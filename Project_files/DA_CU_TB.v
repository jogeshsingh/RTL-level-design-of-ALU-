`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 07:12:49 PM
// Design Name: 
// Module Name: DA_CU_TB
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


module DA_CU_TB(

    );
   reg [3:0] data_in ;
   wire [2:0] state ;
   reg clk , rst_n , start  ;
   wire [3:0] data_out ;
   wire [3:0] REG1 , REG2 ;
  DA_CU DUT (
clk, rst_n , data_in , data_out , REG1, REG2 , state , start
    ); 
    always #10 clk = ~clk ;
 initial begin
 #0 clk = 0 ; rst_n = 1; data_in = 0 ;
 start = 1'b1;
 #30 rst_n = 0 ; 
#20 data_in = 3 ;
#60 data_in = 4 ;
 #120 data_in = 5;    
 end
endmodule
