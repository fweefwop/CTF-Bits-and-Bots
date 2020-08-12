## How to use pwntools to create a template to binary exploit    
     
For demostration purpose, we use **vuln** as binary, **rhost = 127.0.0.1, rport = 1234**
To generate exploit template:   
````
kali@kali:~/tmp$ pwn template ./vuln --host localhost --port 1234 > test.py
````

