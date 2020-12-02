class bridge_wr_driver extends uvm_driver#(write_xtn);
`uvm_component_utils(bridge_wr_driver)
   virtual bridge_if.WR_D vif;
  bridge_wr_agent_config m_cfg;
  write_xtn xtn;
bit [1:0]htrans;

//semaphore sem;

        extern function new(string name ="bridge_wr_driver",uvm_component parent);
        extern function void build_phase(uvm_phase phase);
        extern function void connect_phase(uvm_phase phase);
        extern task  run_phase(uvm_phase phase);
        extern task send_to_dut(write_xtn xtn);
        extern task reset1();

 endclass

                function bridge_wr_driver::new(string name ="bridge_wr_driver",uvm_component parent);
                super.new(name,parent);
               // sem=new(1);

                endfunction

        function void bridge_wr_driver::build_phase(uvm_phase phase);
          super.build_phase(phase);
        if(!uvm_config_db #(bridge_wr_agent_config)::get(this,"","bridge_wr_agent_config",m_cfg))
                `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
        endfunction

        function void bridge_wr_driver::connect_phase(uvm_phase phase);
          vif = m_cfg.vif;
        endfunction
task bridge_wr_driver::reset1();

      @(vif.wr_drv);
     vif.wr_drv.Hresetn<=1'b0;
       @(vif.wr_drv);
     vif.wr_drv.Hresetn<=1'b1;
endtask

task bridge_wr_driver::send_to_dut(write_xtn xtn);


      vif.wr_drv.Haddr<=xtn.Haddr;
      vif.wr_drv.Hsize<=xtn.Hsize;
      vif.wr_drv.Hwrite<=xtn.Hwrite;
      vif.wr_drv.Htrans<=xtn.Htrans;
  htrans=xtn.Htrans;

   if(xtn.Htrans==0)
         begin
         repeat(2)
          begin
        @(vif.wr_drv);
           vif.wr_drv.Htrans<=htrans;
         end
       end

      vif.wr_drv.Hreadyin<=1'b1;
         @(vif.wr_drv);
    wait(vif.wr_drv.Hreadyout)
       vif.wr_drv.Hwdata<=xtn.Hwdata;

      $display("driver data");
       xtn.print();
   endtask

        task bridge_wr_driver::run_phase(uvm_phase phase);
                reset1();
                forever begin
                seq_item_port.get_next_item(req);
                send_to_dut(req);
                seq_item_port.item_done();

                end
        endtask
