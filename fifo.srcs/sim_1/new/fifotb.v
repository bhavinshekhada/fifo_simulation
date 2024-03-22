module fifotb;

    // Parameters
    parameter DATA_WIDTH = 16;
    parameter DEPTH = 32;
    
    // Signals
    reg clk_write, rst_write, wr_en;
    reg [DATA_WIDTH-1:0] data_in;
    reg clk_read, rst_read, rd_en;
    wire [DATA_WIDTH-1:0] data_out;
    wire empty, full;
    
    // Instantiate the module under test
    fifo dut (
        .clk_write(clk_write),
        .rst_write(rst_write),
        .wr_en(wr_en),
        .data_in(data_in),
        .clk_read(clk_read),
        .rst_read(rst_read),
        .rd_en(rd_en),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );
    
    // Clock generation
    always #5 clk_write = ~clk_write;
    always #10 clk_read = ~clk_read;
    
    // Test stimulus
    initial begin
        // Initialize clocks
        clk_write = 0;
        clk_read = 0;
        
        // Reset signals
        rst_write = 1;
        rst_read = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        
        #20 rst_write = 0;
        #20 rst_read = 0;
        
        // Test scenario
        
        // Write data into FIFO
        wr_en = 1;
        repeat (DEPTH * 2) begin
            data_in = $random;
            #10;
        end
        wr_en = 0;
        
        // Read data from FIFO
        rd_en = 1;
        repeat (DEPTH * 2) begin
            #10;
        end
        rd_en = 0;
        
        // End of simulation
        $finish;
    end
    
endmodule
