quit -sim

#vdel -all -lib riscv
#vlib riscv
#vmap riscv riscv

#vdel -all -lib soc
#vlib soc
#vmap riscv soc

#project compileall

vsim -novopt soc.tb_system

do wave_system.do

run 120 ns




mem load -i I0.mem      /tb_system/DUT/I0/tab

add mem /tb_system/DUT/I0/tab     -a hexadecimal  -d hexadecimal -wo 1

run 1000 ns 