#!/bin/bash

echo "Script name: $0"
echo "First arg: $1"
echo "Second arg: $2"
echo "Total args: $#"
echo "All args: $@"
echo "Process ID: $$"

# Run a simple command and check status
ls
echo "Last command status: $?"

