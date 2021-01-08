ASM = nasm
ASM_FLAGS = -f bin

BUILD_DIR = ../build/bootloader
BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

.PHONY: all clean dirs

all: dirs $(BOOTLOADER_OBJS)

dirs:
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@

clean:
	-rm -f $(BUILD_DIR)/*

$(VERBOSE).SILENT:
