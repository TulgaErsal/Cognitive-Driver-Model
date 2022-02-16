%Int V110 engine (3.30.05 data)
%row
rpm_engine=[700. 800. 1000. 1500. 2000. 2500. 3000. 3300.];

%column
mdot_fuel=1.e-6*[5  10	20	30	40	50	60	70	80];

torque_engine=[
9.767	75.383	190.94	285.59	359.33	412.18	444.11	455.15	465.28; %700
15.303	80.318	196.25	293.4	371.76	431.33	472.12	494.11	497.32; %800
12.411	76.501	195.96	303.79	399.98	484.55	557.5	618.81	668.49; %1000
-4.524	61.314	188.26	308.88	423.2	531.2	632.9	728.28	817.34; %1500
-12.214	53.908	182.37	305.8	424.19	537.55	645.86	749.14	847.39; %2000
-35.77	30.439	158.78	281.67	399.12	511.13	617.7	718.82	814.5; %2500
-70.0 	0.0 	142.48	247.52	352.56	457.6	562.64	667.68	772.72; %3000
-75.889	-0.746	128.13	228.45	321.9	435.11	548.32	661.53	774.74  %3300
];


