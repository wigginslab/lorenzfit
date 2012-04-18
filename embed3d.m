

clf
for t=1:length(u)
ts=1:(length(u)-2*t);
plot3(u(1,ts),u(1,ts+t),u(1,ts+2*t),'.'),title(t)
drawnow
end
rotate3d on

