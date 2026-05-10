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
___
## Command Line Arguments

- When you run a Bash script, you can pass extra values (arguments) after the script name.
- These values are accessible inside the script using special variables like `$1`, `$2`, `$@`, etc.

### Special Variables in Bash
| Variable | Meaning |
| --- | --- |
| ``$0`` | Script name |
| ``$1 ``- ``$9`` | Arguments (first to ninth) |
| ``$#`` | Number of arguments passed |
| ``$@`` | All arguments as a list |
| ``$$`` | Process ID of the script |
| ``$?`` | Exit status of the last command |

### Example with Special Variables
#### Code
```bash
#!/bin/bash

echo "Script name: $0"
echo "First arg: $1"
echo "Second arg: $2"
echo "Total args: $#"
echo "All args: $@"
echo "Process ID: $$"

# Run a simple command and check status
ls > /dev/null
echo "Last command status: $?"

```
#### Run
`./script.sh Rohit 21`

#### Output
```shell
Script name: ./script.sh
First arg: Rohit
Second arg: 21
Total args: 2
All args: Rohit 21
Process ID: 12345
Last command status: 0
```

___

# Arrays
Arrays store multiple values in a single variable.

```bash
arr=("apple" "banana" "mango")
echo ${arr[0]}
```
- Access elements using indices, starting at 0.

### All Elements
```bash
echo ${arr[@]}
```
- Prints all elements in the array.

### Length
```bash
echo ${#arr[@]}
```
- Returns the number of elements in the array.

### Looping Through Arrays
```bash
for item in "${arr[@]}"
do
    echo $item
done
```
- Iterates over each element in the array.

---

# String Operations
Strings can be manipulated in various ways.

### Length
```bash
str="hello"
echo ${#str}
```
- Returns the length of the string.

### Substring
```bash
echo ${str:1:3}
```
- Extracts a substring starting at index 1 with length 3 (`ell`).

### Concatenation
```bash
a="Hello"
b="World"
echo "$a $b"
```
- Combines two strings with a space.

---

# Conditional Statements
Conditional statements allow decision-making in scripts.

### If Statement
```bash
num=5
if [ $num -gt 3 ]; then
    echo "Number is greater than 3"
fi
```
- Executes the block only if the condition is true.

### If-Else Statement
```bash
if [ -f "test.txt" ]; then
    echo "File exists"
else
    echo "File not found"
fi
```
- Provides an alternative block if the condition is false.

### If-Elif-Else Chain
```bash
hour=$(date +%H)
if [ $hour -lt 12 ]; then
    echo "Good morning"
elif [ $hour -lt 18 ]; then
    echo "Good afternoon"
else
    echo "Good evening"
fi
```
- Useful for multiple mutually exclusive conditions.

### Case Statement
```bash
read -p "Enter option: " opt
case $opt in
    1) echo "One";;
    2) echo "Two";;
    *) echo "Invalid";;
esac
```
- Cleaner way to handle multiple options.

---

# Functions
Functions in Bash allow you to group commands together and reuse them. They can accept arguments and return values.

```bash
#!/bin/bash

greet() {
    echo "Hello $1"
}

greet Rohit
```
- Defines a function `greet` that takes one argument (`$1`) and prints a greeting.
- Calling `greet Rohit` passes `"Rohit"` as the argument.

### Return Values
Functions can return values by printing them, which can then be captured.

```bash
add() {
    echo $(($1+$2))
}

result=$(add 5 10)
echo $result
```
- The `add` function takes two arguments and prints their sum.
- The result is captured into a variable using command substitution `$(...)`.

---
---
# File Handling
Bash provides ways to check and manipulate files.

### Check if File Exists
```bash
if [ -f test.txt ]
then
    echo "Exists"
fi
```

### Check if Directory Exists
```bash
if [ -d folder ]
then
    echo "Directory exists"
fi
```

### Read File Line by Line
```bash
while read line
do
    echo $line
done < file.txt
```
- Reads each line from a file and processes it.

---

