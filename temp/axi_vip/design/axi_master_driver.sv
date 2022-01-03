//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_master_driver.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_MASTER_DRIVER__SV
`define GUARD_AXI_MASTER_DRIVER__SV

class axi_master_driver extends uvm_driver #(axi_master_transaction);
  `uvm_component_utils(axi_master_driver)

  virtual axi_if axi_vif;

  axi_configuration    cfg;
  axi_master_sequencer sequencer;
  axi_status           share_status;

  local string msg = "[AXI_MASTER_VIP][AXI_MASTER_DRIVER]";  
  local string config_id    = "axi_cfg";
  local string interface_id = "axi_if";

  function new(string name="axi_master_driver", uvm_component parent);
    super.new(name,parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    /** Applying the virtual interface received through the config db */
    if(!uvm_config_db#(virtual axi_if)::get(this,"","axi_if",axi_vif))
      `uvm_fatal(msg,$sformatf("Failed to get %0s from uvm_config_db. Please check!",interface_id))

    /** Applying the configuration received through the config db */
    if(!uvm_config_db#(axi_configuration)::get(this,"","axi_cfg",cfg))
      `uvm_fatal(msg,$sformatf("Failed to get %0s from uvm_config_db. Please check!",config_id))

    /** Applying the configuration received through the config db */
    if(!uvm_config_db#(axi_status)::get(this,"","share_status",share_status))
      `uvm_fatal(msg,$sformatf("Failed to get share_status from uvm_config_db!"))

  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
  endtask: run_phase

endclass: axi_master_driver

`endif


