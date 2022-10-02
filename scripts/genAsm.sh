while getopts b:f: flag
do
        case "${flag}" in
                b) obj_file=${OPTARG};;
                f) c_file=${OPTARG};;
        esac
done
riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32i -o $obj_file $c_file;
riscv64-unknown-elf-objdump -d $obj_file > test.s;
