//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_base_test.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_BASE_TEST__SV
`define GUARD_AXI_BASE_TEST__SV

class axi_base_test extends uvm_test;
  `uvm_component_utils(axi_base_test)

  virtual axi_if master_vif;
  virtual axi_if slave_vif;

  axi_environment env;
  axi_top_configuration top_cfg;
  uvm_report_server svr;

  axi_error_catcher err_catcher;
  time usr_timeout=1ms;

  function new(string name="axi_base_test", uvm_component parent);
    super.new(name,parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build_phase","Entered...",UVM_HIGH)

    /** Applying the virtual interface received through the config db */
    if(!uvm_config_db#(virtual axi_if)::get(this,"","master_vif",master_vif))
      `uvm_fatal(get_type_name(),$sformatf("Failed to get master_vif from uvm_config_db!"));

    /** Applying the virtual interface received through the config db */
    if(!uvm_config_db#(virtual axi_if)::get(this,"","slave_vif",slave_vif))
      `uvm_fatal(get_type_name(),$sformatf("Failed to get master_vif from uvm_config_db!"));

    env = axi_environment::type_id::create("env",this);
    top_cfg = axi_top_configuration::type_id::create("axi_top_configuration");

    /** Apply the virtual interface to environment */
    uvm_config_db#(virtual axi_if)::set(this,"env","master_vif",master_vif);
    uvm_config_db#(virtual axi_if)::set(this,"env","slave_vif",slave_vif);

    /** Apply the configuration to environment */
    uvm_config_db#(axi_top_configuration)::set(this,"env","top_cfg",top_cfg);

    /** Error catcher */
    err_catcher = axi_error_catcher::type_id::create("err_catcher");
    uvm_config_db#(axi_error_catcher)::set(this,"","err_catcher",err_catcher);

    /** Set default time out */
    uvm_top.set_timeout(usr_timeout);
    `uvm_info("build_phase","Exiting...",UVM_HIGH)

  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    `uvm_info("connect_phase","Entered...",UVM_HIGH)
    uvm_report_cb::add(null,err_catcher);
    `uvm_info("connect_phase","Exiting...",UVM_HIGH)
  endfunction: connect_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("end_of_elaboration_phase","Entered...",UVM_HIGH)
     uvm_top.print_topology();
    `uvm_info("end_of_elaboration_phase","Exiting...",UVM_HIGH)
  endfunction: end_of_elaboration_phase

  virtual function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    `uvm_info("final_phase","Entered...",UVM_HIGH)
    svr = uvm_report_server::get_server();
    if(svr.get_severity_count(UVM_FATAL) +
       svr.get_severity_count(UVM_ERROR) > 0) begin
      $display("\n==========================================================");
      $display("               #### Status: TEST FAILED ####                ");
      $display("==========================================================\n");
    end
    else begin
      $display("\n==========================================================");
      $display("               #### Status: TEST PASSED ####                ");
      $display("==========================================================\n");
    end
    `uvm_info("final_phase","Exiting...",UVM_HIGH)

  endfunction: final_phase

endclass: axi_base_test

`define AXI_TEST(className, masterSequenceName, slaveSequenceName) \
class className extends axi_base_test; \
  `uvm_component_utils(className) \
  function new(string name, uvm_component parent); \
    super.new(name,parent); \
  endfunction: new \
  virtual function void build_phase(uvm_phase phase); \
    super.build_phase(phase); \
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master.sequencer.main_phase","default_sequence", masterSequenceName::type_id::get()); \
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.slave.sequencer.main_phase","default_sequence", slaveSequenceName::type_id::get()); \
  endfunction: build_phase \
endclass: className 

 `AXI_TEST(axi_base_sequence_test,axi_master_base_sequence,axi_slave_base_sequence)

`endif


