//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_configuration.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef AXI_CONFIGURATION__SV
`define AXI_CONFIGURATION__SV

class axi_configuration extends uvm_object;

  /** Setting active or passive agent */
  bit  is_active = 1;

  `uvm_object_utils_begin (axi_configuration)
    `uvm_field_int        (is_active ,UVM_ALL_ON |UVM_HEX )
  `uvm_object_utils_end

  function new(string name="axi_configuration");
    super.new(name);
  endfunction: new

endclass: axi_configuration

`endif


