


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% @Copy by  Sobhan Siamak %%%%%%%%%%%%%%%

%% This Program is the Graph Coloring using Simple Genetic Algorithm
% Representation=Integer
clc;
clear;
close all;

%%%%%%%%%%%%%%%%%%%% Definition Matrix of Graph %%%%%%%%%%%%%%%%%%
%Graph=[0,1,0,1,1;1,0,1,0,1;0,1,0,1,1;1,0,1,0,1;1,1,1,1,0];%n=5
%Graph=[0,1,0,1;1,0,1,0;0,1,0,1;1,0,1,0];%n=4
 Graph=[0,1,0,0,1,1,0,0,0,0;1,0,1,0,0,0,1,0,0,0;0,1,0,1,0,0,0,1,0,0;
     0,0,1,0,1,0,0,0,1,0;1,0,0,1,0,0,0,0,0,1;1,0,0,0,0,0,0,1,1,0;
     0,1,0,0,0,0,0,0,1,1;0,0,1,0,0,1,0,0,0,1;0,0,0,1,0,1,1,0,0,0;
     0,0,0,0,1,0,1,1,0,0];%Petersen Graph with ABCDEFGHIJ 10 nodes and chromatic number=3

n=10; %the length of Chromosome ------- for this specific example is x but you can change it
%% you can randomly generate a graph with following line and GraphGenarating Function
% Graph=GraphGeneration(n); % this graph is undirected and symmetric

%%
k=n-2;%k is the number of colors
population=100; %the size of population
%calculate the number of chromosome for crossover and mutation
pc=0.85;% the probability of Crossover
crossnumber=2*round((pc*population)/2);% the number of crossover
pm=0.15;% the probability of mutation
mutatenumber=round(pm*population);% the number of mutation

tic %start Time
%% Initial Generation
generation = initgeneration(n,population,k);
generationcount=150;% the number of generation for running program
Fitness = FitnessEvaluation(population,n,generation,Graph);
BestFitness=zeros(generationcount,1);
AvgFitness=zeros(generationcount,1);
%% main loop
for i=1:generationcount


   %% Selection Function based on Roulette wheel
   crossgeneration=SelectionRW(population,generation,Fitness,n,crossnumber,pc);
   
   %% Crossover  based on One Point
    % in SelectionRW Function  or selection parent we call crossover
    % function  and no need to call crossover this place
   %Crossover=Crossover();no need 

   %% Mutation based on integer Random Flip without repetitive bit 

   otherGeneration=Mutation(crossgeneration,mutatenumber,k,pm,population);
   NewFitnessNext=FitnessEvaluation(population,n,otherGeneration,Graph);
   %% Survival Selection   
      %NewGeneration = 50% of best parents and 50% of best offsprings
   NewGeneration=SurvivalSelection(generation,otherGeneration,population,Fitness,NewFitnessNext,n);
   NewFitness=FitnessEvaluation(population,n,NewGeneration,Graph);
   generation=otherGeneration;
   Fitness=NewFitnessNext;       
   %End of transmite best chromosomes from one generation to other  generation
   %% Display Best Fitness in every Generation
   BestFitness(i)=max(NewFitness(:,1));
   AvgFitness(i)=(sum(NewFitness(:,1)))/population;
   disp(['Generation= ' num2str(i)  '  BestFitness= ' num2str(BestFitness(i))]);

end%%% end of main loop

FinalFitness=NewFitness;
FinalGeneration=NewGeneration;
FinalFitness=sortrows(FinalFitness);%sort ascending Final Fitness 
FinalFitness=flipud(FinalFitness);%sort descending Final Fitness
bestindex=FinalFitness(1,2);
%% Display Graph, Best solution, and Best Fitness
Graph
disp(['Best Solution=' num2str(FinalGeneration(bestindex,:))]);
disp(['Best Fitness=' num2str(FinalFitness(1,1))]);
disp(['Time is:' num2str(toc)]); % stop Time

%% Plot Best and Average Fitness based on Generations
figure(1)
plot(BestFitness,'b');
xlabel('Generation');
ylabel('Fitness');
legend('Best=Blue    AVG=Red');
title('Graph Coloring');
hold on
plot(AvgFitness,'r');
%plot(Graph)
hold off
