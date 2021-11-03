function [xbest,fbest] = fga(fun,N,ll,uu,pc,pm,n,k_max,pa) %%A simple GA
if n==1
    tt=linspace(ll,uu,100);
    for j=1:100
        [t,fc]=fun([tt(j)]);
        Y(j)=fc;
    end
    plot(tt,Y);
    hold on;
end
if n==2
    xx=linspace(ll,uu,100);yy=xx;
[X,Y] = meshgrid(xx,yy);
for i=1:100
    for j=1:100
        [t,fc]=fun([xx(i),yy(j)]);
        Z(i,j)=fc;
    end
end
contour(X,Y,Z);
hold on
end
lb(1:n)=ll;
ub(1:n)=uu;
k=1;

pm0 = pm;
P = initialize_population(n,N); %% P is the population
[F,xbest,fbest] = evaluate(fun,P,lb,ub); %% F is the fitness of the individuals in P
while k < k_max
Ptemp = selection(P,F);
P = crossover(Ptemp,pc,pa);
P = mutation(P,pm,lb,ub);
P{1} = xbest;
[F,xbest,fbest] = evaluate(fun,P,lb,ub,fbest);
pm = adjust_mutation_rate(P,k,k_max,pm,pm0);
k = k+1;
for i=1:N
    if n==2
        plot(P{i}(1),P{i}(2),'*');
    end
    if n==1
        [~,fbest]=fun(P{i});
        plot(P{i},fbest,'*');
    end
end
end
if n==2
    plot(xbest(1),xbest(2),'ro','LineWidth',2,'MarkerSize',6);
end
if n==1
    plot(xbest,fbest,'ro','LineWidth',2,'MarkerSize',6);
end

function P = initialize_population(n,N)
%% n: number of design variables
%% N: number of individuals
for j = 1:N
P{j} = floor(2*rand(1,n));
end

function [F,xbest,fbest] = evaluate(fun,P,lb,ub,varargin)
j0 = 1; fbest = Inf;
N=length(P);
if nargin>4
j0 = 2;
xbest = P{1}; %% currently the first individual is the best if provided.
fbest = varargin{1}; %% if varargin is provided.
F(1) = fbest;
end
for j = j0:N
[~,F(j)] = fun(P{j}); %% decode and evaluate function value
if F(j) < fbest
xbest = P{j};
fbest = F(j);
end
end

function R = selection(P,F)
p=F/sum(F);
N = length(P);
Lp(1)=F(1);
for i=2:N
Lp(i)=Lp(i-1)+F(i); %%计算累积概率
end
R=P;
for i=1:N
ind=find((Lp-rand())>0); %%找出轮盘赌选择的指标
if length(ind)>0
R{i}=P{ind(1)}; %%将对应指标的染色体取出来赋值给新的种群
end
end

function R = crossover(P,pc,pa)
N = length(P); %% number of parents
for i=1:2:N
    if rand()<pc
        R{i}=pa*P{i}+(1-pa)*P{i+1};
        R{i+1}=pa*P{i+1}+(1-pa)*P{i};
    else
        R{i}=P{i};
        R{i+1}=P{i+1};
    end
end

function R = mutation(P,pm,lb,ub)
N = length(P);
for j = 1:N %% go through all genes in each individual for the
    if mod(randperm(N,1),2)==0
        R{j}=P{j}+pm*(ub-P{j})*rand();
    else
        R{j}=P{j}-pm*(P{j}-lb)*rand();
    end
end
function S = population_diversity(P)
N = length(P);
n = length(P{1});
for j = 1:n
for k = 1:N
L(k) = P{k}(j); %% collect jth gene of all individual
end
R(j) = std(L); %% standard deviation of jth gene
end
S = sum(R)/n;

function pm = adjust_mutation_rate(P,k,k_max,pm,pm0)
S = population_diversity(P); %% check population diversity
if k < k_max/2 %% if not reaching half of max iteration
if S < 0.1
pm = pm*1.3; %% diversity is small, higher prob. of mutation
else
pm = pm/1.2; %% diversity is not small, lower prob. of mutation
end
else
pm = pm0*(2*(k_max-k)/k_max)^2; %% gradually reducing the mutation rate
end

