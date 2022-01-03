## 
## -------------------------------------------------------------
##    Copyright 2010 Mentor Graphics Corporation
##    All Rights Reserved Worldwide
## 
##    Licensed under the Apache License, Version 2.0 (the
##    "License"); you may not use this file except in
##    compliance with the License.  You may obtain a copy of
##    the License at
## 
##        http://www.apache.org/licenses/LICENSE-2.0
## 
##    Unless required by applicable law or agreed to in
##    writing, software distributed under the License is
##    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
##    CONDITIONS OF ANY KIND, either express or implied.  See
##    the License for the specific language governing
##    permissions and limitations under the License.
## -------------------------------------------------------------
## 
SEED      ?=random
TIMESCALE ?= "1ps/1ps"
RTL_FILE  ?= compile_rtl.list 
TB_FILE   ?= compile_tb.list 
REGRESSION?= regression.list 
TB_NAME   ?= tb_top
TESTNAME  ?= axi_base_sequence_test
VERBOSITY ?= UVM_HIGH
RUNARG    ?=

ifeq ($(strip $(SEED)),random)
  SEED = $(shell /bin/date +%s)
endif
TEST_LIST = $(shell cat $(strip $(REGRESSION)))

##==============================================================
VLOG =  vlog \
        -timescale ${TIMESCALE} \
        -mfcu \
        -incr \
        +acc  \
        -l quesa_compile.log \
        +define+UVM_NO_DPI \
        +incdir+$(UVM_HOME)/src \
        $(UVM_HOME)/src/uvm.sv
		
VSIM =  vsim \
        -sv_seed ${SEED} \
        -voptargs=+acc \
        -novopt \
        -assertdebug \
        -c ${TB_NAME}\
        -do "log -r /*;run -all;" \
        -l ${TESTNAME}_${SEED}.log	

##==============================================================

all: build run
build: 	vlib
	$(VLOG) -f ${RTL_FILE} -f ${TB_FILE}
		
run:
	$(VSIM) +UVM_TESTNAME=${TESTNAME} \
          +UVM_VERBOSITY=${VERBOSITY} \
	        ${RUNARG} 
	mv ${TESTNAME}_${SEED}.log ./log
	ln -sf ./log/${TESTNAME}_${SEED}.log xrun.log
 
vlib:
	mkdir -p log
	vlib work
	vmap work work

regress: build	
	$(foreach var, $(TEST_LIST), \
  $(VSIM) +UVM_TESTNAME=$(var) +UVM_VERBOSITY=${VERBOSITY};)
	mv *.log ./log

wave:
	vsim -i -view vsim.wlf -do "add wave vsim:/${TB_NAME};" &

clean: 
	rm -rf work
	rm -rf log
	rm -rf *.ini
	rm -rf *.log
	rm -rf ${TB_NAME}
	rm -rf transcript
	rm -rf *.wlf
