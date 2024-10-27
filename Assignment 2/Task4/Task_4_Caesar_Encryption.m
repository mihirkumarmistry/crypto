% This program will find the key and decript the cipher text
clc; close all; clear all;

%text = fileread('EvesDiaryMarkTwain.txt'); % reading text from file
text = fileread('CipherText2.txt'); % reading text from file
ascii_text = double(text); % converting string to numeric ASCII values

frequency = zeros(1,26); % array declaration. Array size 1x26

%% Counting frequency for small case letters
for i= 97:1:122
    frequency(i-96) = length(find(ascii_text==i));
end

%% Counting frequency for capital case letters
for i= 65:1:90
    frequency(i-64) = frequency(i-64) + length(find(ascii_text==i));
end


% Standard English letter frequencies (approximate)
english_freq = [8.167, 1.492, 2.782, 4.253, 12.702, 2.228, 2.015, 6.094, ...
                6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 1.929, ...
                0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.361, 0.150, ...
                1.974, 0.074];

% Normalize the frequencies of the ciphertext to compare with English frequencies
total_letters = sum(frequency);
normalized_frequency = (frequency / total_letters) * 100;

% Find the best shift by comparing each possible shift with standard frequencies
best_shift = 0;
min_difference = inf; % Start with a large number

for shift = 0:25
    % Shift frequencies
    shifted_frequency = circshift(normalized_frequency, -shift);
    
    % Calculate the sum of absolute differences for this shift
    difference = sum(abs(shifted_frequency - english_freq));
    
    % Update the best shift if this one has a smaller difference
    if difference < min_difference
        min_difference = difference;
        best_shift = shift;
    end
end

% Decrypt the text using the best shift found
plaintext = char(ascii_text); % Initialize with original text structure
for i = 1:length(ascii_text)
    if ascii_text(i) >= 65 && ascii_text(i) <= 90
        % Uppercase letters
        plaintext(i) = char(mod(ascii_text(i) - 65 - best_shift, 26) + 65);
    elseif ascii_text(i) >= 97 && ascii_text(i) <= 122
        % Lowercase letters
        plaintext(i) = char(mod(ascii_text(i) - 97 - best_shift, 26) + 97);
    end
end

% Save the plaintext to a file
fileID = fopen('PlainText2.txt', 'w');
fprintf(fileID, '%s', plaintext);
fclose(fileID);

% Display the encryption key and success message
fprintf('The encryption/decryption key (shift) is: %d\n', best_shift);
disp('Decryption complete. Plaintext saved to PlainText2.txt.');