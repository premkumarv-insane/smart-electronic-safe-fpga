onerror {quit -f}
vlib work
vlog -work work failsafe.vo
vlog -work work failsafe.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.failsafe_vlg_vec_tst
vcd file -direction failsafe.msim.vcd
vcd add -internal failsafe_vlg_vec_tst/*
vcd add -internal failsafe_vlg_vec_tst/i1/*
add wave /*
run -all
