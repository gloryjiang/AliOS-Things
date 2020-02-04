NAME := board_pca10040

$(NAME)_MBINS_TYPE := kernel
$(NAME)_VERSION    := 1.0.2
$(NAME)_SUMMARY    := configuration for board pca10040
SUPPORT_MBINS      := yes
MODULE             := 1062
HOST_ARCH          := Cortex-M4
HOST_MCU_FAMILY    := mcu_nrf52xxx
HOST_MCU_NAME      := nrf52832

$(NAME)_COMPONENTS += $(HOST_MCU_FAMILY) kernel_init

GLOBAL_INCLUDES += .

GLOBAL_DEFINES += STDIO_UART=0 CONFIG_NO_TCPIP BOARD_PCA10040 CONFIG_GPIO_AS_PINRESET FLOAT_ABI_HARD NRF52832_XXAA CONFIG_SOC_SERIES_NRF52X CONFIG_CLOCK_CONTROL_NRF5_K32SRC_250PPM=y CONFIG_BOARD_NRF52832_PCA10040=1

CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_pca10040
CONFIG_SYSINFO_DEVICE_NAME   := pca10040

$(NAME)_SOURCES := board.c

GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"

GLOBAL_CFLAGS += -DCONFIG_GPIO_AS_PINRESET -DFLOAT_ABI_HARD  -DNRF52_PAN_74 -DCONFIG_POLL
GLOBAL_CFLAGS += -DCONFIG_CLOCK_CONTROL_NRF5_K32SRC_XTAL
GLOBAL_CFLAGS += -DBLE_4_2

# Define default component testcase set
ifeq (, $(findstring yts, $(BUILD_STRING)))
GLOBAL_DEFINES  += RHINO_CONFIG_WORKQUEUE=1
TEST_COMPONENTS += basic_test wifi_hal_test aos_test kv_test cjson_test
else
GLOBAL_DEFINES += RHINO_CONFIG_WORKQUEUE=0
endif
