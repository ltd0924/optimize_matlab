function Lines=genline(x,y,N)
for i=1:N-1
    Lines{i}=[x(i:i+1),y(i:i+1)];
end
Lines{N}=[[x(N),x(1)],[y(N),y(1)]];
end