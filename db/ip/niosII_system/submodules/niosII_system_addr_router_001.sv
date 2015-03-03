// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/12.1sp1/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2012/10/10 $
// $Author: swbranch $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module niosII_system_addr_router_001_default_decode
  #(
     parameter DEFAULT_CHANNEL = 1,
               DEFAULT_DESTID = 1 
   )
  (output [89 - 85 : 0] default_destination_id,
   output [24-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[89 - 85 : 0];
  generate begin : default_decode
    if (DEFAULT_CHANNEL == -1)
      assign default_src_channel = '0;
    else
      assign default_src_channel = 24'b1 << DEFAULT_CHANNEL;
  end
  endgenerate

endmodule


module niosII_system_addr_router_001
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [100-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [100-1    : 0] src_data,
    output reg [24-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 56;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 89;
    localparam PKT_DEST_ID_L = 85;
    localparam ST_DATA_W = 100;
    localparam ST_CHANNEL_W = 24;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 59;
    localparam PKT_TRANS_READ  = 60;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;




    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h100000 - 64'h80000);
    localparam PAD1 = log2ceil(64'h108000 - 64'h104000);
    localparam PAD2 = log2ceil(64'h109000 - 64'h108800);
    localparam PAD3 = log2ceil(64'h109020 - 64'h109000);
    localparam PAD4 = log2ceil(64'h109030 - 64'h109020);
    localparam PAD5 = log2ceil(64'h109038 - 64'h109030);
    localparam PAD6 = log2ceil(64'h109040 - 64'h109038);
    localparam PAD7 = log2ceil(64'h109048 - 64'h109040);
    localparam PAD8 = log2ceil(64'h109050 - 64'h109048);
    localparam PAD9 = log2ceil(64'h109058 - 64'h109050);
    localparam PAD10 = log2ceil(64'h109060 - 64'h109058);
    localparam PAD11 = log2ceil(64'h109068 - 64'h109060);
    localparam PAD12 = log2ceil(64'h109070 - 64'h109068);
    localparam PAD13 = log2ceil(64'h109078 - 64'h109070);
    localparam PAD14 = log2ceil(64'h109080 - 64'h109078);
    localparam PAD15 = log2ceil(64'h109081 - 64'h109080);
    localparam PAD16 = log2ceil(64'h109082 - 64'h109081);
    localparam PAD17 = log2ceil(64'h109083 - 64'h109082);
    localparam PAD18 = log2ceil(64'h109084 - 64'h109083);
    localparam PAD19 = log2ceil(64'h109085 - 64'h109084);
    localparam PAD20 = log2ceil(64'h109086 - 64'h109085);
    localparam PAD21 = log2ceil(64'h109087 - 64'h109086);
    localparam PAD22 = log2ceil(64'h109088 - 64'h109087);
    localparam PAD23 = log2ceil(64'h109089 - 64'h109088);
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h109089;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;
    localparam RG = RANGE_ADDR_WIDTH-1;

      wire [PKT_ADDR_W-1 : 0] address = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;

    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [24-1 : 0] default_src_channel;




    niosII_system_addr_router_001_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_src_channel (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;
        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

        // ( 0x80000 .. 0x100000 )
        if ( {address[RG:PAD0],{PAD0{1'b0}}} == 21'h80000 ) begin
            src_channel = 24'b000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // ( 0x104000 .. 0x108000 )
        if ( {address[RG:PAD1],{PAD1{1'b0}}} == 21'h104000 ) begin
            src_channel = 24'b000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // ( 0x108800 .. 0x109000 )
        if ( {address[RG:PAD2],{PAD2{1'b0}}} == 21'h108800 ) begin
            src_channel = 24'b000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // ( 0x109000 .. 0x109020 )
        if ( {address[RG:PAD3],{PAD3{1'b0}}} == 21'h109000 ) begin
            src_channel = 24'b000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // ( 0x109020 .. 0x109030 )
        if ( {address[RG:PAD4],{PAD4{1'b0}}} == 21'h109020 ) begin
            src_channel = 24'b000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // ( 0x109030 .. 0x109038 )
        if ( {address[RG:PAD5],{PAD5{1'b0}}} == 21'h109030 ) begin
            src_channel = 24'b000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
        end

        // ( 0x109038 .. 0x109040 )
        if ( {address[RG:PAD6],{PAD6{1'b0}}} == 21'h109038 ) begin
            src_channel = 24'b000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
        end

        // ( 0x109040 .. 0x109048 )
        if ( {address[RG:PAD7],{PAD7{1'b0}}} == 21'h109040 ) begin
            src_channel = 24'b000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
        end

        // ( 0x109048 .. 0x109050 )
        if ( {address[RG:PAD8],{PAD8{1'b0}}} == 21'h109048 ) begin
            src_channel = 24'b000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
        end

        // ( 0x109050 .. 0x109058 )
        if ( {address[RG:PAD9],{PAD9{1'b0}}} == 21'h109050 ) begin
            src_channel = 24'b000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
        end

        // ( 0x109058 .. 0x109060 )
        if ( {address[RG:PAD10],{PAD10{1'b0}}} == 21'h109058 ) begin
            src_channel = 24'b000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // ( 0x109060 .. 0x109068 )
        if ( {address[RG:PAD11],{PAD11{1'b0}}} == 21'h109060 ) begin
            src_channel = 24'b000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // ( 0x109068 .. 0x109070 )
        if ( {address[RG:PAD12],{PAD12{1'b0}}} == 21'h109068 ) begin
            src_channel = 24'b000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // ( 0x109070 .. 0x109078 )
        if ( {address[RG:PAD13],{PAD13{1'b0}}} == 21'h109070 ) begin
            src_channel = 24'b000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // ( 0x109078 .. 0x109080 )
        if ( {address[RG:PAD14],{PAD14{1'b0}}} == 21'h109078 ) begin
            src_channel = 24'b000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // ( 0x109080 .. 0x109081 )
        if ( {address[RG:PAD15],{PAD15{1'b0}}} == 21'h109080 ) begin
            src_channel = 24'b100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
        end

        // ( 0x109081 .. 0x109082 )
        if ( {address[RG:PAD16],{PAD16{1'b0}}} == 21'h109081 ) begin
            src_channel = 24'b010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
        end

        // ( 0x109082 .. 0x109083 )
        if ( {address[RG:PAD17],{PAD17{1'b0}}} == 21'h109082 ) begin
            src_channel = 24'b001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
        end

        // ( 0x109083 .. 0x109084 )
        if ( {address[RG:PAD18],{PAD18{1'b0}}} == 21'h109083 ) begin
            src_channel = 24'b000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
        end

        // ( 0x109084 .. 0x109085 )
        if ( {address[RG:PAD19],{PAD19{1'b0}}} == 21'h109084 ) begin
            src_channel = 24'b000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
        end

        // ( 0x109085 .. 0x109086 )
        if ( {address[RG:PAD20],{PAD20{1'b0}}} == 21'h109085 ) begin
            src_channel = 24'b000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
        end

        // ( 0x109086 .. 0x109087 )
        if ( {address[RG:PAD21],{PAD21{1'b0}}} == 21'h109086 ) begin
            src_channel = 24'b000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // ( 0x109087 .. 0x109088 )
        if ( {address[RG:PAD22],{PAD22{1'b0}}} == 21'h109087 ) begin
            src_channel = 24'b000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // ( 0x109088 .. 0x109089 )
        if ( {address[RG:PAD23],{PAD23{1'b0}}} == 21'h109088 ) begin
            src_channel = 24'b000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


