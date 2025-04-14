module dual_port_ram (
    input clk,

    // Port A
    input we_a,
    input [3:0] addr_a,
    input [7:0] din_a,
    output reg [7:0] dout_a,

    // Port B
    input we_b,
    input [3:0] addr_b,
    input [7:0] din_b,
    output reg [7:0] dout_b
);

    // 16 x 8 RAM
    reg [7:0] ram [15:0];

    always @(posedge clk) begin
        // Port A
        if (we_a)
            ram[addr_a] <= din_a;
        dout_a <= ram[addr_a];

        // Port B
        if (we_b)
            ram[addr_b] <= din_b;
        dout_b <= ram[addr_b];
    end

endmodule

