package FetchStage

import chisel3._
import chisel3.util._

class PCIO(XLEN:Int, MDEPTH:Int) extends Bundle {
        // Input ports
        val forwardInst  : Bool = Input(Bool())
        val stallUnitInst: UInt = Input(UInt(XLEN.W))
        val stallPC      : UInt = Input(UInt(XLEN.W))
        val forwardPC    : Bool = Input(Bool())
        val stallUnitPC  : UInt = Input(UInt(XLEN.W))
        val brEn         : Bool = Input(Bool())
        val jalEn        : Bool = Input(Bool())
        val imm          : SInt = Input(SInt(XLEN.W))
        val regFDpc      : UInt = Input(UInt(XLEN.W))
        val jalrEn       : Bool = Input(Bool())
        val jalrPC       : UInt = Input(UInt(XLEN.W))
        
        // Output ports
        val pcOut      : UInt = Output(UInt(XLEN.W))
        val pc4        : UInt = Output(UInt(XLEN.W))
        val npcOut     : UInt = Output(UInt(XLEN.W))
        val jumpStallEn: Bool = Output(Bool())
        val instAddr   : UInt = Output(UInt(MDEPTH.W))
}

class PC(XLEN:Int, MDEPTH:Int) extends Module {
        // Initializing IO ports
        val io           : PCIO = IO(new PCIO(XLEN, MDEPTH))
        val forwardInst  : Bool = dontTouch(WireInit(io.forwardInst))
        val stallUnitInst: UInt = dontTouch(WireInit(io.stallUnitInst))
        val stallPC      : UInt = dontTouch(WireInit(io.stallPC))
        val forwardPC    : Bool = dontTouch(WireInit(io.forwardPC))
        val stallUnitPC  : UInt = dontTouch(WireInit(io.stallUnitPC))
        val brEn         : Bool = dontTouch(WireInit(io.brEn))
        val jalEn        : Bool = dontTouch(WireInit(io.jalEn))
        val imm          : SInt = dontTouch(WireInit(io.imm))
        val regFDpc      : UInt = dontTouch(WireInit(io.regFDpc))
        val jalrEn       : Bool = dontTouch(WireInit(io.jalrEn))
        val jalrPC       : UInt = dontTouch(WireInit(io.jalrPC))
        
        // Program counter
        val PC: UInt = dontTouch(RegInit(0.U(XLEN.W)))
        
        // Intermediate wires
        val jumpStallEn: Bool = dontTouch(WireInit(brEn || jalEn || jalrEn))
        val pcOut      : UInt = dontTouch(WireInit(Mux(jumpStallEn, 0.U, PC)))
        val pc4        : UInt = dontTouch(WireInit(pcOut + 4.U))
        val npc        : UInt = dontTouch(WireInit(MuxCase(pc4, Seq(
                forwardPC       -> stallUnitPC,
                (brEn || jalEn) -> (regFDpc + imm.asUInt),
                jalrEn          -> jalrPC
        ))))

        // Wiring ports
        Seq(
                io.pc4, io.instAddr, io.jumpStallEn,
        ) zip Seq(
                pc4, pcOut(31, 2), jumpStallEn
        ) foreach {
                x => x._1 := x._2
        }

        Seq(
                PC, io.npcOut
        ) map (x => x := npc)

        Seq(
                io.pcOut, /*io.instOut,*/
        ) zip Seq(
                (pcOut, stallPC), /*(instOut, stallUnitInst),*/
        ) foreach {
                x => x._1 := Mux(forwardInst, x._2._2, x._2._1)
        }
}
