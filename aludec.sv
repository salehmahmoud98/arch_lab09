module aludec(input logic [5:0] funct,
                input logic [3:0] aluop,
                output logic [4:0] alucontrol);
// assign jr=funct==8;
always_comb
	
    case(aluop)
        4'b0000: alucontrol <= 5'b00010; // add (for lw/sw/addi)
        4'b0001: alucontrol <= 5'b00110; // sub (for beq)
        4'b0010: alucontrol <= 5'b01010; // blez        
        4'b0011: alucontrol <= 5'b00001; // or (for ori)
        4'b0100: alucontrol <= 5'b01000; // shift 16 (LUI)
        4'b0101: alucontrol <= 5'b01001; // xor (for XORI)
        4'b0110: alucontrol <= 5'b00111; // sub (for slti)
        4'b0111: alucontrol <= 5'b00000; // and (for andi)
        4'b1000: alucontrol <= 5'b01110; // sltiu
        4'b1001: alucontrol <= 5'b10000; // bgtz
        //TODO add mult
        default: case(funct) // R-type instructions
            6'b000000: alucontrol <= 5'b00011; // sll
            6'b100000: alucontrol <= 5'b00010; // add
            6'b100010: alucontrol <= 5'b00110; // sub
            6'b100011: alucontrol <= 5'b00110; // subu
            6'b100100: alucontrol <= 5'b00000; // and
            6'b100101: alucontrol <= 5'b00001; // or
            6'b101010: alucontrol <= 5'b00111; // slt
            6'b000010: alucontrol <= 5'b01100; // srl
            6'b000110: alucontrol <= 5'b01011; // srlv
            6'b000111: alucontrol <= 5'b01101; // srav
            6'b000011: alucontrol <= 5'b10001; // sra
            6'b000100: alucontrol <= 5'b10010; // sllv
            6'b011000: alucontrol <= 5'b10011; // mult
            6'b100111: alucontrol <= 5'b10100; //nor
            6'b011001: alucontrol <= 5'b10101; //multu
	    6'b011010: alucontrol <= 5'b10110; //div
            6'b011011: alucontrol <= 5'b10111; //divu
            default: alucontrol <= 5'bxxxxx; // ???
        endcase
    endcase
endmodule
