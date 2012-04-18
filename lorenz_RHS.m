function v=lorenz_RHS(u,theta);
v(1)=theta(1)*(u(2)-u(1));
v(2)=u(1)*(theta(2)-u(3))-u(2);
v(3)=u(1)*u(2)-theta(3)*u(3);
