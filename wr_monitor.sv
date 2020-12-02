class bridge_wr_monitor extends uvm_monitor;
`uvm_component_utils(bridge_wr_monitor)
virtual bridge_if.WR_M vif;
bridge_wr_agent_config m_cfg;
write_xtn xtn;
uvm_analysis_port#(write_xtn) monitor_port;
extern function new(string name = "bridge_wr_monitor", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task collect_data();
extern task run_phase(uvm_phase phase);
endclass
   function bridge_wr_monitor::new(string name = "bridge_wr_monitor", uvm_component parent);
                super.new(name,parent);
                monitor_port = new("monitor_port", this);
	
endfunction

function void bridge_wr_monitor::build_phase(uvm_phase phase);
super.build_phase(phase);
 if(!uvm_config_db #(bridge_wr_agent_config)::get(this,"","bridge_wr_agent_config",m_cfg))
 `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
    endfunction
function void bridge_wr_monitor::connect_phase(uvm_phase phase);
   vif = m_cfg.vif;
    endfunction
task bridge_wr_monitor::collect_data();
      xtn=write_xtn::type_id::create("xtn");
        xtn.Htrans=vif.wr_mon.Htrans;


    wait(vif.wr_mon.Htrans==2'd2||vif.wr_mon.Htrans==3)
          xtn.Haddr=vif.wr_mon.Haddr;
               xtn.Hwrite=vif.wr_mon.Hwrite;
               xtn.Hsize=vif.wr_mon.Hsize;
                        @(vif.wr_mon);
            wait(vif.wr_mon.Hreadyout)

                            xtn.Hwdata=vif.wr_mon.Hwdata;
                             xtn.Hrdata=vif.wr_mon.Hrdata;

             $display("write monitor display");
 xtn.print();
 monitor_port.write(xtn);

endtask

task bridge_wr_monitor::run_phase(uvm_phase phase);
 forever
   begin
   collect_data();


end
endtask
