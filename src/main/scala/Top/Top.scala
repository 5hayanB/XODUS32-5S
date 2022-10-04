package Top

import chisel3._
import ParamsAndConsts._
import Core._
import Memories._
import Temp._

class Top extends Module {
        // Initializing modules
        val core   : Core   = Module(new Core(Params.XLEN, Params.MDEPTH))
        val instMem: MemoryO = Module(new MemoryO(Params.XLEN, Params.MDEPTH, INST=true))
        val dataMem: DataMem = Module(new DataMem)

        // Wiring the modules
        Seq(
                // Instruction Memory
                instMem.io.addr, instMem.io.stallEn.get,

                // Data Memory
                dataMem.io.addr, dataMem.io.dataIn, dataMem.io.storeEn, dataMem.io.loadEn,

                // Core
                core.io.instHex, core.io.dataIn
        ) zip Seq(
                // Instruction Memory
                core.io.instAddr, core.io.instStallEn,

                // Data Memory
                core.io.dataAddr, core.io.dataOut, core.io.storeEn, core.io.loadEn,

                // Core
                instMem.io.out, dataMem.io.out
        ) foreach {
                x => x._1 := x._2
        }
}
