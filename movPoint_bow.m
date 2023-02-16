function [ nPos ] = movPoint_bow(h,encoder, x,y, phi, x_pos,y_pos, pos_phi, speed)

dphi = pos_phi+360*(phi<0) - phi+360*(phi<0)
dphi = dphi+360*(dphi<0)

dx = x_pos - x
dy = y_pos - y

nPos = movDelta_bow(h, x,y,phi,encoder ,dx, dy, dphi, speed  );

end

