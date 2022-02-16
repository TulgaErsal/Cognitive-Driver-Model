// pac2002_315_80R22_5.tir
#define VREF                    16.7                 //Measurement speed 
#define R0                      0.548                //Free tyre radius    
// [VERTICAL]
#define VERTICAL_STIFFNESS     	784944               //Tyre vertical stiffness         
#define VERTICAL_DAMPING       	0                    //Tyre vertical damping         
#define BREFF                  	3.5                  //Low load stiffness e.r.r.         
#define DREFF                	0.5                  //Peak value of e.r.r.         
#define FREFF                 	-0.005               //High load stiffness e.r.r.         
#define FZ0                   	35000                //Nominal wheel load
// [LONG_SLIP_RANGE]
#define KPUMIN               	-1.5                 //Minimum valid wheel slip         
#define KPUMAX                	1.5                  //Maximum valid wheel slip         
// [SLIP_ANGLE_RANGE]
#define ALPMIN                	-1.5708              //Minimum valid slip angle         
#define ALPMAX              	1.5708               //Maximum valid slip angle         
// [INCLINATION_ANGLE_RANGE]
#define CAMMIN                	-0.26181             //Minimum valid camber angle         
#define CAMMAX                	0.26181              //Maximum valid camber angle         
// [VERTICAL_FORCE_RANGE]
#define FZMIN                 	1750                 //Minimum allowed wheel load         
#define FZMAX                 	78750                //Maximum allowed wheel load 

//// [LONGITUDINAL_COEFFICIENTS]
#define PCX1 1.7204               //Shape factor Cfx for longitudinal force         
#define PDX1 0.77751              //Longitudinal friction Mux at Fznom         
#define PDX2 -0.24431             //Variation of friction Mux with load         
#define PDX3 -0.00015908          //Variation of friction Mux with camber         
#define PEX1 0.46659              //Longitudinal curvature Efx at Fznom         
#define PEX2 0.393                //Variation of curvature Efx with load         
#define PEX3 0.076024             //Variation of curvature Efx with load squared         
#define PEX4 2.6509e-006          //Factor in curvature Efx while driving         
#define PKX1 14.848               //Longitudinal slip stiffness Kfx/Fz at Fznom         
#define PKX2 -9.8161              //Variation of slip stiffness Kfx/Fz with load         
#define PKX3 0.15818              //Exponent in slip stiffness Kfx/Fz with load         
#define PHX1 -0.00088873          //Horizontal shift Shx at Fznom         
#define PHX2 -0.00067818          //Variation of shift Shx with load         
#define PVX1 -5.5714e-007         //Vertical shift Svx/Fz at Fznom         
#define PVX2 6.2972e-006          //Variation of shift Svx/Fz with load         

#define RBX1 11.13                //Slope factor for combined slip Fx reduction         
#define RBX2 -12.494              //Variation of slope Fx reduction with kappa         
#define RCX1 0.97505              //Shape factor for combined slip Fx reduction         
#define REX1 -0.37196             //Curvature factor of combined Fx         
#define REX2 0.0017379            //Curvature factor of combined Fx with load         
#define RHX1 0.0045181            //Shift factor for combined slip Fx reduction         
#define PTX1 1.5                  //Relaxation length SigKap0/Fz at Fznom         
#define PTX2 1.4                  //Variation of SigKap0/Fz with load         
#define PTX3 1                    //Variation of SigKap0/Fz with exponent of load         

////[OVERTURNING_COEFFICIENTS]
#define QSX1 0                    //Lateral force induced overturning moment         
#define QSX2 0                    //Camber induced overturning couple         
#define QSX3 0                    //Fy induced overturning couple         

////[LATERAL_COEFFICIENTS]
#define PCY1 1.5874               //Shape factor Cfy for lateral forces         
#define PDY1 0.73957              //Lateral friction Muy         
#define PDY2 -0.075004            //Variation of friction Muy with load         
#define PDY3 -8.0362              //Variation of friction Muy with squared camber         
#define PEY1 0.37562              //Lateral curvature Efy at Fznom         
#define PEY2 -0.069325            //Variation of curvature Efy with load         
#define PEY3 0.29168              //Zero order camber dependency of curvature Efy         
#define PEY4 11.559               //Variation of curvature Efy with camber         
#define PKY1 -10.289              //Maximum value of stiffness Kfy/Fznom         
#define PKY2 3.3343               //Load at which Kfy reaches maximum value         
#define PKY3 -0.25732             //Variation of Kfy/Fznom with camber         
#define PHY1 0.0056509            //Horizontal shift Shy at Fznom         
#define PHY2 -0.0020257           //Variation of shift Shy with load         
#define PHY3 -0.038716            //Variation of shift Shy with camber         
#define PVY1 0.015216             //Vertical shift in Svy/Fz at Fznom         
#define PVY2 -0.010365            //Variation of shift Svy/Fz with load         
#define PVY3 -0.31373             //Variation of shift Svy/Fz with camber         
#define PVY4 -0.055766            //Variation of shift Svy/Fz with camber and load         

