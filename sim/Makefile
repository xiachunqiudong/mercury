
BUILD_DIR = ./build
TOP = sim_tb
FILELIST = -file $(MERCURY)/rtl/rtl.f

SIM_DIR = $(shell pwd)
MERCURY = $(SIM_DIR)/..

export MERCURY

build:
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -assert svaext -full64 -timescale=1ns/1ns +lint=TFIPC-L -debug_acc+all -debug_access -sverilog \
	-kdb -lca -DVCS \
	+vcs+loopreport+10000 \
	$(FILELIST) \
	-top $(TOP)

sim:
	$(BUILD_DIR)/simv

dis:
	llvm-objdump -d $(CASE_PATH)/$(CASE_NAME).elf > $(CASE_PATH)/$(CASE_NAME).text.dis

vd:
	verdi -elab ./build/simv.daidir/kdb

CASE_PATH ?= /home/host/project/mercury/sim/case/demo
CASE_NAME ?= demo

clang:
	clang $(CASE_PATH)/$(CASE_NAME).S \
	-T ./case/env/link.ld \
	-mabi=lp64 -static -nostdlib -nostartfiles \
	-o $(CASE_PATH)/$(CASE_NAME).elf

genhex:
	llvm-objcopy -O binary --only-section=.text $(CASE_PATH)/$(CASE_NAME).elf $(CASE_PATH)/$(CASE_NAME).text.bin
	xxd -p -c 32 $(CASE_PATH)/$(CASE_NAME).text.bin > $(CASE_PATH)/$(CASE_NAME).text.hex
	rm $(CASE_PATH)/$(CASE_NAME).text.bin


.PHONY: build