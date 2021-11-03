function ans= Orthonormal(varargin)
if nargin==1
    ans=varargin{1}/norm(varargin{1});
    plot([varargin{1}(1),0],[varargin{1}(2),0],'b')
    hold on
    plot([ans(1),0],[ans(2),0],'r')
elseif nargin>1
    ans{1}=varargin{1}/norm(varargin{1});
    plot([varargin{1}(1),0],[varargin{1}(2),0],'b')
    hold on
    plot([ans{1}(1),0],[ans{1}(2),0],'r')
    for i=2:nargin
        ans{i}=varargin{i};
        tmp=ans{i};
        for j=1:i-1
           ans{i}=ans{i}-tmp'*ans{j}*ans{j};
        end
        ans{i}=ans{i}/norm(ans{i});
        hold on
        plot([varargin{i}(1),0],[varargin{i}(2),0],'b')
        hold on
        plot([ans{i}(1),0],[ans{i}(2),0],'r')
    end
    
else
    disp('error');
end
    