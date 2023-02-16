function [ delta ] = difFuncGauss(x,y, xp,yp, power,sc)

delta = zeros(2,1);
x = (x-xp)/sc;
y = (y-yp)/sc;
delta = [ power * -(pi/3) * x * exp( -0.5*(x*x+y*y) ) ; power * -(pi/3) * y * exp( -0.5*(x*x+y*y) )  ];

% exp( -0.5*(((x-70)/100)^2+((y-90)/100)^2) )

end

