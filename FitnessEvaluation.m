function [ fitness ] = FitnessEvaluation( population,n,generation,Graph )

    fitness=zeros(population,2);
    for i=1:population
        for j=1:n
            for k=1:n
                if((j~=k)&&(j<k))%up of principal Diagonal
                    if((Graph(j,k)==1)&&(generation(i,j)==generation(i,k)))%two nodes have same color
                        fitness(i,1)=fitness(i,1)-1;
                        fitness(i,2)=i;
                    end
                    if ((Graph(j,k)==1)&&(generation(i,j)~=generation(i,k)))%two nodes have different color
                        fitness(i,1)=fitness(i,1)+1;
                        fitness(i,2)=i;
                    end
                    
               
                end
            end
        end
    end


end

