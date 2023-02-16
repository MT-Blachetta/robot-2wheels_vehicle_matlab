
setSpeed = zeros(10,1);
GetEncoders = zeros(10,1);
GetSpeed = zeros(10,1);
kProx = zeros(10,1);
SetEnc = zeros(10,1);

for k = 1:10
tic;
kSetSpeed(h,k,k);
setSpeed(k) = toc;
end


for k = 1:10
tic;
kGetSpeed(h);
GetSpeed(k) = toc;
end


for k = 1:10
tic;
kGetEncoders(h);
GetEncoders(k) = toc;
end

for k = 1:10
tic;
kSetEncoders(h,k,k);
SetEnc(k) = toc;
endx

for k = 1:10
tic;
sens = kProximity(h);
kProx(k) = toc;
end










%{

totalWay = 100;
velocity = 20;
way = 10;
duration = (totalWay+1)/velocity;
duration

time = 0;
tic;

while (time < duration)

  %pos = forward(h,encoder,  phi,x,y, 10,0.2);
  
  pause(way/velocity);
  time = toc;
  time

  %pos
  %x = pos(1);
  %y = pos(2);
  %encoder(1) = pos(3);
  %encoder(2) = pos(4);
  
end

%}