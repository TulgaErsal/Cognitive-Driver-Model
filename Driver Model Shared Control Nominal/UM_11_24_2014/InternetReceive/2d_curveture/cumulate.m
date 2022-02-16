load('graphdfa')
load('graphdt')
Dfa=table2array(graphdfa);
Dt=table2array(graphdt);
fa= cumsum(Dfa);
t= cumsum(Dt);


plot(t,fa,'b-o');
xlabel('Time');
ylabel('farpoint');
