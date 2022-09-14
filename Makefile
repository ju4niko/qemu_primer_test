first_run:
	qemu-system-arm -M realview-pb-a8 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:1234,server,nowait
build:
	arm-none-eabi-as -o startup.o startup.s
link:
	arm-none-eabi-ld -o first_test.elf startup.o
bin:
	arm-none-eabi-objcopy -O binary first_test.elf first_test.bin
second_run:
	qemu-system-arm -M realview-pb-a8 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:1234,server,nowait -kernel first_test.bin
