`include "txn.sv"
`include "interface.sv"
`include "configure.sv"
`include "generator.sv"
`include "bfm.sv"
`include "environment.sv"
`include "program.sv"
`include "slave.sv"

module top;

reg aclk,aresetn;


 //interface handle declaration
  intf pif(aclk,aresetn);

 //clk,rst gen
 initial begin
	 aclk=0;
	 aresetn=1;
	 forever #10 aclk=~aclk;
 end

 /*
 initial begin
	 rst=0;
	 #2 rst=1;
	 #2 rst=0;
 end
*/

 //tb instantiation
 p p1(pif);


 //dut instantiation
module slave(
	aclk,
	aresetn,
	arid,
	araddr,
	arlen,
	arsize,
	arburst,
	arlock,
	arcache,
	arprot,
	arvalid,
	arready,
	rid,
	rdata,
	rresp,
	rlast,
	rvalid,
	rready
	);  
 //testcase selection
/*    initial begin
	$value$plusargs("testcase=%s",config1::tc);
    end
*/
  //simulation end
    initial begin
      #500 $finish;
    end
endmodule
