# Converting C program to elf format
while getopts f:b: flag
do
        case "${flag}" in
                f) c_file=${OPTARG};;
                b) obj_file=${OPTARG};;
        esac
done
riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32i -o ../tests/$obj_file ../tests/$c_file
riscv64-unknown-elf-objdump -d ../tests/$obj_file > ../scripts/test.s

# Generating hex file
python ../scripts/assemblyParser.py

# Generating trace file
echo "Generating trace..."
cd ../
sbt "testOnly Tracer.TracerTopTest -- -DwriteVcd=1" > ./trace/trace.log
cd trace
echo "Trace successfully generated"

# Generating CSV file
echo "Generating CSV..."
python toCSV.py
echo "CSV generated successfully"

