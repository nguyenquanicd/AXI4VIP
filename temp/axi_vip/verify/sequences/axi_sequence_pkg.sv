//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_sequence_pkg.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_SEQUENCE_PACKAGE__SV
`define GUARD_AXI_SEQUENCE_PACKAGE__SV

package axi_sequence_pkg;
  import uvm_pkg::*;

  import axi_pkg::*;
  import axi_environment_pkg::*;

  `include "axi_master_base_sequence.sv";
  `include "axi_slave_base_sequence.sv";

endpackage: axi_sequence_pkg

`endif


