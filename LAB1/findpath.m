function [x,y]=findpath(x0,y0,N,coordinate,visited)
    if visited(x0,y0)==1
      x=[];y=[];
    else
      visited(x0,y0)=1;
      m=true;% check obstacle or not
      for i=1:N
        if y0==coordinate(2,i) && x0==coordinate(1,i)
          m=false;
          break;
        end
      end
      if y0==20 % top return 
         if m
            x=x0;y=y0;
         else 
             x=[];y=[];
         end
      else
         if m
             [x1,y1]=findpath(x0,y0+1,N,coordinate,visited);
             [~,bb]=size(x1);
             if bb==0
                 if x0<20
                     [x1,y1]=findpath(x0+1,y0,N,coordinate,visited);
                     [~,bb]=size(x1);
                     if bb==0
                       if x0>1
                         [x1,y1]=findpath(x0-1,y0,N,coordinate,visited);
                         [~,bb]=size(x1);
                         if bb==0
                             x=[];y=[];
                         else
                             x=[x1;x0];y=[y1;y0];
                         end
                       else
                          x=[];y=[];
                       end 
                     else
                        x=[x1;x0];y=[y1;y0];
                     end
                 else
                     if x0>1
                         [x1,y1]=findpath(x0-1,y0,N,coordinate,visited);
                         [~,bb]=size(x1);
                         if bb==0
                             x=[];y=[];
                         else
                             x=[x1;x0];y=[y1;y0];
                         end
                      else
                          x=[];y=[];
                      end 
                 end
             else
                  x=[x1;x0];y=[y1;y0];
             end
         else
            x=[];y=[];
         end  
      end
    end
                 