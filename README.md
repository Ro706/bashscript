# bash scripting

## Understanding What is Bash

Bash (short for Bourne Again Shell) is a command-line interpreter and scripting language widely used in Linux, macOS, and even Windows (via WSL). It lets you interact with the operating system using text commands and is also powerful for writing scripts to automate tasks.

## History of Bash

Bash was developed in 1989 by Brian Fox.

Bash was created as a free replacement for the Bourne shell. It quickly became the default for GNU and many Linux systems.

Over time, Bash added features from other shells, such as the Korn shell (ksh) and C shell (csh), and it became a very versatile tool for command-line users.

## Common commands

- `ls` - List directory contents
- `cd` - Change the current directory
- `pwd` - Print the current working directory
- `echo` - Display a line of text
- `cat` - Concatenate and display files
- `cp` - Copy files and directories
- `mv` - Move or rename files
- `rm` - Delete files or folders
- `touch` - Create an empty file or update its time
- `mkdir` - Create a new folder
___
## Understanding Variables in Bash

Variables in Bash are used to store data that can be used and manipulated throughout your script or command-line session. Bash variables are untyped, meaning they can hold any type of data.

## Declaring Variables

Variables are declared by simply assigning a value to a name. There should be no spaces around the equal sign:
- `variable_name=value`
- To access the value of a variable, prefix it with a dollar sign: `$variable_name`

```bash
name="John Doe"
echo "Hello, $name!"
number=42
echo "The number is $number"
```


## Environment Variables

Environment variables are special variables that affect the way processes run on your system. They are often used to store system-wide values like the location of executables or the default editor.

```bash

# Display the PATH environment variable
echo "Your PATH is $PATH"
```

## Common Variable Operations

Variables can be used in various operations, such as concatenation and arithmetic.

- Concatenation: Combine strings using variables.
- Arithmetic: Perform calculations using variables.

```bash
#!/bin/bash

# Concatenation
greeting="Hello, "
name="World"
echo "$greeting$name"

# Arithmetic
num1=5
num2=10
sum=$((num1 + num2))
echo "The sum is $sum"
```
___
## Bash Data Types

This section introduces the different data types available in Bash scripting.
- `String` : Strings are sequences of characters used to store text. They can be manipulated using various string operations such as concatenation and substring extraction.
- `Numbers` : Numbers in Bash can be used for arithmetic operations. Bash supports integer arithmetic natively, such as addition, subtraction, multiplication, and division.
- `Arrays` : Arrays are used to store multiple values in a single variable. Each element in an array is accessed using an index. You can iterate over arrays and modify elements.
- `Associative Arrays` : Associative arrays allow you to use named keys to access values. They are similar to dictionaries in other programming languages. You can add or remove keys and values.
### Data Type Limitations 
Bash does not support floating-point arithmetic natively. For such operations, consider using external tools like `bc` or `awk`.

```bash
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
```
___

##  Input Statement

In Bash, `read` is a built‑in command used to accept input from the user or from a file. It’s one of the simplest ways to capture data interactively in a script.

```bash
#!/bin/bash
echo "Enter your name:"
read NAME
echo "Hello $NAME"

#or

read -p "Enter your Name: " NAME
echo "Hello $NAME"
```
### Common Options
- `-p "Prompt"` → Displays a message before reading input.
```bash
read -p "Enter your name: " name
```
- `-s` → Silent mode (input hidden, useful for passwords).
```bash
read -s -p "Enter password: " password
```
- `-n N `→ Reads only N characters.
```bash
read -n 1 -p "Press any key to continue..."
```
- `-t SECONDS` → Timeout if no input is given.
```bash
read -t 5 -p "Enter something within 5 seconds: " input
```

### Example:

```bash
#!/bin/bash

echo "Simple login demo"
read -p "Username: " user
read -s -p "Password: " pass
echo
echo "You entered username: $user and password: $pass"
```

