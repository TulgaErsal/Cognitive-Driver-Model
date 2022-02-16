/**********************************************************
* Tulga Ersal (tersal@umich.edu)
* University of Michigan
* 21 Aug 2020
**********************************************************/

#include <stdio.h>
#include <string.h>
#include <winsock2.h>
#include <math.h>
#include <time.h>
#include "LongHaul.h"

int UDPPort = 36881;
int noOfFunctionCalls = 1; //Number of function calls per major integration step: ode5->6, ode4->4


FILE *ofp; // Output file pointer. This file records messages. Use this file for debugging and monitoring
FILE *tfp; //Client data file pointer. This file records the Client packets
FILE *ufp; //Server data file pointer. This file records the Server packets

#ifndef __LONG_HAUL_REMOTE_DECLARATIONS__
#define __LONG_HAUL_REMOTE_DECLARATIONS__
typedef struct
{
  SOCKET        sockfd ;
  SOCKADDR_IN  	recvAddr;
  SOCKADDR_IN  	fromAddr;
  int           fromSize ;
  LARGE_INTEGER	LIstartTime ;
  LARGE_INTEGER	LIeventTimeStamp ;
  LARGE_INTEGER	LIticksPerSecond ;
  bool replySent ;

  float  timeSinceLastUpdate ;
  int    currentEvent ;
  int    lastEventReceived ;
  float  arrivalTime ;
  int    packetsSent ;
  int    packetsReceived ;
} LH_SharedData;
#endif //__LONG_HAUL_REMOTE_DECLARATIONS__

LH_SharedData G;

typedef struct
{
  double simTime;
  double  couplingVariablesFromServer[numberOfCouplingVariablesFromServer];

} myInputs;

int firstPacket = 1 ;
int tick;

LARGE_INTEGER tickCPU;   // A point in time
LARGE_INTEGER initialTick;  //The tick value at the start of the simulation
double actualTime;   // For converting tick into real time

int udpServer_Initialize ()
{
  // Connect a UDP socket
  WSADATA wsaData;
  int	n;
  int iResult ;
  unsigned long ioctlIn = 1 ; // For non-blocking socket.

  ofp = fopen("logServer.txt","w");
  tfp = fopen("packetsClient.txt","w");
  ufp = fopen("packetsServer.txt","w");
  fprintf (ofp,"Initializing...\n");

  //-----------------------------
  // Initialize Winsock2.
  iResult = WSAStartup( MAKEWORD(2,2), &wsaData );
  if ( iResult != NO_ERROR )
  {	fprintf (ofp,"Error at WSAStartup()\n");
  return 1;
}
else
fprintf (ofp,"Winsock2 initialized successfully!\n");

//-----------------------------
// Create a socket.
G.sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
if ( G.sockfd == INVALID_SOCKET )
{
  WSACleanup();
  fprintf (ofp,"Error at socket(): %i\n",WSAGetLastError());
  return 1;
}
else
fprintf (ofp,"Socket created successfully!\n");

//-----------------------------
// Create the address structure.
memset(&G.recvAddr, 0, sizeof(G.recvAddr));
G.recvAddr.sin_family      = AF_INET;
G.recvAddr.sin_addr.s_addr = htonl(INADDR_ANY);
G.recvAddr.sin_port        = htons(UDPPort);
fprintf (ofp,"Created address structure\n");

//-----------------------------
// Bind to the receive address
n = bind( G.sockfd, (struct sockaddr*)&(G.recvAddr), sizeof(SOCKADDR_IN) ) ;
if (n == SOCKET_ERROR)
{	int error = WSAGetLastError() ;
  fprintf (ofp,"Error calling bind().  WSAGetLastError() returned %i\n",error);
  WSACleanup();
  return 1;
}
else
fprintf (ofp,"Bound to the receive address successfully!\n");

//-----------------------------
// Make the socket non-blocking.
ioctlIn = 1 ; // For non-blocking socket.
n = ioctlsocket(G.sockfd, FIONBIO, &ioctlIn) ;
if (n == SOCKET_ERROR)
{	int error = WSAGetLastError() ;
  fprintf (ofp,"Error calling ioctlsocket().  WSAGetLastError() returned %i\n", error);
}
else
fprintf (ofp,"Socket made non-blocking successfully!\n");


//----------------------------------------------
// Get the clock resolution and the initial time.
QueryPerformanceFrequency(&(G.LIticksPerSecond)) ;
if (!QueryPerformanceCounter(&(G.LIstartTime)) )
fprintf (ofp,"Error: High resolution clock not available.\n");
else
fprintf (ofp,"Clock resolution is %f ns.\n", 1.0E9 / (double)G.LIticksPerSecond.QuadPart);

G.replySent = true;
G.currentEvent = 0;
G.packetsSent = 0;
G.packetsReceived = 0;
firstPacket = 1;
tick = noOfFunctionCalls;

fprintf (ofp,"Initialization completed.\n\n");
return 0; // Indicate that the function was initialized successfully.
}

