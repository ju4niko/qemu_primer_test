#archivo con variables predefinidas de proyectos en comun
include ../parametros.mk

#QEMU debug port
QDP=12345

#opciones de la VM
VMFLGS= -M $(BOARD)  -no-reboot -nographic -monitor telnet:127.0.0.1:$(QDP),server,nowait

#programa de arranque
STARTF=startup

#imagen binaria
BINF=first_test

#linker script
LS=mmap.ld

# construye el proyecto
all:
	$(AS) -g -o $(STARTF).o $(STARTF).s
	$(LD) -T $(LS) -o $(BINF).elf $(STARTF).o
	$(OC) -O binary $(BINF).elf $(BINF).bin

#corre sin debug tools
run:
	$(VM) $(VMFLGS) -kernel $(BINF).bin
	
#arranca la emulacion detenido listo para debugear
debug:
	$(VM) $(VMFLGS) -s -S -kernel $(BINF).bin
clean:
	rm *.bin *.o *.elf
	
#edita programa de arranque
edit:
	open $(STARTF).s

# abre conexion a consola de QEMU	
connect:
	telnet localhost $(QDP)
	
