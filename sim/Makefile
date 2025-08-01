
BUILD_DIR = ./build
TOP = sim_tb
FILELIST = -file $(MERCURY)/rtl/rtl.f

SIM_DIR = $(shell pwd)
MERCURY = $(SIM_DIR)/..

export MERCURY

vcs:
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -assert svaext -full64 -timescale=1ns/1ns +lint=TFIPC-L -debug_acc+all -debug_access -sverilog \
	-kdb -lca -DVCS \
	+vcs+loopreport+10000 \
	$(FILELIST) \
	-top $(TOP)

vd:
	verdi -elab ./build/simv.daidir/kdb
