//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_master_agent.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_MASTER_AGENT__SV
`define GUARD_AXI_MASTER_AGENT__SV

class axi_master_agent extends uvm_agent;
  `uvm_component_utils(axi_master_agent)

  virtual axi_if axi_vif;

  axi_configuration    cfg;
  axi_master_monitor   monitor;
  axi_master_driver    driver;
  axi_master_sequencer sequencer;
  axi_status           share_status;

  local string msg = "[AXI_VIP][AXI_MASTER_AGENT]";  
  local string config_id    = "axi_cfg";
  local string interface_id = "axi_if";

  function new(string name="axi_master_agent", uvm_component parent);
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

    /** Create share status object for futher implementation */
      share_status = axi_status::type_id::create("share_status");
      uvm_config_db#(axi_status)::set(this,"monitor","share_status",share_status);

    /** Create component and set the virtual interface to lower component
     * Default Agent is Active mode.
     * User can set Agent is passive mode by doing:
     * uvm_config_db#(uvm_active_passive_enum)::set(<Path-to-agent>,"is_active",UVM_PASSIVE).
     */
    if(get_is_active() == UVM_ACTIVE) begin
      `uvm_info(msg,$sformatf("Active agent is configued"),UVM_LOW)
      driver = axi_master_driver::type_id::create("driver", this);
      sequencer = axi_master_sequencer::type_id::create("sequencer", this);
      monitor = axi_master_monitor::type_id::create("monitor", this);

      /** Pass configuration to sub component */
      uvm_config_db#(axi_configuration)::set(this,"driver","axi_cfg",cfg);
      uvm_config_db#(axi_configuration)::set(this,"monitor","axi_cfg",cfg);

      /** Pass virtual interface to sub component */
      uvm_config_db#(virtual axi_if)::set(this,"driver","axi_if",axi_vif);
      uvm_config_db#(virtual axi_if)::set(this,"monitor","axi_if",axi_vif);

      /** Pass share status to driver */
      uvm_config_db#(axi_status)::set(this,"driver","share_status",share_status);
    end
    else begin
      `uvm_info(msg,$sformatf("Passive agent is configued"),UVM_LOW)
      monitor = axi_master_monitor::type_id::create("monitor", this);

      /** Pass virtual interface to sub component */
      uvm_config_db#(virtual axi_if)::set(this,"monitor","axi_if",axi_vif);

      /** Pass configuration to sub component */
      uvm_config_db#(axi_configuration)::set(this,"monitor","axi_cfg",cfg);
    end

  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(get_is_active() == UVM_ACTIVE) begin 
      driver.seq_item_port.connect(sequencer.seq_item_export);
      sequencer.get_cfg(this.cfg);
    end
  endfunction: connect_phase

endclass: axi_master_agent

`endif


