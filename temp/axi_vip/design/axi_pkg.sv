//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_pkg.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_PACKAGE__SV
`define GUARD_AXI_PACKAGE__SV

package axi_pkg;
  import uvm_pkg::*;

  `include "axi_timescale.sv"
  `include "axi_define.sv"
  `include "axi_types.sv"
  `include "axi_configuration.sv"
  `include "axi_status.sv"
  `include "axi_transaction.sv"
  `include "axi_master_transaction.sv"
  `include "axi_master_sequencer.sv"
  `include "axi_master_driver.sv"
  `include "axi_master_monitor.sv"
  `include "axi_master_agent.sv"
  `include "axi_slave_transaction.sv"
  `include "axi_slave_sequencer.sv"
  `include "axi_slave_driver.sv"
  `include "axi_slave_monitor.sv"
  `include "axi_slave_agent.sv"

endpackage: axi_pkg

`endif


