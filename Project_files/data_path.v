`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: unknown
// Engineer: Jogesh singh
// 
// Create Date: 08/02/2021 01:40:09 PM
// Design Name: data_path
// Module Name: data_path
// Project Name: RTL_DESIGN2
// Target Devices: artix-7
// Tool Versions: vivado 2020
// Description: Design  a digital system that implements f = x + y by using a datapath given in fig
//The circuit only implements the operation when start signal is asserted , The ALU oeprations are 4
//controlled by the op signal when op= 0 , f = A if op = 1 , f = A + B .
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_path(
clk , rst_n , sel_1 , op  , REG1 , REG2 , ld_1  , ld_2 , data_in , data_out, en
    );
  input clk, rst_n  , sel_1 ,op, ld_1 , ld_2 , en;
  input [3:0] data_in  ;
  output reg [3:0] data_out ;
  reg[3:0] F;
  output reg[3:0] REG1 , REG2 ; 
    
    ///Circuit implementation of REG1 ///
    
    always @ (posedge clk )
  begin 
    if(rst_n)
    begin
    REG1 <= 4'b0000;
    end
    else if (ld_1)
    begin
    if(sel_1)
    begin
    REG1<= data_in ;
    end
    else
    begin
    REG1<= data_out ;
     end
     end
     else
     begin
     REG1<= REG1 ;
     end
    end
    
    
    //circuit implementation for REG2 //
    always @ (posedge clk)
    begin
    if ( rst_n)
    begin
    REG2 <= 4'b0000;
    end
    else if (ld_2)
    begin
    REG2<= data_out ;
    end
    else
    begin
    REG2 <= REG2 ;
    end
    end
    
    
    ///circuit implementation of ALU ///
    always@(op or REG1 or REG2 )
    begin
    case(op)
    0: F = REG1 ;
    1: F = REG1 + REG2 ;
    endcase
    end
    
    //data_out process//
    always @ ( en or F)
    begin
    if (en)
    begin
    data_out = F ;
    end
    else
    begin
    data_out = 4'b0000;
    end
    end
       
endmodule
