function [ new_phi ] = movDelta_rotate( h,encState, orientation ,phi, omega )

l = 53.0; % mm
%speed = ((abs(phi)/360)*pi*l)/dTime;
speed = (omega*l*pi)/360;

if speed < 131
p = speed / 0.13;
dTime = abs(phi)/omega;
    if phi < 0
        p = round(p);
        kSetSpeed(h,+p,-p);
        pause(dTime-0.06);
        %tic;
        
    else
        p = round(p);
        kSetSpeed(h,-p,+p);
        pause(dTime-0.06);
        %tic;
    end
    
else
dTime = abs(phi)/281;
p = 1000;
   if phi < 0
        
        kSetSpeed(h,+p,-p);
        pause(dTime-0.06);
        %tic;
   else
        
        kSetSpeed(h,-p,+p);
        pause(dTime-0.06);
        %tic;
   end
   
end
   
        

enc = kGetEncoders(h);
encoder(1) = enc(1) - encState(1);
encoder(2) = enc(2) - encState(2);
dphi = (encoder(2)*0.13*360)/(pi*l);
n_phi = orientation + 360*(orientation<0);
n_phi = mod(n_phi+dphi,360);
n_phi = n_phi - 360*(n_phi>180);

new_phi = [n_phi;enc];


end

