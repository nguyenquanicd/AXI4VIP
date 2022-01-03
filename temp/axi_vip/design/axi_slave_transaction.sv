//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_slave_transaction.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef AXI_SLAVE_TRANSACTION__SV
`define AXI_SLAVE_TRANSACTION__SV

class axi_slave_transaction extends axi_transaction;
  `uvm_object_utils_begin(axi_slave_transaction)
  `uvm_object_utils_end

  function void pre_randomize();
  endfunction: pre_randomize

  function void post_randomize();
  endfunction: post_randomize

  function new(string name="axi_slave_transaction");
    super.new(name);
  endfunction: new

endclass: axi_slave_transaction

`endif


