# Analysis Log

- checking system logs in a specific category
```bash
grep "Step_LSC" HealthApp_2k.log
```

- checking system log count in a specific category
```bash
grep -c "Step_LSC" HealthApp_2k.log
```

-  checking system log updated under 24hr 
```bash
find . -name "*.log" -mtime -1
```
searches the current directory and its subdirectories for files ending with .log that were modified in the last 24 hours. Here, find . starts the search from the current folder, -name "*.log" filters only log files, and -mtime -1 ensures the results include files changed within one day.

