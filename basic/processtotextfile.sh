#!/bin/bash

nmap google.com -Pn >> google_nmap.txt
echo Hello World! > hello.txt
cat hello.txt
echo Good morning > hello.txt
cat hello.txt
echo Hello World! >> hello.txt
cat hello.txt
echo Good Morning >> hello.txt
cat hello.txt
