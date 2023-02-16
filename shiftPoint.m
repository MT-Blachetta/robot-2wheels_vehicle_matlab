function [ result ] = shiftPoint( hyp ,x,y, angle )

 
alpha = angle - 360*(angle > 180)


if hyp < 0
    
    if alpha < 0  
        
		if abs(alpha) > 90
		     
            alpha = abs((alpha/180)*pi);
            xm = cos(alpha)*abs(hyp); 
            ym = sin(alpha)*abs(hyp);
            
            xNew = x - xm;
            yNew = y + ym;
			
            result = [xNew; yNew];
            
        else
            
            alpha = alpha - 90
            %special = (not(alpha==-180)-0.5)*2
            
            
            alpha = abs((alpha/180)*pi);
            xm = sin(alpha)*abs(hyp); 
            ym = cos(alpha)*abs(hyp);
            
            xNew = x - xm;
            yNew = y - ym; % *special;
            result = [xNew; yNew];
            
        end
        
        
    else
	
		if abs(alpha) > 90
            
  
            alpha = abs((alpha/180)*pi);
            xm = cos(alpha)*abs(hyp);
            ym = sin(alpha)*abs(hyp);
        
            xNew = x - xm;
            yNew = y - ym;
            result = [xNew; yNew];
            
            
        else
            
            alpha = alpha + 90;
          
            alpha = abs((alpha/180)*pi);
            xm = sin(alpha)*abs(hyp); 
            ym = cos(alpha)*abs(hyp);
        
            xNew = x - xm; 
            yNew = y + ym;
            result = [xNew; yNew];
		
		end
        
		
    end
        
        
 
 %---------------------------------------------   
    
    
else
    
    
  if alpha < 0 
        
		if abs(alpha) > 90
		
			alpha = alpha + 90;
			
            alpha = abs((alpha/180)*pi);
			xm = sin(alpha)*abs(hyp); 
			ym = cos(alpha)*abs(hyp);
			
			xNew = x - xm; 
			yNew = y - ym;
			result = [xNew; yNew];
        
        else
            alpha = abs((alpha/180)*pi);
			xm = cos(alpha)*abs(hyp);
			ym = sin(alpha)*abs(hyp);
			
			xNew = x + xm;
			yNew = y - ym;
			result = [xNew; yNew];
			
		end
        
    else
    
		if abs(alpha) > 90
        
			alpha = alpha - 90;        
            
            alpha = abs((alpha/180)*pi);
			xm = sin(alpha)*abs(hyp); 
			ym = cos(alpha)*abs(hyp);
			
            xNew = x - xm;
			yNew = y + ym;
			result = [xNew; yNew];

        
        else
        
			
			alpha = abs((alpha/180)*pi);
			xm = cos(alpha)*abs(hyp); 
			ym = sin(alpha)*abs(hyp);
			
            xNew = x + xm;
			yNew = y + ym;
			result = [xNew; yNew];
        
        end
    
    
    end
    
    
    

end


end

