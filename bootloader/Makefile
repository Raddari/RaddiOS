# Colours
ECHO_RESET = $(shell tput sgr0)
ECHO_YELLOW = $(shell tput setaf 3)
ECHO_LIGHT_GREEN = $(shell tput setaf 2)

ASM = nasm
ASM_FLAGS = -f bin

BUILD_DIR = build
DISK = $(BUILD_DIR)/disk.img
BOOT = $(BUILD_DIR)/bootloader
OUT_FILES = $(BOOT) $(DISK)

all: directories $(OUT_FILES)

$(BOOT): bootloader.asm
	$(ASM) $(ASM_FLAGS) $^ -o $@

$(DISK): $(BOOT)
	@echo "[$(ECHO_YELLOW)Creating disk image...$(ECHO_RESET)]"
	dd if=/dev/zero of=$(DISK) bs=512 count=2880
	@echo "[$(ECHO_YELLOW)Writing bootloader to first sector...$(ECHO_RESET)]"
	dd conv=notrunc if=$(BOOT) of=$(DISK) bs=512 count=1 seek=0
	@echo "[$(ECHO_LIGHT_GREEN)Done!$(ECHO_RESET)]"

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

.PHONY: directories
directories: $(BUILD_DIR)

.PHONY: clean
clean:
	-rm -f $(OUT_FILES)

$(VERBOSE).SILENT:

