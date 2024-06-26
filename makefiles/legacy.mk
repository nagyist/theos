FRAMEWORKDIR = $(THEOS)
FW_BINDIR = $(THEOS_BIN_PATH)
FW_MAKEDIR = $(THEOS_MAKE_PATH)
FW_INCDIR = $(THEOS_INCLUDE_PATH)
FW_LIBDIR = $(THEOS_LIBRARY_PATH)
FW_MODDIR = $(THEOS_MODULE_PATH)

FW_PROJECT_DIR = $(THEOS_PROJECT_DIR)

export FRAMEWORKDIR FW_BINDIR FW_MAKEDIR FW_INCDIR FW_LIBDIR FW_MODDIR
export FW_PROJECT_DIR

# $(warning ...) expands to the empty string, so the contents of these variables are not damaged.
FW_PLATFORM_NAME = $(THEOS_PLATFORM_NAME)$(warning FW_PLATFORM_NAME is deprecated. Please migrate to THEOS_PLATFORM_NAME.)
FW_TARGET_NAME = $(THEOS_TARGET_NAME)$(warning FW_TARGET_NAME is deprecated. Please migrate to THEOS_TARGET_NAME.)

FW_STAGING_DIR = $(THEOS_STAGING_DIR)$(warning FW_STAGING_DIR is deprecated. Please migrate to THEOS_STAGING_DIR.)

ifneq ($(FW_BUILD_DIR),)
$(warning FW_BUILD_DIR is deprecated. Please migrate to THEOS_BUILD_DIR.)
THEOS_BUILD_DIR ?= $(FW_BUILD_DIR)
else
FW_BUILD_DIR = $(THEOS_BUILD_DIR)$(warning FW_BUILD_DIR is deprecated. Please migrate to THEOS_BUILD_DIR.)
endif

ifneq ($(FW_OBJ_DIR_NAME),)
$(warning FW_OBJ_DIR_NAME is deprecated. Please migrate to THEOS_OBJ_DIR_NAME.)
THEOS_OBJ_DIR_NAME ?= $(FW_OBJ_DIR_NAME)
endif

FW_OBJ_DIR = $(THEOS_OBJ_DIR)$(warning FW_OBJ_DIR is deprecated. Please migrate to THEOS_OBJ_DIR.)

ifneq ($(FW_SUBPROJECT_PRODUCT),)
$(warning FW_SUBPROJECT_PRODUCT is deprecated. Please migrate to THEOS_SUBPROJECT_PRODUCT.)
THEOS_SUBPROJECT_PRODUCT ?= $(FW_SUBPROJECT_PRODUCT)
else
FW_SUBPROJECT_PRODUCT = $(THEOS_SUBPROJECT_PRODUCT)$(warning FW_SUBPROJECT_PRODUCT is deprecated. Please migrate to THEOS_SUBPROJECT_PRODUCT.)
endif

FW_INSTANCE = $(THEOS_CURRENT_INSTANCE)$(warning FW_INSTANCE is deprecated. Please migrate to THEOS_CURRENT_INSTANCE.)

FW_SHARED_BUNDLE_RESOURCE_PATH = $(THEOS_SHARED_BUNDLE_RESOURCE_PATH)$(warning FW_SHARED_BUNDLE_RESOURCE_PATH is deprecated. Please migrate to THEOS_SHARED_BUNDLE_RESOURCE_PATH.)
FW_PACKAGE_NAME = $(THEOS_PACKAGE_NAME)$(warning FW_PACKAGE_NAME is deprecated. Please migrate to THEOS_PACKAGE_NAME.)
FW_PACKAGE_ARCH = $(THEOS_PACKAGE_ARCH)$(warning FW_PACKAGE_ARCH is deprecated. Please migrate to THEOS_PACKAGE_ARCH.)
FW_PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)$(warning FW_PACKAGE_VERSION is deprecated. Please migrate to THEOS_PACKAGE_BASE_VERSION.)
FW_PACKAGE_DEBVERSION = $(call __simplify,FW_PACKAGE_DEBVERSION,$(THEOS_PACKAGE_BASE_VERSION))$(warning FW_PACKAGE_DEBVERSION is deprecated. Please migrate to THEOS_PACKAGE_BASE_VERSION.)
FW_PACKAGE_FILENAME = $(error FW_PACKAGE_FILENAME is deprecated. The filename for the most recent package can be found in '.theos/last_package'.)
FW_PACKAGE_STAGING_DIR = $(THEOS_STAGING_DIR)$(warning FW_PACKAGE_STAGING_DIR is deprecated. Please migrate to THEOS_STAGING_DIR.)

ifdef FW_DEVICE_TUNNEL
$(warning FW_DEVICE_TUNNEL is deprecated. Please migrate to THEOS_DEVICE_IP and THEOS_DEVICE_PORT.)
FW_DEVICE_PORT = 2222
FW_DEVICE_IP = 127.0.0.1
endif

ifneq ($(FW_DEVICE_IP),)
$(warning FW_DEVICE_IP is deprecated. Please migrate to THEOS_DEVICE_IP.)
THEOS_DEVICE_IP ?= $(FW_DEVICE_IP)
endif

ifneq ($(FW_DEVICE_PORT),)
$(warning FW_DEVICE_PORT is deprecated. Please migrate to THEOS_DEVICE_PORT.)
THEOS_DEVICE_PORT ?= $(FW_DEVICE_PORT)
endif

THEOS_PACKAGE_VERSION = $(call __simplify,THEOS_PACKAGE_VERSION,$(THEOS_PACKAGE_BASE_VERSION))$(warning THEOS_PACKAGE_VERSION is deprecated. Please migrate to THEOS_PACKAGE_BASE_VERSION.)

ifeq ($(call __exists,$(THEOS_BUILD_DIR)/debs),$(_THEOS_TRUE))
ifneq ($(call __exists,$(THEOS_BUILD_DIR)/packages),$(_THEOS_TRUE))
$(warning The "debs" directory has been renamed to "packages." Moving it.)
$(shell mv "$(THEOS_BUILD_DIR)/debs" "$(THEOS_BUILD_DIR)/packages")
endif
endif

ifneq ($(ADDITIONAL_CPPFLAGS),)
$(warning ADDITIONAL_CPPFLAGS is deprecated. Please migrate to ADDITIONAL_CCFLAGS.)
ADDITIONAL_CCFLAGS += $(ADDITIONAL_CPPFLAGS)
endif
