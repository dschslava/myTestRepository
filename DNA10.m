%% Change list
% 1. Add a function for plot. 
% 2. Modify codon5 to bring nuc used in the function for the plot.

%%

clear all;
close all;
clc;
tic;
%% option to save the data and change the direction of the data
saveoption = 1;  % 0 no save, 1 for excel, 2 for txt file
cont = 1;  % just to print dot lines at the beginning of the test. Used in the save2file.m

datadir = 0;  % 0 for the foward direction, 1 for the reverse direction

pname = 'TP53';

%% Data extraction from an excel file
[dna] = dataextraction2(pname); 

if datadir == 1
    dna = dna(end:-1:1);
end

%% Initial value for variables
numBases = length(dna);
freqCodon = 1; % If the data should be calculated for frequency
NoC = zeros(1, 64); % Number of Codon
PoC = zeros(1, 64); % Percent of Codon

%% Main loop to calculate 
for i = 1:1:numBases-2
    for k = i:3:numBases-rem(numBases-i+1,3)-2
        [NoC, lastcodon, nuc] = codon5(dna, k, NoC);
        if (strcmp(lastcodon, 'TAA') || strcmp(lastcodon, 'TAG') ||...
            strcmp(lastcodon, 'TGA')) && (k ~= numBases-rem(numBases-i+1,3)-2)
            NoC = zeros(1,64);
            freqCodon = 2;
            break;
        end
    end
    if freqCodon == 1
        for h = 1:1:64
            PoC(h) = (NoC(h)/((numBases-rem(numBases-i+1,3)-i+1)/3))*100;
        end
        totalsamples = (numBases-rem(numBases-i+1,3)-i+1)/3;
        newdata = [PoC, totalsamples];
        tc = num2str(i); % Starting position
        [cont] = save4file(tc,newdata,saveoption,cont,datadir,pname);
        
        displayplot2(PoC,nuc,tc,totalsamples,numBases,pname);     
        
        
        break;
    end
    freqCodon = 1;

end


