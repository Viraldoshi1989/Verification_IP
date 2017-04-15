`define TXID 4
`define ADDR 32
`define DATA 32
`define STRB `DATA/8
`define MEM_RANGE 10
`define BUFF_RANGE 2

//--------------------------------module for slave---------------------------------------------

module slave(

  input logic aclk, aresetn,
/*
    // write address channel signals
  input  logic [`TXID-1:0] awid,
  input  logic [`ADDR-1:0] awaddr,
  input  logic [      3:0] awlen,
  input  logic [      2:0] awsize,
  input  logic [      1:0] awburst,
  input  logic [      1:0] awlock,
  input  logic [      3:0] awcache,
  input  logic [      2:0] awprot,
  input  logic             awvalid,
  output logic             awready,

    // write data channel signals
  input  logic [`TXID-1:0] wid,
  input  logic [`DATA-1:0] wdata,
  input  logic [`STRB-1:0] wstrb,
  input  logic             wlast,
  input  logic             wvalid,
  output logic             wready,

  // write response channel signals
  output logic [`TXID-1:0] bid,
  output logic [      1:0] bresp,
  output logic             bvalid,
  input  logic             bready,
*/
  // read address channel signals
  input  logic [`TXID-1:0] arid,
  input  logic [`ADDR-1:0] araddr,
  input  logic [      3:0] arlen,
  input  logic [      2:0] arsize,
  input  logic [      1:0] arburst,
  input  logic [      1:0] arlock,
  input  logic [      3:0] arcache,
  input  logic [      2:0] arprot,
  input  logic             arvalid,
  output logic             arready,

  // read data channel signals
  output logic [`TXID-1:0] rid,
  output logic [`DATA-1:0] rdata,
  output logic [      1:0] rresp,
  output logic             rlast,
  output logic             rvalid,
  input  logic             rready
			);

//--------------------------------module for slave end -----------------------------------------


  int queue_read[$];

initial arready=1;

  always@(posedge aclk or areset_n)begin

    if (!areset_n)begin
      rvalid=0;
      $display("RESET SIGNAL ARRIVE....!!!!");
    end

    else if (aclk && areset_n)begin
      if (arvalid && arready)begin

          if (araddr>=((1<<(`MEM_RANGE))-1))begin
            $display ("Read Slave Error ....!!\n");
            rvalid=1;
	    rresp=2;
          end
          else begin
                if (arburst==2'b10)begin							// burst type is wrap
                  if(((araddr % (2**arsize))!=0))begin						//check burst value
                    $display("Slave Error ....!!\n");
                     rvalid=1;
		     rresp= 2;;
                  end
                  else begin
                    if ((arlen+1)==2 || (arlen+1)==4 || (arlen+1)==8 || (arlen+1)==16) 
		    begin
                      queue_read.push_back(arid);
                      queue_read.push_back(araddr);
                      queue_read.push_back((arlen)+1);
                      queue_read.push_back(arsize);
                      queue_read.push_back(arburst); 
                   end
                   else 
		   begin
                     $display ($time, "Slave Error ....!!");
                     rvalid=1;
   		     rresp=2;
                   end
                 end 
               end  										//burst type is incer and fixed
               else if (arburst==2'b00 || arburst==2'b01) 
               begin										// arburst=incr adddress can be aligned or unaligned
                  queue_read.push_back(arid);
                  queue_read.push_back(araddr);
                  queue_read.push_back((arlen)+1);
                  queue_read.push_back(arsize);
                  queue_read.push_back(arburst); 
                end 
            end 
          $display ($time,"Store Read Operation queue value is :",queue_read);
      end       
     
    end 
  end 
  endmodule
