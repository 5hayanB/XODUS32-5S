package PipelineRegs

import chisel3._

class RegFDIO(XLEN:Int) extends Bundle {
        // Input ports
        val pcIn  : UInt = Input(UInt(XLEN.W))
        val instIn: UInt = Input(UInt(XLEN.W))
        val pc4In : UInt = Input(UInt(XLEN.W))
        
        // Output ports
        val pcOut  : UInt = Output(UInt(XLEN.W))
        val instOut: UInt = Output(UInt(XLEN.W))
        val pc4Out : UInt = Output(UInt(XLEN.W))
}

class RegFD(XLEN:Int) extends Module {
        // Initializing IO ports
        val io    : RegFDIO = IO(new RegFDIO(XLEN))
        val pcIn  : UInt    = dontTouch(WireInit(io.pcIn))
        val instIn: UInt    = dontTouch(WireInit(io.instIn))
        val pc4In : UInt    = dontTouch(WireInit(io.pc4In))
        
        // Initializing registers
        val pc  : UInt = dontTouch(RegInit(0.U(XLEN.W)))
        val inst: UInt = dontTouch(RegInit(0.U(XLEN.W)))
        val pc4 : UInt = dontTouch(RegInit(0.U(XLEN.W)))
        
        // Intermediate wires
        val pcOut  : UInt = dontTouch(WireInit(pc))
        val instOut: UInt = dontTouch(WireInit(inst))
        val pc4Out : UInt = dontTouch(WireInit(pc4))
        
        // Wiring ports
        Seq(
                // Output ports
                io.pcOut, io.instOut, io.pc4Out,
                
                // Registers
                pc, inst, pc4
        ) zip Seq(
                // Output ports
                pc, inst, pc4,
                
                // Registers
                pcIn, instIn, pc4In
        ) foreach {
                x => x._1 := x._2
        }
}
