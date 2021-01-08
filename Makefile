# Colours
ECHO_RESET = $(shell tput sgr0)
ECHO_YELLOW = $(shell tput setaf 3)
ECHO_LIGHT_GREEN = $(shell tput setaf 2)

ASM = nasm
ASM_FLAGS = -f bin

BUILD_DIR = ./build
DISK_IMG = $(BUILD_DIR)/disk.img
BOOTLOADER = $(BUILD_DIR)/bootloader/bootloader.o

.PHONY: all clean dirs bootdisk bootloader

all: dirs bootdisk

dirs:
	@mkdir -p $(BUILD_DIR)

bootloader:
	@make -C bootloader

bootdisk: bootloader
	@echo "[$(ECHO_YELLOW)Creating disk image...$(ECHO_RESET)]"
	dd if=/dev/zero of=$(DISK_IMG) bs=512 count=2880
	@echo "[$(ECHO_YELLOW)Writing bootloader to first sector...$(ECHO_RESET)]"
	dd conv=notrunc if=$(BOOTLOADER) of=$(DISK_IMG) bs=512 count=1 seek=0
	@echo "[$(ECHO_LIGHT_GREEN)Done!$(ECHO_RESET)]"

clean:
	-rm -f $(DISK_IMG)
	@make -C bootloader clean

$(VERBOSE).SILENT:
