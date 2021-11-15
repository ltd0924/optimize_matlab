function points=LHS(N,n)
dis=1/N;
visited=zeros(N,n-1);
for i=1:N
    while true
        flag=0;
        for j=1:n-1
            c(j)=randperm(N,1);            
        end
        for j=1:n-1
            if visited(c(j),j)~=0
                flag=1;
                break
            end
        end
        if flag==0
            for j=1:n-1
                visited(c(j),j)=1;          
            end
            break
        end
    end    
    points(i,:)=[dis*(i-1)+rand()*dis,(c-1).*dis+rand()*dis];
end
