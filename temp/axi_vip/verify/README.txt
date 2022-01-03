//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Author        : VLSI GROUP
// Date          : 03-Jan-2022
//=============================================================================

I. Overview
<top_directory>
      |-------> design: Included VIP 
      |-------> docs: Included document
      |-------> verify
                  |-----> env
                  |-----> hdl_interconnect
                  |-----> run_sim
                  |-----> sequences
                  |-----> testcases
                  |-----> project.env

II. Detail of environment structure
  TBD...

III. How to run simulation
  1. Go to <top_directory>/verify
  2. Edit path of UVM_HOME to uvm library in project.env file
  3. Use command to setting linux environment variable
    source project.env
  4. Go to rum_sim directory
  5. Use command below for trial basic simulation
    make all


