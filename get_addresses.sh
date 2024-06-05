#!/bin/sh
gdb -q -x get_addresses.gdb $(pwd)/vuln 2> /dev/null | grep 0x | grep -v Breakpoint | sed "s/\=/\t/g" | cut -f2 | sed "s/ //g"

