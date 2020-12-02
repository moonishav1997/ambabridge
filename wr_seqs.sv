class bridge_wbase_seq extends uvm_sequence#(write_xtn);
    `uvm_object_utils(bridge_wbase_seq)
extern function new(string name ="bridge_wbase_seq");
 //extern task body();
endclass
        function bridge_wbase_seq::new(string name ="bridge_wbase_seq");
                super.new(name);
                endfunction
///////////////////////////////single 8bit//////////////////////////////////////
class seq1 extends bridge_wbase_seq;
    `uvm_object_utils(seq1)
  function new(string name ="seq1");
        super.new(name);
        endfunction
task body();
  begin
           req=write_xtn::type_id::create("req");
           start_item(req);
           assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==0;Hwrite==1;         
                                       })
          `uvm_info("seq1",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
          finish_item(req);

           end
        endtask
endclass
////////////////////////////inc4 8bit/////////////////////////////////////////////////
class seq2_inc4 extends bridge_wbase_seq;
`uvm_object_utils(seq2_inc4)
 int haddr,hwrite;
 function new(string name ="seq2_inc4");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==3;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;
             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==3;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);
      end
endtask
endclass
////////////////////////////inc8  8bit////////////////////////////////////              
class seq3_inc8 extends bridge_wbase_seq;
`uvm_object_utils(seq3_inc8)
 int haddr;
 function new(string name ="seq3_inc8");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==5;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==5;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);
      end
endtask
endclass
//////////////////////////inc16 8bit/////////////////////////////////////////////////
class seq4_inc16 extends bridge_wbase_seq;
`uvm_object_utils(seq4_inc16)
 int haddr;
 function new(string name ="seq4_inc16");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==7;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==7;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);
      end
endtask
endclass
////////////////////////inc4 16 bit/////////////////////////////////////////////
class seq5_inc4 extends bridge_wbase_seq;
`uvm_object_utils(seq5_inc4)
 int haddr;
 function new(string name ="seq5_inc4");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==3;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==1;
                Hburst==3;
                Haddr==haddr+2'd2;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);
    end
endtask
endclass
/////////////////////////////inc8 16bit////////////////////////////
class seq6_inc8 extends bridge_wbase_seq;
`uvm_object_utils(seq6_inc8)
 int haddr;
 function new(string name ="seq6_inc8");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==5;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==1;
                Hburst==5;
                Haddr==haddr+2'd2;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);
      end
endtask
endclass
/////////////////////////////////////inc16 16bit////////////////////////////////////
class seq7_inc16 extends bridge_wbase_seq;
`uvm_object_utils(seq7_inc16)
 int haddr;
 function new(string name ="seq7_inc16");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==7;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==1;
                Hburst==7;
                Haddr==haddr+2'd2;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);
      end
endtask
endclass
///////////////////////////32bit inc4 inc16 inc 32/////////////////////

class seq8_inc4 extends bridge_wbase_seq;
`uvm_object_utils(seq8_inc4)
 int haddr;
//event ev;
 function new(string name ="seq8_inc4");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==3;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);

               haddr=req.Haddr;


             for(int i=0;i<3;i++)
               begin
                start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==1;
                Hburst==3;
                Haddr==haddr+4'd4;});

                haddr=req.Haddr;
               finish_item(req);
               end




           start_item(req);
             assert(req.randomize with {Htrans==0;});
            finish_item(req);
          end
endtask
endclass


        // ->ev;
          ///////////////////32 bit  inc 8////////////////////////

