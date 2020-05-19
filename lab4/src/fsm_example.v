module LaserTimer(B, X, Clk, Rst);

input B;
output reg X;
input Clk, Rst;

parameter S_Off = 0, S_On1 = 1, S_On2 = 2, S_On3 = 3;//对应四个状态

reg [1:0] State, StateNext; //当前状态和下一个时钟周期的状态

// CombLogic
always @(State, B)
  begin
    case (State)
      S_Off:
        begin
          X <= 0;                 //初始状态Off：关闭
          if (B == 0)
            StateNext <= S_Off;   //不按按钮，保持关闭
          else
            StateNext <= S_On1;  //按了按钮，下一个状态为On1
        end
      S_On1:
        begin
          X <= 1;                //激光发射第1个周期
          StateNext <= S_On2;    //下一个状态自动迁移为On2
        end
      S_On2:
        begin
          X <= 1;               //激光发射第2个周期
          StateNext <= S_On3;   //下一个状态自动迁移为On3
        end
      S_On3:
        begin
          X <= 1;               //激光发射第3个周期
          StateNext <= S_Off;    //下一个状态自动迁移为Off
        end
    endcase
  end

// StateReg
always @(posedge Clk)
  begin
    if (Rst == 1 )
      State <= S_Off;   //激光器复位
    else
      State <= StateNext; //迁移到下一个状态
  end
endmodule
