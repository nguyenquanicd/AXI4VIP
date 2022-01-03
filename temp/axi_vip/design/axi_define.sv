//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_define.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : Define can override by environment
//
//
//
//=============================================================================
`ifndef GUARD_AXI_DEFINE__SV
`define GUARD_AXI_DEFINE__SV

  `ifndef FORK_GUARD_BEGIN
    `define FORK_GUARD_BEGIN fork begin
  `endif

  `ifndef FORK_GUARD_END
    `define FORK_GUARD_END   fork end
  `endif

`endif


