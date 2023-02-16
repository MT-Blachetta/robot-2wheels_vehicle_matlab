% figure

points = [ ];

punkte = [ [21; 34; -2; 30] ];  % [ 10;10; -2; 5 ] ];

field = meshgrid(0:401,0:401,1:4);

number = 40;

for k = 0:number
points = [ points [ ones(1,number).*k ; 0:number-1 ; zeros(1,number); zeros(1,number); zeros(1,number); zeros(1,number) ] ];
end

sz = size(points);

for k = 1:sz(2)
value = dField(points(1,k),points(2,k),punkte);
points(3,k) = value(1);
points(4,k) = value(2);
points(5,k) = value(4);
points(6,k) = value(3);
% field(points(1,k)+1, points(2,k)+1, 4) = atan2(value(2),value(1));
% field(points(1,k)+1, points(2,k)+1, 3) = value(3);
end

maxX = max(points(3,:));
minX = min(points(3,:));
minY = min(points(4,:));
maxY = max(points(4,:));

for p = 1:sz(2)

amount = abs(points(3,p));
    
if minX < -0.04
    if maxX > 0.04
        xVal = minX*(1-abs(points(3,p)/minX))*(points(3,p)<0) + maxX*(1-(points(3,p)/maxX))*(points(3,p)>0);
        points(3,p) = points(3,p)*(amount<0.05) + xVal*(amount>0.05);
    else
        xVal = minX*(1-abs(points(3,p)/minX))*(points(3,p)<0) + points(3,p)*(points(3,p)>0);
        points(3,p) = points(3,p)*(amount<0.05) + xVal*(amount>0.05);
    end
        
else
      if maxX > 0.04
          xVal = points(3,p)*(points(3,p)<0) + maxX*(1-(points(3,p)/maxX))*(points(3,p)>0);
          points(3,p) = points(3,p)*(amount<0.05) + xVal*(amount>0.05);
      end
    
end

amount = abs(points(4,p));

if minY < -0.04
    if maxY > 0.04
        yVal = minX*(1-abs(points(4,p)/minX))*(points(4,p)<0) + maxX*(1-(points(4,p)/maxX))*(points(4,p)>0);
        points(4,p) = points(4,p)*(amount<0.05) + yVal*(amount>0.05);
    else
        yVal = minX*(1-abs(points(4,p)/minX))*(points(4,p)<0) + points(4,p)*(points(4,p)>0);
        points(4,p) = points(4,p)*(amount<0.05) + yVal*(amount>0.05);
    end
        
else
      if maxY > 0.04
          yVal = points(4,p)*(points(4,p)<0) + maxX*(1-(points(4,p)/maxX))*(points(4,p)>0);
          points(4,p) = points(4,p)*(amount<0.05) + yVal*(amount>0.05);
      end
    
end


end  



%sign = points(3,p)/amount;





% surf(field(:,:,3))

%{
dx = field(x,y,1);
dy = field(x,y,2);
angle = field(x,y,3);
betrag = field(x,y,4);
%}


