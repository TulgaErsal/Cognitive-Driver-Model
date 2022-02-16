// Data
#define FZ0     35000                //Nominal wheel load
#define PCY1	1.5874               //Shape factor Cfy for lateral forces
#define PDY1	0.73957              //Lateral friction Muy
#define PDY2	-0.075004            //Variation of friction Muy with load
#define PEY1	0.37562              //Lateral curvature Efy at Fznom
#define PEY2	-0.069325            //Variation of curvature Efy with load
#define PEY3	0.29168              //Zero order camber dependency of curvature Efy
#define PKY1	-10.289              //Maximum value of stiffness Kfy/Fznom
#define PKY2	3.3343               //Load at which Kfy reaches maximum value
#define PHY1	0.0056509            //Horizontal shift Shy at Fznom
#define PHY2	-0.0020257           //Variation of shift Shy with load
#define PVY1	0.015216             //Vertical shift in Svy/Fz at Fznom
#define PVY2	-0.010365            //Variation of shift Svy/Fz with load 
#define RBY1	13.271              //Slope factor for combined Fy reduction         
#define RBY2	5.2405              //Variation of slope Fy reduction with alpha         
#define RBY3   	1.1547e-005         //Shift term for alpha in slope Fy reduction         
#define RCY1   	1.01                //Shape factor for combined Fy reduction         
#define REY1   	0.010513            //Curvature factor of combined Fy         
#define REY2   	5.9816e-005         //Curvature factor of combined Fy with load         
#define RHY1   	0.028005            //Shift factor for combined Fy reduction         
#define RHY2 	-4.8794e-005        //Shift factor for combined Fy reduction with load         
#define RVY1  	0.0066878           //Kappa induced side force Svyk/Muy*Fz at Fznom         
#define RVY2   	-0.042813           //Variation of Svyk/Muy*Fz with load                
#define RVY4  	-0.019796           //Variation of Svyk/Muy*Fz with alpha         
#define RVY5  	1.9                 //Variation of Svyk/Muy*Fz with kappa         
#define RVY6  	-7.8097             //Variation of Svyk/Muy*Fz with atan(kappa)    