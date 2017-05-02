
class Packet_ans;
	int answer;
	int val1;
	int val2;
	int valid;
	key_value_t operator;


	extern function new();
	extern function int compAnswer();
	extern function int isValid();
	extern function void setVals(int v1, int v2);
	extern function void reset();


endclass

function Packet_ans::new();
	reset();

endfunction

//returns 1 if true
//0 if not
function int Packet_ans::compAnswer();
	int check;
	
	case(operator)
		PLUS: check = val1+val2;
		MINUS: check = val1-val2;
		MULTIPLY: check = val1*val2;
		DIVIDE: check = val1/val2;
		default: check = -1;
	endcase

	answer = check;
	return answer;


endfunction

//sees if the packet is valid
//this only works if you use set functions
function int Packet_ans::isValid();

	return valid;

endfunction

function int Packet_ans::setVals(int v1, int v2);
	val1 = v1;
	val2 = v2;
	compAnswer();
	valid = 1;

endfunction

function void Packet_ans::reset();
	val1 = 0;
	val2 = 0;
	answer = 0;
	valid = 0;
endfunction

