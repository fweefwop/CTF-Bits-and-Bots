## How to use pwntools to create a template to binary exploit    
     
For demostration purpose, we use **vuln** as binary, **rhost = 127.0.0.1, rport = 1234**
To generate exploit template:   
````
kali@kali:~/tmp$ pwn template ./vuln --host localhost --port 1234 > test.py
````
### The template allows you to exploit both local and remote     
    
##### Local
````
kali@kali:~/tmp$ python3 test.py LOCAL
[*] '/home/kali/tmp/vuln'
    Arch:     amd64-64-little
    RELRO:    Partial RELRO
    Stack:    Canary found
    NX:       NX enabled
    PIE:      No PIE (0x400000)
[+] Starting local process '/home/kali/tmp/vuln': pid 47785
[*] Switching to interactive mode
$ AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa
$ AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa
[*] Process '/home/kali/tmp/vuln' stopped with exit code 0 (pid 47785)
[*] Got EOF while reading in interactive
$ 
[*] Got EOF while sending in interactive
```````   
##### Remote
```
kali@kali:~/tmp$ python3 test.py

```

For more info: https://www.youtube.com/watch?v=NhNbivMVPk0
