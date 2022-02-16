function AREA = triangle_area(PT1, PT2, PT3)

X1 = PT1(1);
X2 = PT2(1);
X3 = PT3(1);

Y1 = PT1(2);
Y2 = PT2(2);
Y3 = PT3(2);

AREA = abs(X1*(Y2 - Y3) + X2*(Y3 - Y1) + X3*(Y1 - Y2))/2;