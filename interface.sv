interface intf(input clk,rst);
// read address channel signals
  logic [`TXID-1:0] arid,
  logic [`ADDR-1:0] araddr,
  logic [      3:0] arlen,
  logic [      2:0] arsize,
  logic [      1:0] arburst,
  logic [      1:0] arlock,
  logic [      3:0] arcache,
  logic [      2:0] arprot,
  logic             arvalid,
  logic             arready,

  // read data channel signals
  logic [`TXID-1:0] rid,
  logic [`DATA-1:0] rdata,
  logic [      1:0] rresp,
  logic             rlast,
  logic             rvalid,
  logic             rready



  
  clocking cb@(posedge clk);
	default input #2;
	default output #2;
// read address channel signals
  output  logic [`TXID-1:0] arid;
  output  logic [`ADDR-1:0] araddr;
  output  logic [      3:0] arlen;
  output  logic [      2:0] arsize;
  output  logic [      1:0] arburst;
  output  logic [      1:0] arlock;
  output  logic [      3:0] arcache;
  output  logic [      2:0] arprot;
  output  logic             arvalid;
  input logic             arready;

  // read data channel signals
  input logic [`TXID-1:0] rid;
  input logic [`DATA-1:0] rdata;
  input logic [      1:0] rresp;
  input logic             rlast;
  input logic             rvalid;
  output logic            rready;
  
  endclocking

endinterface

