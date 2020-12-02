class bridge_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
`uvm_component_utils(bridge_virtual_sequencer)
bridge_wr_sequencer wr_seqrh[];
bridge_rd_sequencer rd_seqrh[];
bridge_env_config m_cfg;
	extern function new(string name = "bridge_virtual_sequencer",uvm_component parent);
        extern function void build_phase(uvm_phase phase);
endclass

function bridge_virtual_sequencer::new(string name="bridge_virtual_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void bridge_virtual_sequencer::build_phase(uvm_phase phase);
         if(!uvm_config_db #(bridge_env_config)::get(this,"","bridge_env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
            super.build_phase(phase);
          wr_seqrh=new[m_cfg.no_of_wr_agents];
          $display("%d",m_cfg.no_of_wr_agents);

          rd_seqrh=new[m_cfg.no_of_rd_agents];
        endfunction
