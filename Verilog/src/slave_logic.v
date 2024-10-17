`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2024 16:38:01
// Design Name: 
// Module Name: slave_logic
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


module slave_logic(
    input clk,
    input nrst,
    input m_valid,
    input [7:0] m_data,
    output reg s_ready,
    output reg [7:0] s_data_out
    );
    
    parameter READY = 1'b0,
              PROCESS = 1'b1;
    reg s_state;
    
    always @ (posedge clk)
    begin
    if (!nrst) begin
        s_ready <= 1'b0;
        s_data_out <= 8'h00; 
        s_state <= READY;
    end
    else
    begin
        case(s_state)
            READY: begin
                s_ready <= 1'b1;
                if (m_valid == 1'b1) begin
                    s_ready <= 1'b0;
                    s_state <= PROCESS;
                    s_data_out <= m_data;
                end
            end
            PROCESS: begin
                s_state <= READY;
                s_ready <= 1'b1;
           end
        endcase
    end
  end
endmodule
