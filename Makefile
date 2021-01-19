################################################################################
# GNU makefile example for code compiled with SDCC
# File Name: Makefile or makefile or gnumakefile
# Only the targets which apply will be processed by GNU make.
# To create the file 'prog.hex' using GNU make, 
# execute 'make prog.hex', 'make all', or just 'make'.
# Note: GNU make requires a special format for the makefile:
#     A tab character must be at the beginning of every command line!
################################################################################


# Default target
all: timer.s19
# Compile phase
timer.rel : timer.c
#	sdcc -c -mhc08 timer.c

# Link phase
timer.s19 : timer.rel
	sdcc -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF timer.c -o .\firmware\timer.s19
#	sdcc -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF timer.rel -o .\build\timer.s19
#	sdcc -mhc08 --data-loc 0x80 --code-loc 0xF800 --stack-loc 0xFF -o qt2_timer.s19

# Phony target
.PHONY: clean
clean:
#	C:\\MinGW\\msys\\1.0\\bin\\rm *.asm *.rel *.lst *.rst *.cdb *.map *.sym *.lk *.s19



