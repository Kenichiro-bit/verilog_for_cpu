module FizzBuzz(
    input [7:0] n,
    output fizz,
    output buzz
);

    assign fizz = (n % 3) == 0 ? 1'b1 : 1'b0;
    assign buzz = (n % 5) == 0 ? 1'b1 : 1'b0;
endmodule

module FizzBuzzTest();
    logic [7:0] n; 
    logic fizz, buzz;

    FizzBuzz dut(n, fizz, buzz);

    initial begin
        $dumpfile("fizzbuzz.vcd");
        $dumpvars(0, dut);

        for (n = 1; n < 30; n = n + 1) begin
            #10
            $display("n: %d, fizz: %d, buzz: %d", n, fizz, buzz);
        end
    end    
endmodule
