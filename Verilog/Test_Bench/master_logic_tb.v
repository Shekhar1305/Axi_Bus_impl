`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2024 15:33:27
// Design Name: 
// Module Name: master_logic_tb
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


module master_logic_tb;
reg clk,  nrst, s_ready;              
reg [7:0] m_in_data;    
wire m_valid;       
wire [7:0] m_s_data;    

master_logic DUT (.clk(clk), .nrst(nrst), .s_ready(s_ready), .m_in_data(m_in_data), 
                  .m_valid(m_valid), .m_s_data(m_s_data)); 
               
initial begin
clk = 1'b1;
nrst = 1'b0;
s_ready = 1'b1;

end

always clk = #5 ~clk;


initial begin

nrst = #20 1'b1;
m_in_data = 8'hb0;
m_in_data = #20 8'hb1;   
m_in_data = #20 8'hb2;   
m_in_data = #20 8'hb3;   
m_in_data = #20 8'hb4;   
m_in_data = #20 8'hb5;   
#40
$finish;
end      
endmodule
