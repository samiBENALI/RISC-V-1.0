quit -sim

vdel -all -lib RISCV
vlib RISCV
vmap RISCV RISCV

project compileall

vsim -novopt RISCV.tb_alu

do wave_alu.do

run 100 ns


