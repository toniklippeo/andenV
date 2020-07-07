create_project andenV ./build/andenV -part xc7a35ticsg324-1L
set_property board_part digilentinc.com:arty-a7-35:part0:1.0 [current_project]
add_files -norecurse -scan_for_includes ./rtl/core/defines.sv 
add_files -norecurse -scan_for_includes	./rtl/core/alu.sv
