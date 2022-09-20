function [ Graph ] = GraphGeneration( n )

  Graph=zeros(n);
  for i=1:n
      for j=1:n
          if(i<j)
              Graph(i,j)=randi([0 1]);
          end
          if(i>j)
              Graph(i,j)=Graph(j,i);%because graph is symmetric
          end
      end
  end
  
end

