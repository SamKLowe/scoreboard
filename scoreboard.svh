//scoreboard for the RPN calculator
//
//TODO add ID to packets
class Scoreboard;
	
	mailbox #(Packet_ans) predictor_mb, dut_mb;
	extern function new();
	extern function void connect_mb ((mailbox #(Packet) predictor, mailbox #(Packet) dut);
	extern function run();




endclass


function void Scoreboard::connect_mb ((mailbox #(Packet) predictor, mailbox #(Packet) dut);

	predictor_mb = predictor;
	dut_mb = dut;

endfunction

//main running scoreboard function
function void Scoreboard::run();
	Packet_ans in_predict;
	Packet_ans in_dut;

	forever begin
		//get an entry from in_mail
		predictor_mb.get(in_predict);
		dut_mb.get(in_dut);

		//assuming we have the same packets. May need to add logic
		//here or in my predictors
		
		//check if the same
		


	end


endfunction
