package InstMem

import chisel3._
import chisel3.util.experimental.loadMemoryFromFile
import scala.math.pow

class InstMemIO(XLEN:Int, MDEPTH:Int) extends Bundle {
        // Input ports
        val instAddr: UInt = Input(UInt(MDEPTH.W))
        val stallEn : Bool = Input(Bool())

        // Output ports
        val instOut: UInt = Output(UInt(XLEN.W))
}

class InstMem(XLEN:Int, MDEPTH:Int) extends Module {
        // Initializing IO ports
        val io: InstMemIO = IO(new InstMemIO(XLEN, MDEPTH))

        // Initializing instruction memory
        val instMem: Mem[UInt] = Mem(pow(2, MDEPTH), UInt(XLEN.W))

        // Loading instruction hex from file
        loadMemoryFromFile(instMem, "assembly/assembly.hex")

        // Wiring to output ports
        io.instOut := Mux(io.stallEn, 0.U, instMem.read(io.instAddr))
}
