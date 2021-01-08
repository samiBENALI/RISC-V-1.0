quit -sim

vdel -all -lib RISCV
vlib RISCV
vmap RISCV RISCV

project compileall

vsim -novopt RISCV.tb_controller

do wave_controller.do

run 100 ns
