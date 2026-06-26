`timescale 1ns/1ps

module csa_tb;

reg clk;
reg rst;
reg [7:0] x;

wire [15:0] led2;

csa_da_openlane u3 (
    .clk(clk),
    .rst(rst),
    .x(x),
    .led(led2)
);

// Clock generation
always #5 clk = ~clk;

// VCD dump
initial begin
    $dumpfile("csa_da_openlane.vcd");
    $dumpvars(0, csa_tb);
end

// Stimulus
initial begin
    clk = 0;
    rst = 1;
    x = 0;

    #20 rst = 0;

    #10 x = 8'd1;
    #10 x = 8'd2;
    #10 x = 8'd3;
    #10 x = 8'd4;
    #10 x = 8'd5;
    #10 x = 8'd6;

    #100 x = 8'd10;

    #10 $finish;
end

endmodule
