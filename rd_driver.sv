class bridge_rd_driver extends uvm_driver#(read_xtn);
`uvm_component_utils(bridge_rd_driver)
   virtual bridge_if.RD_D vif;
  bridge_rd_agent_config m_cfg;
   read_xtn xtn;
  	extern function new(string name ="bridge_rd_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
        extern task send_to_dut();
        

endclass


        	function bridge_rd_driver::new(string name ="bridge_rd_driver",uvm_component parent);
		super.new(name,parent);
	        endfunction

	function void bridge_rd_driver::build_phase(uvm_phase phase);
          super.build_phase(phase);
        if(!uvm_config_db #(bridge_rd_agent_config)::get(this,"","bridge_rd_agent_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
        endfunction
    
	function void bridge_rd_driver::connect_phase(uvm_phase phase);
          vif = m_cfg.vif;
        endfunction
task bridge_rd_driver::send_to_dut();
         wait(vif.rd_drv.Pselx && ~vif.rd_drv.Pwrite)
           vif.rd_drv.Prdata<={$random};
         wait(vif.rd_drv.Penable)
             @(vif.rd_drv);
 endtask

task bridge_rd_driver::run_phase(uvm_phase phase);
  forever
       send_to_dut;
 endtask

