class bridge_vbase_seq extends uvm_sequence #(uvm_sequence_item);
     `uvm_object_utils(bridge_vbase_seq) 
  bridge_wr_sequencer wr_seqrh[];
  bridge_rd_sequencer rd_seqrh[];
 bridge_env_config m_cfg;	
 bridge_virtual_sequencer vsqrh;
extern function new(string name = "bridge_vbase_seq");
extern task body();
endclass
	function bridge_vbase_seq::new(string name ="bridge_vbase_seq");
		super.new(name);
	endfunction
task bridge_vbase_seq::body();

  assert($cast(vsqrh,m_sequencer)) 
 `uvm_info("BODY", "success in $cast of virtual sequencer",UVM_LOW);

 if(!uvm_config_db #(bridge_env_config)::get(null,get_full_name(),"bridge_env_config",m_cfg))
`uvm_fatal("not getting envc config","pls check")
 wr_seqrh = new[m_cfg.no_of_wr_agents];
rd_seqrh = new[m_cfg.no_of_rd_agents]; 
 
 foreach(wr_seqrh[i])
  wr_seqrh[i] = vsqrh.wr_seqrh[i];
    foreach(rd_seqrh[i])
rd_seqrh[i] = vsqrh.rd_seqrh[i];
endtask
///////////////////////////////////////////////////////////////////////////////////////////////////
class vseq1 extends bridge_vbase_seq;
   seq1 seq1_wxtns;
//   rseq1 rseq1_wxtns;
`uvm_object_utils(vseq1)
	extern function new(string name = "vseq1");
	extern task body();
	endclass

function vseq1::new(string name ="vseq1");
		super.new(name);
	endfunction

 task vseq1::body();
   super.body();
   seq1_wxtns=seq1::type_id::create("seq1_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq1_wxtns.start(wr_seqrh[i]);
                 endtask
/////////////////////////8bit inc4////////////////////////////////////////////////////////////
class vseq2 extends bridge_vbase_seq;

  seq2_inc4 seq2_wxtns;
`uvm_object_utils(vseq2)
function new(string name="vseq2");
   super.new(name);
   endfunction
task body();
  super.body();
   seq2_wxtns=seq2_inc4::type_id::create("seq2_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq2_wxtns.start(wr_seqrh[i]);

endtask
endclass
///////////////////////8bit inc8/////////////////////////////////////////////////////////////
class vseq3 extends bridge_vbase_seq;

  seq3_inc8 seq3_wxtns;
`uvm_object_utils(vseq3)
function new(string name="vseq3");
   super.new(name);
   endfunction
task body();
  super.body();
   seq3_wxtns=seq3_inc8::type_id::create("seq3_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq3_wxtns.start(wr_seqrh[i]);

endtask
endclass
////////////////////////8bit inc16////////////////////////////////////////////////////////
class vseq4 extends bridge_vbase_seq;

  seq4_inc16 seq4_wxtns;
`uvm_object_utils(vseq4)
function new(string name="vseq4");
   super.new(name);
   endfunction
task body();
  super.body();
   seq4_wxtns=seq4_inc16::type_id::create("seq4_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq4_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////16bit inc4//////////////////////////////////////////////////////////
class vseq5 extends bridge_vbase_seq;

  seq5_inc4 seq5_wxtns;
 // seq6_inc8 seq6_wxtns;
//  seq7_inc16 seq7_wxtns;
`uvm_object_utils(vseq5)
function new(string name="vseq5");
   super.new(name);
   endfunction
task body();
  super.body();
   seq5_wxtns=seq5_inc4::type_id::create("seq5_wxtns");
  // seq6_wxtns=seq6_inc8::type_id::create("seq6_wxtns");
   // seq7_wxtns=seq7_inc16::type_id::create("seq7_wxtns");

                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                begin
                 seq5_wxtns.start(wr_seqrh[i]);
                 
              //   seq6_wxtns.start(wr_seqrh[i]);
                 
                 // seq7_wxtns.start(wr_seqrh[i]);
                  end


endtask
endclass
//////////////////////16bit inc8///////////////////////////////////////////////////////////
class vseq6 extends bridge_vbase_seq;

  seq6_inc8 seq6_wxtns;
`uvm_object_utils(vseq6)
function new(string name="vseq6");
   super.new(name);
   endfunction
task body();
  super.body();
   seq6_wxtns=seq6_inc8::type_id::create("seq6_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq6_wxtns.start(wr_seqrh[i]);

endtask
endclass
////////////////////////16bit inc16///////////////////////////////////////////////////////////
class vseq7 extends bridge_vbase_seq;

  seq7_inc16 seq7_wxtns;
`uvm_object_utils(vseq7)
function new(string name="vseq7");
   super.new(name);
   endfunction
task body();
  super.body();
   seq7_wxtns=seq7_inc16::type_id::create("seq7_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq7_wxtns.start(wr_seqrh[i]);

endtask
endclass
///////////////////////////32bit inc4inc16inc32/////////////////////////////////////
class vseq8 extends bridge_vbase_seq;

  seq8_inc4 seq8_wxtns;
`uvm_object_utils(vseq8)
function new(string name="vseq8");
   super.new(name);
   endfunction
task body();
  super.body();
   seq8_wxtns=seq8_inc4::type_id::create("seq8_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq8_wxtns.start(wr_seqrh[i]);

endtask
endclass


////////////////////////////////////32bit inc8////////////////////////////
class vseq9 extends bridge_vbase_seq;

  seq8_inc8 seq9_wxtns;
`uvm_object_utils(vseq9)
function new(string name="vseq9");
   super.new(name);
   endfunction
task body();
  super.body();
   seq9_wxtns=seq8_inc8::type_id::create("seq9_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq9_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////32 bit inc 16/////////////////////////////////////////
class vseq10 extends bridge_vbase_seq;

  seq8_inc16 seq10_wxtns;
`uvm_object_utils(vseq10)
function new(string name="vseq10");
   super.new(name);
   endfunction
task body();
  super.body();
   seq10_wxtns=seq8_inc16::type_id::create("seq10_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq10_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////8bit wrap4/////////////////////////////////////////////
class vseq11 extends bridge_vbase_seq;

  seq_wrap4 seq11_wxtns;
`uvm_object_utils(vseq11)
function new(string name="vseq11");
   super.new(name);
   endfunction
task body();
  super.body();
   seq11_wxtns=seq_wrap4::type_id::create("seq11_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq11_wxtns.start(wr_seqrh[i]);

endtask
endclass

///////////////////////8bit wrap8//////////////////////////
class vseq12 extends bridge_vbase_seq;

  seq_wrap8 seq12_wxtns;
`uvm_object_utils(vseq12)
function new(string name="vseq12");
   super.new(name);
   endfunction
task body();
  super.body();
   seq12_wxtns=seq_wrap8::type_id::create("seq12_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq12_wxtns.start(wr_seqrh[i]);

endtask
endclass
/////////////////////////8bit wrap16////////////////////////////////////
class vseq13 extends bridge_vbase_seq;

  seq_wrap16 seq13_wxtns;
`uvm_object_utils(vseq13)
function new(string name="vseq13");
   super.new(name);
   endfunction
task body();
  super.body();
   seq13_wxtns=seq_wrap16::type_id::create("seq13_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq13_wxtns.start(wr_seqrh[i]);

endtask
endclass
/////////////////////16bit wrap4//////////////////////////////////////
class vseq14 extends bridge_vbase_seq;

  seq1_wrap4 seq14_wxtns;
`uvm_object_utils(vseq14)
function new(string name="vseq14");
   super.new(name);
   endfunction
task body();
  super.body();
   seq14_wxtns=seq1_wrap4::type_id::create("seq14_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq14_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////16bit wrap8////////////////////////////////////////
class vseq15 extends bridge_vbase_seq;

  seq1_wrap8 seq15_wxtns;
`uvm_object_utils(vseq15)
function new(string name="vseq15");
   super.new(name);
   endfunction
task body();
  super.body();
   seq15_wxtns=seq1_wrap8::type_id::create("seq15_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq15_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////16bit wrap16///////////////////////////
class vseq16 extends bridge_vbase_seq;

  seq1_wrap16 seq16_wxtns;
`uvm_object_utils(vseq16)
function new(string name="vseq16");
   super.new(name);
   endfunction
task body();
  super.body();
   seq16_wxtns=seq1_wrap16::type_id::create("seq16_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq16_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////32bit wrap4////////////////////////
class vseq17 extends bridge_vbase_seq;

  seq2_wrap4 seq17_wxtns;
`uvm_object_utils(vseq17)
function new(string name="vseq17");
   super.new(name);
   endfunction
task body();
  super.body();
   seq17_wxtns=seq2_wrap4::type_id::create("seq17_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq17_wxtns.start(wr_seqrh[i]);

endtask
endclass
////////////////32 bit wrap8/////////////////////////
class vseq18 extends bridge_vbase_seq;

  seq2_wrap8 seq18_wxtns;
`uvm_object_utils(vseq18)
function new(string name="vseq18");
   super.new(name);
   endfunction
task body();
  super.body();
   seq18_wxtns=seq2_wrap8::type_id::create("seq18_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq18_wxtns.start(wr_seqrh[i]);

endtask
endclass
/////////////32 bit wrap 16/////////////////////////
class vseq19 extends bridge_vbase_seq;

  seq2_wrap16 seq19_wxtns;
`uvm_object_utils(vseq19)
function new(string name="vseq19");
   super.new(name);
   endfunction
task body();
  super.body();
   seq19_wxtns=seq2_wrap16::type_id::create("seq19_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq19_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////unspecified length/////////////
class vseq20 extends bridge_vbase_seq;

  seq_unsp seq20_wxtns;
`uvm_object_utils(vseq20)
function new(string name="vseq20");
   super.new(name);
   endfunction
task body();
  super.body();
   seq20_wxtns=seq_unsp::type_id::create("seq20_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq20_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////////////////////////////////////read sequence//////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////
class vseq21 extends bridge_vbase_seq;
   rseq1 seq1_wxtns;
//   rseq1 rseq1_wxtns;
`uvm_object_utils(vseq21)
	extern function new(string name = "vseq21");
	extern task body();
	endclass

function vseq21::new(string name ="vseq21");
		super.new(name);
	endfunction

 task vseq21::body();
   super.body();
   seq1_wxtns=rseq1::type_id::create("seq1_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq1_wxtns.start(wr_seqrh[i]);
                 endtask
/////////////////////////8bit inc4////////////////////////////////////////////////////////////
class vseq22 extends bridge_vbase_seq;

  rseq2_inc4 seq2_wxtns;
`uvm_object_utils(vseq22)
function new(string name="vseq22");
   super.new(name);
   endfunction
task body();
  super.body();
   seq2_wxtns=rseq2_inc4::type_id::create("seq2_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq2_wxtns.start(wr_seqrh[i]);

endtask
endclass
///////////////////////8bit inc8/////////////////////////////////////////////////////////////
class vseq23 extends bridge_vbase_seq;

  rseq3_inc8 seq3_wxtns;
`uvm_object_utils(vseq23)
function new(string name="vseq23");
   super.new(name);
   endfunction
task body();
  super.body();
   seq3_wxtns=rseq3_inc8::type_id::create("seq3_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq3_wxtns.start(wr_seqrh[i]);

endtask
endclass
////////////////////////8bit inc16////////////////////////////////////////////////////////
class vseq24 extends bridge_vbase_seq;

  rseq4_inc16 seq4_wxtns;
`uvm_object_utils(vseq24)
function new(string name="vseq24");
   super.new(name);
   endfunction
task body();
  super.body();
   seq4_wxtns=rseq4_inc16::type_id::create("seq4_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq4_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////16bit inc4//////////////////////////////////////////////////////////
class vseq25 extends bridge_vbase_seq;

  rseq5_inc4 seq5_wxtns;
 // seq6_inc8 seq6_wxtns;
//  seq7_inc16 seq7_wxtns;
`uvm_object_utils(vseq25)
function new(string name="vseq25");
   super.new(name);
   endfunction
task body();
  super.body();
   seq5_wxtns=rseq5_inc4::type_id::create("seq5_wxtns");
  // seq6_wxtns=seq6_inc8::type_id::create("seq6_wxtns");
   // seq7_wxtns=seq7_inc16::type_id::create("seq7_wxtns");

                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                begin
                 seq5_wxtns.start(wr_seqrh[i]);
                 
              //   seq6_wxtns.start(wr_seqrh[i]);
                 
                 // seq7_wxtns.start(wr_seqrh[i]);
                  end


endtask
endclass
//////////////////////16bit inc8///////////////////////////////////////////////////////////
class vseq26 extends bridge_vbase_seq;

  rseq6_inc8 seq6_wxtns;
`uvm_object_utils(vseq26)
function new(string name="vseq26");
   super.new(name);
   endfunction
task body();
  super.body();
   seq6_wxtns=rseq6_inc8::type_id::create("seq6_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq6_wxtns.start(wr_seqrh[i]);

endtask
endclass
////////////////////////16bit inc16///////////////////////////////////////////////////////////
class vseq27 extends bridge_vbase_seq;

  rseq7_inc16 seq7_wxtns;
`uvm_object_utils(vseq27)
function new(string name="vseq27");
   super.new(name);
   endfunction
task body();
  super.body();
   seq7_wxtns=rseq7_inc16::type_id::create("seq7_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq7_wxtns.start(wr_seqrh[i]);

endtask
endclass
///////////////////////////32bit inc4inc16inc32/////////////////////////////////////
class vseq28 extends bridge_vbase_seq;

  rseq8_inc4 seq8_wxtns;
`uvm_object_utils(vseq28)
function new(string name="vseq28");
   super.new(name);
   endfunction
task body();
  super.body();
   seq8_wxtns=rseq8_inc4::type_id::create("seq8_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq8_wxtns.start(wr_seqrh[i]);

endtask
endclass


////////////////////////////////////32bit inc8////////////////////////////
class vseq29 extends bridge_vbase_seq;

  rseq8_inc8 seq9_wxtns;
`uvm_object_utils(vseq29)
function new(string name="vseq29");
   super.new(name);
   endfunction
task body();
  super.body();
   seq9_wxtns=rseq8_inc8::type_id::create("seq9_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq9_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////32 bit inc 16/////////////////////////////////////////
class vseq30 extends bridge_vbase_seq;

  rseq8_inc16 seq10_wxtns;
`uvm_object_utils(vseq30)
function new(string name="vseq30");
   super.new(name);
   endfunction
task body();
  super.body();
   seq10_wxtns=rseq8_inc16::type_id::create("seq10_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq10_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////8bit wrap4/////////////////////////////////////////////
class vseq31 extends bridge_vbase_seq;

  rseq_wrap4 seq11_wxtns;
`uvm_object_utils(vseq31)
function new(string name="vseq31");
   super.new(name);
   endfunction
task body();
  super.body();
   seq11_wxtns=rseq_wrap4::type_id::create("seq11_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq11_wxtns.start(wr_seqrh[i]);

endtask
endclass

///////////////////////8bit wrap8//////////////////////////
class vseq32 extends bridge_vbase_seq;

  rseq_wrap8 seq12_wxtns;
`uvm_object_utils(vseq32)
function new(string name="vseq32");
   super.new(name);
   endfunction
task body();
  super.body();
   seq12_wxtns=rseq_wrap8::type_id::create("seq12_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq12_wxtns.start(wr_seqrh[i]);

endtask
endclass
/////////////////////////8bit wrap16////////////////////////////////////
class vseq33 extends bridge_vbase_seq;

  rseq_wrap16 seq13_wxtns;
`uvm_object_utils(vseq33)
function new(string name="vseq33");
   super.new(name);
   endfunction
task body();
  super.body();
   seq13_wxtns=rseq_wrap16::type_id::create("seq13_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq13_wxtns.start(wr_seqrh[i]);

endtask
endclass
/////////////////////16bit wrap4//////////////////////////////////////
class vseq34 extends bridge_vbase_seq;

  rseq1_wrap4 seq14_wxtns;
`uvm_object_utils(vseq34)
function new(string name="vseq34");
   super.new(name);
   endfunction
task body();
  super.body();
   seq14_wxtns=rseq1_wrap4::type_id::create("seq14_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq14_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////16bit wrap8////////////////////////////////////////
class vseq35 extends bridge_vbase_seq;

  rseq1_wrap8 seq15_wxtns;
`uvm_object_utils(vseq35)
function new(string name="vseq35");
   super.new(name);
   endfunction
task body();
  super.body();
   seq15_wxtns=rseq1_wrap8::type_id::create("seq15_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq15_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////16bit wrap16///////////////////////////
class vseq36 extends bridge_vbase_seq;

  rseq1_wrap16 seq16_wxtns;
`uvm_object_utils(vseq36)
function new(string name="vseq36");
   super.new(name);
   endfunction
task body();
  super.body();
   seq16_wxtns=rseq1_wrap16::type_id::create("seq16_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq16_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////32bit wrap4////////////////////////
class vseq37 extends bridge_vbase_seq;

  rseq2_wrap4 seq17_wxtns;
`uvm_object_utils(vseq37)
function new(string name="vseq37");
   super.new(name);
   endfunction
task body();
  super.body();
   seq17_wxtns=rseq2_wrap4::type_id::create("seq17_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq17_wxtns.start(wr_seqrh[i]);

endtask
endclass
////////////////32 bit wrap8/////////////////////////
class vseq38 extends bridge_vbase_seq;

  rseq2_wrap8 seq18_wxtns;
`uvm_object_utils(vseq38)
function new(string name="vseq38");
   super.new(name);
   endfunction
task body();
  super.body();
   seq18_wxtns=rseq2_wrap8::type_id::create("seq18_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq18_wxtns.start(wr_seqrh[i]);

endtask
endclass
/////////////32 bit wrap 16/////////////////////////
class vseq39 extends bridge_vbase_seq;

  rseq2_wrap16 seq19_wxtns;
`uvm_object_utils(vseq39)
function new(string name="vseq39");
   super.new(name);
   endfunction
task body();
  super.body();
   seq19_wxtns=rseq2_wrap16::type_id::create("seq19_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq19_wxtns.start(wr_seqrh[i]);

endtask
endclass
//////////////////////unspecified length/////////////
class vseq40 extends bridge_vbase_seq;

  rseq_unsp seq20_wxtns;
`uvm_object_utils(vseq40)
function new(string name="vseq40");
   super.new(name);
   endfunction
task body();
  super.body();
   seq20_wxtns=rseq_unsp::type_id::create("seq20_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq20_wxtns.start(wr_seqrh[i]);

endtask
endclass







////////////////////////////////////back to back/////////////////////////
class vseq41 extends bridge_vbase_seq;

  back_seq seq20_wxtns;
`uvm_object_utils(vseq41)
function new(string name="vseq41");
   super.new(name);
   endfunction
task body();
  super.body();
   seq20_wxtns=back_seq::type_id::create("seq20_wxtns");
                 for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
                 seq20_wxtns.start(wr_seqrh[i]);

endtask
endclass


