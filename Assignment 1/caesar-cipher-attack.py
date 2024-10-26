# -*- coding: utf-8 -*-
"""
Created on Mon Oct  7 00:55:03 2024
@author1: Mihirkumar Mistry (Student ID: 249419480)
@author2: Divkumar Patel (Student ID: 249417620)
Group Number: 11
"""
# Take cipher text from the user
cipher_text = input('Enter cipher text:')

# Caesar cipher attack function
def caesar_cipher_brute_force_attack(cipher_text):
    # Loop through 1 to 26 keys
    for key in range(1, 26):
        plain_text = ""
    
        for char in cipher_text:
            # Check if the char is a alphabet or not
            if char.isalpha(): 
                # Get the ascii value of the base char, based on the case
                start = ord('A') if char.isupper() else ord('a')
                # Finding the plaintext using character shifting algorithm 
                decrypted_char = chr((ord(char) - start - key) % 26 + start)
                # Add the resulting char
                plain_text += decrypted_char
            else:
                # Keep the Non-alphabet character as it is
                plain_text += char
                
        print(f"Key: {key}, Plaintext: {plain_text}")
        
        
# Call caesar_cipher_decryption with user input
caesar_cipher_brute_force_attack(cipher_text)
# 'jryy qbar v nccergvngr vg'
