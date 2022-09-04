`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 07:11:56 PM
// Design Name: 
// Module Name: DA_CU
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


module DA_CU(
clk, rst_n , data_in , data_out , REG1, REG2 , state , start
    );
 input clk , rst_n, start;
 output  [2:0] state ;
 input [3:0] data_in ;
 output [3:0] REG1 , REG2  ;
 output [3:0] data_out ;   
 wire ld_1 , ld_2 , sel_1 , op , en ;   
  
 data_path DATAPATH(
clk , rst_n , sel_1 , op  , REG1 , REG2 , ld_1  , ld_2 , data_in , data_out, en
    ); 
    
 controller CONTROL_PATH(
clk, rst_n , ld_1, ld_2 , sel_1 , op , en , state, start 
    );
    
  
  
    
endmodule
