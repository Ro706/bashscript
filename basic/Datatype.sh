#!/bin/bash
echo "=== Bash Data Types Demo ==="

### 1. Strings
name="Rohit"
greeting="Hello, $name!"
echo "String Example: $greeting"

# String operations
str="BashScripting"
echo "Length of string: ${#str}"
echo "Substring (first 4 chars): ${str:0:4}"
echo "Concatenation: $str Rocks!"

### 2. Numbers (Integer Arithmetic)
num1=10
num2=3
echo "Numbers Example:"
echo "Addition: $((num1 + num2))"
echo "Subtraction: $((num1 - num2))"
echo "Multiplication: $((num1 * num2))"
echo "Division: $((num1 / num2))"

# Limitation: No native floating-point
echo "Division with decimals requires 'bc':"
echo "scale=2; $num1 / $num2" | bc

### 3. Arrays
fruits=("Apple" "Banana" "Cherry")
echo "Array Example:"
echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"
echo "Number of fruits: ${#fruits[@]}"

# Iterating over array
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done

### 4. Associative Arrays (like dictionaries)
declare -A capitals
capitals["India"]="New Delhi"
capitals["USA"]="Washington D.C."
capitals["Japan"]="Tokyo"

echo "Associative Array Example:"
echo "Capital of India: ${capitals["India"]}"
echo "Capital of USA: ${capitals["USA"]}"

# Iterating over keys
for country in "${!capitals[@]}"; do
  echo "Country: $country, Capital: ${capitals[$country]}"
done

### 5. Data Type Limitation Reminder
echo "Note: Bash does not support floating-point arithmetic natively."
echo "Use external tools like 'bc' or 'awk' for decimal calculations."

