class bridge_wr_agent_config extends uvm_object;
`uvm_object_utils(bridge_wr_agent_config)
virtual bridge_if vif;
//int no_of_wr_agents=1;
uvm_active_passive_enum is_active = UVM_ACTIVE;
extern function new(string name = "bridge_wr_agent_config");
endclass


function bridge_wr_agent_config::new(string name = "bridge_wr_agent_config");
  super.new(name);
endfunction
