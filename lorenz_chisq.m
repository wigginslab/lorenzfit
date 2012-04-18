function [L,v,u_t]=lorenz_chisq(theta,u,h);

% construct the velocity
u_t=diff(u,1,2)/h;

% the model velocity
v=zeros(size(u));
for t=1:(size(u,2)-1);
 v(:,t)=lorenz_RHS(u(:,t),theta);
end

% the difference
delta=u_t-v(:,1:(end-1));

% the square of the difference
L=sum(delta(:).^2);
