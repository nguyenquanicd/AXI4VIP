//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_environment.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_ENVIRONMENT__SV
`define GUARD_AXI_ENVIRONMENT__SV

class axi_environment extends uvm_env;
  `uvm_component_utils(axi_environment)

  virtual axi_if master_vif;
  virtual axi_if slave_vif;

  axi_master_agent master_agent;
  axi_slave_agent  slave_agent;

  axi_top_configuration top_cfg;

  axi_scoreboard axi_sb;

  function new(string name="axi_environment", uvm_component parent);
    super.new(name,parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build_phase","Entered...",UVM_HIGH)

    /** Applying the virtual interface received through the config db */
    if(!uvm_config_db#(virtual axi_if)::get(this,"","master_vif",master_vif))
      `uvm_fatal(get_type_name(),$sformatf("Failed to get master_vif from uvm_config_db!"))

    /** Applying the virtual interface received through the config db */
    if(!uvm_config_db#(virtual axi_if)::get(this,"","slave_vif",slave_vif))
      `uvm_fatal(get_type_name(),$sformatf("Failed to get slave_vif from uvm_config_db!"))

    /** Applying the configuration received through the config db */
    if(!uvm_config_db#(axi_top_configuration)::get(this,"","top_cfg",top_cfg))
      `uvm_fatal(get_type_name(),$sformatf("Failed to get top_cfg from uvm_config_db!"))

    /** Construct the agent */
    master_agent = axi_master_agent::type_id::create("master_agent", this);
    slave_agent  = axi_slave_agent::type_id::create("slave_agent", this);

    /** Construct the scoreboard */
    axi_sb = axi_scoreboard::type_id::create("axi_sb", this);

    /** Apply the virtual interface to agent */
    uvm_config_db#(virtual axi_if)::set(this,"master_agent","axi_if",master_vif);
    uvm_config_db#(virtual axi_if)::set(this,"slave_agent","axi_if",slave_vif);

    /** Apply the configuration to agent */
    uvm_config_db#(axi_configuration)::set(this,"master_agent","axi_cfg",top_cfg.master_cfg);
    uvm_config_db#(axi_configuration)::set(this,"slave_agent","axi_cfg",top_cfg.slave_cfg);

    `uvm_info("build_phase","Exiting...",UVM_HIGH)
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("connect_phase","Entered...",UVM_HIGH)

    /** Connect to scoreboard */
    master_agent.monitor.item_observed_port.connect(axi_sb.packet_from_master_port);
    slave_agent.monitor.item_observed_port.connect(axi_sb.packet_from_slave_port);

    `uvm_info("connect_phase","Exiting...",UVM_HIGH)
  endfunction: connect_phase

endclass: axi_environment

`endif


