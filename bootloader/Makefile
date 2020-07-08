ASM = nasm
ASM_FLAGS = -f bin

BUILD_DIR = build
DISK = $(BUILD_DIR)/disk.img
BOOT = $(BUILD_DIR)/bootloader
OUT_FILES = $(BOOT) $(DISK)

all: $(OUT_FILES)

$(BOOT): bootloader.asm
	$(ASM) $(ASM_FLAGS) $^ -o $@

$(DISK): $(BOOT)
	@echo Creating disk image...
	dd if=/dev/zero of=$(DISK) bs=512 count=2880
	@echo Writing bootloader to first sector...
	dd conv=notrunc if=$(BOOT) of=$(DISK) bs=512 count=1 seek=0
	@echo Done!

$(VERBOSE).SILENT:

.PHONY: clean
clean:
	-rm -f $(OUT_FILES)

