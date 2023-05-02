#
# Makefile for stm32mp157a-dk1
#

WORK_DIR   = $(PWD)
TMP_DIR    = $(WORK_DIR)/tmp
IMAGE_DIR  = $(WORK_DIR)/img
IMAGE_NAME = $(IMAGE_DIR)/sd.img
IMAGE_BLOCK= 1M
IMAGE_COUNT= 4k

all: $(IMAGE_NAME)

$(IMAGE_NAME): $(IMAGE_DIR)
	@echo "Creating image file"
	@dd if=/dev/zero of=$(IMAGE_NAME) bs=$(IMAGE_BLOCK) count=$(IMAGE_COUNT) status=progress

$(IMAGE_DIR): 
	@mkdir $(IMAGE_DIR) || true

$(TMP_DIR):
	@mkdir $(TMP_DIR) || true

clean: 
	@rm -f $(IMAGE_NAME)

.PHONY: all clean 

# 
# vim: ts=4 nowrap autoindent
