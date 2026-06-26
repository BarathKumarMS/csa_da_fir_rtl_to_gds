module csa_da_openlane (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  x,
    output wire [15:0] led
);

    // ---------------- COEFFICIENTS (ROM as localparams) ----------------//
    // Avoids initial-block memory-ROM inference, which is fragile across
    // Yosys versions. A flat case/localparam select synthesizes
    // deterministically as combinational logic on every Yosys build.
    localparam [7:0] H0  = 8'd23,  H1  = 8'd57,  H2  = 8'd91,  H3  = 8'd13,
                      H4  = 8'd77,  H5  = 8'd45,  H6  = 8'd99,  H7  = 8'd31,
                      H8  = 8'd62,  H9  = 8'd88,  H10 = 8'd17,  H11 = 8'd53,
                      H12 = 8'd29,  H13 = 8'd74,  H14 = 8'd66,  H15 = 8'd81;

    // ---------------- SHIFT REGISTER (flattened, no unpacked array) ----//
    // 16 taps x 8 bits, each tap is its own named reg instead of
    // reg [7:0] shift[15:0] -- this keeps Yosys from ever considering
    // memory inference for what is really just a shift register.
    reg [7:0] sh0, sh1, sh2, sh3, sh4, sh5, sh6, sh7;
    reg [7:0] sh8, sh9, sh10, sh11, sh12, sh13, sh14, sh15;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sh0  <= 8'd0;  sh1  <= 8'd0;  sh2  <= 8'd0;  sh3  <= 8'd0;
            sh4  <= 8'd0;  sh5  <= 8'd0;  sh6  <= 8'd0;  sh7  <= 8'd0;
            sh8  <= 8'd0;  sh9  <= 8'd0;  sh10 <= 8'd0;  sh11 <= 8'd0;
            sh12 <= 8'd0;  sh13 <= 8'd0;  sh14 <= 8'd0;  sh15 <= 8'd0;
        end else begin
            sh0  <= x;
            sh1  <= sh0;   sh2  <= sh1;   sh3  <= sh2;   sh4  <= sh3;
            sh5  <= sh4;   sh6  <= sh5;   sh7  <= sh6;   sh8  <= sh7;
            sh9  <= sh8;   sh10 <= sh9;   sh11 <= sh10;  sh12 <= sh11;
            sh13 <= sh12;  sh14 <= sh13;  sh15 <= sh14;
        end
    end

    // ---------------- BIT-SLICE DA ----------------//
    // bit_sum[i] = sum of h[k] over all taps where bit i of that tap is 1.
    // Max possible value = sum(all h) = 906 -> fits in 10 bits.
    reg [9:0] bit_sum0, bit_sum1, bit_sum2, bit_sum3;
    reg [9:0] bit_sum4, bit_sum5, bit_sum6, bit_sum7;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_sum0 <= 10'd0; bit_sum1 <= 10'd0; bit_sum2 <= 10'd0; bit_sum3 <= 10'd0;
            bit_sum4 <= 10'd0; bit_sum5 <= 10'd0; bit_sum6 <= 10'd0; bit_sum7 <= 10'd0;
        end else begin
            bit_sum0 <= (sh0[0]?H0:10'd0)+(sh1[0]?H1:10'd0)+(sh2[0]?H2:10'd0)+(sh3[0]?H3:10'd0)+
                        (sh4[0]?H4:10'd0)+(sh5[0]?H5:10'd0)+(sh6[0]?H6:10'd0)+(sh7[0]?H7:10'd0)+
                        (sh8[0]?H8:10'd0)+(sh9[0]?H9:10'd0)+(sh10[0]?H10:10'd0)+(sh11[0]?H11:10'd0)+
                        (sh12[0]?H12:10'd0)+(sh13[0]?H13:10'd0)+(sh14[0]?H14:10'd0)+(sh15[0]?H15:10'd0);

            bit_sum1 <= (sh0[1]?H0:10'd0)+(sh1[1]?H1:10'd0)+(sh2[1]?H2:10'd0)+(sh3[1]?H3:10'd0)+
                        (sh4[1]?H4:10'd0)+(sh5[1]?H5:10'd0)+(sh6[1]?H6:10'd0)+(sh7[1]?H7:10'd0)+
                        (sh8[1]?H8:10'd0)+(sh9[1]?H9:10'd0)+(sh10[1]?H10:10'd0)+(sh11[1]?H11:10'd0)+
                        (sh12[1]?H12:10'd0)+(sh13[1]?H13:10'd0)+(sh14[1]?H14:10'd0)+(sh15[1]?H15:10'd0);

            bit_sum2 <= (sh0[2]?H0:10'd0)+(sh1[2]?H1:10'd0)+(sh2[2]?H2:10'd0)+(sh3[2]?H3:10'd0)+
                        (sh4[2]?H4:10'd0)+(sh5[2]?H5:10'd0)+(sh6[2]?H6:10'd0)+(sh7[2]?H7:10'd0)+
                        (sh8[2]?H8:10'd0)+(sh9[2]?H9:10'd0)+(sh10[2]?H10:10'd0)+(sh11[2]?H11:10'd0)+
                        (sh12[2]?H12:10'd0)+(sh13[2]?H13:10'd0)+(sh14[2]?H14:10'd0)+(sh15[2]?H15:10'd0);

            bit_sum3 <= (sh0[3]?H0:10'd0)+(sh1[3]?H1:10'd0)+(sh2[3]?H2:10'd0)+(sh3[3]?H3:10'd0)+
                        (sh4[3]?H4:10'd0)+(sh5[3]?H5:10'd0)+(sh6[3]?H6:10'd0)+(sh7[3]?H7:10'd0)+
                        (sh8[3]?H8:10'd0)+(sh9[3]?H9:10'd0)+(sh10[3]?H10:10'd0)+(sh11[3]?H11:10'd0)+
                        (sh12[3]?H12:10'd0)+(sh13[3]?H13:10'd0)+(sh14[3]?H14:10'd0)+(sh15[3]?H15:10'd0);

            bit_sum4 <= (sh0[4]?H0:10'd0)+(sh1[4]?H1:10'd0)+(sh2[4]?H2:10'd0)+(sh3[4]?H3:10'd0)+
                        (sh4[4]?H4:10'd0)+(sh5[4]?H5:10'd0)+(sh6[4]?H6:10'd0)+(sh7[4]?H7:10'd0)+
                        (sh8[4]?H8:10'd0)+(sh9[4]?H9:10'd0)+(sh10[4]?H10:10'd0)+(sh11[4]?H11:10'd0)+
                        (sh12[4]?H12:10'd0)+(sh13[4]?H13:10'd0)+(sh14[4]?H14:10'd0)+(sh15[4]?H15:10'd0);

            bit_sum5 <= (sh0[5]?H0:10'd0)+(sh1[5]?H1:10'd0)+(sh2[5]?H2:10'd0)+(sh3[5]?H3:10'd0)+
                        (sh4[5]?H4:10'd0)+(sh5[5]?H5:10'd0)+(sh6[5]?H6:10'd0)+(sh7[5]?H7:10'd0)+
                        (sh8[5]?H8:10'd0)+(sh9[5]?H9:10'd0)+(sh10[5]?H10:10'd0)+(sh11[5]?H11:10'd0)+
                        (sh12[5]?H12:10'd0)+(sh13[5]?H13:10'd0)+(sh14[5]?H14:10'd0)+(sh15[5]?H15:10'd0);

            bit_sum6 <= (sh0[6]?H0:10'd0)+(sh1[6]?H1:10'd0)+(sh2[6]?H2:10'd0)+(sh3[6]?H3:10'd0)+
                        (sh4[6]?H4:10'd0)+(sh5[6]?H5:10'd0)+(sh6[6]?H6:10'd0)+(sh7[6]?H7:10'd0)+
                        (sh8[6]?H8:10'd0)+(sh9[6]?H9:10'd0)+(sh10[6]?H10:10'd0)+(sh11[6]?H11:10'd0)+
                        (sh12[6]?H12:10'd0)+(sh13[6]?H13:10'd0)+(sh14[6]?H14:10'd0)+(sh15[6]?H15:10'd0);

            bit_sum7 <= (sh0[7]?H0:10'd0)+(sh1[7]?H1:10'd0)+(sh2[7]?H2:10'd0)+(sh3[7]?H3:10'd0)+
                        (sh4[7]?H4:10'd0)+(sh5[7]?H5:10'd0)+(sh6[7]?H6:10'd0)+(sh7[7]?H7:10'd0)+
                        (sh8[7]?H8:10'd0)+(sh9[7]?H9:10'd0)+(sh10[7]?H10:10'd0)+(sh11[7]?H11:10'd0)+
                        (sh12[7]?H12:10'd0)+(sh13[7]?H13:10'd0)+(sh14[7]?H14:10'd0)+(sh15[7]?H15:10'd0);
        end
    end

    // ---------------- SHIFT (bit-weight scaling) ----------------//
    // s[i] = bit_sum[i] << i, max value 906<<7 = 115968 -> fits in 17 bits.
    wire [16:0] bit_sum0_ext = {7'd0, bit_sum0};
    reg  [16:0] s0, s1, s2, s3, s4, s5, s6, s7;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            s0 <= 17'd0; s1 <= 17'd0; s2 <= 17'd0; s3 <= 17'd0;
            s4 <= 17'd0; s5 <= 17'd0; s6 <= 17'd0; s7 <= 17'd0;
        end else begin
            s0 <= {7'd0, bit_sum0} << 0;
            s1 <= {7'd0, bit_sum1} << 1;
            s2 <= {7'd0, bit_sum2} << 2;
            s3 <= {7'd0, bit_sum3} << 3;
            s4 <= {7'd0, bit_sum4} << 4;
            s5 <= {7'd0, bit_sum5} << 5;
            s6 <= {7'd0, bit_sum6} << 6;
            s7 <= {7'd0, bit_sum7} << 7;
        end
    end

    // ---------------- CSA TREE ----------------//
    // Carries are shifted left by 1 at each merge per standard carry-save
    // convention. Width grows by at most 1 bit per level; 18 bits is
    // sufficient headroom through to final_sum (theoretical max = 231030,
    // which needs 18 bits).
    reg [17:0] sum1, carry1;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum1 <= 18'd0; carry1 <= 18'd0;
        end else begin
            sum1   <= s0 ^ s1 ^ s2;
            carry1 <= (s0 & s1) | (s1 & s2) | (s2 & s0);
        end
    end

    reg [17:0] sum2, carry2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum2 <= 18'd0; carry2 <= 18'd0;
        end else begin
            sum2   <= sum1 ^ (carry1 << 1) ^ s3;
            carry2 <= (sum1 & (carry1 << 1)) | (s3 & (carry1 << 1)) | (sum1 & s3);
        end
    end

    reg [17:0] sum3, carry3;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum3 <= 18'd0; carry3 <= 18'd0;
        end else begin
            sum3   <= sum2 ^ (carry2 << 1) ^ s4;
            carry3 <= (sum2 & (carry2 << 1)) | (s4 & (carry2 << 1)) | (sum2 & s4);
        end
    end

    reg [17:0] sum4, carry4;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum4 <= 18'd0; carry4 <= 18'd0;
        end else begin
            sum4   <= sum3 ^ (carry3 << 1) ^ s5;
            carry4 <= (sum3 & (carry3 << 1)) | (s5 & (carry3 << 1)) | (sum3 & s5);
        end
    end

    reg [17:0] sum5, carry5;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum5 <= 18'd0; carry5 <= 18'd0;
        end else begin
            sum5   <= sum4 ^ (carry4 << 1) ^ s6;
            carry5 <= (sum4 & (carry4 << 1)) | (s6 & (carry4 << 1)) | (sum4 & s6);
        end
    end

    // ---------------- FINAL STAGE ----------------//
    reg [17:0] final_sum;
    always @(posedge clk or posedge rst) begin
        if (rst)
            final_sum <= 18'd0;
        else
            final_sum <= sum5 + (carry5 << 1) + s7;
    end

    // ---------------- OUTPUT ----------------//
    reg [17:0] y_reg;
    always @(posedge clk or posedge rst) begin
        if (rst)
            y_reg <= 18'd0;
        else
            y_reg <= final_sum;
    end

    // led is intentionally the lower 16 bits of an 18-bit result.
    // The true FIR output needs 18 bits (max 231030); this truncates
    // the top 2 bits. If you need full precision, widen `led` to
    // [17:0] instead of silently dropping MSBs.
    assign led = y_reg[15:0];

endmodule
