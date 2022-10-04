package Memories

import chisel3._
import chisel3.util.experimental.loadMemoryFromFile
import scala.math.pow

class MemoryIO(XLEN:Int, MDEPTH:Int, INST:Boolean, DATA:Boolean) extends Bundle {
        // Input ports
        val addr: UInt = Input(UInt(MDEPTH.W))

        // - Instruction Memory specific ports
        val stallEn = if (INST) Some(Input(Bool()))
                else None

        // - Data Memory specific ports
        val loadEn  = if (DATA) Some(Input(Bool()))
                else None
        val storeEn = if (DATA) Some(Input(Bool()))
                else None
        val dataIn  = if (DATA) Some(Input(SInt(XLEN.W)))
                else None

        // Output ports
        val out: UInt = Output(UInt(XLEN.W))
}

class MemoryO(XLEN:Int, MDEPTH:Int, INST:Boolean=false, DATA:Boolean=false) extends Module {
        // Initializing IO ports
        val io     : MemoryIO = IO(new MemoryIO(XLEN, MDEPTH, INST, DATA))
        val addr   : UInt     = dontTouch(WireInit(io.addr))
        val stallEn           = if (INST) Some(dontTouch(WireInit(io.stallEn.get)))
                else None
        val loadEn            = if (DATA) Some(dontTouch(WireInit(io.loadEn.get)))
                else None
        val storeEn           = if (DATA) Some(dontTouch(WireInit(io.storeEn.get)))
                else None
        val dataIn            = if (DATA) Some(dontTouch(WireInit(io.dataIn.get)))
                else None
        val memDepth: Int = pow(2, MDEPTH).toInt

        // Initializing instruction memory
        val mem = if (INST) Some(Mem(memDepth, UInt(XLEN.W)))
                else if (DATA) Some(Mem(memDepth, SInt(XLEN.W)))
                else None

        // Instruction Memory: Saving instruction hex from file to memory
        if (INST) Some(loadMemoryFromFile(mem.get, "asm/assembly.hex"))
                else None

        // Data Memory: Saving data to memory
        //if (DATA) when (storeEn.get) {
        //        mem.get.write(addr, dataIn.get)
        //} else None

        // Wiring ports
        // 
        // - Instruction Memory
        if (INST) io.out := Mux(stallEn.get, 0.U, mem.get.read(addr))

        // - Data Memory
        else if (DATA) when (loadEn.get) {
                io.out := mem.get.read(addr)
        } else None
}
