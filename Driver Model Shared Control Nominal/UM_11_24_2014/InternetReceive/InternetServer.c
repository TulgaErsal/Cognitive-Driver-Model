/**********************************************************
* Tulga Ersal (tersal@umich.edu)
* University of Michigan
* 21 Aug 2020
**********************************************************/

/* This file implements the Simulink S-Function framework */

/* the name of your S-Function */
#define S_FUNCTION_NAME InternetServer

/* matlab include files */
#include <simstruc.h>
#include <math.h>

/* 20-sim include files */
#include "xxtypes.h"
#include "xxmatrix.h"

//Tulga include files
#include "ServerEmbed.h"
#include "ServerEmbed.c"

/* global simulation structure */
SimStruct *MyS = NULL;

/* the submodel io variables */
const XXInteger xx_number_of_inputs = numberOfCouplingVariablesFromServer;
const XXInteger xx_number_of_outputs = 1+numberOfCouplingVariablesFromClient;
const XXInteger xx_number_of_favorite_parameters = 0;

/* the variable arrays */
XXDouble xx_V[1+numberOfCouplingVariablesFromServer];		/* 1+xx_number_of_inputs, where 1 is for simulation time */
XXMatrix xx_M[2];		/* matrices */
XXDouble xx_U[1+numberOfCouplingVariablesFromClient];		/* xx_number_of_outputs */

/* boolean indicating initialization phase */
XXBoolean xx_initialize;

/* just include c-sources to make the mex command work on a single file */
/* 20-sim c-include files */
#include "xxfuncs.c"
#include "xxmatrix.c"
#include "xxinverse.c"

/* mdlInitializeSizes - initialize the sizes array
*
* The sizes array is used by SIMULINK to determine the S-function blocks
* characteristics (number of inputs, outputs, states, etc.).
*
* The direct feedthrough flag can be either 1=yes or 0=no. It should be
* set to 1 if the input, "u", is used is the mdlOutput function. Setting this
* to 0 is asking to making a promise that "u" will not be used in the mdlOutput
* function. If you break the promise, then unpredictable results will occur.
*/
static void mdlInitializeSizes (SimStruct *S)
{
	/* copy the SimStruct pointer S to the global variable */
	MyS = S;

	/* continuous time model */
	ssSetNumContStates (S, 0);                          /* number of continuous states */
	ssSetNumDiscStates (S, 0);                          /* number of discrete states */
	ssSetNumInputs (S, xx_number_of_inputs);            /* number of inputs */
	ssSetNumOutputs (S, xx_number_of_outputs);          /* number of outputs */
	ssSetDirectFeedThrough (S, XXTRUE);                 /* direct feedthrough flag */
	ssSetNumSampleTimes (S, 1);                         /* number of sample times */
	ssSetNumSFcnParams (S, xx_number_of_favorite_parameters); /* number of input arguments */
	ssSetNumRWork (S, 0);                               /* number of real work vector elements */
	ssSetNumIWork (S, 0);                               /* number of integer work vector elements */
	ssSetNumPWork (S, 0);                               /* number of pointer work vector elements */

	/* check the amount of favorite parameters */
	if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S))
	{
		/* give an error */
		ssSetErrorStatus (S, "wrong number of parameters given by Simulink");
		return;
	}
}


/* mdlInitializeSampleTimes - initialize the sample times array
*
* This function is used to specify the sample time(s) for your S-function.
* You must register the same number of sample times as specified in
* ssSetNumSampleTimes. If you specify that you have no sample times, then
* the S-function is assumed to have one inherited sample time.
*
* The sample times are specified period, offset pairs. The valid pairs are:
*
*   [CONTINUOUS_SAMPLE_TIME   0     ]  : Continuous sample time.
*   [period                   offset]  : Discrete sample time where
*                                        period > 0.0 and offset < period or
*                                        equal to 0.0.
*   [VARIABLE_SAMPLE_TIME     0     ]  : Variable step discrete sample time
*                                        where mdlGetTimeOfNextVarHit is
*                                        called to get the time of the next
*                                        sample hit.
*
*  or you can specify that the sample time is inherited from the driving
*  block in which case the S-function can have only one sample time:
*    [CONTINUOUS_SAMPLE_TIME    0    ]
*/
static void mdlInitializeSampleTimes (SimStruct *S)
{
	/* copy the SimStruct pointer S to the global variable */
	MyS = S;

	/* continuous time model */
	ssSetSampleTime (S, 0, CONTINUOUS_SAMPLE_TIME);
	ssSetOffsetTime (S, 0, 0.0);
}

