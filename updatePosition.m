function [ position ] = updatePosition(h,encState, x,y,phi )

'updatePosition'

diameter = 53;

encod = kGetEncoders(h);
encoder = [ 0; 0];

encoder(1) = encod(1) - encState(1);
encoder(2) = encod(2) - encState(2);

if abs(encoder(1)) == abs(encoder(2))
    
    if encoder(1) == encoder(2)
        
           position = shiftPoint( encoder(1)*0.13 ,x,y,phi );
           position = [ position(1);position(2); phi;encod(1);encod(2) ];
        
    else
            dPhi = ( (encoder(2)*0.13)/(pi*diameter) ) * 360 ;
            n_phi = phi + 360*(phi<0);
            n_phi = mod(n_phi+dphi,360);
            n_phi = n_phi - 360*(n_phi>180);
            position = [x; y; n_phi; encod(1); encod(2)];
            
    end
    
    
    
else 
    
        phi =  phi + 360*(phi<0)
        
        sign = encoder(1)/abs(encoder(1))
               
        bL = abs( encoder(1)*0.13 )
        bR = abs( encoder(2)*0.13 )

        arcBow =  (bR+bL)/2

        arcRadius = (arcBow*diameter)/abs(bR-bL)

        arc_phi =  arcBow/arcRadius

        c_ = arcRadius*cos(arc_phi)

        x_ego = arcRadius*sin(arc_phi)*sign
        y_ego = (arcRadius - c_) % 
                  
        arc_phi = (arc_phi/pi)*180
        n_phi = mod(phi+arc_phi,360)
        n_phi = n_phi - 360*(n_phi>180)

        phi = (phi/180)*pi
        dx = x_ego*cos(phi) - y_ego*sin(phi)
        dy = x_ego*sin(phi) + y_ego*cos(phi)
       
        
        n_x = x + dx*((encoder(1)<encoder(2))-0.5)*2
        n_y = y + dy
        position = [ n_x; n_y; n_phi; encod(1); encod(2) ];

    
end

    


end

