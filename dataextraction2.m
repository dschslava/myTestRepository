function [alldata] = dataextraction2(pname)

% clear all;
% close all;

%% Read the data from an excel file.
rawrow = [];  % create one line of data

% [~,t,~] = xlsread('and.xlsx');  % read the data from excel file copied from the web page. 
% [~,t,~] = xlsread('D:\MAP Program\hello.xlsx');  % read the data from excel file copied from the web page. 
[~,t,~] = xlsread(['/Users/power/Documents/DNA/',pname,'.xlsx']); 
% [~,t,~] = xlsread([pname,'.xlsx']); 
numrow = size(t);  % show homw many row has the data in the excel.

%% Concatenate and clean up the data to use. 
    for i = 1:numrow(1)  %  concatenate each first row to the last row in the excel based on numrow(rowxcolumn).
        for k = 1:numrow(2)  %  concatenate first and the last column per each row based on numrow.
            rawrow = strcat(rawrow,t{i,k});
        end
    end
rawrow(isletter(rawrow)==0)=[];  % remove all special characters in the data.
alldata = upper(rawrow);  % capitalize all data
numdata = length(alldata);  % check the length of all final data. Based on this, some loop for analyzing the data needs to be interated.

disp(['Total number of letters = ',num2str(numdata)]);


end