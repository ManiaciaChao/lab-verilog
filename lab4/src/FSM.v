module FSM(clk,rst,start,next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
input clk,rst,start,next_zero;
output reg LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE;

parameter S_START = 0, S_DONE = 1, S_COMPUTE_SUM = 2, S_GET_NEXT = 3;
reg [1:0] State=0, StateNext=0;

always @(State,clk,rst,start,next_zero)
  begin
    if(rst ==1)
      StateNext <=  S_START;
    case (State)
      S_START:
        begin
          {LD_SUM, LD_NEXT, SUM_SEL,
           NEXT_SEL, A_SEL,DONE}<=6'b000000;
          if (start == 1)
            StateNext <= S_COMPUTE_SUM;
        end
      S_DONE:
        begin
          {LD_SUM, LD_NEXT, SUM_SEL,
           NEXT_SEL, A_SEL,DONE}<=6'b000001;
          if (start == 0)
            StateNext <= S_START;
        end
      S_COMPUTE_SUM:
        begin
          {LD_SUM, LD_NEXT, SUM_SEL,
           NEXT_SEL, A_SEL,DONE}<=6'b101110;
          StateNext <= S_GET_NEXT;
        end
      S_GET_NEXT:
        begin
          {LD_SUM, LD_NEXT, SUM_SEL,
           NEXT_SEL, A_SEL,DONE}<=6'b011100;
          if (next_zero == 0)
            StateNext <= S_COMPUTE_SUM;
          else
            StateNext <= S_DONE;
        end
    endcase
  end

always @(posedge clk)
  begin
    if (rst == 1 )
      StateNext <=  S_START;
    else
      State <= StateNext;
  end

endmodule
