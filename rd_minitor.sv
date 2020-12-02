class bridge_rd_monitor extends uvm_monitor;
`uvm_component_utils(bridge_rd_monitor)
virtual bridge_if.RD_M vif;
bridge_rd_agent_config m_cfg;
 read_xtn xtn;
uvm_analysis_port#(read_xtn) monitor_port;
extern function new(string name = "bridge_rd_monitor", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task collect_data();
extern task run_phase(uvm_phase phase);

endclass

function bridge_rd_monitor::new(string name = "bridge_rd_monitor", uvm_component parent);
		super.new(name,parent);
		monitor_port = new("monitor_port", this);

endfunction
function void bridge_rd_monitor::build_phase(uvm_phase phase);
super.build_phase(phase);
 if(!uvm_config_db #(bridge_rd_agent_config)::get(this,"","bridge_rd_agent_config",m_cfg))
 `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
    endfunction
function void bridge_rd_monitor::connect_phase(uvm_phase phase);
   vif = m_cfg.vif;
    endfunction
task bridge_rd_monitor::collect_data();
      xtn=read_xtn::type_id::create("xtn");
fork
   begin
   @(vif.rd_mon);

    wait(vif.rd_mon.Pwrite && vif.rd_mon.Penable)
     //xtn.Pwrite=1'b1;

  //  wait(vif.rd_mon.Penable)
  xtn.Pwdata=vif.rd_mon.Pwdata;
  xtn.Paddr=vif.rd_mon.Paddr;
 //  xtn.print();
   end
begin
  @(vif.rd_mon);
   wait(~vif.rd_mon.Pwrite && vif.rd_mon.Penable)
   //xtn.Pwrite=1'b0;
  xtn.Paddr=vif.rd_mon.Paddr;

  wait(vif.rd_mon.Penable)
   xtn.Prdata=vif.rd_mon.Prdata;
          //   xtn.print();

end
join_any 
 
 $display("read_monitor display");
xtn.print();
 monitor_port.write(xtn);
endtask

task bridge_rd_monitor::run_phase(uvm_phase phase);
forever
  collect_data();
endtask

    