/* mdlInitializeConditions - initialize the states
*
* In this function, you should initialize the continuous and discrete
* states for your S-function block.  The initial states are placed
* in the x0 variable.  You can also perform any other initialization
* activities that your S-function may require.
*/
static void mdlInitializeConditions (double *x0, SimStruct *S)
{
	int index;

	/* copy the SimStruct pointer S to the global variable */
	MyS = S;

	/* set the model matrices */
	xx_M[0].mat = &xx_V[0];		/* inputs */
	xx_M[0].rows = 1;
	xx_M[0].columns = 1+xx_number_of_inputs;
	xx_M[1].mat = &xx_U[0];		/* outputs */
	xx_M[1].rows = 1;
	xx_M[1].columns = xx_number_of_outputs;


	/* indicate initial model computations */
	xx_initialize = XXTRUE;

	/* the initial model equations */
	udpServer_Initialize ();


	/* the static model equations */


	/* the input model equations */
	for (index = 0; index < 1+xx_number_of_inputs; ++index)
	{
		xx_M[0].mat[index] = 0;
	}

	/* done with initialization */
	xx_initialize = XXFALSE;
}


/* mdlDerivatives - compute the derivatives
*
* In this function, you compute the S-function blocks derivatives.
* The derivatives are placed in the dx variable.
*/
static void mdlDerivatives (double *dx, double *x, double *u, SimStruct *S, int tid)
{
	int index;
	/* copy the SimStruct pointer S to the global variable */
	MyS = S;

	/* dynamic model equations */
	xx_M[0].mat[0] = xx_time;
	for (index = 0; index < xx_number_of_inputs; ++index)
	{
		xx_M[0].mat[1+index] = u[index];
	}
}


/* mdlOutputs - compute the outputs
*
* In this function, you compute the outputs of your S-function
* block.  The outputs are placed in the y variable.
*/
static void mdlOutputs (double *y, double *x, double *u, SimStruct *S, int tid)
{
	int index;

	/* copy the SimStruct pointer S to the global variable */
	MyS = S;

	/* output equations */
	xx_M[0].mat[0] = xx_time;
	for (index = 0; index < xx_number_of_inputs; ++index)
	{
		xx_M[0].mat[1+index] = u[index];
	}

	udpServer_CommunicateThroughUDP (xx_M[0].mat, 2, xx_M[1].mat, 6, xx_major);
	/* copy the model outputs into the supplied output vector y */
	for (index = 0; index < xx_number_of_outputs; ++index)
	{
		y[index] = xx_M[1].mat[index];
	}
}


/* mdlUpdate - perform action at major integration time step
*
* This function is called once for every major integration time step.
* Discrete states are typically updated here, but this function is useful
* for performing any tasks that should only take place once per integration
* step.
*/
static void mdlUpdate (double *x, double *u, SimStruct *S, int tid)
{
	/* copy the SimStruct pointer S to the global variable */
	MyS = S;
}


/* mdlTerminate - called when the simulation is terminated.
*
* In this function, you should perform any actions that are necessary
* at the termination of a simulation.  For example, if memory was allocated
* in mdlInitializeConditions, this is the place to free it.
*/
static void mdlTerminate (SimStruct *S)
{
	/* copy the SimStruct pointer S to the global variable */
	MyS = S;

	/* final model equations */
	udpServer_Terminate ();

}

/* Is this file being compiled as a MEX-file? */
#ifdef	MATLAB_MEX_FILE

/* MEX-file interface mechanism */
#include "simulink.c"

#else

/* code generation registration function */
#include "cg_sfun.h"

#endif
