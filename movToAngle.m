function [ direction ] = movToAngle(h,encState, phi,pos_phi,omega )

dphi = pos_phi+360*(pos_phi<0) - phi+360*(phi<0);
dphi = dphi+360*(dphi<-360);
dphi = dphi+360*(dphi<-180);
dphi = dphi-360*(dphi>360);
dphi = dphi-360*(dphi>180);

direction = movDelta_rotate(h,encState,phi,dphi,omega);

end

