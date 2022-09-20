function [ NewGeneration] = SurvivalSelection( generation,otherGeneration,population,Fitness,NewFitnessNext,n )

    
    pop=(population/2);% 50% of best chromosome from each generation transmite to next generation
    NewGeneration=zeros(population,n);
    F1=sortrows(Fitness);%Ascending sort of  fitness belong to before generation
    F1=flipud(F1);%Descending sort of fitness  belong to before generation
    F2=sortrows(NewFitnessNext);%Ascending sort of  fitness belong to new generation
    F2=flipud(F2);%Descending sort of fitness  belong to new generation
    for i=1:2:pop
        NewGeneration(i,:)=generation(F1(i,2),:);%transmite of best before generation to new generation
        NewGeneration(i+1,:)=otherGeneration(F2(i,2),:);%transmite of best current generation to new generation
        
    end
    
end

