//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_scoreboard.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_SCOREBOARD__SV
`define GUARD_AXI_SCOREBOARD__SV

`uvm_analysis_imp_decl(_master)
`uvm_analysis_imp_decl(_slave)

class axi_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(axi_scoreboard)

  uvm_analysis_imp_master #(axi_master_transaction, axi_scoreboard) packet_from_master_port;
  uvm_analysis_imp_slave  #(axi_slave_transaction, axi_scoreboard) packet_from_slave_port;

  function new(string name="axi_scoreboard", uvm_component parent);
    super.new(name,parent);
    packet_from_master_port = new ("packet_from_master_port", this);
    packet_from_slave_port = new ("packet_from_slave_port", this);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build_phase","Entered...",UVM_HIGH)
    `uvm_info("build_phase","Exiting...",UVM_HIGH)
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
  endtask: run_phase

  virtual function void write_master(axi_master_transaction trans);
    `uvm_info("get_full_name()","Get packet from master...",UVM_MEDIUM)
  endfunction: write_master

  virtual function void write_slave(axi_slave_transaction trans);
    `uvm_info("get_full_name()","Get packet from slave...",UVM_MEDIUM)
  endfunction: write_slave

  virtual function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info("check_phase","Entered...",UVM_HIGH)
    `uvm_info("check_phase","Exiting...",UVM_HIGH)
  endfunction: check_phase

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("report_phase","Entered...",UVM_HIGH)
    `uvm_info("report_phase","Exiting...",UVM_HIGH)
  endfunction: report_phase

endclass: axi_scoreboard

`endif


