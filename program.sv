program prog(intf if_h);
	env env_h;
	initial begin
		env_h=new(if_h);
		env_h.run();
	end
endprogram
