module top;
  import test_pkg::*;
  import uvm_pkg::*;
	 bit Hclk;  
	always 
	#10 Hclk=~Hclk;    
  bridge_if in(Hclk);// Instantiate 4 ram_if interface instances in0,in1,in2,in3 with clock as input
   // bridge_if in1(Hclk);
   rtl_top DUV( Hclk,in.Hresetn,in.Htrans,in.Hsize,in.Hreadyin,in.Hwdata,in.Haddr,in.Hwrite,in.Prdata,in.Hrdata,in.Hresp,in.Hreadyout,in.Pselx,in.Pwrite,in.Penable,in.Paddr,in.Pwdata);
 initial
begin
   	uvm_config_db #(virtual bridge_if)::set(null,"*","vif_0",in);
      //  uvm_config_db #(virtual bridge_if)::set(null,"*","vif_1",in1);

run_test();
end
endmodule

