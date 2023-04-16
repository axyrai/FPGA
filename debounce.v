module debounce_ckt(
input button,
input clk,
output wire result
    );

   
wire Q1;
wire Q2;
wire EN1 = 1'b1;
wire EN2 = 1'b1;
wire xor_out;
/****************************** Debounce ckt Implementation code ****************************************/

DFF FF1 (button,clk,EN1,Q1);
DFF FF2 (Q1,clk,EN2,Q2);
     
xor g1 (xor_out,Q1,Q2);

counter C1 (clk,xor_out,~Cout,Cout);     
DFF FF3 (Q2,clk,Cout,result);



endmodule


/***************************************** N-bit counter *************************************/
 module counter (clk, SCLR,EN,c);
     input clk;
     input SCLR;   // Clear of counter //
     input EN ; // Active 'HIGH' Enable //
      reg [N-1:0] Cout; 
	  output reg c;// Counter Output //
 


parameter N = 20;

            always@(posedge clk)
                    if(SCLR) 
							begin 						  
							Cout <= 0;
							c<=0;
							end
                        else if (EN)    
                            begin
                                    if (Cout == N-1) 
												begin
                                            Cout <= 0;
														  c<=1;
														  end
                                    else
												begin
                                            Cout <= Cout + 1;
														  c<=0;
                            end
									 end
                    
endmodule       
 

/************************************* D Flip Flop Module (with Enable)**************************/

module DFF(input D,input clk,input EN ,output reg Q);

            always @(posedge clk ) 
                    begin
                        if(EN)
                                begin
                                   Q <= D; 
                                end 
                    end     
endmodule
