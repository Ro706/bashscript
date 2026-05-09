#!/bin/bash

a=10
b=5

Add=$((a+b))
prod=$((a*b))
sub=$((a-b))
div=$(echo "scale=2; $a / $b" | bc)

echo $Add
echo $sub
echo $prod
echo $div

