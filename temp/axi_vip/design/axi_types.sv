//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_types.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef AXI_TYPES__SV
`define AXI_TYPES__SV

class axi_types extends uvm_object;
  `uvm_object_utils(axi_types)

  typedef enum bit {
       WRITE
      ,READ = 1
  } xact_type_enum;

  function new(string name="axi_types");
    super.new(name);
  endfunction: new

endclass: axi_types

`endif


