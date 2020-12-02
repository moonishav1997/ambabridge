class bridge_rd_agent_config extends uvm_object;
`uvm_object_utils(bridge_rd_agent_config)
virtual bridge_if vif;
//int no_of_rd_agents=3;
uvm_active_passive_enum is_active = UVM_ACTIVE;
extern function new(string name = "bridge_rd_agent_config");
endclass


function bridge_rd_agent_config::new(string name = "bridge_rd_agent_config");
  super.new(name);
endfunction
