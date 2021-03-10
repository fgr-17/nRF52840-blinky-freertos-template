PROJECT_NAME     := blinky_FreeRTOS_pca10056
TARGETS          := nrf52840_xxaa
OUTPUT_DIRECTORY := bin

PROJ_DIR := .
SRC_DIR := $(PROJ_DIR)/src

$(OUTPUT_DIRECTORY)/nrf52840_xxaa.out: \
  LINKER_SCRIPT  := $(SRC_DIR)/blinky_FreeRTOS_gcc_nrf52.ld

# Source files common to all targets
SRC_FILES += \
  $(NORDIC_SDK_PATH)/modules/nrfx/mdk/gcc_startup_nrf52840.S \
  $(NORDIC_SDK_PATH)/components/libraries/log/src/nrf_log_frontend.c \
  $(NORDIC_SDK_PATH)/components/libraries/log/src/nrf_log_str_formatter.c \
  $(NORDIC_SDK_PATH)/components/boards/boards.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/croutine.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/event_groups.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/portable/MemMang/heap_1.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/list.c \
  $(NORDIC_SDK_PATH)/external/freertos/portable/GCC/nrf52/port.c \
  $(NORDIC_SDK_PATH)/external/freertos/portable/CMSIS/nrf52/port_cmsis.c \
  $(NORDIC_SDK_PATH)/external/freertos/portable/CMSIS/nrf52/port_cmsis_systick.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/queue.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/stream_buffer.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/tasks.c \
  $(NORDIC_SDK_PATH)/external/freertos/source/timers.c \
  $(NORDIC_SDK_PATH)/components/libraries/button/app_button.c \
  $(NORDIC_SDK_PATH)/components/libraries/util/app_error.c \
  $(NORDIC_SDK_PATH)/components/libraries/util/app_error_handler_gcc.c \
  $(NORDIC_SDK_PATH)/components/libraries/util/app_error_weak.c \
  $(NORDIC_SDK_PATH)/components/libraries/timer/app_timer_freertos.c \
  $(NORDIC_SDK_PATH)/components/libraries/util/app_util_platform.c \
  $(NORDIC_SDK_PATH)/components/libraries/util/nrf_assert.c \
  $(NORDIC_SDK_PATH)/components/libraries/atomic/nrf_atomic.c \
  $(NORDIC_SDK_PATH)/components/libraries/balloc/nrf_balloc.c \
  $(NORDIC_SDK_PATH)/external/fprintf/nrf_fprintf.c \
  $(NORDIC_SDK_PATH)/external/fprintf/nrf_fprintf_format.c \
  $(NORDIC_SDK_PATH)/components/libraries/memobj/nrf_memobj.c \
  $(NORDIC_SDK_PATH)/components/libraries/ringbuf/nrf_ringbuf.c \
  $(NORDIC_SDK_PATH)/components/libraries/strerror/nrf_strerror.c \
  $(NORDIC_SDK_PATH)/integration/nrfx/legacy/nrf_drv_clock.c \
  $(NORDIC_SDK_PATH)/components/drivers_nrf/nrf_soc_nosd/nrf_nvic.c \
  $(NORDIC_SDK_PATH)/components/drivers_nrf/nrf_soc_nosd/nrf_soc.c \
  $(NORDIC_SDK_PATH)/modules/nrfx/soc/nrfx_atomic.c \
  $(NORDIC_SDK_PATH)/modules/nrfx/drivers/src/nrfx_clock.c \
  $(NORDIC_SDK_PATH)/modules/nrfx/drivers/src/nrfx_gpiote.c \
  $(NORDIC_SDK_PATH)/components/libraries/bsp/bsp.c \
  $(NORDIC_SDK_PATH)/modules/nrfx/mdk/system_nrf52840.c \
  $(SRC_DIR)/main.cpp \

