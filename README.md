# bash scripting

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

___
