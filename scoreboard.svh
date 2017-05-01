//scoreboard for the RPN calculator
//
//TODO add ID to packets
class Scoreboard;
	
	int correct;
	int incorrect;


	mailbox #(Packet_ans) predictor_mb, dut_mb;
	extern function new();
	extern function void connect_mb ((mailbox #(Packet) predictor, mailbox #(Packet) dut);
	extern function run();
	extern function print();




endclass

function new();
	correct = 0;
	incorrect = 0;
endfunction


function void Scoreboard::connect_mb (mailbox #(Packet_ans) predictor, mailbox #(Packet_ans) dut);

	predictor_mb = predictor;
	dut_mb = dut;

endfunction

//main running scoreboard function
function void Scoreboard::run();
	Packet_ans predict;
	Packet_ans dut;

	forever begin
		//get an entry from in_mail
		predictor_mb.get(predict);
		dut_mb.get(dut);

		//assuming we have the same packets. May need to add logic
		//here or in my predictors
		
		//check if the same
		if(predict.answer == dut.answer)begin
			correct++;
		end
		else begin
			incorrect++;
		end
	end

endfunction

function void print();
	$display();
	$display("######################################");
	$display("############ SCOREBOARD ##############");
	$display("######################################");
	$display();
	$display("PASS: %d		FAIL: %d", correct, incorrect);
	$display();


endfunction
