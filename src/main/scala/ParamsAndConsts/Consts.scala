package Constants

import chisel3._

object Consts {
        // Opcodes
        val R: Map[String, UInt] = Map(
                "math" -> "b0110011".U/*,
                "mathw" -> "b0".U*/
        )
        val S: UInt              = "b0100011".U
        val B: UInt              = "b1100011".U
        val J: UInt              = "b1101111".U
        val I: Map[String, UInt] = Map(
                "math"  -> "b0010011".U,
                "load"  -> "b0000011".U,
                "fence" -> "b0001111".U,
                "mathw" -> "b0011011".U,
                "jalr"  -> "b1100111".U,
                "csr"   -> "b1110011".U
        )
        val U: Map[String, UInt] = Map(
                "auipc" -> "b0010111".U,
                "lui"   -> "b0110111".U
        )
}
