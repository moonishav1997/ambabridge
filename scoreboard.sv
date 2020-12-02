class bridge_scoreboard extends uvm_scoreboard;
`uvm_component_utils(bridge_scoreboard)
	uvm_tlm_analysis_fifo #(read_xtn) fifo_rdh;
        uvm_tlm_analysis_fifo #(write_xtn) fifo_wrh;
     

write_xtn wr_data,cov_xtn;
read_xtn rd_data,cov_xtn1;
static int activate;
bit [31:0] wdata;
bit [31:0] rdata;



int wr_xtns,rd_xtns,xtns_compared,xtns_dropped;
///////////////////////////////////////////////////coverage//////////////////////////////////
covergroup bridge;//with function sample(int i);
option.per_instance=1;
 Haddr1:coverpoint cov_xtn.Haddr [31:0]{

               bins slave1= {['h8000_0000:'h8000_03ff]};
               bins slave2= {['h8400_0000:'h8400_03ff]};
               bins slave3= {['h8800_0000:'h8800_03ff]};
               bins slave4= {['h8c00_0000:'h8c00_03ff]};
                 }
Hwdata1:coverpoint cov_xtn.Hwdata [31:0] {
              bins low ={[0:2000000000]};
             bins high={[2000000001:4000000000]};
             }
Hsize1:coverpoint cov_xtn.Hsize [2:0]{
                bins eight={0};
                bins sixteen={1};
                bins full={2};}
Htrans1:coverpoint cov_xtn.Htrans [1:0]{
                 bins idle={0};
                 bins nonseq={2};
                 bins seq={3};
                            }
Hwrite1:coverpoint cov_xtn.Hwrite{
                bins wr={1}; 
                bins r={0};          }
Hreadyin1:coverpoint cov_xtn.Hreadyin{
                bins hreadyin={[0:1]};
                }
Haddr1xHsize1xHtrans1xHwrite1:cross Haddr1,Hsize1,Htrans1,Hwrite1;

   endgroup
///////////////////////////////////////////////////////////////////////////////////////////
covergroup bridge1;//with function sample(int i);
option.per_instance=1;
 Paddr1:coverpoint cov_xtn1.Paddr [31:0]{

               bins slave1= {['h8000_0000:'h8000_03ff]};
               bins slave2= {['h8400_0000:'h8400_03ff]};
               bins slave3= {['h8800_0000:'h8800_03ff]};
               bins slave4= {['h8c00_0000:'h8c00_03ff]};
                 }
Pwrite1:coverpoint cov_xtn1.Pwrite{
                bins w={[1:0]}; 
              
               }
Paddr1xPwrite1:cross Paddr1,Pwrite1;
   endgroup

///////////////////////////////////////////////////////////////////////////////////////////

extern function new(string name,uvm_component parent);
extern task run_phase(uvm_phase phase);
 //extern function  void  report_phase(uvm_phase phase);
extern function void check_data(write_xtn wr_data,read_xtn rd_data);


endclass


function bridge_scoreboard::new(string name="bridge_scoreboard",uvm_component parent);
      super.new(name,parent);
        fifo_rdh= new("fifo_rdh",this);
        fifo_wrh=new("fifo_wrh",this);
         bridge=new();
         bridge1=new();
  endfunction

task bridge_scoreboard::run_phase(uvm_phase phase);
         fork
	   forever begin
            fifo_wrh.get(wr_data); 
              cov_xtn=wr_data;
              bridge.sample();
       
	    `uvm_info("WRITE SB","write data" , UVM_LOW)
            wr_data.print;
             
	    fifo_rdh.get(rd_data);
              cov_xtn1=rd_data;
              bridge1.sample();

             `uvm_info("READ SB", "read data" , UVM_LOW)
              rd_data.print;
              check_data(wr_data,rd_data);
	    
	 end
         join
   endtask

function void bridge_scoreboard::check_data(write_xtn wr_data,read_xtn rd_data);
begin
	case(wr_data.Hsize)
		3'b000 : case(wr_data.Haddr[1:0])
			 2'b00 : begin
				 wdata = wr_data.Hwdata[7:0];
				 rdata = rd_data.Prdata[7:0]; end
			 	 
			 2'b01 : begin
				 wdata = wr_data.Hwdata[15:8];
				 rdata = rd_data.Prdata[15:8]; end 
			 	 
			 2'b10 : begin
				 wdata = wr_data.Hwdata[23:16];
				 rdata = rd_data.Prdata[23:16]; end 

			 2'b11 : begin
				 wdata = wr_data.Hwdata[31:24];
				 rdata = rd_data.Prdata[31:24]; end 
			 endcase

		3'b001 : case(wr_data.Haddr[1:0])
			 2'b00 : begin
				 wdata = wr_data.Hwdata[15:0];
				 rdata = rd_data.Prdata[15:0]; end
			 	 
			 2'b10 : begin
				 wdata = wr_data.Hwdata[31:16];
				 rdata = rd_data.Prdata[31:16]; end 
			 endcase
		
		3'b010 :  begin
		  	  wdata = wr_data.Hwdata[31:0];
			  rdata = rd_data.Prdata[31:0]; end
	endcase
end

	if(wr_data.Hwrite)
		begin
                 $display("=====%d====",wr_data.Hwrite);
		if(wdata == rd_data.Pwdata && wr_data.Haddr==rd_data.Paddr)
			begin
			$display("$$$$$$$$$$ write Successfully compared$$$$$$$$$$$ ");
                      
                     end
			else
			$display(" $$$$$$$$$$$write comparison failure$$$$$$$$$$$$");
			$display("Hwdata=%0h,Pwdata=%0h,Haddr=%0h,Paddr=%0h",wdata,rd_data.Pwdata,wr_data.Haddr,rd_data.Paddr);
                       
		end

 else	if(!wr_data.Hwrite)
		begin
		if(rdata == wr_data.Hrdata &&  wr_data.Haddr==rd_data.Paddr)
			begin
			$display("$$$$$read  Successfully compared$$$$$$");
                         
                          end
			else
			$display("$$$$$read comparison failure");
			$display("Prdata=%0h,Hrata=%0h,Haddr=%0h,Paddr=%0h",rdata,wr_data.Hrdata,wr_data.Haddr,rd_data.Paddr);
                       
		end

endfunction






