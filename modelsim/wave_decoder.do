onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_decoder/uut/inst
add wave -noupdate /tb_decoder/uut/rs1a
add wave -noupdate /tb_decoder/uut/rs2a
add wave -noupdate /tb_decoder/uut/rda
add wave -noupdate /tb_decoder/uut/immI
add wave -noupdate /tb_decoder/uut/immS
add wave -noupdate /tb_decoder/uut/immB
add wave -noupdate /tb_decoder/uut/immU
add wave -noupdate /tb_decoder/uut/immJ
add wave -noupdate /tb_decoder/uut/sign31_11
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {60 ns}
