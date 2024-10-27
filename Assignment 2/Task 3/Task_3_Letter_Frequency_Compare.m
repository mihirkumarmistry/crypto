%% This program plots the letter frequency of the input text
clc; close all; clear all;

%% Reading ciphertext from file
cipherText = fileread('CipherText2.txt'); 
ascii_cipherText = double(cipherText); %Converting string to numeric ASCII values

%% Reading plaintext from file
plainText = fileread('PlainText1.txt'); 
ascii_plainText = double(plainText); % converting string to numeric ASCII values

%% array declaration. Array size 1x26
frequency_cipher = zeros(1,26); 
frequency_plain = zeros(1,26);

%% Counting frequency for small case letters
for i= 97:1:122
    frequency_cipher(i-96) = length(find(ascii_cipherText==i));
    frequency_plain(i-96) = length(find(ascii_plainText==i));
end

%% Counting frequency for capital case letters
for i= 65:1:90
    frequency_cipher(i-64) = frequency_cipher(i-64) + length(find(ascii_cipherText==i));
    frequency_plain(i-64) = frequency_plain(i-64) + length(find(ascii_plainText==i));
end

%% Normalizing to percentage value
frequency_cipher = frequency_cipher/sum(frequency_cipher)*100; 
frequency_plain = frequency_plain/sum(frequency_plain)*100; 

%% Ploting letter frequency for ciphrtext
subplot(2,1,1)
bar(frequency_cipher, 'red')
xlabel('Encrypted Alphabets (a to z i.e., 0 to 26)')
ylabel('Frequency (in %)')
title('Letter Frequency Plot for Ciphertext')
grid on

%% Ploting letter frequency for plaintext
subplot(2,1,2)
bar(frequency_plain, '')
xlabel('Plain Alphabets (a to z i.e., 0 to 26)')
ylabel('Frequency (in %)')
title('Letter Frequency Plot for Plaintext')
grid on
