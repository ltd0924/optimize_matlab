h=[0.2,0.1,0.05,0.01];
syms y(t) t
eqn = diff(y,t) == -y+3*cos(3*t)*exp(-t);
con = y(0) == 0;

yS(t) = dsolve(eqn,con);
cf=linspace(0,5);
plot(cf,yS(cf),'--','LineWidth',2,'DisplayName','original data')
grid on;
for i=1:4
    cc=0:h(i):5;
    yy=[0];
    for j=1:length(cc)-1
        kk=3*cos(3*cc(j))*exp(-cc(j))-yS(cc(j));
       yy(j+1)=yy(j)+h(i)*kk;
    end
    ccname=h(i)+" Euler";
    hold on;  
    plot(cc,yy,'DisplayName',ccname);
    
    hold on;    
    for j=1:length(cc)-2
       kk=3*cos(3*cc(j))*exp(-cc(j))-yS(cc(j));
       kg=3*cos(3*cc(j+1))*exp(-cc(j+1))-yS(cc(j+1));
       yy(j+1)=yy(j)-h(i)*kk*0.5+1.5*h(i)*kg;
    end
    ccname=h(i)+" Adams";
    plot(cc,yy,'DisplayName',ccname);
    
end