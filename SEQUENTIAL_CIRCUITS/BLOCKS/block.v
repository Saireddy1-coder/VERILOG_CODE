//===TESTING BEHAVIOUR OF BLOCKS WITH UNEXPECTED CONDITIONS===//
module tb;
    reg a, b, c, d;    // for Block 1
    reg p, q, r, s;    // for Block 2

    initial begin
        // Initialize all
        a = 0; b = 0; c = 0; d = 0;
        p = 0; q = 0; r = 0; s = 0;

        // Monitor prints whenever any signal changes
        $monitor("t=%0t | a=%0b b=%0b c=%0b d=%0b | p=%0b q=%0b r=%0b s=%0b",
                  $time, a, b, c, d, p, q, r, s);

        // =============================================
        // BLOCK 1: begin-end inside fork-join
        // =============================================
        $display("--- Block 1 Start (fork-join) at t=%0t ---", $time);

        fork

            begin                  // Thread 1
                a = 1;
                #5;
                b = 1;
            end
                                  // Thread 2
                c = 1;
                #10;
                d = 1;

        join

        $display("--- Block 1 End (fork-join) at t=%0t ---", $time);


        // =============================================
        // BLOCK 2: NBA with intra-assignment delays
        // =============================================
        $display("--- Block 2 Start (NBA delays) at t=%0t ---", $time);

        begin
            p <= #10 1;
            q <= #20 1;
            r <= #5  1;
            s <= #15 1;
        end

        // Wait enough time for all NBAs to complete
        #25;

        $display("--- Block 2 End (NBA delays) at t=%0t ---", $time);
    end

endmodule
