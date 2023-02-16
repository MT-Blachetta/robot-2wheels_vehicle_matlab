% sin (  grd*((2*pi)/360) ); sin with GRAD
figure
% v mit v_max = 130 mm/s | mit max_omega 281 grad/s
diameter = 53;
l = 53;

v = 130;

% winkelgeschwindigkeit
omega = round( (v/(diameter*pi))*360 );

intensity = 1;
scaling = 1;


vel = (omega*l*pi)/360;

p = vel/0.13;

gamma = 45;

gamma_ = abs(gamma);
sign = -gamma/gamma_;

repellor = sign*180 + gamma_; 


a = 0:360; % in grad

dsys = - intensity * sin( scaling*a*((2*pi)/360) - repellor*((2*pi)/360)  );
% + sin <==> attractor / - sin <==> repellor

% maximum omega = 281 grd/s
dsys = dsys .* 281;


plot(a,dsys)