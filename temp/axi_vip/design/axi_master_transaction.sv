//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_master_transaction.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef AXI_MASTER_TRANSACTION__SV
`define AXI_MASTER_TRANSACTION__SV

class axi_master_transaction extends axi_transaction;
  `uvm_object_utils_begin(axi_master_transaction)
  `uvm_object_utils_end

  function void pre_randomize();
  endfunction: pre_randomize

  function void post_randomize();
  endfunction: post_randomize

  function new(string name="axi_master_transaction");
    super.new(name);
  endfunction: new

endclass: axi_master_transaction

`endif


