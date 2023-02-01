CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
AS=arm-none-eabi-as
OBCPY=arm-none-eabi-objcopy
VM=qemu-system-arm
VMFLGS=-M realview-pb-a8 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:1234,server,nowait
STARTF=startup
BINF=first_test

all:
	$(AS) -o $(STARTF).o $(STARTF).s
	$(LD) -o $(BINF).elf $(STARTF).o
	$(OBCPY) -O binary $(BINF).elf $(BINF).bin
run:
	$(VM) $(VMFLGS) -kernel $(BINF).bin
clean:
	rm *.bin *.o *.elf
edit:
	nano $(STARTF).s
