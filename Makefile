
disable-aslr:
	echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

vuln: vuln.c secret.h
	gcc -m32 -no-pie -g vuln.c -o vuln -fno-stack-protector -z execstack
	sudo chown root:root vuln
	sudo chmod 4755 vuln

shellcode: shellcode.asm
	nasm -f elf32 shellcode.asm -o shellcode.o
	ld -melf_i386 shellcode.o -o shellcode
	rm shellcode.o

objdump: shellcode
	objdump -Mintel -D shellcode

objdump_og: shellcode_og.asm
	nasm -f elf32 shellcode_og.asm -o shellcode.o
	ld -melf_i386 shellcode.o -o shellcode
	rm shellcode.o
	objdump -Mintel -D shellcode
	rm shellcode

test_shcode: shellcode
	./shellcode

exploit: vuln disable-aslr
	sh get_addresses.sh | xargs python exploit.py | $(PWD)/vuln

clean:
	sudo rm vuln shellcode malicious_input 2> /dev/null