int udpServer_CommunicateThroughUDP (double *inarr, int inputs, double *outarr, int outputs, int major)
{

  myInputs myIns;

  SOCKADDR_IN fromAddr;
  int fromSize ;

  int n ;
  int iResult;
  int iLoop;
  int thereIsNewPacket = false;

  ToClient   fromServer ;
  ToServer  fromClient ;

  int myMajor=0;

  myIns.simTime = inarr[0];
  for(iLoop = 0; iLoop < numberOfCouplingVariablesFromServer; ++iLoop)
  {
    myIns.couplingVariablesFromServer[iLoop] = inarr[1+iLoop];
  }

  //fprintf(ofp,"simTime = %f, ",myIns.simTime);
  if (tick++ % noOfFunctionCalls == 0)
  myMajor = 1;
  //fprintf(ofp,"major = %i\n",myMajor);
  if (myMajor)
  {
    //find the actual time;
    QueryPerformanceCounter(&tickCPU);
    if (myIns.simTime == 0)
    {
      outarr[0]  = 0; //server actual time
      initialTick = tickCPU;
    }
    // convert the tick number into the number of seconds since the system was started...
    actualTime = (tickCPU.QuadPart-initialTick.QuadPart)/(double)G.LIticksPerSecond.QuadPart;

    // Server site is driven by the receipt of a packet from the client site
    fromSize = sizeof(SOCKADDR_IN) ;
    n = recvfrom(G.sockfd, (char*)&fromClient, sizeof(fromClient), 0, (struct sockaddr*)&fromAddr, &fromSize);
    if (n == SOCKET_ERROR)
    {	int error = WSAGetLastError() ;
      if (error != WSAEWOULDBLOCK)
      fprintf (ofp,"Error reading socket.  WSAGetLastError() returned %i\n", error);
    }
    else
    {
      // Make sure there are no further packets waiting in line
      while (n != SOCKET_ERROR)
      {
        thereIsNewPacket = true;
        G.currentEvent++;
        fprintf (tfp,"%i\t%f\t%f\t",G.currentEvent, actualTime, myIns.simTime);
        for (iLoop = 0; iLoop < numberOfCouplingVariablesFromClient; ++iLoop)
        {
          fprintf (tfp,"%f\t", fromClient.couplingVariablesFromClient[iLoop]);
        }
        fprintf (tfp,"\n");
        n = recvfrom(G.sockfd, (char*)&fromClient, sizeof(fromClient), 0, (struct sockaddr*)&fromAddr, &fromSize);
      }


      G.fromAddr = fromAddr ;
      G.fromSize = fromSize ;
      G.packetsReceived++ ;

      // Verify that ICDs are consistent by confirming the version tag.
      if (firstPacket)
      {
        firstPacket = 0 ;
      }

      // Internalize data if packet contains new information
      if (thereIsNewPacket)
      {
        // Register packet arrival event.
        G.arrivalTime = myIns.simTime ;
        G.timeSinceLastUpdate = 0.0 ;
        G.replySent = false ;

        // Populate the output terminals
        for (iLoop = 0; iLoop < numberOfCouplingVariablesFromClient; ++iLoop)
        {
          outarr[1+iLoop] = fromClient.couplingVariablesFromClient[iLoop];
        }

      }
    }

    outarr[0] = thereIsNewPacket;
    G.timeSinceLastUpdate = myIns.simTime-G.arrivalTime ;
  }

  return 0; //Indicate that communication was successful.
}

int udpServer_Terminate ()
{
  int error;
  fprintf (ofp,"Terminating...\n");
  error = closesocket(G.sockfd);
  if (!error)
  fprintf (ofp,"Socket closed.\n");
  else
  fprintf (ofp,"Error in closesocket: %i\n",WSAGetLastError());

  error = WSACleanup();
  if (!error)
  fprintf (ofp,"Termination completed.");
  else
  fprintf (ofp,"Error in WSACleanup(): %i",WSAGetLastError());

  fclose(ofp);
  fclose(tfp);
  fclose(ufp);
  return 0; // Indicate that the function was terminated successfully.
}
