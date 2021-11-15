function points=SRS(N,n)
l=sqrt(N);
dis1=1/l;
dis2=l/N;
for i=1:l
    for j=1:N/l
        points((i-1)*N/l+j,:)=[dis1*(i-1)+rand()*dis1,(j-1)*dis2+dis2*rand()];
    end
end