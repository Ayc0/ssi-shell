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

# gcc
echo "gcc"
echo "
int main() {
    return 0;
}" > test.c
gcc test.c -o test

# gdb
echo "gdb"
gdb -batch -ex "run" test 2>&1
rm -f test
rm -f test.c