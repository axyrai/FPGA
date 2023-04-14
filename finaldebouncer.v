module debouncer(button,clk,result);
input button,clk;
output reg result;
reg q1,q2,q3,q4;
reg [4:0] count;

always@(posedge clk)
begin
        q1<=button;
end

always@(posedge clk)
begin
        q2<=q1;
end

always@(q1 or q2)
begin
        q3<=q1^q2;
end

always@(posedge clk)
begin
        if (q3)
        begin
        count<=5'b0;
        q4<=0;
        end
        else if (q4)
        begin
                if(count == 5'd20)
                begin
                        q4<=1;
                        count<=5'b0;
                end

                else 
                begin
                        count<=count+1'b1;
                end
        end
		  end

always@(posedge clk)
begin
        if(q4)
        begin
                result<=q2;
        end
end
endmodule
