class bridge_tb extends uvm_env;
`uvm_component_utils(bridge_tb)
bridge_wr_agt_top wagnt_top;
bridge_rd_agt_top ragnt_top;
bridge_virtual_sequencer v_sequencer;
bridge_scoreboard sb1;
bridge_env_config m_cfg;
extern function new(string name = "bridge_tb", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
endclass
   function bridge_tb::new(string name = "bridge_tb", uvm_component parent);
		super.new(name,parent);
    endfunction
 function void bridge_tb::build_phase(uvm_phase phase);
       if(!uvm_config_db #(bridge_env_config)::get(this,"","bridge_env_config",m_cfg))
        `uvm_fatal("fatal","cannot get env config"); 
         super.build_phase(phase);
        if(m_cfg.has_scoreboard==1) 
      sb1=bridge_scoreboard::type_id::create("sb1",this);
  
           if(m_cfg.has_wagent_top==1)
         // wagnt_top=new[m_cfg.no_of_wagent_tops]
             //	foreach(wagnt_top[i])
                  //    wagnt_top[i]=bridge_wr_agt_top::type_id::create($sformatf("wagnt_top[%0d]",i) ,this);
                  wagnt_top=bridge_wr_agt_top::type_id::create("wagnt_top",this);

        
          if(m_cfg.has_ragent_top==1)
         // ragnt_top=new[m_cfg.no_of_ragent_tops]
            // 	foreach(ragnt_top[i])
                  //    ragnt_top[i]=bridge_rd_agt_top::type_id::create($sformatf("ragnt_top[%0d]",i) ,this);
               ragnt_top=bridge_rd_agt_top::type_id::create("ragnt_top",this);

   if(m_cfg.has_virtual_sequencer==1)
        v_sequencer=bridge_virtual_sequencer::type_id::create("v_sequencer",this);
 endfunction
function void bridge_tb::connect_phase(uvm_phase phase);
 if(m_cfg.has_virtual_sequencer)
    begin
      for(int i=0;i<m_cfg.no_of_rd_agents;i++)
        begin 
   v_sequencer.rd_seqrh[i]=ragnt_top.agnth[i].m_sequencer;
     ragnt_top.agnth[i].monh.monitor_port.connect(sb1.fifo_rdh.analysis_export);
     end
  for(int i=0;i<m_cfg.no_of_wr_agents;i++)
        begin 
   v_sequencer.wr_seqrh[0]=wagnt_top.agnth[0].m_sequencer;
     wagnt_top.agnth[i].monh.monitor_port.connect(sb1.fifo_wrh.analysis_export);
    end
    end
endfunction

