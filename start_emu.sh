#!/bin/zsh
DISK_IMG="${1:-$(find . -type d -name '*build*')}/disk.img"
qemu-system-i386 -curses -machine q35 -fda "$DISK_IMG" -gdb tcp::26000 -S
