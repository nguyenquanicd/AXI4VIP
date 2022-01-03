//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_slave_base_sequence.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_SLAVE_SEQUENCE__SV
`define GUARD_AXI_SLAVE_SEQUENCE__SV

class axi_slave_base_sequence extends uvm_sequence #(axi_slave_transaction);
  `uvm_object_utils(axi_slave_base_sequence)

  function new(string name="axi_slave_base_sequence");
    super.new(name);
  endfunction: new

  virtual task pre_body();
    super.pre_body();
    `uvm_info("pre_body","Entered...",UVM_LOW)
    /** Raise the objection if sequence was started automatically */
    if(starting_phase!=null)
      starting_phase.raise_objection(this);
    `uvm_info("pre_body","Exiting...",UVM_LOW)
  endtask: pre_body

  virtual task post_body();
    super.post_body();
    `uvm_info("post_body","Entered...",UVM_LOW)
    /** Raise the objection if sequence was started automatically */
    if(starting_phase!=null)
      starting_phase.drop_objection(this);
    `uvm_info("post_body","Exiting...",UVM_LOW)
  endtask: post_body

  virtual task body();
    `uvm_info("body","Entered...",UVM_LOW)
    #1ms;
    `uvm_info("body","Exiting...",UVM_LOW)

  endtask: body

endclass: axi_slave_base_sequence

`endif


