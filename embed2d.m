
for t=1:length(u)
ts=1:(length(u)-t);
plot(u(1,ts),u(1,ts+t),'.'), title(t)
drawnow
end
