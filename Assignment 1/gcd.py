"""
Created on Sun Oct  6 23:55:27 2024
@author: Divkumar Patel
Student ID: 249417620
Group Number: 11
"""

# Take integer number1 from user
number1 = int(input('Enter integer number1:'))
# Take integer number2 from user
number2 = int(input('Enter integer number2:'))

# Step 1: Check if number2 > number1
if number2 > number1:
    # Swap number1 and number2 value
    temp = number1
    number1 = number2
    number2= temp

# Calcualte GCD function
def get_gcd(number1, number2):
    return number2 == 0 and number1 or get_gcd(number2, number1 % number2)

# Call function to calculate GCD
gcd = get_gcd(number1, number2)

# Print gcd value
print(f"GCD of {number1} and {number2} is: {gcd}.")
