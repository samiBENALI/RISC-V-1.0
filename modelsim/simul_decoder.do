quit -sim

vdel -all -lib RISCV
vlib RISCV
vmap RISCV RISCV

project compileall

vsim -novopt RISCV.tb_decoder

do wave_decoder.do

run 100 ns
