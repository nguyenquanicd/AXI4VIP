//=============================================================================
// Project       : AXI VIP
//=============================================================================
// Filename      : axi_error_catcher.sv
// Author        : VLSI GROUP
// Company       : NO
// Date          : 03-Jan-2022
//=============================================================================
// Description   : 
//
//
//
//=============================================================================
`ifndef GUARD_AXI_ERROR_CATCHER__SV
`define GUARD_AXI_ERROR_CATCHER__SV

typedef class axi_error_catcher_msg;
class axi_error_catcher extends uvm_report_catcher;
  `uvm_object_utils(axi_error_catcher)

  axi_error_catcher_msg error_message[$];

  function new(string name="axi_error_catcher");
    super.new(name);
  endfunction: new

  virtual function bit pattern_match(string str1, str2);
    int l1,l2;

    l1 = str1.len();
    l2 = str2.len();
    pattern_match = 0;
    if(l2 > l1) return 0;
    for(int i=0; i<l1-l2+1; i++) begin
      if(str1.substr(i,i+l2-1) == str2)
        return 1;
    end
  endfunction: pattern_match

  virtual function action_e catch();
    string str_cmp;
    int need_del[$];

    if(get_severity() == UVM_ERROR || get_severity() == UVM_FATAL) begin
      foreach(error_message[i]) begin
        str_cmp = error_message[i].str;
        if(pattern_match(get_message(),str_cmp)) begin
          set_severity(UVM_INFO);
          `uvm_info("REPORT_CATCHER:",$sformatf("Demoted below error message: %s. Pos: %0d",str_cmp,i),UVM_LOW)
          error_message[i].rpt--;
          if(error_message[i].rpt <= 0)
            need_del.push_front(i);
        end
      end
      foreach(need_del[i])
        error_message.delete(need_del[i]);
    end
    return THROW;
  endfunction: catch

  virtual function void add_error_catcher_msg(string str, int rpt=1, bit ign=0);
    axi_error_catcher_msg msg;
    msg = axi_error_catcher_msg::type_id::create("msg");
    msg.str = str;
    msg.rpt = rpt;
    msg.ign = ign;
    error_message.push_back(msg);
  endfunction: add_error_catcher_msg

  virtual function void check_remain_msg();
    foreach(error_message[i]) begin
      if(!error_message[i].ign) begin
        `uvm_error("REPORT_CATCHER:",$sformatf("Error message is not happen: %s",error_message[i].str))
      end
    end
  endfunction: check_remain_msg

endclass: axi_error_catcher

class axi_error_catcher_msg extends uvm_object;
  `uvm_object_utils(axi_error_catcher_msg)

  string str; //Which message capture in simulation
  int    rpt; //How many error message happen
  bit    ign; //Ignore uvm error if message not happen or not enough number of message

  function new(string name="axi_error_catcher_msg");
    super.new(name);
  endfunction: new

endclass: axi_error_catcher_msg

`endif


