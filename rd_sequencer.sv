class bridge_rd_sequencer extends uvm_sequencer#(read_xtn);
  `uvm_component_utils(bridge_rd_sequencer);
extern function new(string name = "bridge_rd_sequencer",uvm_component parent);
endclass
function bridge_rd_sequencer::new(string name="bridge_rd_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction

