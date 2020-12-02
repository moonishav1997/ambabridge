class bridge_wr_agent extends uvm_agent;
`uvm_component_utils(bridge_wr_agent)
 bridge_wr_agent_config m_cfg;
        bridge_wr_monitor monh;
        bridge_wr_sequencer m_sequencer;
        bridge_wr_driver drvh;
 extern function new(string name = "bridge_wr_agent", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass
       function bridge_wr_agent::new(string name = "bridge_wr_agent",
                               uvm_component parent = null);
         super.new(name, parent);
       endfunction

function void bridge_wr_agent::build_phase(uvm_phase phase);
                super.build_phase(phase);
                // get the config object using uvm_config_db
          if(!uvm_config_db #(bridge_wr_agent_config)::get(this,"","bridge_wr_agent_config",m_cfg))
                `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
                monh=bridge_wr_monitor::type_id::create("monh",this);
                if(m_cfg.is_active==UVM_ACTIVE)
                begin
                drvh=bridge_wr_driver::type_id::create("drvh",this);
                m_sequencer=bridge_wr_sequencer::type_id::create("m_sequencer",this);
                end
        endfunction
function void bridge_wr_agent::connect_phase(uvm_phase phase);
                if(m_cfg.is_active==UVM_ACTIVE)
                begin
                drvh.seq_item_port.connect(m_sequencer.seq_item_export);
                end
        endfunction
