//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_master_monitor.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_MASTER_MONITOR__SV
`define GUARD_AXI_MASTER_MONITOR__SV

class axi_master_monitor extends uvm_monitor;
  `uvm_component_utils(axi_master_monitor)

  virtual axi_if axi_vif;

  axi_configuration    cfg;
  axi_status           share_status;

  UVM_FILE       FN;
  /** Analysis port, send the transaction to scoreboard */
  uvm_analysis_port #(axi_master_transaction) item_observed_port;

  local string msg = "[AXI_MASTER_VIP][AXI_MASTER_MONITOR]";
  local string config_id    = "axi_cfg";
  local string interface_id = "axi_if";

  function new(string name="axi_master_monitor", uvm_component parent);
    super.new(name,parent);
    item_observed_port = new("item_observed_port",this);
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

  /** Create file and also return handle via output */
  virtual function void create_file(output UVM_FILE fn);
    string full_name = get_full_name();
    string FN_str = full_name.substr(13,full_name.len()-1);
    fn = $fopen($sformatf("%s.trace",FN_str),"w");
  endfunction

  /** Print to trace file */
  virtual function void printf(input string str,input UVM_FILE fn);
    $fdisplay(fn,"%s",str);
  endfunction

  /** Convert data to string with underscores */
  virtual function string fmt (longint num, string radix, int width = 1);
    /** for $display.  For example: 12345 -> 12_345.
     * radix should be [d|h|b].
     * width can be used for zero-padding on the left.
     * Any x/z passed into num gets converted to 0.
     * Reals passed into num are rounded to an integer.
     * Values greater than 64-bit are truncated.
     */
    int pos, chars;
    string str, str2, fmtstr;
    str2 = "";

    fmtstr = {"%0", $sformatf("%0d", width), radix};
    str = $sformatf(fmtstr, num);

    chars = (radix == "d") ? 3 : 4;
    pos = 0;
    for (int i = str.len()-1; i>=0; i--) begin
      pos++;
      str2 = {str.getc(i), str2};
      if (pos % chars == 0) str2 = {"_", str2};
    end

    /** Remove any leading underscore */
    if (str2.getc(0) == "_") begin
      str2 = str2.substr(1, str2.len()-1);
    end
    return str2;
 endfunction: fmt

endclass: axi_master_monitor

`endif


