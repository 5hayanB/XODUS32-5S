# XODUS32-5S

A 5 stage 32 bit RISC-V I(Base) extension core

## Dependencies

- sbt
- openjdk 18

## Simulation

1. Edit the `assembly.s` file with your own assembly code and place the hex instructions in `hex.txt` in the `simulation` directory. A template file is also given. Follow the pattern for a successful simulation.

2. Before starting the simulation, make sure you're in the root directory of the repository.

```bash
sbt
```

3. The sbt server will be started. To generate the RTL file,

```bash
testOnly Top.TopTest -- -DwriteVcd=1
```

4. A `Top.vcd` file is situated in `test_run_dir/XODUS32_5S/`. Use a vcd file viewer like `gtkwave` to view the RTL.

## ISS Log

A log file in the Spike-ISS format can also be generated.

1. In the `sbt` shell, run

```bash
testOnly Tracer.TracerTopTest -- -DwriteVcd=1
```

2. from the root directory, cd into the `trace` directory and execute `traceGenerator.sh` file.

```bash
cd trace
./traceGenerator.sh
```

3. A CSV file `trace.csv` along with a log file `trace.log` will be generated.

