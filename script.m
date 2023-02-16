%h = kOpenPort();
%kSetSpeed(h,0,0);

stdSensor = [ 23.0518 0.6331 1.3262 2.3751 1.7114 1.7147 1.2885 5.7932 ];

%figure;

sdata = kProximity(h);
assert(sdata(1) > 0);

sens = sensorToDistance(sdata);
circle = 1;
% count = 3;
% counter = count;

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
% if min ( sens ) < vStop
%      ;

vStop = 3.5;

%plot(sens);

%{

for i = 1:1000
    sens = [sens,kProximity(h) ];
end



max_means = zeros(8,1); 
stdmax = zeros(8,1);

for s = 1:8
    max_means(s) = mean( sens(s,:)  );
    stdmax(s) = std( sens(s,:) );    
end

%}

% figure

'1.'

points = [ ];

punkte = [ [210; 340; 2.5; 400] [150; 190; -0.6; 20 ] ];

xp = 210;
yp = 340;

field = meshgrid(0:401,0:401,1:4);

number = 400;

for k = 0:number
points = [ points [ ones(1,number).*k ; 0:number-1 ; zeros(1,number); zeros(1,number); zeros(1,number); zeros(1,number) ] ];
end

sz = size(points);

for k = 1:sz(2)
value = dField(points(1,k),points(2,k),punkte);
field(points(1,k)+1 , points(2,k)+1, 1) = value(1);
field(points(1,k)+1, points(2,k)+1, 2) = value(2);
% points(5,k) = sqrt(value(1)*value(1) + value(2)*value(2));
field(points(1,k)+1, points(2,k)+1, 4) = value(4);
field(points(1,k)+1, points(2,k)+1, 3) = value(3);
end


% surf(field(:,:,3))

'2.'

x = 70;
y = 90;

phi = 90;

places = [ x; y; phi  ];

%dx = field(round(x),round(y),1);
%dy = field(round(x),round(y),2);
alpha = field(round(x),round(y),3)
%alpha = (alpha/pi)*180;
betrag = field(round(x),round(y),4)





encoder = kGetEncoders(h);
% pos = [x;y;encoder];
'START'
%pos

countTest = 0;
trigger = 0;
Ty = 0;
Tx = 0;


%}

%totalWay = 120;
velocity = 60;
omega = 150;
way = 10;

dtime = way/velocity;

%duration = (totalWay+1)/velocity;

'3.'

%time = 0;
turn = movToAngle(h,encoder,phi ,alpha, omega);
kStop(h);
phi = turn(1) 
encoder(1) = turn(2);
encoder(2) = turn(3);
'4.'
movAcc_straight(h,velocity*betrag);
pause(dtime);
%tic;

while(true)
    
    %(time < duration)

  %pos = forward(h,encoder,  phi,x,y, 10,0.2);
  
  
  if min ( sensorToDistance(kProximity(h)) ) < vStop
      err = 1;
      
     obsPos = obstacleEstimation( snr, sensorValues(:,:,snr) )
     % rechne in x/y_ego um
     % mov_bow mit 90 grad
      obstacles =  [ obstacles obsPos ];

      
      break;
  end
  
  
  
  posit = updatePosition(h,encoder, x,y,phi);
  x = posit(1);
  y = posit(2);
  phi = posit(3);
  encoder(1) = posit(4);
  encoder(2) = posit(5);
  places = [ places [x;y;phi] ]; 
  alpha = field(round(x),round(y),3);
  %alpha = (alpha/pi)*180;
  betrag = field(round(x),round(y),4);
  
  kStop(h);
  turn = movToAngle(h,encoder,phi ,alpha,omega);
  
  pause(dtime);
  
  kStop(h);
  phi = turn(1); 
  encoder(1) = turn(2);
  encoder(2) = turn(3);  
  
  
  movAcc_straight(h,velocity*betrag);
  
  circle = mod(circle,4)+1;
  sdata = kProximity(h);
  assert(sdata(1) > 0);
  sens = sensorToDistance(sdata);
  for s=1:8

    sensorValues(circle,1,s) = x;
    sensorValues(circle,2,s) = y;
    sensorValues(circle,3,s) = phi;
    sensorValues(circle,4,s) = sens(s);

  end
  
  if ((xp-50) < x) && (x < (xp+50)) && ((yp-50) < y) && (y < (yp+50))
      Tx = x;
      Ty = y;
      trigger = 1;
  break;
  end
  
  pause(dtime);
  
  countTest = countTest + 1;

  %time = toc;
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

%{

x 20
y 200

nach

x90
y250

phi_45

%}

% [ 0; 0.3040 ;1.8009 ;3.0588 ; 3.9912; 4.8353 ]











