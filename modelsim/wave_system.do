onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider System
add wave -noupdate /tb_system/DUT/reset
add wave -noupdate /tb_system/DUT/clk
add wave -noupdate /tb_system/DUT/enable
add wave -noupdate /tb_system/DUT/CPU_IAddr
add wave -noupdate /tb_system/DUT/CPU_IData
add wave -noupdate /tb_system/DUT/CPU_DBE
add wave -noupdate /tb_system/DUT/CPU_DAddr
add wave -noupdate /tb_system/DUT/CPU_DWrite
add wave -noupdate /tb_system/DUT/CPU_DData_out
add wave -noupdate /tb_system/DUT/CPU_DData_in
add wave -noupdate /tb_system/DUT/D0_Data_out
add wave -noupdate /tb_system/DUT/D1_Data_out
add wave -noupdate /tb_system/DUT/CS_D0
add wave -noupdate /tb_system/DUT/CS_D1
add wave -noupdate /tb_system/DUT/CS
add wave -noupdate /tb_system/DUT/D1_RnW
add wave -noupdate /tb_system/DUT/CPU_IAddr_Modelsim
add wave -noupdate /tb_system/DUT/CPU_DAddr_Modelsim
add wave -noupdate -divider CPU
add wave -noupdate /tb_system/DUT/CPU/reset
add wave -noupdate /tb_system/DUT/CPU/clk
add wave -noupdate /tb_system/DUT/CPU/enable
add wave -noupdate /tb_system/DUT/CPU/IAddr
add wave -noupdate /tb_system/DUT/CPU/IData
add wave -noupdate /tb_system/DUT/CPU/DBE
add wave -noupdate /tb_system/DUT/CPU/DAddr
add wave -noupdate /tb_system/DUT/CPU/DWrite
add wave -noupdate /tb_system/DUT/CPU/DData_out
add wave -noupdate /tb_system/DUT/CPU/DData_in
add wave -noupdate /tb_system/DUT/CPU/decoded_inst
add wave -noupdate /tb_system/DUT/CPU/PC
add wave -noupdate /tb_system/DUT/CPU/NPC
add wave -noupdate /tb_system/DUT/CPU/inst
add wave -noupdate /tb_system/DUT/CPU/rs1a
add wave -noupdate /tb_system/DUT/CPU/rs1d
add wave -noupdate /tb_system/DUT/CPU/rs2a
add wave -noupdate /tb_system/DUT/CPU/rs2d
add wave -noupdate /tb_system/DUT/CPU/rda
add wave -noupdate /tb_system/DUT/CPU/rdd
add wave -noupdate /tb_system/DUT/CPU/rdd_select
add wave -noupdate /tb_system/DUT/CPU/immI
add wave -noupdate /tb_system/DUT/CPU/immS
add wave -noupdate /tb_system/DUT/CPU/immB
add wave -noupdate /tb_system/DUT/CPU/immU
add wave -noupdate /tb_system/DUT/CPU/immJ
add wave -noupdate /tb_system/DUT/CPU/reg_write
add wave -noupdate /tb_system/DUT/CPU/PCrs1d_select
add wave -noupdate /tb_system/DUT/CPU/PCrs1d
add wave -noupdate /tb_system/DUT/CPU/imm4BJI_select
add wave -noupdate /tb_system/DUT/CPU/imm4BJI
add wave -noupdate /tb_system/DUT/CPU/A_select
add wave -noupdate /tb_system/DUT/CPU/A
add wave -noupdate /tb_system/DUT/CPU/B_select
add wave -noupdate /tb_system/DUT/CPU/B
add wave -noupdate /tb_system/DUT/CPU/op
add wave -noupdate /tb_system/DUT/CPU/C
add wave -noupdate /tb_system/DUT/CPU/BE
add wave -noupdate /tb_system/DUT/CPU/data_out
add wave -noupdate /tb_system/DUT/CPU/data_in
add wave -noupdate /tb_system/DUT/CPU/data_in1
add wave -noupdate /tb_system/DUT/CPU/data_write
add wave -noupdate /tb_system/DUT/CPU/result
add wave -noupdate /tb_system/DUT/CPU/addr
add wave -noupdate /tb_system/DUT/CPU/U3/op
add wave -noupdate /tb_system/DUT/CPU/U3/a
add wave -noupdate /tb_system/DUT/CPU/U3/b
add wave -noupdate /tb_system/DUT/CPU/U3/c
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {132 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 221
configure wave -valuecolwidth 145
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1166 ns}
