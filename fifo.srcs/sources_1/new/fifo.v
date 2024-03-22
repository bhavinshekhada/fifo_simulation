module fifo (
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg empty,
    output reg full
);

parameter DEPTH = 8; // Depth of the FIFO
reg [7:0] mem [0:DEPTH-1]; // FIFO memory
reg wr_ptr = 0; // Write pointer
reg rd_ptr = 0; // Read pointer
reg count = 0; // Counter for FIFO occupancy
integer  i;
// Reset logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count <= 0;
        data_out <= 0;
        empty <= 1;
        full <= 0;
       // int i <=0;
        for (i = 0; i < DEPTH; i = i + 1) 
        begin
            mem[i] <= 0;
        end
    end else begin
        // Write operation
        if (wr_en && !full) begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= (wr_ptr == DEPTH-1) ? 0 : wr_ptr + 1;
            count <= count + 1;
            full <= (count == DEPTH);
            empty <= 0;
        end
        
        // Read operation
        if (rd_en && !empty) begin
            data_out <= mem[rd_ptr];
            rd_ptr <= (rd_ptr == DEPTH-1) ? 0 : rd_ptr + 1;
            count <= count - 1;
            empty <= (count == 1);
            full <= 0;
        end
    end
end

endmodule