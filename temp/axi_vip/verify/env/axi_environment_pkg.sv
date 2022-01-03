//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_environment_pkg.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_ENVIRONMENT_PACKAGE__SV
`define GUARD_AXI_ENVIRONMENT_PACKAGE__SV

package axi_environment_pkg;
  import uvm_pkg::*;

  import axi_pkg::*;

  `include "axi_error_catcher.sv";
  `include "axi_scoreboard.sv";
  `include "axi_top_configuration.sv";
  `include "axi_environment.sv";

endpackage: axi_environment_pkg

`endif


