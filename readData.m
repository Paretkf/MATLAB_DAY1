%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Pare\Desktop\TESA\MATLAB\workshop\commercial buildings\building1retail.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/01/09 11:10:10

%% Initialize variables.
filename = 'C:\Users\Pare\Desktop\TESA\MATLAB\workshop\commercial buildings\building1retail.csv';
delimiter = ',';
startRow = 2;

%% Format for each line of text:
%   column1: datetimes (%{MM/dd/yyyy HH:mm}D)
%	column2: double (%f)
%   column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%{MM/dd/yyyy HH:mm}D%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
building1retail1 = table(dataArray{1:end-1}, 'VariableNames', {'Timestamp','OATF','PowerkW'});

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% building1retail1.Timestamp=datenum(building1retail1.Timestamp);

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;