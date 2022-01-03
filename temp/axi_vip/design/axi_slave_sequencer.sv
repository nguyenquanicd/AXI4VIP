//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_slave_sequencer.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_SLAVE_SEQUENCER__SV
`define GUARD_AXI_SLAVE_SEQUENCER__SV

typedef class axi_slave_agent;
typedef class axi_status;
class axi_slave_sequencer extends uvm_sequencer #(axi_slave_transaction);
  `uvm_component_utils(axi_slave_sequencer)

  axi_configuration    cfg;
  axi_status           share_status;

  local string msg = "[AXI_SLAVE_VIP][AXI_SLAVE_SEQUENCER]";  

  function new(string name="axi_slave_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction: new

  function void get_cfg(ref axi_configuration cfg);
    this.cfg = cfg;
  endfunction: get_cfg


endclass: axi_slave_sequencer

`endif


