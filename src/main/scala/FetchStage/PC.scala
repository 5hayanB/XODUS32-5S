package FetchStage

//import scala.math.pow
import chisel3._
//import chisel3.util._
//import chisel3.util.experimental.loadMemoryFromFile

class FetchIO(XLEN:Int, MDEPTH:Int) extends Bundle {
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
        val pcOut    : UInt = Output(UInt(XLEN.W))
        //val instOut : UInt = Output(UInt(XLEN.W))
        val pc4      : UInt = Output(UInt(XLEN.W))
        val npcOut   : UInt = Output(UInt(XLEN.W))
        val stallEn  : Bool = Output(Bool())
        val instAddr : UInt = Output(UInt(MDEPTH.W))
}

class Fetch(XLEN:Int, MDEPTH:Int) extends Module {
        // Initializing IO ports
        val io : Fetch_IO = IO(new Fetch_IO(XLEN))
        //val forwardInst  : Bool     = dontTouch(WireInit(io.forwardInst))
        //val stallUnitInst: UInt     = dontTouch(WireInit(io.stallUnitInst))
        //val stallPC       : UInt     = dontTouch(WireInit(io.stallPC))
        //val forwardPC    : Bool     = dontTouch(WireInit(io.forwardPC))
        //val stallUnitPC  : UInt     = dontTouch(WireInit(io.stallUnitPC))
        //val brEn         : Bool     = dontTouch(WireInit(io.brEn))
        //val jalEn        : Bool     = dontTouch(WireInit(io.jalEn))
        //val imm           : SInt     = dontTouch(WireInit(io.imm))
        //val regFDpc      : UInt     = dontTouch(WireInit(io.regFDpc))
        //val jalrEn       : Bool     = dontTouch(WireInit(io.jalrEn))
        //val jalrPC       : UInt     = dontTouch(WireInit(io.jalrPC))
        
        // Program counter
        val PC: UInt = dontTouch(RegInit(0.U(XLEN.W)))
        
        // Instruction memory
        //val instMem: Mem[UInt] = Mem(pow(2, 16).toInt, UInt(XLEN.W))
        
        // Loading instructions into instruction memory
        //loadMemoryFromFile(instMem, "assembly/assembly.hex")
        
        // Intermediate wires
        val stallEn : Bool = dontTouch(WireInit(io.brEn || io.jalEn || io.jalrEn))
        val pcOut   : UInt = dontTouch(WireInit(Mux(stallEn, 0.U, PC)))
        //val instNum : UInt = dontTouch(WireInit(pcOut(17, 2)))
        val pc4     : UInt = dontTouch(WireInit(pcOut + 4.U))
        //val brJalPC : UInt = dontTouch(WireInit(io.regFDpc + io.imm.asUInt))
        //val instOut : UInt = dontTouch(WireInit(Mux(stallEn, 0.U, instMem.read(instNum))))
        val npc     : UInt = dontTouch(WireInit(MuxCase(pc4, Seq(
                io.forwardPC          -> io.stallUnitPC,
                (io.brEn || io.jalEn) -> io.regFDpc + io.imm.asUInt,
                io.jalrEn             -> io.jalrPC
        ))))

        // Wiring to output ports
        Seq(
                io.pc4, io.instAddr, io.stallEn,
        ) zip Seq(
                pc4, pcOut(32, 2), stallEn
        ) foreach {
                x => x._1 := x._2
        }

        Seq(
                PC, io.npcOut
        ) map (x => x := npc)

        Seq(
                io.pcOut, /*io.instOut,*/
        ) zip Seq(
                (pcOut, io.stallPC), /*(instOut, stallUnitInst),*/
        ) foreach {
                x => x._1 := Mux(io.forwardInst, x._2._2, x._2._1)
        }
}
