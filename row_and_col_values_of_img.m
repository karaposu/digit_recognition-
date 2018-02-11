function [s] = row_and_col_values_of_img(test_picture)

   s=zeros(1,784) ;
    I =(test_picture)  ;
          for j=1:28  %
                for i=1:28  %
             s(1, i+ 28*(j-1) )=I(j,i); 
                 end

          end
            
          
end

% 
% quick check to see if it is truly calculates ...
%     
% at first  j =1   
%     
%                 for i=1:28  %
%              s(1, i )=I(j,i); 
%                  end
% so it just copy first row to s   ...
%     
% then   j =2
%                  for i=1:28  %
%              s(1, i+ 28) )=I(2,i); 
%                  end
%                  
%     so it copies second row to  s ; starting from s(1, 28)  until  s(1, 56)         
%     
%     
%     then   j =28
%     
%      for i=1:28  %
%              s(1, i+ 28*(27) )=I(28,i); 
%                  end
%                  
%     so it copies second row to s  starting from s(1, 28*27)  until  s(1, 28*28)...
    
    
    
    
    