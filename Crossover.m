function [ o1,o2 ] = Crossover( p1,p2,n,generation )

   parent1=generation(p1,:);
   parent2=generation(p2,:);
   
   onepoint=randi([1,n-1]);%select one point among length of chromosome
   
   o1=[parent1(1:onepoint) parent2(onepoint+1:end)];%offspring1
   o2=[parent2(1:onepoint) parent1(onepoint+1:end)];%offspring2

end