#define RBY1 13.271               //Slope factor for combined Fy reduction         
#define RBY2 5.2405               //Variation of slope Fy reduction with alpha         
#define RBY3 1.1547e-005          //Shift term for alpha in slope Fy reduction         
#define RCY1 1.01                 //Shape factor for combined Fy reduction         
#define REY1 0.010513             //Curvature factor of combined Fy         
#define REY2 5.9816e-005          //Curvature factor of combined Fy with load         
#define RHY1 0.028005             //Shift factor for combined Fy reduction         
#define RHY2 -4.8794e-005         //Shift factor for combined Fy reduction with load         
#define RVY1 0.0066878            //Kappa induced side force Svyk/Muy*Fz at Fznom         
#define RVY2 -0.042813            //Variation of Svyk/Muy*Fz with load         
#define RVY3 -0.16227             //Variation of Svyk/Muy*Fz with camber         
#define RVY4 -0.019796            //Variation of Svyk/Muy*Fz with alpha         
#define RVY5 1.9                  //Variation of Svyk/Muy*Fz with kappa         
#define RVY6 -7.8097              //Variation of Svyk/Muy*Fz with atan(kappa)         
#define PTY1 1.2                  //Peak value of relaxation length SigAlp0/R0         
#define PTY2 2.5                  //Value of Fz/Fznom where SigAlp0 is extreme         

//// [ROLLING_COEFFICIENTS]
#define QSY1 0.008                //Rolling resistance torque coefficient         
#define QSY2 0                    //Rolling resistance torque depending on Fx         
#define QSY3 0                    //Rolling resistance torque depending on speed         
#define QSY4 0                    //Rolling resistance torque depending on speed ^4         

//// [ALIGNING_COEFFICIENTS]
#define QBZ1 5.8978               //Trail slope factor for trail Bpt at Fznom         
#define QBZ2 -0.1535              //Variation of slope Bpt with load         
#define QBZ3 -2.0052              //Variation of slope Bpt with load squared         
#define QBZ4 0.62731              //Variation of slope Bpt with camber         
#define QBZ5 -0.92709             //Variation of slope Bpt with absolute camber         
#define QBZ9 10.637               //Slope factor Br of residual torque Mzr         
#define QBZ10 0                   //Slope factor Br of residual torque Mzr         
#define QCZ1 1.4982               //Shape factor Cpt for pneumatic trail         
#define QDZ1 0.085549             //Peak trail Dpt" Dpt*(Fz/Fznom*R0)         
#define QDZ2 -0.025298            //Variation of peak Dpt" with load         
#define QDZ3 0.21486              //Variation of peak Dpt" with camber         
#define QDZ4 -3.9098              //Variation of peak Dpt" with camber squared         
#define QDZ6 -0.0013373           //Peak residual torque Dmr" Dmr/(Fz*R0)         
#define QDZ7 0.0013869            //Variation of peak factor Dmr" with load         
#define QDZ8 -0.053513            //Variation of peak factor Dmr" with camber         
#define QDZ9 0.025817             //Variation of peak factor Dmr" with camber and load         
#define QEZ1 -0.0084519           //Trail curvature Ept at Fznom         
#define QEZ2 0.0097389            //Variation of curvature Ept with load         
#define QEZ3 0                    //Variation of curvature Ept with load squared         
#define QEZ4 4.3583               //Variation of curvature Ept with sign of Alpha-t         
#define QEZ5 -645.04              //Variation of Ept with camber and sign Alpha-t         
#define QHZ1 0.0085657            //Trail horizontal shift Sht at Fznom         
#define QHZ2 -0.0042922           //Variation of shift Sht with load         
#define QHZ3 0.14763              //Variation of shift Sht with camber         
#define QHZ4 -0.29999             //Variation of shift Sht with camber and load         

#define SSZ1 -0.019408            //Nominal value of s/R0: effect of Fx on Mz         
#define SSZ2 0.025786             //Variation of distance s/R0 with Fy/Fznom         
#define SSZ3 0.31908              //Variation of distance s/R0 with camber         
#define SSZ4 -0.50765             //Variation of distance s/R0 with load and camber         
#define QTZ1 0                    //Gyration torque constant         
#define MBELT 0                   //Belt mass of the wheel   