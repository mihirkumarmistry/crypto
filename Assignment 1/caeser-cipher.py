"""
Created on Mon Oct  7 00:28:03 2024
@author: Mihirkumar Mistry
Student ID: 249419480
Group Number: 11
"""
# Take cipher text from the user
cipher_text = input('Enter cipher text:')
# Take key value from the user
key = int(input('Enter key:'))

# Caesar cipher decryption function
def caesar_cipher_decryption(cipher_text, key):
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
            
    return plain_text

# Call caesar_cipher_decryption with user input
print('Plaintext:',caesar_cipher_decryption(cipher_text, key))


# p_text = caesar_cipher_decryption('ez oz zc yze ez oz esle td esp bfpdetzy', 11)


# def caesar_attack(cipher_text):
    
#     for key in range(26):
#         decrypted_text = ""
#         shift = key
    
#         for char in cipher_text:
#             if char.isalpha():  # Check if the character is an alphabet
#                 # Reverse shift character based on case
#                 start = ord('A') if char.isupper() else ord('a')
#                 decrypted_char = chr((ord(char) - start - shift) % 26 + start)
#                 decrypted_text += decrypted_char
#             else:
#                 decrypted_text += char  # Non-alphabet characters remain unchanged
            
#         print(f"Key: {key}, Plaintext: {decrypted_text}")
        
        
# caesar_attack('jryy qbar v nccergvngr vg')