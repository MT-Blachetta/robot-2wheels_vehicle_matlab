function [ new_pos ] = movDelta_bow(h, x,y,phi,encoder ,dx_alo, dy_alo, dphi, speed  )
		'movDelta_bow'

        diameter = 53;
        error = 100/100;

        % phi =  phi + 360*(phi<0)
		% dphi =  dphi + 360*(dphi<0)
        dphi = dphi - 360*(dphi>180);
        phi = phi - 360*(phi>180);
		dphi = (dphi/180)*pi
		phi = (phi/180)*pi
        
        % sign = encoder(1)/abs(encoder(1))
		
		 
		x_ego = dx_alo*cos(phi) + dy_alo*sin(phi) % KORREKT
        y_ego = -dx_alo*sin(phi) + dy_alo*cos(phi) % KORREKT
		
		arcRadius = x_ego/sin(dphi)
		arcBow = dphi*arcRadius
		bDif = (arcBow*diameter)/arcRadius
		

		bL = arcBow-(bDif/2)
		bR = bL+bDif
		difference = 1-abs(bDif/bR)
        wheelL = round(speed*difference/0.13);
        wheelR = round(speed/0.13);
        
        if wheelR > wheelL
            shift = wheelL;
            wheelL = wheelR;
            wheelR = shift;
        end
		
		dtime = abs(arcBow)/speed
		
		kSetSpeed(h,wheelL,wheelR);
		pause(dtime-0.055);
        tic;
        new_pos = updatePosition(h,x,y,phi,encoder);
        toc

end

