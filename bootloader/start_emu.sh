#!/bin/bash
DISK_IMG="${1:-build}/disk.img"
qemu-system-i386 -curses -machine q35 -fda "$DISK_IMG" -gdb tcp::26000 -S
