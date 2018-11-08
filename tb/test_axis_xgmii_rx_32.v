/*

Copyright (c) 2015-2017 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * Testbench for axis_xgmii_rx_32
 */
module test_axis_xgmii_rx_32;

// Parameters

// Inputs
reg clk = 0;
reg rst = 0;
reg [3:0] current_test = 0;

reg [31:0] xgmii_rxd = 32'h07070707;
reg [3:0] xgmii_rxc = 4'hf;

// Outputs
wire [31:0] m_axis_tdata;
wire [3:0] m_axis_tkeep;
wire m_axis_tvalid;
wire m_axis_tlast;
wire m_axis_tuser;
wire error_bad_frame;
wire error_bad_fcs;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        current_test,
        xgmii_rxd,
        xgmii_rxc
    );
    $to_myhdl(
        m_axis_tdata,
        m_axis_tkeep,
        m_axis_tvalid,
        m_axis_tlast,
        m_axis_tuser,
        error_bad_frame,
        error_bad_fcs
    );

    // dump file
    $dumpfile("test_axis_xgmii_rx_32.lxt");
    $dumpvars(0, test_axis_xgmii_rx_32);
end

axis_xgmii_rx_32
UUT (
    .clk(clk),
    .rst(rst),
    .xgmii_rxd(xgmii_rxd),
    .xgmii_rxc(xgmii_rxc),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tuser(m_axis_tuser),
    .error_bad_frame(error_bad_frame),
    .error_bad_fcs(error_bad_fcs)
);

endmodule
