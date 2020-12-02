`include "definitions.v"
interface bridge_if(input bit Hclk);

    logic [2:0] Hsize;
    logic Hresetn;
    logic [1:0] Htrans;
    logic Hwrite;
    logic Hreadyin;
    logic Hreadyout;
    logic [1:0] Hresp;
     logic      [`WIDTH-1:0]Hwdata;
     logic      [`WIDTH-1:0]Haddr;
     logic      [`WIDTH-1:0]Hrdata;
/////////////////////////////////////////
    logic Penable;
      logic Pwrite;

    logic  [`WIDTH-1:0] Pwdata;
    logic  [`WIDTH-1:0]Prdata;
    logic  [`WIDTH-1:0]Paddr;
    logic  [`SLAVES-1:0] Pselx;
  //assign Hclk=Hclk;
clocking  wr_drv@(posedge Hclk);
  default input #1 output #1;
        output Hsize,Hresetn,Htrans,Hwrite,Hwdata,Haddr,Hreadyin;
        input Hreadyout,Hresp,Hrdata;
   endclocking

clocking wr_mon@(posedge Hclk);
   default input #1 output #1;

       input Hrdata,Hreadyout,Hwrite,Hreadyin,Hwdata,Haddr,Htrans,Hsize;
  endclocking
clocking rd_drv@(posedge Hclk);
   default input #1 output #1;
   output Prdata;
   input Pselx,Pwrite,Penable;
   endclocking

clocking rd_mon@(posedge Hclk);
 default input #1 output #1;
   input Pwrite,Penable,Pwdata,Prdata,Paddr,Pselx;

   endclocking


modport WR_D(clocking wr_drv);
modport WR_M(clocking wr_mon);
modport RD_D(clocking rd_drv);
modport RD_M(clocking rd_mon);
endinterface

