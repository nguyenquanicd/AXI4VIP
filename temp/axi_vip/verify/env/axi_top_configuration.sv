//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_top_configuration.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_TOP_CONFIGURATION__SV
`define GUARD_AXI_TOP_CONFIGURATION__SV

class axi_top_configuration extends uvm_object;

  axi_configuration master_cfg;
  axi_configuration slave_cfg;

  `uvm_object_utils_begin(axi_top_configuration)
    `uvm_field_object (master_cfg, UVM_ALL_ON)
    `uvm_field_object (slave_cfg, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="axi_top_configuration");
    super.new(name);
    master_cfg = new();
    slave_cfg = new();
  endfunction: new

endclass: axi_top_configuration

`endif