# Redirects
Redirects control input and output streams.

### Output Redirect
```bash
echo "Hello" > file.txt
```
- Writes output to a file (overwrites existing content).

### Append
```bash
echo "New line" >> file.txt
```
- Appends output to a file.

### Input Redirect
```bash
wc -l < file.txt
```
- Passes file content as input to a command.

---

# Pipes
Pipes connect the output of one command to the input of another.

```bash
cat file.txt | grep hello
```
- Passes the contents of `file.txt` to `grep` for searching.

---

# grep
`grep` searches for text patterns in files.

### Search Text
```bash
grep "hello" file.txt
```

### Ignore Case
```bash
grep -i "hello" file.txt
```

---

# sed
`sed` is a stream editor for modifying text.

### Replace Text
```bash
sed 's/apple/mango/' file.txt
```
- Replaces the first occurrence of "apple" with "mango" in each line.

---

# awk
`awk` is used for text processing and extracting fields.

```bash
awk '{print $1}' file.txt
```
- Prints the first column from each line.

### Useful For
- Parsing logs  
- Processing CSV files  

---

# Exit Status
Every command returns an exit status (0 = success, non-zero = error).

```bash
mkdir test
echo $?
```

---

# Debugging
Debugging helps trace script execution.

### Run with Debug Mode
```bash
bash -x script.sh
```

### Inside Script
```bash
set -x
```

---

# Important Linux Commands
| Command | Work |
|---------|------|
| ls | list files |
| pwd | current directory |
| cd | change directory |
| mkdir | create folder |
| rm | remove |
| cp | copy |
| mv | move |
| touch | create file |
| cat | view file |
| chmod | change permissions |

---

# File Permissions
```bash
chmod +x script.sh
```
- Makes a script executable.

### Permission Format
`rwxr-xr-x`

| Symbol | Meaning |
|--------|---------|
| r | read |
| w | write |
| x | execute |

---

# Cron Jobs (Automation)
Cron schedules tasks to run automatically.

### Open Cron
```bash
crontab -e
```

### Example
```bash
* * * * * /home/user/script.sh
```
- Runs every minute.

---

# Error Handling
```bash
set -e
```
- Stops the script immediately if any command fails.

---

# Useful Special Commands
- Current user: `whoami`  
- Date: `date`  
- Disk usage: `df -h`  
- RAM usage: `free -m`  
- Processes: `ps aux`  
- Kill process: `kill PID`  

---

# Advanced Bash Topics
### Here Documents
```bash
cat << EOF
Hello
World
EOF
```

### Trap Signals
```bash
trap "echo Exiting" EXIT
```

### Background Processes
```bash
sleep 10 &
```

___
<img width="658" height="322" alt="image" src="https://github.com/user-attachments/assets/d9a37c86-87de-4083-a478-f8ca181fdeea" />
<img width="431" height="273" alt="image" src="https://github.com/user-attachments/assets/6104fa8e-c232-45cd-85ab-aa01c846eb69" />
<img width="882" height="322" alt="image" src="https://github.com/user-attachments/assets/2177c183-b39a-4afe-ac2c-0e6845c84731" />
<img width="892" height="467" alt="image" src="https://github.com/user-attachments/assets/59d4481d-f0ec-4820-871e-1d2fbf8cdf0d" />
<img width="903" height="416" alt="image" src="https://github.com/user-attachments/assets/7fe5199f-1bbb-4ed7-9975-97a8b3f70e8f" />
<img width="893" height="262" alt="image" src="https://github.com/user-attachments/assets/546addd3-4541-4c16-bffd-c77110157a4a" />

___

## Analysis Log

