//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_status.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef AXI_STATUS__SV
`define AXI_STATUS__SV

class axi_status extends uvm_object;

  `uvm_object_utils_begin(axi_status)
  `uvm_object_utils_end

  function new(string name="axi_status");
    super.new(name);
  endfunction: new

endclass: axi_status

`endif


