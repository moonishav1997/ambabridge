class bridge_wr_agt_top extends uvm_env;
`uvm_component_utils(bridge_wr_agt_top)
bridge_wr_agent agnth[];
bridge_env_config m_cfg;
//bridge_wr_agent_config
        extern function new(string name = "bridge_wr_agt_top" , uvm_component parent);
        extern function void build_phase(uvm_phase phase);
        //extern task run_phase(uvm_phase phase);
  endclass
        function bridge_wr_agt_top::new(string name = "bridge_wr_agt_top" , uvm_component parent);
                super.new(name,parent);
        endfunction

        function void bridge_wr_agt_top::build_phase(uvm_phase phase);
                super.build_phase(phase);
       if(!uvm_config_db#(bridge_env_config)::get(this,"","bridge_env_config",m_cfg))
         `uvm_fatal("fatal","cannot get() env config file to wr_agt_top")
        agnth=new[m_cfg.no_of_wr_agents];
       foreach(agnth[i])
        begin
       uvm_config_db#(bridge_wr_agent_config)::set(this,$sformatf("agnth[%0d]*",i),"bridge_wr_agent_config",m_cfg.m_wr_agent_cfg[i]);
        agnth[i]=bridge_wr_agent::type_id::create($sformatf("agnth[%0d]",i),this);
        end
       endfunction