# Include folders common to all targets
INC_FOLDERS += \
  $(SRC_DIR)/config \
  $(NORDIC_SDK_PATH)/components \
  $(NORDIC_SDK_PATH)/modules/nrfx/mdk \
  $(NORDIC_SDK_PATH)/components/libraries/timer \
  $(NORDIC_SDK_PATH)/components/libraries/strerror \
  $(NORDIC_SDK_PATH)/components/toolchain/cmsis/include \
  $(NORDIC_SDK_PATH)/external/freertos/source/include \
  $(NORDIC_SDK_PATH)/external/freertos/config \
  $(NORDIC_SDK_PATH)/components/libraries/util \
  $(NORDIC_SDK_PATH)/components/libraries/balloc \
  $(NORDIC_SDK_PATH)/components/libraries/ringbuf \
  $(NORDIC_SDK_PATH)/modules/nrfx/hal \
  $(NORDIC_SDK_PATH)/components/libraries/bsp \
  $(NORDIC_SDK_PATH)/components/libraries/log \
  $(NORDIC_SDK_PATH)/components/libraries/button \
  $(NORDIC_SDK_PATH)/modules/nrfx \
  $(NORDIC_SDK_PATH)/components/libraries/experimental_section_vars \
  $(NORDIC_SDK_PATH)/integration/nrfx/legacy \
  $(NORDIC_SDK_PATH)/external/freertos/portable/CMSIS/nrf52 \
  $(NORDIC_SDK_PATH)/integration/nrfx \
  $(NORDIC_SDK_PATH)/components/drivers_nrf/nrf_soc_nosd \
  $(NORDIC_SDK_PATH)/components/libraries/atomic \
  $(NORDIC_SDK_PATH)/components/boards \
  $(NORDIC_SDK_PATH)/components/libraries/memobj \
  $(NORDIC_SDK_PATH)/external/freertos/portable/GCC/nrf52 \
  $(NORDIC_SDK_PATH)/modules/nrfx/drivers/include \
  $(NORDIC_SDK_PATH)/external/fprintf \
  $(NORDIC_SDK_PATH)/components/libraries/log/src \

# Libraries common to all targets
LIB_FILES += \

# Optimization flags
OPT = -O3 -g3
# Uncomment the line below to enable link time optimization
#OPT += -flto

# C flags common to all targets
CFLAGS += $(OPT)
CFLAGS += -DBOARD_PCA10056
CFLAGS += -DCONFIG_GPIO_AS_PINRESET
CFLAGS += -DFLOAT_ABI_HARD
CFLAGS += -DFREERTOS
CFLAGS += -DNRF52840_XXAA
CFLAGS += -mcpu=cortex-m4
CFLAGS += -mthumb -mabi=aapcs
CFLAGS += -Wall -Werror
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# keep every function in a separate section, this allows linker to discard unused ones
CFLAGS += -ffunction-sections -fdata-sections -fno-strict-aliasing
CFLAGS += -fno-builtin -fshort-enums

# C++ flags common to all targets
CXXFLAGS += $(OPT)
# Assembler flags common to all targets
ASMFLAGS += -g3
ASMFLAGS += -mcpu=cortex-m4
ASMFLAGS += -mthumb -mabi=aapcs
ASMFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
ASMFLAGS += -DBOARD_PCA10056
ASMFLAGS += -DCONFIG_GPIO_AS_PINRESET
ASMFLAGS += -DFLOAT_ABI_HARD
ASMFLAGS += -DFREERTOS
ASMFLAGS += -DNRF52840_XXAA

# Linker flags
LDFLAGS += $(OPT)
LDFLAGS += -mthumb -mabi=aapcs -L$(NORDIC_SDK_PATH)/modules/nrfx/mdk -T$(LINKER_SCRIPT)
LDFLAGS += -mcpu=cortex-m4
LDFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# let linker dump unused sections
LDFLAGS += -Wl,--gc-sections
# use newlib in nano version
LDFLAGS += --specs=nano.specs

nrf52840_xxaa: CFLAGS += -D__HEAP_SIZE=8192
nrf52840_xxaa: CFLAGS += -D__STACK_SIZE=8192
nrf52840_xxaa: ASMFLAGS += -D__HEAP_SIZE=8192
nrf52840_xxaa: ASMFLAGS += -D__STACK_SIZE=8192

# Add standard libraries at the very end of the linker input, after all objects
# that may need symbols provided by these libraries.
LIB_FILES += -lc -lnosys -lm


.PHONY: default help

# Default target - first one defined
default: nrf52840_xxaa

# Print all targets that can be built
help:
	@echo following targets are available:
	@echo		nrf52840_xxaa
	@echo		sdk_config - starting external tool for editing sdk_config.h
	@echo		flash      - flashing binary

TEMPLATE_PATH := $(NORDIC_SDK_PATH)/components/toolchain/gcc


include $(TEMPLATE_PATH)/Makefile.common

$(foreach target, $(TARGETS), $(call define_target, $(target)))

.PHONY: flash erase doc

# Flash the program
flash: default
	@echo Flashing: $(OUTPUT_DIRECTORY)/nrf52840_xxaa.hex
	nrfjprog -f nrf52 --program $(OUTPUT_DIRECTORY)/nrf52840_xxaa.hex --sectorerase
	nrfjprog -f nrf52 --reset

erase:
	nrfjprog -f nrf52 --eraseall

doc:
	doxygen

SDK_CONFIG_FILE := $(SRC_DIR)/config/sdk_config.h
CMSIS_CONFIG_TOOL := $(NORDIC_SDK_PATH)/external_tools/cmsisconfig/CMSIS_Configuration_Wizard.jar
sdk_config:
	java -jar $(CMSIS_CONFIG_TOOL) $(SDK_CONFIG_FILE)
