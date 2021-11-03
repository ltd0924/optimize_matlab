function SumAll(varargin)
  if nargin==0
    disp("Number of input is 0");
    disp(" = 0");
  elseif nargin==1
    disp("Number of input is "+varargin{1});
    disp(varargin{1}+"="+varargin{1});
  else
    ans=0;
    s=varargin{1};
    for i=1:nargin
      ans=ans+varargin{i};
      if i~=1
        s=s+" + "+varargin{i};
      end
    end
    disp("Number of input is "+ans);
    disp(s+" = "+ans);
  end
