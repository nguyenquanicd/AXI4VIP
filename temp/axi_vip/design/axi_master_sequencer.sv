//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_master_sequencer.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_MASTER_SEQUENCER__SV
`define GUARD_AXI_MASTER_SEQUENCER__SV

typedef class axi_master_agent;
typedef class axi_status;
class axi_master_sequencer extends uvm_sequencer #(axi_master_transaction);
  `uvm_component_utils(axi_master_sequencer)

  axi_configuration    cfg;
  axi_status           share_status;

  local string msg = "[AXI_MASTER_VIP][AXI_MASTER_SEQUENCER]";  

  function new(string name="axi_master_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction: new

  function void get_cfg(ref axi_configuration cfg);
    this.cfg = cfg;
  endfunction: get_cfg


endclass: axi_master_sequencer

`endif


