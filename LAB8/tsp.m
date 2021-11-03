function [xbest,fbest] = tsp(dis,n,N,pc,pm,k_max,pa) %%A simple GA

k=1;

pm0 = pm;
P = initialize_population(N,n); %% P is the population
[f,xbest,fbest]= evaluate(P,dis,N); %% F is the fitness of the individuals in P
while k < k_max
    Ptemp = selection(P,f,N);
    P = crossover(Ptemp,pc,pa,N);
    P = mutation(P,pm,N);
    P{1} = xbest;
    [F,xbest,fbest] = evaluate(P,dis,N,fbest);
    pm = adjust_mutation_rate(P,k,k_max,pm,pm0);
    k = k+1;
    %xbest;
    %disp(" length: "+fbest);
end

disp("final: ");xbest
disp(" length: "+fbest);
end

function P = initialize_population(N,n)
for i=1:n
    P{i}=randperm(N);
end
end

function [f,xbest,fbest]= evaluate(P,dis,N,varargin)
j0 = 1; fbest = Inf;
if nargin>3
j0 = 2;
xbest = P{1}; %% currently the first individual is the best if provided.
fbest = varargin{1}; %% if varargin is provided.
f(1) = fbest;
end
n=length(P);
for ii=1:n
    f(ii)=0;
    for jj=1:N-1
        f(ii)=f(ii)+dis{P{ii}(jj)}(P{ii}(jj+1));
    end
     f(ii)=f(ii)+dis{P{ii}(N)}(P{ii}(1));
    if f(ii) < fbest
       xbest = P{ii};
       fbest = f(ii);
    end
end
end

function R = selection(P,F,N)
p=F/sum(F);
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
end

function R = crossover(P,pc,pa,N)
c1=randperm(N-1,2);
while c1(1)==c1(2)
    c1=randperm(N-1,2);
end
if c1(1)>c1(2)
    tmp=c1(2);c1(2)=c1(1);c1(1)=tmp;
end
for i=1:2:N
    tcc=P{i}(c1(1)+1:c1(2));
    P{i}(c1(1)+1:c1(2))=P{i+1}(c1(1)+1:c1(2));
    P{i+1}(c1(1)+1:c1(2))=tcc;
    mmap=containers.Map(tcc,P{i}(c1(1)+1:c1(2)));
    mmap1=containers.Map(P{i}(c1(1)+1:c1(2)),tcc);
    p2=zeros(1,N);
    for j=1:length(tcc)
        p2(tcc(j))=1;
    end
    p1=zeros(1,N);
    tcc=P{i}(c1(1)+1:c1(2));
    for j=1:length(tcc)
        p1(tcc(j))=1;
    end
    for j=1:c1(1)
        if p1(P{i}(j))==0
            p1(P{i}(j))=1;
        else
            cg=mmap(P{i}(j));
            while p1(cg)==1
                cg=mmap(cg);
            end
            p1(cg)=1;
            P{i}(j)=cg;
        end
    end
    for j=c1(2)+1:N
        if p1(P{i}(j))==0
            p1(P{i}(j))=1;
        else
            cg=mmap(P{i}(j));
            while p1(cg)==1
                cg=mmap(cg);
            end
            p1(cg)=1;
            P{i}(j)=cg;
        end
    end
    for j=1:c1(1)
        if p2(P{i+1}(j))==0
            p2(P{i+1}(j))=1;
        else
            cg=mmap1(P{i+1}(j));
            while p2(cg)==1
                cg=mmap1(cg);
            end
            p2(cg)=1;
            P{i+1}(j)=cg;
        end
    end
    for j=c1(2)+1:N
        if p2(P{i+1}(j))==0
            p2(P{i+1}(j))=1;
        else
            cg=mmap1(P{i+1}(j));
            while p2(cg)==1
                cg=mmap1(cg);
            end
            p2(cg)=1;
            P{i+1}(j)=cg;
        end
    end
end
R=P;
end




function R = mutation(P,pm,N)
n = length(P);
R=P;
for j = 1:n %% go through all genes in each individual for the
    if pm > rand()
        c1=randperm(N,2);
        tmp=R{j}(c1(1));R{j}(c1(1))=R{j}(c1(2));R{j}(c1(2))=tmp;
    end
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
end

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
end
