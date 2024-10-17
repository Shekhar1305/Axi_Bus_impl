`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2024 15:18:43
// Design Name: 
// Module Name: master_logic
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


module master_logic(
    input clk,
    input nrst,
    input [7:0] m_in_data,
    output reg m_valid,
    output reg [7:0] m_s_data,
    input s_ready
    );
      
   parameter  TRANSMIT     = 1'b0,
              WAIT_F_SLAVE = 1'b1;
  
   
    reg  curr_state;
    always @ (posedge clk)
    begin
     if (!nrst) begin
        m_valid <= 1'b0;  
        m_s_data <= 8'h00;
        curr_state <= TRANSMIT;
     end
     else
     begin
        case (curr_state)
        TRANSMIT: begin
            m_s_data <= m_in_data;
            m_valid <= 1'b1;
            curr_state <= WAIT_F_SLAVE;
        end
        WAIT_F_SLAVE: begin
            if (s_ready) begin
                m_valid <= 1'b0;
                curr_state <= TRANSMIT;
            end
            else begin
                curr_state <= WAIT_F_SLAVE;
            end
       end
    endcase
    end
end
endmodule
