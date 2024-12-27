[Home](Readme.md)
# BIOS

See Also:

 - [Hardware](Hardware.md)

---

**Contents**

- [Miscellaneous](BIOS.md#miscellaneous)

---

## Miscellaneous

---

```
AMI BIOS Beep Codes

1 beep - refresh faliure
2 beeps- parity error
3 beeps- base 64k memory failure
4 beeps- timer not operational
5 beeps- processor error
6 beeps- 8042- gate A20 failure
7 beeps- cpu exception interrupt error
8 beeps- display memory read/write failure
9 beeps- ROM checksum error
10beeps- COMOS shutdown register read/write error
11beeps- cache memory bad


AWARD BIOS beep codes

1 short- system boots successfully
2 short- COMOS setting error
1 long 1 short- DRAM or M/B error
1 long 2 short- monitor or display card error
1 long 3 short- keyboard error
1 long 9 short- BIOS ROM error
continuous long beeps- DRAM error
continuous short beeps- power error
```

https://www.intel.com/content/www/us/en/support/articles/000005473/boards-and-kits.html

```
You can hear the beep codes through the onboard piezoelectric speaker. For Intel® Desktop Boards
without the onboard speaker, you can hear the beeps through a speaker attached to the line out
audio jack on the board.

Beep Code		Sequence/Pattern		Meaning		Troubleshooting Steps	
--
Single beep		One 0.5 second beep		F2 Setup / F10 Boot Menu prompt		This short beep occurs when the BIOS is ready to accept keyboard input. No action needed.	
--
2 beeps		
On-off (1.0 second each) two times, then 2.5-second pause (off).
The pattern repeats once.
Then the computer continues to boot.

	Video error (no add-in graphics card installed)		

    Reseat add-in graphics card.
    Make sure a compatible processor is installed.
--
3 beeps		
On-off (1.0 second each) three times, then 2.5-second pause (off).
The pattern repeats until the computer is powered off.

	Memory error		

    Reseat the memory.
    Make sure that the contacts on the memory and the socket are clean.
    Try removing one bank of memory modules at a time. (Some systems can require a memory module in Bank 0.)
    Try using memory modules from the same manufacturer with the same part number and speed.
    Check for a faulty memory module by trying the memory in a known good system.
--
High/low beeps		
Alternate high and low beeps (1.0 second each) for 8 beeps.

Then the computer shuts down.
	CPU thermal trip warning		

    Check that the processor heatsink/fan is properly installed.
    Check that the thermal interface material is sufficient and is spread evenly.

---

Beep codes for discontinued (legacy) desktop boards
Beep State		Meaning	
1 long beep followed by 2 short beeps		Video configuration failure (a faulty video card or no card installed), or an external ROM module does not properly checksum to zero.	
1		Refresh failure	
2		Parity can't be reset	
3		First 64K memory failure	
4		Timer not operational	
5		Processor failure (reserved; not used)	
6		8042 GateA20 can't be toggled (memory failure or not present)	
7		Exception interrupt error	
8		Display memory R/W error	
9		(Reserved; not used)	
10		CMOS Shutdown register test error	
11		Invalid BIOS (such as, POST module not found)
```

---
