clear 
% random noise on the velocity
  epsilon=1;
% random noise on the observation
  eta=1;
% total time
  T=50;
  T=5000;

% time step
  h=1e-2;

% parameter
  theta=[10 28 8/3];

% initial value
  u0 = [20 5 -5]';
  u(:,1)=u0;

% run the dynamical system
for t=2:T
% the lorenz RHS:
  v(:,t-1)=lorenz_RHS(u(:,t-1),theta);
% now add noise
  v(:,t-1)=v(:,t-1)+eps*randn(size(u0));
% now update
  u(:,t)=u(:,t-1)+h*v(:,t-1);
end

xs=linspace(-5,5,10);
ys=linspace(-5,5,10);


% perturb the degree of freedom ('measurement noise')

u2=u+eta*randn(size(u));
for idx=1:length(xs);                                    
for idy=1:length(ys);
   ls(idx,idy)=lorenz_chisq(theta+xs(idx)*[1 0 0]+ys(idy)*[0 1 0],u2,h);
end
end

%plot it all

% plot the deviation as a function of the parameter perturbation
figure(1)
mesh(xs+theta(1),ys+theta(2),ls);
title('chisquared vs theta(1) and theta(2)')

% plot the unperturbed dynamics
figure(2)
plot(u')
title('u')

% plot the perturbed dynamics (which was fed into the plot of deviation)
figure(3)
plot(u2')
title('perturbed u (fed to chisquared)')
