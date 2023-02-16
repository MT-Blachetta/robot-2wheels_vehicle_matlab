function [ Z ] = normalgauss(X,Y,xp,yp,power,sc)

X = (X-xp)/sc;
Y = (Y-yp)/sc;

Z = X.*exp(-X.^2 - Y.^2);

Z = Z*power;

end

