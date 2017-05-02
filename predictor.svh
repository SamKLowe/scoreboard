

class predictor;

	//queues to model inside calculator
	
	key_value_t digit[$] = new();
	key_value_t memory[$] = new();

	mailbox #(Packet) in_mail;
	mailbox #(Packet_ans) out_mail;

	Packet_ans packet_out;

	extern function new();
	extern function void connect_mb(mailbox #(Packet) in_mailbox, mailbox #(Packet_ans) out_mailbox);
	extern function void run();

	




endclass

function new();
	packet_out = new();

endfunction

	
function void connect_mb(mailbox #(Packet) in_mailbox, mailbox #(Packet_ans) out_mailbox);

	in_mail = in_mailbox;
	out_mail = out_mailbox;

endfunction

//recieves Packets and turns them into val1 <operator> val2 = answer
function void run();
	Packet in_key;
	//get incoming key
	in_mail.get(in_key);

	case(in_key.button.key)
		


	endcase




endfunction
