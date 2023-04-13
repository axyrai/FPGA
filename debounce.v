module debounce_ckt(
input button,
input clk,
output reg result
    );
  
wire Q1;
wire Q2;
wire EN1 = 1'b1;
wire EN2 = 1'b1;
wire xor_out;

DFF FF1 (button,clk,EN1,Q1);
DFF FF2 (Q1,clk,EN2,Q2);
     
xor g1 (xor_out,Q1,Q2);

counter C1 (clk,xor_out,~Cout,Cout);     
DFF2 FF3 (Q2,clk,Cout,result);



endmodule


//N bit counter
 module counter (clk, SCLR,EN,Cout);
     input clk;
     input SCLR;   // Clear of counter //
     input EN ; // Active 'HIGH' Enable //
     output reg [N-1:0] Cout; // Counter Output //
 
         
parameter N = 16;

            always@(posedge clk)
                    if(SCLR)  
						  Cout <= 0;
                        else if (EN)    
                            begin
                                    if (Cout == N-1) 
                                            Cout <= 0;
                                    else
                                            Cout <= Cout + 1;
                            end
                    
endmodule       
 

//D flipflop

module DFF(input D,input clk,input EN ,output wire Q);
reg out;
            always @(posedge clk or EN) 
                    begin
                        if(EN)
                                begin
                                   out <= D; 
                                end 
										   out <=out;	
                    end 
						  assign Q=out;
					  
endmodule 
