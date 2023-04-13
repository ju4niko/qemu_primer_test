#toolchain a utilizar
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

