//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : tb_top.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================

/** Top level systemverilog testbench */

`timescale 1ps/1ps
//`include "axi_dut_sv_wrapper.sv"
import uvm_pkg::*;
import axi_pkg::*;
import axi_test_pkg::*;

module tb_top;

  /** Instantiate AXI Interface */
  axi_if master_if();
  axi_if slave_if();

  /** Interconnect wrapper */
//  axi_dut_sv_wrapper dut(master_if,slave_if);

  initial begin
    `ifdef WAVE_FSDB
      $fsdbDumpfile("test_top");
      $fsdbDumpvars;
    `elsif WAVE_VCD
      $dumpvars;
    `elsif WAVE
      $vcdpluson;
    `endif
  end

  /** Set the VIP interface on the environment */
  initial begin
    uvm_config_db#(virtual axi_if)::set(uvm_root::get(),"uvm_test_top","master_vif",master_if);
    uvm_config_db#(virtual axi_if)::set(uvm_root::get(),"uvm_test_top","slave_vif",slave_if);

    /** Start the UVM test */
    run_test();
  end

endmodule