| Tag | Meaning / Role in Logs |
| --- | --- |
| **Step_LSC** | Refers to the *Log Step Counter* or a step‑tracking component. It records events like ``onStandStepChanged`` or sensor flushes, indicating step detection and updates. |
| **Step_StandReportReceiver** | A receiver module that listens for broadcast events (e.g., screen on/off, activity changes) and reports standing/step data. |
| **Step_SPUtils** | Likely a *SharedPreferences Utility* class used to store and retrieve step or health data locally in the app. |
| **Step_ExtSDM** | External *Step Data Manager* — manages extended step data, possibly aggregating or syncing with other services. |
| **HiH_** | Prefix for *HiHealth* framework components. It indicates modules belonging to Huawei’s HiHealth SDK (used in fitness/health apps). |
| **HiH_HiAppUtil** | Utility functions for the HiHealth app, handling common operations like formatting, conversions, or app‑level helpers. |
| **HiH_HiSyncControl** | Synchronization controller for HiHealth — manages syncing health data between local storage and cloud/remote services. |
| **HiH_HiHealthBinder** | A binder interface for inter‑process communication (IPC) within the HiHealth system, allowing different modules to interact. |
| **HiH_DataStatManager** | Data Statistics Manager — collects, aggregates, and reports statistics (e.g., steps, calories, activity summaries). |
| **HiH_HiBroadcastUtil** | Utility for handling broadcast events (e.g., system intents like screen on/off, connectivity changes) within HiHealth. |



# HealthApp_2k.log Analysis

The `HealthApp_2k.log` file is a structured Android health application log.
It records step counting, calorie estimation, altitude tracking, and broadcast events.
Each entry captures a timestamp, component name, process ID, and the specific action or data update.

---

## 📋 Log Structure
Each line follows the format:

```
<timestamp>|<component>|<pid>|<message/content>
```

- **Timestamp** → e.g., `20171223-22:15:29:606` (date and time with milliseconds).
- **Component** → module generating the log (`Step_LSC`, `Step_SPUtils`, etc.).
- **PID** → process ID (`30002312` in most entries).
- **Message/Content** → action performed or data recorded (e.g., `onStandStepChanged 3579`).

---

## 🔎 Key Components

- **Step_LSC (Log Step Counter)**
  Tracks step changes (`onStandStepChanged`) and handles broadcast actions like screen on/off or time ticks.

- **Step_StandReportReceiver**
  Receives system broadcasts (`SCREEN_ON`, `SCREEN_OFF`, `TIME_TICK`) and generates reports summarizing steps, calories, and altitude.

- **Step_SPUtils (SharedPreferences Utility)**
  Stores and retrieves step data in persistent storage. Example:
  ```
  getTodayTotalDetailSteps = 1514038440000##6993##548365##8661##12266##27164404
  ```

- **Step_ExtSDM (External Step Data Manager)**
  Calculates derived metrics like calories (`totalCalories=126775`) and altitude (`totalAltitude=240`).

- **Step_StandStepCounter**
  Flushes sensor data when triggered by broadcasts.

- **Step_ScreenUtil**
  Checks screen status (`isScreenOn true`) to adjust reporting logic.

---

## 📊 Example Flow in the Log

1. **Step detected** → `Step_LSC` logs `onStandStepChanged`.
2. **Data update** → `Step_SPUtils` updates today’s step totals.
3. **Derived metrics** → `Step_ExtSDM` calculates calories and altitude.
4. **Report generated** → `Step_StandReportReceiver` outputs a summary line like:
   ```
   REPORT : 7007 5002 150089 240
   ```
   (steps, calories, distance, altitude).
5. **Broadcast events** → system actions (`SCREEN_ON`, `SCREEN_OFF`, `TIME_TICK`) trigger flushes and recalculations.

---

## ⚠️ Why It’s Useful

- **Debugging** → Developers can trace how step data flows through the app.
- **Analysis** → Researchers can study user activity patterns, energy expenditure, and app behavior.
- **Performance Monitoring** → Identifies delays or errors in sensor handling and reporting.

---

✅ **In summary:**
The `HealthApp_2k.log` is a detailed activity log from a health tracking app.
It records step counts, calorie/altitude calculations, and system broadcast events, with each component (`Step_LSC`, `Step_SPUtils`, `Step_ExtSDM`, etc.) handling a specific part of the data pipeline.
```

---
