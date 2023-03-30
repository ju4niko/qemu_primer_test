CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
AS=arm-none-eabi-as
OBCPY=arm-none-eabi-objcopy
VM=qemu-system-arm
VMFLGS= -M realview-pb-a8 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:12345,server,nowait
STARTF=startup
BINF=first_test

all:
	$(AS) -g -o $(STARTF).o $(STARTF).s
	$(LD) -o $(BINF).elf $(STARTF).o
	$(OBCPY) -O binary $(BINF).elf $(BINF).bin
run:
	$(VM) $(VMFLGS) -kernel $(BINF).bin
debug:
	$(VM) $(VMFLGS) -s -S -kernel $(BINF).bin
clean:
	rm *.bin *.o *.elf
edit:
	nano $(STARTF).s
connect:
	telnet localhost 12345
