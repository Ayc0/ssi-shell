from hashlib import sha256
from base64 import b64encode

def read_from_file(file_name):
    with open(file_name) as f:
        return f.read()

stored_hash = read_from_file("/usr/local/tests/secret.txt")

def compute_hash(s):
    return b64encode( sha256( s.encode('UTF-8') ).digest() )

def try_password(psswd):
    if ( compute_hash(psswd) == stored_hash ):
        print("Access granted")
    else:
        print("Access denied")

try_password("iuyghjklkfghjk")