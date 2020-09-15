## Steganography
originally from https://bitvijays.github.io/LFC-Forensics.html. Added modification to tailor team usage. 
### Images
Download to install common Stegnography tools: - ```frackerzip, Exiftool, Steghide, Outguess, Jsteg, Stegoveritas```          
[steg-tools-install.sh](https://fweefwop.github.io/CTF%20Tools/steg-tools-install.shInstall)

**Usage:**
```
chmod +x steg-tools-install.sh
./steg-tools-install.sh
```    
**Stegoveritas:** This is an automated tool to detect hidden text and files. It usually is included in Kali.      
**Install:** ```  pip install stegoveritas```      
**Usage:** ``` stegoveritas [file name]``` 

If you are looking for hidden flag in an image first start with ``` stegovertitas``` or run the following steps:
1. ```file, exiftool``` command, and make sure the extension is correctly displayed.
2. ```strings```      
  2.1 Sometimes, it is better to see lines only greater than x length.
  ``` 
    strings RainingBlood.mp3 | awk 'length($0)>20' | sort -u
  ```  
3.1 ```binwalk``` the file, just to make sure, there’s nothing extra stored in that image.               
3.2 ```scalpel``` the file, usually used on .bmp file.           
4. ```hexdump -C``` and look for interesting pattern may be? If you get 7z or PK they represent Zipped files. If so, you can extract those file 
with 7z x . If somehow, you get a passphrase for the image, then you might have to use ```steghide``` tool as it allows to hide data with a passphrase.
5. [stegsolve](https://github.com/eugenekolo/sec-tools/tree/master/stego/stegsolve/stegsolve) - check all the planes. There’s a data-extracter, we may try to extract all the values of RGB and see if there’s any flag in that.
6. ```stegosuite```
7. ```steghide``` : If there’s any text present in the Image file or the filename of the image or any link ( maybe to youtube video; video name can be 
the password ) that can be a passphrase to steghide. Sometimes, you may have to try all lowercase/ uppercase combinations.
8. [zsteg](https://github.com/zed-0xff/zsteg): detect stegano-hidden data in PNG & BMP
9. [pngcheck](http://www.libpng.org/pub/png/apps/pngcheck.html): pngcheck verifies the integrity of PNG, JNG and MNG files (by checking the internal 32-bit CRCs [checksums] and decompressing 
the image data); it can optionally dump almost all of the chunk-level information in the image in human-readable form.
10. [Mediaextract](https://github.com/panzi/mediaextract) : Extracts media files (AVI, Ogg, Wave, PNG, …) that are embedded within other files.
11. Comparing two similar images to find the difference
```        
    compare hint.png stego100.png -compose src diff.png
```
12. [Image Arithmetic](http://homepages.inf.ed.ac.uk/rbf/HIPR2/arthops.htm) We can do image addition, subtraction, multiplication, division, blending, logical AND/NAND, logical OR/NOR, logical XOR/XNOR, Invert/ Logical NOT, Bitshift Operators.
13. We can use [gmic](http://gmic.eu/) to perform XOR of the images.
```
  gmic a.png b.png -blend xor -o result.png
```    
14. JPEG : [Jstego](https://sourceforge.net/projects/jstego/) : program aims at providing a java solution to hide secret information(such as secret file) to JPEG images. Hiding algorithm contains 
Jsteg and F5. The main(probably the toughest) stuff is encoding and decoding JFIF files.
15. JPEG : [Jsteg](https://github.com/lukechampine/jsteg) : jsteg is a package for hiding data inside jpeg files, a technique known as steganography. This is accomplished by copying each bit 
of the data into the least-significant bits of the image. The amount of data that can be hidden depends on the filesize of the jpeg; it takes about 10-14 bytes 
of jpeg to store each byte of the hidden data.
16. [Repair Corrupted JPEG/JPG, GIF, TIFF, BMP, PNG or RAW Image](https://online.officerecovery.com/pixrecovery/)

### LSB Stegonagraphy
File are made of bytes. Each byte is composed of eight bits.
```   
10101100
1st digit is MSB and Last digit is LSB
```    
Changing the least-significant bit (LSB) doesn’t change the value very much.
```   
10101100(base 2) == 172 (10)
```
changing the LSB from 0 to 1:
```   
10101101(base 2) == 173 (10)
```   
So we can modify the LSB without changing the file noticeably. By doing so, we can hide a message inside.

### LSB Stegonagraphy in Images

LSB Stegonagraphy or Least Significant Bit Stegonagraphy is a method of stegonagraphy where data is recorded in the lowest bit of a byte.

Say an image has a pixel with an RGB value of (255, 255, 255), the bits of those RGB values will look like
```    
1 1 1 1 1 1 1 1
```   
By modifying the lowest, or least significant, bit, we can use the 1 bit space across every RGB value for every pixel to construct a message.
```    
1 1 1 1 1 1 1 0
```    
The reason stegonagraphy is hard to detect by sight is because a 1 bit difference in color is insignificant as seen below.
```       
Color 1    Color 2
FFFFFE     FFFFFF
```    
Decoding LSB steganography is exactly the same as encoding, but in reverse. For each byte, grab the LSB and add it to your decoded message. Once you’ve 
gone through each byte, convert all the LSBs you grabbed into text or a file.

### QRCodes?
Install [zbarimg](http://manpages.ubuntu.com/manpages/focal/en/man1/zbarimg.1.html)     
```    
apt-get install zbar-tools
```     
Usage      
Read a [QR-Code](https://bahamas10.github.io/binary-to-qrcode/)
```      
zbarimg <imagefile>
```      
Got a QR-Code in Binary 0101?, convert it into QR-Code by QR Code Generator

### Sound Files
1. Open the file in Audacity or [Spectrum Analyzer](https://academo.org/demos/spectrum-analyzer/) and probably analyze the Spectogram     
  1.1 Arrow next to the track name to switch from waveform (top) to logarithmic spectrogram (bottom).       
  1.2 Morse code possible? As all the morse data appears to be below 100 Hz, we can use a low pass filter (effects menu, cutoff 100 Hz) to ease transcription   
  1.3 [Golang mp3 Frame Parser](https://github.com/tcolgate/mp3)   

