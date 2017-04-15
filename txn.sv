// TRANSACTION CLASS FOR -BIT DATA

class txn; //#(ADDR = 4, DATA = 8, TXID = 4, STRB = DATA/8);
  rand logic [TXID-1:0] arid;      //address and control signals for read
  rand logic [ADDR:0  ] araddr;
  rand logic [3:0] arlen;
  rand logic [2:0] arsize;
  rand logic [1:0] arburst;
  logic arvalid;
  logic arready;

function void print(string str);

  $display("\n|  Signals  |  \t\tValues Generated  at %s", str);

  $display("\n|  arid     |  \t\t%0h ",arid);

  $display("\n|  araddr   |  \t\t%0h ",araddr);

  $display("\n|  arlen    |  \t\t%0h ",arlen);

  $display("\n|  arsize   |  \t\t%0h ",arsize);

  $display("\n|  arburst  |  \t\t%0h ",arburst);

  $display("\n|  arvalid  |  \t\t%0h ",arvalid);

  $display("\n|  arready  |  \t\t%0h ",arready);
  

endfunction  

endclass


