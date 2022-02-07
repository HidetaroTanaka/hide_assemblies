import chisel3._
import chiseltest._
import chiseltest.ChiselScalatestTester
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.must.Matchers

class BlackBoxInlineRTLTester extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Josef Stalin"
  it should "purge everyone" in {
    test(new BlackBoxInlineRTL).withAnnotations(Seq(VerilatorBackendAnnotation)) { c =>
      c.io.in1.poke("h13".U)
      c.io.in2.poke("h26".U)
      println(c.io.out.peek())
    }
  }

}
