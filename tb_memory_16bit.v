`timescale 1ns/1ps // Define time unit and precision
module tb_memory_16bit;

    wire [15:0] dataOut;
    reg [15:0] dataIn;
    reg sel;
    reg write;
    reg clk; 

    memory memory_instance(   
        .dataOut(dataOut), 
        .dataIn(dataIn), 
        .sel(sel), 
        .write(write), 
        .clk(clk)
    ); 

    initial begin
      clk = 0;
      forever #5 clk = ~clk // Toggle clock every 5 time units
    end 

    initial begin
        $dumpfile("memory_16bit_wave.vcd");   // VCD file where the simulation data will be written.
        $dumpvars(0, tb_memory_16bit);  /*This VCD file records the values of specified signals and 
                                        variables over time during a simulation, 
                                        enabling waveform viewing and debugging. */
        
        // Write to reg 0
        write = 1;
        sel = 0; 
        dataIn = 16'h1234;
        #10;

        // Write to reg 1
        sel = 1;
        dataIn = 16'hABCD;
        #10;

        // Disable write, read back reg 0
        write = 0;
        sel = 0;
        #10;

        // Read back reg 1
        sel = 1;
        #10;

        // Stop simulation
        $stop;
    end 

endmodule