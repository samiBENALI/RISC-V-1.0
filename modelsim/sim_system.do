quit -sim

#vdel -all -lib riscv
#vlib riscv
#vmap riscv riscv

#vdel -all -lib soc
#vlib soc
#vmap riscv soc

project compileall

vsim -novopt soc.tb_system

do wave1.do

run 120 ns

#mem load -i RegBank.mem /tb_system/DUT/CPU/RegBank1/tab

mem load -i I0.mem      /tb_system/DUT/I0/tab
mem load -i D0.mem      /tb_system/DUT/D0/tab

#add mem /tb_system/DUT/CPU/RegBank1/tab -a decimal      -d hexadecimal -wo 1
add mem /tb_system/DUT/I0/tab     -a hexadecimal  -d hexadecimal -wo 1
add mem /tb_system/DUT/D0/tab     -a hexadecimal  -d hexadecimal -wo 1
run 4000 ns 