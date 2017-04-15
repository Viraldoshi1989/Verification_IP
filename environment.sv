class env;
	virtual intf vif;
	gen g_h;
	bfm b_h;
	
	function new(virtual intf vif);
		this.vif=vif;
	endfunction
	
	task run();
		g_h=new();
		b_h=new(vif);
		fork
			g_h.run();
			b_h.run();
		join
	endtask
endclass
