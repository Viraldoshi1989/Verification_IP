class gen;
	txn t_h;

	task run();
		repeat(10) begin
		t_h=new();
		t_h.randomize();
		t_h.print("GENERATOR");
		config1 :: mbx.put(t_h);
		end
	endtask
endclass
