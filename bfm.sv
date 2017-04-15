class bfm;
	txn t_h;
	virtual intf vif;

	function new(virtual intf vif1);
		vif=vif1;
	endfunction

	task run();
		@(negedge vif.rst);
		forever begin
		t_h=new();
			config1::mbx.get(t_h);
			t_h.print("BFM");
			drive_slave(t_h);
		end
	endtask

	task drive_slave(txn t_h);
	//	@(posedge vif.clk);
		@(vif.cb);
	//	vif.si=t_h.si;
		vif.cb.arid <= arid;
		vif.cb.araddr <= araddr;
		vif.cb.arlen <= arlen;
		vif.cb.arsize <= arsize;
		vif.cb.arburst <= arburst;
		vif.cb.arlock <= arlock;
		vif.cb.arcache <= arcache;
		vif.cb.arprot <= arprot;
		vif.cb.arvalid <= arvalid;
		vif.cb.rready <= rready;

	endtask
endclass
