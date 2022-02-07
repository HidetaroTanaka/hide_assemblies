import chisel3._
import chisel3.util._

class BlackBoxAdd(bits: Int) extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle{
    val in1 = Input(UInt(bits.W))
    val in2 = Input(UInt(bits.W))
    val out = Output(UInt((bits+1).W))
  })

  setInline("BlackBoxAdd.v",
    s"""
       |module BlackBoxAdd (
       |    input wire [${bits-1}:0] in1,
       |    input wire [${bits-1}:0] in2,
       |    output wire [$bits:0] out
       |    );
       |
       |    assign out = in1 + in2;
       |endmodule
       |""".stripMargin
  )
}

class BlackBoxInlineRTL extends Module {
  val io = IO(new Bundle{
    val in1 = Input(UInt(8.W))
    val in2 = Input(UInt(8.W))
    val out = Output(UInt(9.W))
  })

  val m_bb_add = Module(new BlackBoxAdd(8))

  m_bb_add.io <> io
}

object convertBlackBoxInlineRTL extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new BlackBoxInlineRTL)
}