module memory_16bit (
    output [15:0] dataOut,
    input [15:0] dataIn,
    input sel, write, clk   // sel: 0 -> reg0, 1 -> reg1
);

    // 16-bit register 0 using 2-bit registers
    reg [1:0] reg0_set0, reg1_set0, reg2_set0, reg3_set0;
    reg [1:0] reg4_set0, reg5_set0, reg6_set0, reg7_set0;

    // 16-bit register 1 using 2-bit registers
    reg [1:0] reg0_set1, reg1_set1, reg2_set1, reg3_set1;
    reg [1:0] reg4_set1, reg5_set1, reg6_set1, reg7_set1;


    always @(posedge clk) begin 
        if (write) begin
            // Write into register 0
            if (sel == 0) begin
                reg0_set0 <= dataIn[1:0];
                reg1_set0 <= dataIn[3:2];
                reg2_set0 <= dataIn[5:4];
                reg3_set0 <= dataIn[7:6];
                reg4_set0 <= dataIn[9:8];
                reg5_set0 <= dataIn[11:10];
                reg6_set0 <= dataIn[13:12];
                reg7_set0 <= dataIn[15:14];
            end 
            // Write into register 1
            else begin
                reg0_set1 <= dataIn[1:0];
                reg1_set1 <= dataIn[3:2];
                reg2_set1 <= dataIn[5:4];
                reg3_set1 <= dataIn[7:6];
                reg4_set1 <= dataIn[9:8];
                reg5_set1 <= dataIn[11:10];
                reg6_set1 <= dataIn[13:12];
                reg7_set1 <= dataIn[15:14];
            end
        end
    end

    assign dataOut = (sel == 0) ? 
        {reg7_set0, reg6_set0, reg5_set0, reg4_set0, reg3_set0, reg2_set0, reg1_set0, reg0_set0} : 
        {reg7_set1, reg6_set1, reg5_set1, reg4_set1, reg3_set1, reg2_set1, reg1_set1, reg0_set1};

endmodule
