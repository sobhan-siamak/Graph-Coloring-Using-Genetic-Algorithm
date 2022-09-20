function [ NewGeneration ] = Mutation( crossgeneration,mutatenumber,k ,pm,population)

   [n1,m1]=size(crossgeneration);
   flag=0;% this flag is for checking different color in chromosome 
   %for i=1:mutatenumber
   for i=1:population
       if(rand<pm)%mutation with pm probability
         mpoint=randi([1,n1]);%select random one chromosome for mutation
         parent=crossgeneration(mpoint,:);
         k2=randi([1 k]);%k2 is the color
         for j=1:m1
            if(parent(j)==k2)
                flag=1;%means this color is in the chromosome
            end
         end
         if(flag==0)%if this color is not in the chromosome
            t=randi([1 m1]);%select random one point for changing color
            parent(t)=k2;%replace the color
         end
         crossgeneration(mpoint,:)=parent();
         flag=0;
       end
   end
   
   NewGeneration=crossgeneration;

end

