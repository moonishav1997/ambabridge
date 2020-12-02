class write_xtn extends uvm_sequence_item;
  `uvm_object_utils(write_xtn);
 function new(string name="write_xtn");
    super.new(name);
    endfunction                                                                                                                                                rand bit [2:0] Hsize;
rand bit [1:0] Htrans;
rand bit Hwrite;
rand bit [31:0] Hwdata;
bit [31:0] Hrdata;
rand bit [31:0] Haddr;
rand bit [2:0] Hburst;
bit Hwrite1;
int i;


bit Hreadyin;
bit Hreadyout;
bit Hresp;
constraint address { soft Haddr inside {['h8000_0000:'h8000_03ff],['h8400_0000:'h8400_03ff],['h8800_0000:'h8800_03ff],['h8c00_0000:'h8c00_03ff]};}
constraint datasize {Hsize inside {[0:2]};}
constraint address1 {Hsize==1 ->  Haddr%2==0; Hsize==2 ->  Haddr%4==0;}
extern function void do_print(uvm_printer printer);
extern function void post_randomize();
endclass

   function void  write_xtn::do_print (uvm_printer printer);
    super.do_print(printer);


    //                   srting name            bitstream value     size       radix for printing
    printer.print_field( "Hsize",               this.Hsize,         3,           UVM_BIN);
    printer.print_field( "Htrans",               this.Htrans,       2,           UVM_BIN               );
    printer.print_field( "Hwrite",              this.Hwrite,        1,           UVM_BIN);
    printer.print_field( "Hwdata",              this.Hwdata,        32,          UVM_DEC);
    printer.print_field( "Haddr",               this.Haddr,         32,          UVM_BIN);
    printer.print_field( "Hburst",              this.Hburst,        3,           UVM_BIN);
     printer.print_field( "Hreadyin",           this.Hreadyin,      1,           UVM_BIN);
      printer.print_field( "Hreadyout",                 this.Hreadyout,             1,  UVM_BIN         );
      printer.print_field( "data_count",                this.i,             32,         UVM_DEC         );
      printer.print_field( "Hrdata",            this.Hrdata,        32,          UVM_DEC);


  endfunction
  function void  write_xtn::post_randomize();
    i++;//data_count
    Hwrite1=1'b1;//this.Hwrite;

 endfunction