class seq8_inc8 extends bridge_wbase_seq;
`uvm_object_utils(seq8_inc8)
 int haddr;
//event ev;
 function new(string name ="seq8_inc8");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==5;Hwrite==1;})
                `uvm_info("seq_inc8",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;




             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==1;
                Hburst==5;
                Haddr==haddr+4'd4;});

                haddr=req.Haddr;
               finish_item(req);

               end



           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
           end
endtask
endclass



            /////////////////////32 bit inc 16////////////////////////
class seq8_inc16 extends bridge_wbase_seq;
`uvm_object_utils(seq8_inc16)
 int haddr;
//event ev;
 function new(string name ="seq8_inc16");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");


            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==7;Hwrite==1;})
                `uvm_info("seq_inc16",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;


             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==1;
                Hburst==7;
                Haddr==haddr+4'd4;});

                haddr=req.Haddr;
               finish_item(req);

               end


           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);




    end
endtask
endclass

////////////////////////////////////8bit wrap4////////////////////////////////////
class seq_wrap4 extends bridge_wbase_seq;
`uvm_object_utils(seq_wrap4)
int haddr;
 function new(string name ="seq_wrap4");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
          /////////////////wrap4/////////////
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==2;Hwrite==1;})
                `uvm_info("seq_wrap",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==2;
                Haddr=={haddr[31:2],haddr[1:0]+1'b1};});
                haddr=req.Haddr;
               finish_item(req);
                 end
             start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);

 end
endtask
endclass

 /////////////////////////////////////////8bit  wrap 8////////////////////////

class seq_wrap8 extends bridge_wbase_seq;
`uvm_object_utils(seq_wrap8)
int haddr;
 function new(string name ="seq_wrap8");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==4;Hwrite==1;})
                `uvm_info("seq_wrap8",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==4;
                Haddr=={haddr[31:3],haddr[2:0]+1'b1};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
          // $diplay("display of inc8");
         //  #500;
 end
endtask
endclass

/////////////////////////////////////////8bit wrap 16////////////////////////
class seq_wrap16 extends bridge_wbase_seq;
`uvm_object_utils(seq_wrap16)
int haddr;
 function new(string name ="seq_wrap16");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==6;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==6;
                Haddr=={haddr[31:4],haddr[3:0]+1'b1};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);

  end
endtask
  endclass                                                                              
/////////////////////////////////////////16bit wrap4////////////////////////////////////////////
class seq1_wrap4 extends bridge_wbase_seq;
`uvm_object_utils(seq1_wrap4)
int haddr;
 function new(string name ="seq1_wrap4");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
          /////////////////wrap4/////////////
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==2;Hwrite==1;})
                `uvm_info("seq1_wrap4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==1;
                Hburst==2;
                Haddr=={haddr[31:3],haddr[2:1]+1'b1,haddr[0]};});
                haddr=req.Haddr;
               finish_item(req);
                 end
             start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
  end
endtask
  endclass
 ///////////////////16bit wrap 8///////////////////////////////////////////

class seq1_wrap8 extends bridge_wbase_seq;
`uvm_object_utils(seq1_wrap8)
int haddr;
 function new(string name ="seq1_wrap8");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==4;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==1;
                Hburst==4;
                Haddr=={haddr[31:4],haddr[3:1]+1'b1,haddr[0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
          // $diplay("display of inc8");
           //#500;
  end
endtask
  endclass
 /////////////////////16 bit wrap 16///////////////////////////////////////
class seq1_wrap16 extends bridge_wbase_seq;
`uvm_object_utils(seq1_wrap16)
int haddr;
 function new(string name ="seq1_wrap16");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==6;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==1;
                Hburst==6;
                Haddr=={haddr[31:5],haddr[4:1]+1'b1,haddr[0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);

  end
endtask
  endclass
/////////////////////////////////////////32bit wrap4///////////////////

class seq2_wrap4 extends bridge_wbase_seq;
`uvm_object_utils(seq2_wrap4)
int haddr;
 function new(string name ="seq2_wrap4");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
          /////////////////wrap4/////////////
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==2;Hwrite==1;})
                `uvm_info("seq_wrap",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==1;
                Hburst==2;
                Haddr=={haddr[31:4],haddr[3:2]+1'b1,haddr[1:0]};});
                haddr=req.Haddr;
               finish_item(req);
                 end
             start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
 end
endtask
  endclass
/////////////////////////////32 bit   wrap 8////////////////////////
class seq2_wrap8 extends bridge_wbase_seq;
`uvm_object_utils(seq2_wrap8)
int haddr;
 function new(string name ="seq2_wrap8");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==4;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==1;
                Hburst==4;
                Haddr=={haddr[31:5],haddr[4:2]+1'b1,haddr[1:0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
          // $diplay("display of inc8");
           #500;
 end
endtask
  endclass
 ///////////////////////////////32 bit  wrap 16////////////////////////
class seq2_wrap16 extends bridge_wbase_seq;
`uvm_object_utils(seq2_wrap16)
int haddr;
 function new(string name ="seq2_wrap16");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==6;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==1;
                Hburst==6;
                Haddr=={haddr[31:6],haddr[5:2]+1'b1,haddr[1:0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);

  end
endtask
  endclass

/////////////////////////////////////Unspecified length//////////////////////////


class seq_unsp extends bridge_wbase_seq;
`uvm_object_utils(seq_unsp)
bit [2:0]hsize;
int haddr1;
 function new(string name ="seq_unsp");
        super.new(name);
        endfunction
task body();
        req=write_xtn::type_id::create("req");

  start_item(req);

               assert(req.randomize() with {Htrans==2;Hwrite==1;Hburst==1;Haddr=='h8400_0000;});

  finish_item(req);
      hsize=req.Hsize;
      haddr1=req.Haddr;
  case(hsize)
       3'd0:begin
             for(int i=0;i<1022;i++)
              begin
               start_item(req);
                assert(req.randomize() with {Hwrite==1;Haddr==(haddr1+1'b1);Htrans==3;Hburst==1;Hsize==hsize;});
              haddr1=req.Haddr;

               finish_item(req);
              end
                start_item(req);
                assert(req.randomize() with {Htrans==0;});
                finish_item(req);
              end
       3'd1:begin
              for(int i=0;i<510;i++)

              begin
               start_item(req);
                assert(req.randomize() with {Hwrite==1;Haddr==(haddr1+2'd2);Htrans==3;Hburst==1;Hsize==hsize;});
                haddr1=req.Haddr;
               finish_item(req);
               end
                start_item(req);
                assert(req.randomize() with {Htrans==0;});
                finish_item(req);
              end
         3'd2:begin
              for(int i=0;i<254;i++)

              begin
               start_item(req);
                assert(req.randomize() with {Hwrite==1;Haddr==(haddr1+3'd4);Htrans==3;Hburst==1;Hsize==hsize;});
               haddr1=req.Haddr;
               finish_item(req);
              end
                start_item(req);
                assert(req.randomize() with {Htrans==0;});
                finish_item(req);
              end
endcase
endtask
endclass
//////////////////////////////////////////////////////read sequence//////////////////////////////////////////////////////////////////////

///////////////////////////////single 8bit//////////////////////////////////////
class rseq1 extends bridge_wbase_seq;
    `uvm_object_utils(rseq1)
  function new(string name ="rseq1");
        super.new(name);
        endfunction
task body();
  begin
           req=write_xtn::type_id::create("req");
           start_item(req);
           assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==0;Hwrite==0;         
                                       })
          `uvm_info("seq1",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
          finish_item(req);

           end
        endtask
endclass
////////////////////////////inc4 8bit/////////////////////////////////////////////////
class rseq2_inc4 extends bridge_wbase_seq;
`uvm_object_utils(rseq2_inc4)
 int haddr,hwrite;
 function new(string name ="rseq2_inc4");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==3;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;
             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==0;
                Hburst==3;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==0;});
             finish_item(req);
      end
endtask
endclass
////////////////////////////inc8  8bit////////////////////////////////////              
class rseq3_inc8 extends bridge_wbase_seq;
`uvm_object_utils(rseq3_inc8)
 int haddr;
 function new(string name ="rseq3_inc8");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==5;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==0;
                Hburst==5;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==0;});
             finish_item(req);
      end
endtask
endclass
//////////////////////////inc16 8bit/////////////////////////////////////////////////
class rseq4_inc16 extends bridge_wbase_seq;
`uvm_object_utils(rseq4_inc16)
 int haddr;
 function new(string name ="rseq4_inc16");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==7;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==0;
                Hburst==7;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==0;});
             finish_item(req);
      end
endtask
endclass
////////////////////////inc4 16 bit/////////////////////////////////////////////
class rseq5_inc4 extends bridge_wbase_seq;
`uvm_object_utils(rseq5_inc4)
 int haddr;
 function new(string name ="rseq5_inc4");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==3;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==0;
                Hburst==3;
                Haddr==haddr+2'd2;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==0;});
             finish_item(req);
    end
endtask
endclass
/////////////////////////////inc8 16bit////////////////////////////
class rseq6_inc8 extends bridge_wbase_seq;
`uvm_object_utils(rseq6_inc8)
 int haddr;
 function new(string name ="rseq6_inc8");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==5;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==0;
                Hburst==5;
                Haddr==haddr+2'd2;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==0;});
             finish_item(req);
      end
endtask
endclass
/////////////////////////////////////inc16 16bit////////////////////////////////////
class rseq7_inc16 extends bridge_wbase_seq;
`uvm_object_utils(rseq7_inc16)
 int haddr;
 function new(string name ="rseq7_inc16");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==7;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==0;
                Hburst==7;
                Haddr==haddr+2'd2;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==0;});
             finish_item(req);
      end
endtask
endclass
///////////////////////////32bit inc4 inc16 inc 32/////////////////////

class rseq8_inc4 extends bridge_wbase_seq;
`uvm_object_utils(rseq8_inc4)
 int haddr;
//event ev;
 function new(string name ="rseq8_inc4");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==3;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);

               haddr=req.Haddr;


             for(int i=0;i<3;i++)
               begin
                start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==0;
                Hburst==3;
                Haddr==haddr+4'd4;});

                haddr=req.Haddr;
               finish_item(req);
               end




           start_item(req);
             assert(req.randomize with {Htrans==0;});
            finish_item(req);
          end
endtask
endclass


        // ->ev;
          ///////////////////32 bit  inc 8////////////////////////

class rseq8_inc8 extends bridge_wbase_seq;
`uvm_object_utils(rseq8_inc8)
 int haddr;
//event ev;
 function new(string name ="rseq8_inc8");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==5;Hwrite==0;})
                `uvm_info("seq_inc8",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;




             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==0;
                Hburst==5;
                Haddr==haddr+4'd4;});

                haddr=req.Haddr;
               finish_item(req);

               end



           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
           end
endtask
endclass



            /////////////////////32 bit inc 16////////////////////////
class rseq8_inc16 extends bridge_wbase_seq;
`uvm_object_utils(rseq8_inc16)
 int haddr;
//event ev;
 function new(string name ="rseq8_inc16");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");


            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==7;Hwrite==0;})
                `uvm_info("seq_inc16",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;


             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==0;
                Hburst==7;
                Haddr==haddr+4'd4;});

                haddr=req.Haddr;
               finish_item(req);

               end


           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);




    end
endtask
endclass

////////////////////////////////////8bit wrap4////////////////////////////////////
class rseq_wrap4 extends bridge_wbase_seq;
`uvm_object_utils(rseq_wrap4)
int haddr;
 function new(string name ="rseq_wrap4");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
          /////////////////wrap4/////////////
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==2;Hwrite==0;})
                `uvm_info("seq_wrap",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==0;
                Hburst==2;
                Haddr=={haddr[31:2],haddr[1:0]+1'b1};});
                haddr=req.Haddr;
               finish_item(req);
                 end
             start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);

 end
endtask
endclass

 /////////////////////////////////////////8bit  wrap 8////////////////////////

class rseq_wrap8 extends bridge_wbase_seq;
`uvm_object_utils(rseq_wrap8)
int haddr;
 function new(string name ="rseq_wrap8");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==4;Hwrite==0;})
                `uvm_info("seq_wrap8",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==0;
                Hburst==4;
                Haddr=={haddr[31:3],haddr[2:0]+1'b1};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
          // $diplay("display of inc8");
         //  #500;
 end
endtask
endclass

/////////////////////////////////////////8bit wrap 16////////////////////////
class rseq_wrap16 extends bridge_wbase_seq;
`uvm_object_utils(rseq_wrap16)
int haddr;
 function new(string name ="rseq_wrap16");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==6;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==0;
                Hburst==6;
                Haddr=={haddr[31:4],haddr[3:0]+1'b1};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);

  end
endtask
  endclass                                                                              
/////////////////////////////////////////16bit wrap4////////////////////////////////////////////
class rseq1_wrap4 extends bridge_wbase_seq;
`uvm_object_utils(rseq1_wrap4)
int haddr;
 function new(string name ="rseq1_wrap4");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
          /////////////////wrap4/////////////
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==2;Hwrite==0;})
                `uvm_info("seq1_wrap4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==0;
                Hburst==2;
                Haddr=={haddr[31:3],haddr[2:1]+1'b1,haddr[0]};});
                haddr=req.Haddr;
               finish_item(req);
                 end
             start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
  end
endtask
  endclass
 ///////////////////16bit wrap 8///////////////////////////////////////////

class rseq1_wrap8 extends bridge_wbase_seq;
`uvm_object_utils(rseq1_wrap8)
int haddr;
 function new(string name ="rseq1_wrap8");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==4;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==0;
                Hburst==4;
                Haddr=={haddr[31:4],haddr[3:1]+1'b1,haddr[0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
          // $diplay("display of inc8");
           //#500;
  end
endtask
  endclass
 /////////////////////16 bit wrap 16///////////////////////////////////////
class rseq1_wrap16 extends bridge_wbase_seq;
`uvm_object_utils(rseq1_wrap16)
int haddr;
 function new(string name ="rseq1_wrap16");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==1;Hburst==6;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==1;
                Hwrite==0;
                Hburst==6;
                Haddr=={haddr[31:5],haddr[4:1]+1'b1,haddr[0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);

  end
endtask
  endclass
/////////////////////////////////////////32bit wrap4///////////////////

class rseq2_wrap4 extends bridge_wbase_seq;
`uvm_object_utils(rseq2_wrap4)
int haddr;
 function new(string name ="rseq2_wrap4");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");
          /////////////////wrap4/////////////
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==2;Hwrite==0;})
                `uvm_info("seq_wrap",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==0;
                Hburst==2;
                Haddr=={haddr[31:4],haddr[3:2]+1'b1,haddr[1:0]};});
                haddr=req.Haddr;
               finish_item(req);
                 end
             start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
 end
endtask
  endclass
/////////////////////////////32 bit   wrap 8////////////////////////
class rseq2_wrap8 extends bridge_wbase_seq;
`uvm_object_utils(rseq2_wrap8)
int haddr;
 function new(string name ="rseq2_wrap8");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==4;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==0;
                Hburst==4;
                Haddr=={haddr[31:5],haddr[4:2]+1'b1,haddr[1:0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
             assert(req.randomize with {Htrans==0;});
           finish_item(req);
          // $diplay("display of inc8");
           #500;
 end
endtask
  endclass
 ///////////////////////////////32 bit  wrap 16////////////////////////
class rseq2_wrap16 extends bridge_wbase_seq;
`uvm_object_utils(rseq2_wrap16)
int haddr;
 function new(string name ="rseq2_wrap16");
        super.new(name);
        endfunction

task body();
  begin
        req=write_xtn::type_id::create("req");

            start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==2;Hburst==6;Hwrite==0;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;

             for(int i=0;i<15;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==2;
                Hwrite==0;
                Hburst==6;
                Haddr=={haddr[31:6],haddr[5:2]+1'b1,haddr[1:0]};});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;});
             finish_item(req);

  end
endtask
  endclass

/////////////////////////////////////Unspecified length//////////////////////////


class rseq_unsp extends bridge_wbase_seq;
`uvm_object_utils(rseq_unsp)
bit [2:0]hsize;
int haddr1;
 function new(string name ="rseq_unsp");
        super.new(name);
        endfunction
task body();
        req=write_xtn::type_id::create("req");

  start_item(req);

               assert(req.randomize() with {Htrans==2;Hwrite==0;Hburst==1;Haddr=='h8400_0000;});

  finish_item(req);
      hsize=req.Hsize;
      haddr1=req.Haddr;
  case(hsize)
       3'd0:begin
             for(int i=0;i<1022;i++)
              begin
               start_item(req);
                assert(req.randomize() with {Hwrite==0;Haddr==(haddr1+1'b1);Htrans==3;Hburst==1;Hsize==hsize;});
              haddr1=req.Haddr;

               finish_item(req);
              end
                start_item(req);
                assert(req.randomize() with {Htrans==0;});
                finish_item(req);
              end
       3'd1:begin
              for(int i=0;i<510;i++)

              begin
               start_item(req);
                assert(req.randomize() with {Hwrite==0;Haddr==(haddr1+2'd2);Htrans==3;Hburst==1;Hsize==hsize;});
                haddr1=req.Haddr;
               finish_item(req);
               end
                start_item(req);
                assert(req.randomize() with {Htrans==0;});
                finish_item(req);
              end
         3'd2:begin
              for(int i=0;i<254;i++)

              begin
               start_item(req);
                assert(req.randomize() with {Hwrite==0;Haddr==(haddr1+3'd4);Htrans==3;Hburst==1;Hsize==hsize;});
               haddr1=req.Haddr;
               finish_item(req);
              end
                start_item(req);
                assert(req.randomize() with {Htrans==0;});
                finish_item(req);
              end
endcase
endtask
endclass

/////////////////////////////////////////back to back///////////////////////////////////////////////////////

class back_seq extends bridge_wbase_seq;
`uvm_object_utils(back_seq)
 int haddr,hwrite;
 function new(string name ="back_seq");
        super.new(name);
        endfunction
task body();
  begin
        req=write_xtn::type_id::create("req");
           start_item(req);
               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==3;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;
             for(int i=0;i<3;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==3;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);

          req=write_xtn::type_id::create("req");
           start_item(req);

               assert(req.randomize() with {Htrans==2;Hsize==0;Hburst==5;Hwrite==1;})
                `uvm_info("seq_inc4",$sformatf("printing from sequence \n %s",req.sprint()),UVM_HIGH)
                finish_item(req);
               haddr=req.Haddr;
             for(int i=0;i<7;i++)
               begin

               start_item(req);
               assert (req.randomize with {
                Htrans==3;
                Hsize==0;
                Hwrite==1;
                Hburst==3;
                Haddr==haddr+1'b1;});

                haddr=req.Haddr;
               finish_item(req);

               end

           start_item(req);
              assert(req.randomize with {Htrans==0;Hsize==0;Hwrite==1;});
             finish_item(req);



      end
endtask
endclass

