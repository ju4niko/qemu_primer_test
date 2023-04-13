#toolchain a utilizr
TC=arm-none-eabi

#herramientas del toolchain
# compilador de C
CC=$(TC)-gcc
#linker
LD=$(TC)-ld
#ensamblador
AS=$(TC)-as
#extractor de objetos
OC=$(TC)-objcopy

# maquina virtual a utilizar
VM=qemu-system-arm

# arquitecturas a emular, descomentar la que se utilizara
#BOARD=mcimx6ul-evk
BOARD=realview-pb-a8

#opciones de la VM
VMFLGS= -M $(BOARD)  -no-reboot -nographic -monitor telnet:127.0.0.1:12345,server,nowait

#programa de arranque
STARTF=startup

#imagen binaria
BINF=first_test

#linker script
LS=mmap.ld

all:
	$(AS) -g -o $(STARTF).o $(STARTF).s
	$(LD) -T $(LS) -o $(BINF).elf $(STARTF).o
	$(OC) -O binary $(BINF).elf $(BINF).bin
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
