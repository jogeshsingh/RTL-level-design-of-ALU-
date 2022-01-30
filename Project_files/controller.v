`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 02:28:40 PM
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(
clk, rst_n , ld_1, ld_2 , sel_1 , op , en , state, start 
    );
 input clk  , rst_n , start ; 
 output  ld_1 , ld_2 ,  op , en , sel_1 ;
 output reg [2:0] state ;  
 reg [2:0] next_state ; 
 reg [4:0] CV ;
 parameter [2:0] 
 S0 = 0 ,
 S1 = 1 ,
 S2 = 2 , 
 S3 = 3 ,
 S4 = 4 ; 
 
 
 assign ld_1 = CV[4] ;
 assign ld_2 = CV[3] ;
 assign sel_1 = CV[2] ;
 assign op = CV[1] ;
 assign en = CV[0] ;
 
 
 ///state registers ///
 always @ ( negedge clk )
 begin
 if(rst_n)
 begin
 state <= S0 ;
 end
 else
 begin
 state <= next_state ;
 end
 end
 
 /// next_state logic ///
 always @ (  state , start  )
 begin
 case (state)
 S0: begin 
 if (start)
 next_state = S1;
 else
 next_state = S0 ;
 CV = 5'b00000 ;
end
 S1 : begin CV = 5'b10100;  next_state = S2 ; end
 S2: begin CV = 5'b01001; next_state = S3; end
 S3: begin CV = 5'b10100; next_state = S4; end
 S4: begin CV = 5'b10011; next_state = S0; end
 default : begin CV = 5'b00000; next_state = S0 ; end
 endcase
 end
 endmodule
