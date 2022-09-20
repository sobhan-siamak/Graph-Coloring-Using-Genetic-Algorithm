function [ crossgeneration ] = SelectionRW( population,generation,Fitness,n,crossnumber,pc )

  NewFitness=Fitness;
  crossgeneration=generation;
  %Normalize Fitness between 0 and 1
  minim=min(Fitness(:,1));
  if(minim<=0)
     NewFitness(:,1)= (Fitness(:,1)-minim)+1;
  end
  %RouletteWheel
  s=sum(NewFitness(:,1));%calculate sum
  NewFitness(:,1)=NewFitness(:,1)/s;%calculate average
  NewFitness(:,1)=cumsum(NewFitness(:,1));%cumulative Sum
  
  for i=1:population-1
      if(rand<pc)% crossover with pc probability
         p1=find(rand<NewFitness(:,1),1,'first');%find the first chromosome
         p2=find(0.9*rand<NewFitness(:,1),1,'first');%find the second chromosome
         if (p1~=p2)
           [o1,o2]=Crossover(p1,p2,n,generation);%call crossover for every selection
           crossgeneration(i,:)=o1;%save offspring1
           crossgeneration(i+1,:)=o2;%save offspring2
        end
      end
  end
      
  %   for i=1:2:crossnumber
%       p1=find(rand<NewFitness(:,1),1,'first');
%       p2=find(0.9*rand<NewFitness(:,1),1,'first');
%       if (p1~=p2)
%         [o1,o2]=Crossover(p1,p2,n,generation);
%         crossgeneration(i,:)=o1;
%         crossgeneration(i+1,:)=o2;
%       end
%   end



end

