function [ distance ] = sensorToDistance( sensordaten )

%sensordaten

means = [ 45.3996 27.4026 99.3407 55.9990 62.8422 134.6553 22.6094 41.7982 ];
max_means = [ 3851.6 3827.8 3800.1 3815.4 3844.9 3835.3 3856.2 3877.9 ];

distance = zeros(8,1);

error = 0.1;

%sensorNr = 1;
%svalue = 30;

for s = 1:8
    
svalue = sensordaten(s);

svalue = max(svalue-means(s),1) ;
  
scale = svalue / ( max_means(s)-means(s) );
Iscale = abs(scale-1);

distance(s) = max(-0.96 * log(scale) - error, 0);

end

end

