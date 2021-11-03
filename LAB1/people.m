function db_file=people(db_file,comm,varargin)
switch comm
    case 'reset'
        db_file=[];
    case 'list'
        [~,n]=size(db_file);
        for i=1:n
            disp(db_file(i).name+" "+db_file(i).age);
        end
    case 'insert'
        [~,n]=size(db_file);
        [m,~]=size(varargin{1});
        for i=1:m
            db_file(n+i).name=varargin{1}(i,1);            
            db_file(n+i).age=varargin{1}(i,2);
        end
    case 'remove'
        t=find(strcmp({db_file.name},varargin{1}));
        db_file(t)=[];
        
end
        