//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_transaction.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef AXI_TRANSACTION__SV
`define AXI_TRANSACTION__SV

class axi_transaction extends uvm_sequence_item;

  rand axi_types :: xact_type_enum  xact_type;

  `uvm_object_utils_begin (axi_transaction)
    `uvm_field_enum       (axi_types::xact_type_enum, xact_type, UVM_ALL_ON |UVM_HEX )
  `uvm_object_utils_end

  function void pre_randomize();
  endfunction: pre_randomize

  function void post_randomize();
  endfunction: post_randomize

  function new(string name="axi_transaction");
    super.new(name);
  endfunction: new

endclass: axi_transaction

`endif


