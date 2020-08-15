# Pwn Helper Utilies 
    
## Pwntool fit
Used for positioning your code at a specific location. For ie. BoF is found at 126 bytes, and after that you need to jump to address ```0xdeadbeaf```:
   
```
>>> from pwn import *
>>> fit({126:"oxdeadbeaf"})
b'aaaabaaacaaadaaaeaaafaaagaaahaaaiaaajaaakaaalaaamaaanaaaoaaapaaaqaaaraaasaaataaauaaavaaawaaaxaaayaaazaa
bbaabcaabdaabeaabfaabga0xdeadbeaf'
```     
You can also choose your own filler character instead of the random generated one:
     
```
>>> fit({126:"0xdeadbeaf"}, filler="A")
b'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAA0xdeadbeaf'
```

## Packing and Unpacking Address
These are bit dependent. To pack/unpack an address into a string, ie. 64bits:      

```
Pack:
>>> p64(0xdeadbeaf)
b'\xaf\xbe\xad\xde\x00\x00\x00\x00'
``` 
```   
Unpack:
>>> u64(b'\xaf\xbe\xad\xde\x00\x00\x00\x00')
3735928495
>>> hex(u64(b'\xaf\xbe\xad\xde\x00\x00\x00\x00'))
'0xdeadbeaf'
```    




