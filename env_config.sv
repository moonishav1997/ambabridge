class bridge_env_config extends uvm_object;
`uvm_object_utils(bridge_env_config)
bit has_scoreboard = 1;
bit has_wagent_top = 1;
bit has_ragent_top = 1;
bit has_virtual_sequencer = 1;
int no_of_wr_agents=1;
int no_of_rd_agents=1;
//int no_of_wagent_tops=1;
//int no_of_ragent_tops=1;

bridge_wr_agent_config m_wr_agent_cfg[];
bridge_rd_agent_config m_rd_agent_cfg[];

extern function new(string name = "bridge_env_config");
endclass
function bridge_env_config::new(string name="bridge_env_config");
    super.new(name);
endfunction


