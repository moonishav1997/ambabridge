class bridge_base_test extends uvm_test;
`uvm_component_utils(bridge_base_test)
bridge_tb bridge_envh;
         bridge_env_config m_tb_cfg;
         bridge_wr_agent_config m_wr_cfg[];
         bridge_rd_agent_config m_rd_cfg[];
extern function new(string name = "bridge_base_test" , uvm_component parent);
extern function void build_phase(uvm_phase phase);

extern function void end_of_elaboration_phase(uvm_phase phase);
endclass
        function bridge_base_test::new(string name = "bridge_base_test" , uvm_component parent);
                super.new(name,parent);
        endfunction
    function void bridge_base_test::build_phase(uvm_phase phase);
           m_tb_cfg=bridge_env_config::type_id::create("m_tb_cfg",this);
         m_tb_cfg.m_wr_agent_cfg=new[m_tb_cfg.no_of_wr_agents];
         m_wr_cfg=new[m_tb_cfg.no_of_wr_agents];

         foreach(m_wr_cfg[i])
            begin
           m_wr_cfg[i]=bridge_wr_agent_config::type_id::create($sformatf("m_wr_cfg[%0d]", i),this);

          if(!uvm_config_db#(virtual bridge_if)::get(this,"","vif_0",m_wr_cfg[i].vif))
         `uvm_fatal("fatal","cannot get virtual interface");
            m_wr_cfg[i].is_active=UVM_ACTIVE;
             m_tb_cfg.m_wr_agent_cfg[i] = m_wr_cfg[i];
              end

    m_tb_cfg.m_rd_agent_cfg=new[m_tb_cfg.no_of_rd_agents];
      m_rd_cfg=new[m_tb_cfg.no_of_rd_agents];

        foreach(m_rd_cfg[i])
        begin
              m_rd_cfg[i]=bridge_rd_agent_config::type_id::create($sformatf("m_rd_cfg[%0d]", i),this);

          if(! uvm_config_db#(virtual bridge_if)::get(this,"","vif_0",m_rd_cfg[i].vif))
         `uvm_fatal("fatal","cannot get virtual interface");
            m_rd_cfg[i].is_active=UVM_ACTIVE;
             m_tb_cfg.m_rd_agent_cfg[i] = m_rd_cfg[i];
              end
        uvm_config_db #(bridge_env_config)::set(this,"*","bridge_env_config",m_tb_cfg);
        super.build();
        bridge_envh=bridge_tb::type_id::create("bridge_envh", this);
        endfunction

function void bridge_base_test::end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology;
endfunction
///////////////////////////////////////////////////////////////////////////////////////
 class bridge_seq1_test extends bridge_base_test;

`uvm_component_utils(bridge_seq1_test)

vseq1 bridge_seqh;
extern function new(string name = "bridge_seq1_test" , uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass
        function bridge_seq1_test::new(string name = "bridge_seq1_test" , uvm_component parent);
                super.new(name,parent);
        endfunction


        function void bridge_seq1_test::build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction

        task bridge_seq1_test::run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq1::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
   #100;
         phase.drop_objection(this);
       endtask
///////////////////////////////8bit inc4 test///////////////////
 class bridge_seq2_test extends bridge_base_test;

`uvm_component_utils(bridge_seq2_test)
vseq2 bridge_seqh;
function new(string name="bridge_seq2_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq2::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #500;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////8bit inc8//////////////////////////////////
class bridge_seq3_test extends bridge_base_test;

`uvm_component_utils(bridge_seq3_test)
vseq3 bridge_seqh;
function new(string name="bridge_seq3_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq3::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////8bit inc16////////////////////////////////
class bridge_seq4_test extends bridge_base_test;

`uvm_component_utils(bridge_seq4_test)
vseq4 bridge_seqh;
function new(string name="bridge_seq4_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq4::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////16bit inc4//////////////////////////////
class bridge_seq5_test extends bridge_base_test;

`uvm_component_utils(bridge_seq5_test)
vseq5 bridge_seqh;
function new(string name="bridge_seq5_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq5::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////16bit inc8//////////////////////////////////////
class bridge_seq6_test extends bridge_base_test;

`uvm_component_utils(bridge_seq6_test)
vseq6 bridge_seqh;
function new(string name="bridge_seq6_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq6::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////////16bit inc16////////////////////////////////
class bridge_seq7_test extends bridge_base_test;

`uvm_component_utils(bridge_seq7_test)
vseq7 bridge_seqh;
function new(string name="bridge_seq7_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq7::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////32 bit inc4 ///////////////////
class bridge_seq8_test extends bridge_base_test;

`uvm_component_utils(bridge_seq8_test)
vseq8 bridge_seqh;
function new(string name="bridge_seq8_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq8::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////////32bit inc8//////////////////////////////////
class bridge_seq9_test extends bridge_base_test;
`uvm_component_utils(bridge_seq9_test)
vseq9 bridge_seqh;
function new(string name="bridge_seq9_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq9::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////32bit inc16//////////////////////////////////////
class bridge_seq10_test extends bridge_base_test;
`uvm_component_utils(bridge_seq10_test)
vseq10 bridge_seqh;
function new(string name="bridge_seq10_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq10::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////8bit wrap4//////////////////////////////////
class bridge_seq11_test extends bridge_base_test;
`uvm_component_utils(bridge_seq11_test)
vseq11 bridge_seqh;
function new(string name="bridge_seq11_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq11::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////8bit wrap8/////////////////////////////////
class bridge_seq12_test extends bridge_base_test;
`uvm_component_utils(bridge_seq12_test)
vseq12 bridge_seqh;
function new(string name="bridge_seq12_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq12::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////8bit wrap16//////////////////////////////////
class bridge_seq13_test extends bridge_base_test;
`uvm_component_utils(bridge_seq13_test)
vseq13 bridge_seqh;
function new(string name="bridge_seq13_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq13::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////16bit wrap4///////////////////////////////////
class bridge_seq14_test extends bridge_base_test;
`uvm_component_utils(bridge_seq14_test)
vseq14 bridge_seqh;
function new(string name="bridge_seq14_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq14::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////////16bit wrap8/////////////////////////////////////
class bridge_seq15_test extends bridge_base_test;
`uvm_component_utils(bridge_seq15_test)
vseq15 bridge_seqh;
function new(string name="bridge_seq15_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq15::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////16bit wrap16//////////////////////////////////////
class bridge_seq16_test extends bridge_base_test;
`uvm_component_utils(bridge_seq16_test)
vseq16 bridge_seqh;
function new(string name="bridge_seq16_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq16::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////////32bit wrap4/////////////////////////////////
class bridge_seq17_test extends bridge_base_test;
`uvm_component_utils(bridge_seq17_test)
vseq17 bridge_seqh;
function new(string name="bridge_seq17_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq17::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////////32bit wrap8///////////////////////////////
class bridge_seq18_test extends bridge_base_test;
`uvm_component_utils(bridge_seq18_test)
vseq18 bridge_seqh;
function new(string name="bridge_seq18_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq18::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////////32bit wrap16/////////////////////////
class bridge_seq19_test extends bridge_base_test;
`uvm_component_utils(bridge_seq19_test)
vseq19 bridge_seqh;
function new(string name="bridge_seq19_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq19::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////////uspecified length////////////////////
class bridge_seq20_test extends bridge_base_test;
`uvm_component_utils(bridge_seq20_test)
vseq20 bridge_seqh;
function new(string name="bridge_seq20_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq20::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////////////////////////////////////////read sequence//////////////////////////////////////////////////////////////////////
 class bridge_seq21_test extends bridge_base_test;

`uvm_component_utils(bridge_seq21_test)

vseq21 bridge_seqh;
extern function new(string name = "bridge_seq21_test" , uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass
        function bridge_seq21_test::new(string name = "bridge_seq21_test" , uvm_component parent);
                super.new(name,parent);
        endfunction


        function void bridge_seq21_test::build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction

        task bridge_seq21_test::run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq21::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
   #100;
         phase.drop_objection(this);
       endtask
///////////////////////////////8bit inc4 test///////////////////
 class bridge_seq22_test extends bridge_base_test;

`uvm_component_utils(bridge_seq22_test)
vseq22 bridge_seqh;
function new(string name="bridge_seq22_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq22::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #500;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////8bit inc8//////////////////////////////////
class bridge_seq23_test extends bridge_base_test;

`uvm_component_utils(bridge_seq23_test)
vseq23 bridge_seqh;
function new(string name="bridge_seq23_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq23::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////8bit inc16////////////////////////////////
class bridge_seq24_test extends bridge_base_test;

`uvm_component_utils(bridge_seq24_test)
vseq24 bridge_seqh;
function new(string name="bridge_seq24_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq24::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////16bit inc4//////////////////////////////
class bridge_seq25_test extends bridge_base_test;

`uvm_component_utils(bridge_seq25_test)
vseq25 bridge_seqh;
function new(string name="bridge_seq25_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq25::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////16bit inc8//////////////////////////////////////
class bridge_seq26_test extends bridge_base_test;

`uvm_component_utils(bridge_seq26_test)
vseq26 bridge_seqh;
function new(string name="bridge_seq26_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq26::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////////16bit inc16////////////////////////////////
class bridge_seq27_test extends bridge_base_test;

`uvm_component_utils(bridge_seq27_test)
vseq27 bridge_seqh;
function new(string name="bridge_seq27_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq27::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////32 bit inc4 ///////////////////
class bridge_seq28_test extends bridge_base_test;

`uvm_component_utils(bridge_seq28_test)
vseq28 bridge_seqh;
function new(string name="bridge_seq28_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq28::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////////32bit inc8//////////////////////////////////
class bridge_seq29_test extends bridge_base_test;
`uvm_component_utils(bridge_seq29_test)
vseq29 bridge_seqh;
function new(string name="bridge_seq29_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq29::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////32bit inc16//////////////////////////////////////
class bridge_seq30_test extends bridge_base_test;
`uvm_component_utils(bridge_seq30_test)
vseq30 bridge_seqh;
function new(string name="bridge_seq30_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq30::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////////8bit wrap4//////////////////////////////////
class bridge_seq31_test extends bridge_base_test;
`uvm_component_utils(bridge_seq31_test)
vseq31 bridge_seqh;
function new(string name="bridge_seq31_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq31::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////8bit wrap8/////////////////////////////////
class bridge_seq32_test extends bridge_base_test;
`uvm_component_utils(bridge_seq32_test)
vseq32 bridge_seqh;
function new(string name="bridge_seq32_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq32::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////8bit wrap16//////////////////////////////////
class bridge_seq33_test extends bridge_base_test;
`uvm_component_utils(bridge_seq33_test)
vseq33 bridge_seqh;
function new(string name="bridge_seq33_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq33::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////16bit wrap4///////////////////////////////////
class bridge_seq34_test extends bridge_base_test;
`uvm_component_utils(bridge_seq34_test)
vseq34 bridge_seqh;
function new(string name="bridge_seq34_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq34::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////////16bit wrap8/////////////////////////////////////
class bridge_seq35_test extends bridge_base_test;
`uvm_component_utils(bridge_seq35_test)
vseq35 bridge_seqh;
function new(string name="bridge_seq35_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq35::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
////////////////////16bit wrap16//////////////////////////////////////
class bridge_seq36_test extends bridge_base_test;
`uvm_component_utils(bridge_seq36_test)
vseq36 bridge_seqh;
function new(string name="bridge_seq36_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq36::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////////32bit wrap4/////////////////////////////////
class bridge_seq37_test extends bridge_base_test;
`uvm_component_utils(bridge_seq37_test)
vseq37 bridge_seqh;
function new(string name="bridge_seq17_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq37::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
//////////////////////32bit wrap8///////////////////////////////
class bridge_seq38_test extends bridge_base_test;
`uvm_component_utils(bridge_seq38_test)
vseq38 bridge_seqh;
function new(string name="bridge_seq38_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq38::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
///////////////////////32bit wrap16/////////////////////////
class bridge_seq39_test extends bridge_base_test;
`uvm_component_utils(bridge_seq39_test)
vseq39 bridge_seqh;
function new(string name="bridge_seq39_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq39::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
/////////////////////uspecified length////////////////////
class bridge_seq40_test extends bridge_base_test;
`uvm_component_utils(bridge_seq40_test)
vseq40 bridge_seqh;
function new(string name="bridge_seq40_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq40::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass

//////////////////////back to back/////////////////////////
class bridge_seq41_test extends bridge_base_test;
`uvm_component_utils(bridge_seq41_test)
vseq41 bridge_seqh;
function new(string name="bridge_seq41_test",uvm_component parent);
      super.new(name,parent);
  endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction
        task run_phase(uvm_phase phase);
          phase.raise_objection(this);
          bridge_seqh=vseq41::type_id::create("bridge_seqh");
          bridge_seqh.start(bridge_envh.v_sequencer);
          #300;
         phase.drop_objection(this);
       endtask
endclass
