
figure
hold on

x = 210;
y = 340;
phi = 270;

encState = kGetEncoders(h);

place = [ x; y; phi ];

scatter(x,y)
axis([0 400 0 400 ])

kSetSpeed(h,500,300);
time = 0;
tic

while(time < 5)
    
info = updatePosition(h ,x,y,phi , encState);
x = info(1)
y = info(2)
phi = info(3)
encState(1) = info(4);
encState(2) = info(5);

scatter(x,y)
drawnow

time = toc;

end

kStop(h);
