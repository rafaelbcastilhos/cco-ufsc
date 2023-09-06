# inputs = [ velocity , angule ]
# state = [ pos x, pos y, direction ]
# output = [ pos x, pos y ]
tmax = 100;
futureEvents = [10, 0.5, 0.1;
                15, 0.5, 0.5;
                30, 1, 0.1;
                50, 0.3, 0.1;
                55, 0.1, -0.5;
                100, 0, 0];

t = 0;
nextEvent = 1;
outputs = [1, 0.1];
results = zeros(1,3);
while t < tmax
  disp (t), disp(outputs);
  t = futureEvents(nextEvent,1);
  outputs(1) = futureEvents(nextEvent,2);
  outputs(2) = futureEvents(nextEvent,3);
  results(end+1,:) = [t, outputs];
  nextEvent = nextEvent + 1;
endwhile;

[x1,y1] = stairs(results(:,1), results(:,2));
[x2,y2] = stairs(results(:,1), results(:,3));
plot(x1,y1,"-o", "linewidth", 2)
xlabel ("t");;
ylabel ("velocity");

