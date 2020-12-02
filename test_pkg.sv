
package test_pkg;



        import uvm_pkg::*;
//include uvm_macros.sv
        `include "uvm_macros.svh"

`include "wr_xtn.sv"
`include "wr_agent_config.sv"
`include "rd_agent_config.sv"
`include "env_config.sv"
`include "wr_driver.sv"
`include "wr_monitor.sv"
`include "wr_sequencer.sv"
`include "wr_agent.sv"
`include "wr_agent_top.sv"
`include "wr_seqs.sv"

`include "rd_xtn.sv"
`include "rd_monitor.sv"
`include "rd_sequencer.sv"
`include "rd_seqs.sv"
`include "rd_driver.sv"
`include "rd_agent.sv"
`include "rd_agent_top.sv"

`include "virtual_sequencer.sv"
`include "virtual_seqs.sv"
`include "scoreboard.sv"

`include "env.sv"


`include "test.sv"
endpackage
