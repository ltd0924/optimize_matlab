function Fit = mec(fun,nPop,Xmin,Xmax,pc,mu,n,gamma,k_max) %%A simple GA
Pop = repmat(Xmin, nPop, 1) + repmat((Xmax - Xmin), nPop, 1) .* rand(nPop, n);
for i=1:nPop
    Fit(i,:)=(fun(Pop(i,:)))';
end
kc=1;nc=2*round(pc*nPop/2);
while kc<k_max
    
    ssr = randperm(nPop);
    parent = Pop(ssr, :);
    parentfit = Fit(ssr, :);
    
    % select parents for crossover
    spc = ssr(1: nc);
    % select parents for mutation
    spm = ssr(nc+1: end);
    
    % Crossover
    parentc = Pop(spc, :);
    offspringc = zeros(size(parentc));
    for k=1:nc/2
        
        p1=parentc(2*k-1, :);
        p2=parentc(2*k, :);
        [offspringc(2*k-1, :), offspringc(2*k, :)]=Crossover(p1, p2, gamma, Xmax, Xmin);
        
    end
    
    
    % Mutation
    parentm = Pop(spm, :);
    offspringm = zeros(size(parentm));
    nm=nPop - nc;
    for k=1:nm 
        p=parentm(k, :);      
        offspringm(k, :)=Mutate(p,mu, Xmax, Xmin);
    end

    % new offspring
    offspring = [offspringc; offspringm];
    for i=1:length(offspring)
        offspringfit(i,:)=(fun(offspring(i,:)))';
    end
    kc=kc+1;
    
    % Merge the parent and offspring
    Pop = [parent; offspring];
    Fit = [parentfit; offspringfit];
    
    
    % non-domniated-sort
     [F, F1] = NonDominatedSorting(Pop, Fit);

    % crowding distance assignment
    CCDI = CalcCrowdingDistance(Fit, F);

    % sort population elitism
    indexDC = SortPopulation(F1, CCDI);
    
    % truncation 
    Pop = Pop(indexDC(1:nPop), :);
    Fit = Fit(indexDC(1:nPop), :);
    
    % Plot results;
    plot(Fit(:, 1), Fit(:, 2), 'r*', 'MarkerSize', 8);

    xlabel('f1');
    ylabel('f2');
    title('Iterated Solutions');

    pause(0.00001);
end
end

% non-dominated sorting
function [F, F1] = NonDominatedSorting(pop, fit)
    [N,n ] = size(pop);
    S = cell(N, 1);
    F = {[]};
    nDom = zeros(N, 1);
    rrank = zeros(N, 1);
    for p=1:N
        S{p} = [];
        for q = 1:N
            if all(fit(p, :) <= fit(q, :))
                S{p} = [S{p} q];
            elseif all(fit(q, :) <= fit(p, :))
                nDom(p) = nDom(p) + 1;
            end
        end
        if nDom(p) == 0
            rrank(p) = 1;
            F{1} = [F{1} p];
        end
    end
    
    i =1;
    while true
        Q = [];
        for p=F{i}
            for q = S{p}
                nDom(q) = nDom(q) - 1;
                if nDom(q) == 0
                    rrank(q) = i + 1;
                    Q = [Q q];
                end
            end
        end
        
        if isempty(Q)
            break;
        end
        i = i + 1;
        F{i} = Q;

    end
    
    F1 = zeros(N, 1);
    nfront = numel(F);
    for j=1:nfront
        for k = F{j}
            F1(k) = j;
        end
    end
    
end

function CCDI = CalcCrowdingDistance(fit, F)
    
    nfront = numel(F);
    ojn = size(fit, 2);
    CCDI = zeros(size(fit, 1), 1);
    
    for j=1:nfront
        nsol = numel(F{j});
        CDI = zeros(1, nsol);
        tmp = fit(F{j}, :);
        for oj = 1:ojn
            [value, index] = sort(tmp(:, oj));
            fm_max = value(end);
            fm_min = value(1);
            CDI(index(1)) = Inf;
            CDI(index(end)) = Inf;
            for i=2:nsol-1
                dd = ( fit(F{j}(index(i+1)), oj) - fit(F{j}(index(i-1)), oj)  ) / (fm_max - fm_min);
                CDI(index(i)) = CDI(index(i)) + dd;
            end
        end
        
        for k=1:nsol
            CCDI(F{j}(k)) = CDI(k);
        end
        
    end

end

function index = SortPopulation(F, CDI)
    [~,  index] = sortrows([F CDI], [1, -2]);
end

% crossover operator
function [y1, y2]=Crossover(x1,x2,gamma,VarMax,VarMin)

    alpha=unifrnd(-gamma,1+gamma, size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    
    y1=max(y1,VarMin);
    y1=min(y1,VarMax);
    
    y2=max(y2,VarMin);
    y2=min(y2,VarMax);

end

% mutation operator
function y=Mutate(x,mu,VarMax,VarMin)
       
    % uniform mutation 
    r = rand(size(x)) >= mu;
    y = unifrnd(VarMin, VarMax, size(x));
    y(r) = x(r);

end