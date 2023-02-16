obstacles = [0;0];

eState = kGetEncoders(h);

threshold = 3.5;

figure
hold on

x = 70;
y = 90;
phi = 45;

place = [ x; y; phi ];

scatter(x,y)
axis([0 270 0 400 ])

circle = 1;
count = 3;
counter = count;

sensorValues = zeros(4,4,8); % (row - circles ,column - data, sensorNR )

sdata = kProximity(h);
assert(sdata(1) > 0);

sens = sensorToDistance(sdata);

for s=1:8

sensorValues(circle,1,s) = x;
sensorValues(circle,2,s) = y;
sensorValues(circle,3,s) = phi;
sensorValues(circle,4,s) = sens(s);

end

totalWay = 120;
velocity = 40;
way = 10;

way/velocity

duration = (totalWay+1)/velocity;

time = 0;
movAcc_bow(h,velocity,1.2);

tic;

while (time < duration)

  %pos = forward(h,encoder,  phi,x,y, 10,0.2);
   pause(way/velocity);
  
   % if min ( toDistance(kProximity(h)) ) < vStop
   %   break;
   % end

%----------------------------------------CALCULATION
   
 if circle == 4
  
              for snr = 1:8

                for k = [ 4 3 2 ]

                    sValue = sensorValues(k,4,snr);
                    Pre_sValue = sensorValues(k-1,4,snr);

                    counter = counter-(sValue < Pre_sValue); 

                    if counter <= 0
                        if sensorValues(4,4,snr) < threshold

                    %SetObstacle 
                    obstacles =  [ obstacles obstacleEstimation( snr, sensorValues(:,:,snr) ) ];

                        end
                     end



                end

                counter = count;
        end
      
 end

 
 
  circle = mod(circle,4)+1;
  sdata = kProximity(h);
  assert(sdata(1) > 0);
  sens = sensorToDistance(sdata);

    nPos = updatePosition(h, x,y,phi, eState );
    x = nPos(1);
    y = nPos(2);
    phi = nPos(3);
    place = [ place [x;y;phi] ];
    scatter(x,y)
    drawnow
    eState(1) = nPos(4);
    eState(2) = nPos(5);
  
for s=1:8

sensorValues(circle,1,s) = x;
sensorValues(circle,2,s) = y;
sensorValues(circle,3,s) = phi;
sensorValues(circle,4,s) = sens(s);

end

%----------------------------------------CALCULATION

  time = toc;
  %time
  %sens = [sens,kProximity(h)];
 
  %drawnow;
  %pos
  %x = pos(1);
  %y = pos(2);
  %encoder(1) = pos(3);
  %encoder(2) = pos(4);


end

kStop(h);
