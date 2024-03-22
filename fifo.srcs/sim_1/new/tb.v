module tb;

    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire empty;
    wire full;

    // Instantiate the FIFO module
    fifo dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Testbench initializations
    initial begin
        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;

        // Reset and wait for a few cycles
        #10 rst = 0;
        #20;

        // Write data into the FIFO
        wr_en = 1;
        data_in = 8'hAA; // Writing data 0xAA
        #10;
        wr_en = 0;
        #10;

        // Read data from the FIFO
        rd_en = 1;
        #10;
        rd_en = 0;
        #10;

        $finish;
    end

    // Display outputs
    always @(posedge clk) begin
        $display("Data Out: %h, Empty: %b, Full: %b", data_out, empty, full);
    end

endmodule
