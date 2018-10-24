#!/bin/zsh

sleep $((($RANDOM%10)+1))

# Loop
echo "loop"
python3 /usr/local/tests/loop.py

# Hash
echo "hash sha256"
python3 /usr/local/tests/hash.py

# nmap
echo "nmap"
nmap -A www.centralesupelec.fr
