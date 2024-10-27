%% Caesar Cipher encryption
% m = plain text string. Contains only a-to-z and space
% k = encryption key, ranges from 1 to 26 
% cipherText = encrypted text k(m).

clc; clear all; close all;

m = fileread('PlainText1.txt'); % reading plaintext from text file
k = 0; % encryption key
ascii_m = double(m);         % ascii values of the string

%% Finding the locations of special characters
characters1 = find(ascii_m < 65); 
characters2 = find(ascii_m == 96);
characters3 = find(ascii_m > 122);

%% special characters are replaced by space
ascii_m(characters1) = 32;  
ascii_m(characters2) = 32;  
ascii_m(characters3) = 32;  
 
 
%% Encryption
ascii_cipherText = ascii_m+k;
wrap = find(ascii_cipherText>122); % wraping around if greater than 'z'
ascii_cipherText(wrap) = ascii_cipherText(wrap)-26;
wrap = find(ascii_cipherText==96); % wraping around if greater than 'z'
ascii_cipherText(wrap) = ascii_cipherText(wrap)-26;


%% restoring spaces
ascii_cipherText(characters1) = 32;     
ascii_cipherText(characters2) = 32;     
ascii_cipherText(characters3) = 32;     

cipherText = char(ascii_cipherText);

%% Writing encrypted text in a text file
%fid = fopen('C:\Users\Administrator\Documents\MATLAB\CipherText1.txt','wt');
fid = fopen('Task_1_CipherText1.txt','wt');
fprintf(fid, '%s', cipherText);
fclose(fid);
