# verilog_for_cpu
FPGAでCPUを実装するための基礎固め

# 記法と例

verilogファイルは拡張子が.v

## counter.v
```
module counter(
  input wire clk,  //入力を記述
  input wire rst,
  output reg [3:0] cout　//出力を記述、またバス幅も
);

always @(posedge clk or posedge rst) begin //clkの立ち上がりに合わせてカウント
    if (rst)
        count <= 4'b0000;
    else
        count <= count + 1;　
end

endmodule
```

## tb_counter.v
```
`timescale 1ns / 1ps // timescaleを記述
module tb_counter();　// テストベンチモジュールの定義、ポートは持たない

reg clk; // reg：テストベンチ内で自分が操作する信号
reg rst; 
wire [3:0] count; // wire:DUTから出てくる信号

// DUT (Device Under Test)
counter uut ( //ここでcounter.vの中身を呼び出している。uut -> Unit Under test
    .clk(clk),
    .rst(rst),
    .count(count)
);

// クロック生成（10ns周期 = 100MHz）
always #5 clk = ~clk;

initial begin
    $dumpfile("counter.vcd");  // 波形出力ファイル
    $dumpvars(0, tb_counter);

    // 初期化
    clk = 0;
    rst = 1;
    #20;
    rst = 0;

    // しばらく動かす
    #200;

    // 終了
    $finish;
end

endmodule

```
