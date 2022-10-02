package PipelineRegs

import chisel3._

class RegFDIO(XLEN:Int) extends Bundle {
        // Input pins
        val PCIn  : UInt = Input(UInt(XLEN.W))
        val instIn: UInt = Input(UInt(XLEN.W))
        val PC4In : UInt = Input(UInt(XLEN.W))
        
        // Output pins
        val PCOut  : UInt = Output(UInt(XLEN.W))
        val instOut: UInt = Output(UInt(XLEN.W))
        val PC4Out : UInt = Output(UInt(XLEN.W))
}

class RegFD(XLEN:Int) extends Module {
        // Initializing IO pins
        val io     : RegFDIO = IO(new RegFDIO(XLEN))
        //val PCIn  : UInt     = dontTouch(WireInit(io.PCIn))
        //val instIn: UInt     = dontTouch(WireInit(io.instIn))
        //val PC4In : UInt     = dontTouch(WireInit(io.PC4In))
        
        // Initializing registers
        val PC  : UInt = dontTouch(RegInit(0.U(XLEN.W)))
        val inst: UInt = dontTouch(RegInit(0.U(XLEN.W)))
        val PC4 : UInt = dontTouch(RegInit(0.U(XLEN.W)))
        
        // Intermediate wires
        //val PCOut  : UInt = dontTouch(WireInit(PC))
        //val instOut: UInt = dontTouch(WireInit(inst))
        //val PC4Out : UInt = dontTouch(WireInit(PC4))
        
        // Wiring to output pins
        Seq(
                // Output pins
                io.PCOut, io.instOut, io.PC4Out,
                
                // Registers
                PC,       inst,       PC4
        ) zip Seq(
                // Output pins
                PC,      inst,      PC4,
                
                // Registers
                io.PCIn, io.instIn, io.PC4In
        ) foreach {
                x => x._1 := x._2
        }
}
