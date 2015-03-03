# TCL File Generated by Component Editor 12.1sp1
# Sun Mar 01 15:50:00 MST 2015
# DO NOT MODIFY


# 
# WaveformGenerator "WaveformGenerator" v1.0
# null 2015.03.01.15:50:00
# 
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module WaveformGenerator
# 
set_module_property NAME WaveformGenerator
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME WaveformGenerator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL WaveformGenerator
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file WaveformGenerator.vhd VHDL PATH ourVHDL/WaveformGenerator.vhd
add_fileset_file VoiceGenerator.vhd VHDL PATH ourVHDL/VoiceGenerator.vhd
add_fileset_file Oscillator.vhd VHDL PATH ourVHDL/Oscillator.vhd
add_fileset_file SinLut.vhd VHDL PATH ourVHDL/SinLut.vhd
add_fileset_file WaveformGeneratorPackage.vhd VHDL PATH ourVHDL/WaveformGeneratorPackage.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock_sink
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset_n reset_n Input 1


# 
# connection point phase_increments_voice0
# 
add_interface phase_increments_voice0 avalon end
set_interface_property phase_increments_voice0 addressUnits WORDS
set_interface_property phase_increments_voice0 associatedClock clock_sink
set_interface_property phase_increments_voice0 associatedReset reset
set_interface_property phase_increments_voice0 bitsPerSymbol 8
set_interface_property phase_increments_voice0 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice0 burstcountUnits WORDS
set_interface_property phase_increments_voice0 explicitAddressSpan 0
set_interface_property phase_increments_voice0 holdTime 0
set_interface_property phase_increments_voice0 linewrapBursts false
set_interface_property phase_increments_voice0 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice0 readLatency 0
set_interface_property phase_increments_voice0 readWaitTime 1
set_interface_property phase_increments_voice0 setupTime 0
set_interface_property phase_increments_voice0 timingUnits Cycles
set_interface_property phase_increments_voice0 writeWaitTime 0
set_interface_property phase_increments_voice0 ENABLED true

add_interface_port phase_increments_voice0 avs_writedata_phase_increments_voice0 writedata Input 64
add_interface_port phase_increments_voice0 avs_write_n_phase_increments_voice0 write_n Input 1
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point phase_increments_voice1
# 
add_interface phase_increments_voice1 avalon end
set_interface_property phase_increments_voice1 addressUnits WORDS
set_interface_property phase_increments_voice1 associatedClock clock_sink
set_interface_property phase_increments_voice1 associatedReset reset
set_interface_property phase_increments_voice1 bitsPerSymbol 8
set_interface_property phase_increments_voice1 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice1 burstcountUnits WORDS
set_interface_property phase_increments_voice1 explicitAddressSpan 0
set_interface_property phase_increments_voice1 holdTime 0
set_interface_property phase_increments_voice1 linewrapBursts false
set_interface_property phase_increments_voice1 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice1 readLatency 0
set_interface_property phase_increments_voice1 readWaitTime 1
set_interface_property phase_increments_voice1 setupTime 0
set_interface_property phase_increments_voice1 timingUnits Cycles
set_interface_property phase_increments_voice1 writeWaitTime 0
set_interface_property phase_increments_voice1 ENABLED true

add_interface_port phase_increments_voice1 avs_writedata_phase_increments_voice1 writedata Input 64
add_interface_port phase_increments_voice1 avs_write_n_phase_increments_voice1 write_n Input 1
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point phase_increments_voice2
# 
add_interface phase_increments_voice2 avalon end
set_interface_property phase_increments_voice2 addressUnits WORDS
set_interface_property phase_increments_voice2 associatedClock clock_sink
set_interface_property phase_increments_voice2 associatedReset reset
set_interface_property phase_increments_voice2 bitsPerSymbol 8
set_interface_property phase_increments_voice2 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice2 burstcountUnits WORDS
set_interface_property phase_increments_voice2 explicitAddressSpan 0
set_interface_property phase_increments_voice2 holdTime 0
set_interface_property phase_increments_voice2 linewrapBursts false
set_interface_property phase_increments_voice2 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice2 readLatency 0
set_interface_property phase_increments_voice2 readWaitTime 1
set_interface_property phase_increments_voice2 setupTime 0
set_interface_property phase_increments_voice2 timingUnits Cycles
set_interface_property phase_increments_voice2 writeWaitTime 0
set_interface_property phase_increments_voice2 ENABLED true

add_interface_port phase_increments_voice2 avs_writedata_phase_increments_voice2 writedata Input 64
add_interface_port phase_increments_voice2 avs_write_n_phase_increments_voice2 write_n Input 1
set_interface_assignment phase_increments_voice2 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice2 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice2 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice2 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice0
# 
add_interface note_end_voice0 avalon end
set_interface_property note_end_voice0 addressUnits WORDS
set_interface_property note_end_voice0 associatedClock clock_sink
set_interface_property note_end_voice0 associatedReset reset
set_interface_property note_end_voice0 bitsPerSymbol 8
set_interface_property note_end_voice0 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice0 burstcountUnits WORDS
set_interface_property note_end_voice0 explicitAddressSpan 0
set_interface_property note_end_voice0 holdTime 0
set_interface_property note_end_voice0 linewrapBursts false
set_interface_property note_end_voice0 maximumPendingReadTransactions 0
set_interface_property note_end_voice0 readLatency 0
set_interface_property note_end_voice0 readWaitTime 1
set_interface_property note_end_voice0 setupTime 0
set_interface_property note_end_voice0 timingUnits Cycles
set_interface_property note_end_voice0 writeWaitTime 0
set_interface_property note_end_voice0 ENABLED true

add_interface_port note_end_voice0 avs_writedata_note_end_voice0 writedata Input 8
add_interface_port note_end_voice0 avs_write_n_note_end_voice0 write_n Input 1
set_interface_assignment note_end_voice0 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice1
# 
add_interface note_end_voice1 avalon end
set_interface_property note_end_voice1 addressUnits WORDS
set_interface_property note_end_voice1 associatedClock clock_sink
set_interface_property note_end_voice1 associatedReset reset
set_interface_property note_end_voice1 bitsPerSymbol 8
set_interface_property note_end_voice1 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice1 burstcountUnits WORDS
set_interface_property note_end_voice1 explicitAddressSpan 0
set_interface_property note_end_voice1 holdTime 0
set_interface_property note_end_voice1 linewrapBursts false
set_interface_property note_end_voice1 maximumPendingReadTransactions 0
set_interface_property note_end_voice1 readLatency 0
set_interface_property note_end_voice1 readWaitTime 1
set_interface_property note_end_voice1 setupTime 0
set_interface_property note_end_voice1 timingUnits Cycles
set_interface_property note_end_voice1 writeWaitTime 0
set_interface_property note_end_voice1 ENABLED true

add_interface_port note_end_voice1 avs_writedata_note_end_voice1 writedata Input 8
add_interface_port note_end_voice1 avs_write_n_note_end_voice1 write_n Input 1
set_interface_assignment note_end_voice1 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice2
# 
add_interface note_end_voice2 avalon end
set_interface_property note_end_voice2 addressUnits WORDS
set_interface_property note_end_voice2 associatedClock clock_sink
set_interface_property note_end_voice2 associatedReset reset
set_interface_property note_end_voice2 bitsPerSymbol 8
set_interface_property note_end_voice2 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice2 burstcountUnits WORDS
set_interface_property note_end_voice2 explicitAddressSpan 0
set_interface_property note_end_voice2 holdTime 0
set_interface_property note_end_voice2 linewrapBursts false
set_interface_property note_end_voice2 maximumPendingReadTransactions 0
set_interface_property note_end_voice2 readLatency 0
set_interface_property note_end_voice2 readWaitTime 1
set_interface_property note_end_voice2 setupTime 0
set_interface_property note_end_voice2 timingUnits Cycles
set_interface_property note_end_voice2 writeWaitTime 0
set_interface_property note_end_voice2 ENABLED true

add_interface_port note_end_voice2 avs_writedata_note_end_voice2 writedata Input 8
add_interface_port note_end_voice2 avs_write_n_note_end_voice2 write_n Input 1
set_interface_assignment note_end_voice2 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice2 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice2 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice2 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point wave_shapes
# 
add_interface wave_shapes avalon end
set_interface_property wave_shapes addressUnits WORDS
set_interface_property wave_shapes associatedClock clock_sink
set_interface_property wave_shapes associatedReset reset
set_interface_property wave_shapes bitsPerSymbol 8
set_interface_property wave_shapes burstOnBurstBoundariesOnly false
set_interface_property wave_shapes burstcountUnits WORDS
set_interface_property wave_shapes explicitAddressSpan 0
set_interface_property wave_shapes holdTime 0
set_interface_property wave_shapes linewrapBursts false
set_interface_property wave_shapes maximumPendingReadTransactions 0
set_interface_property wave_shapes readLatency 0
set_interface_property wave_shapes readWaitTime 1
set_interface_property wave_shapes setupTime 0
set_interface_property wave_shapes timingUnits Cycles
set_interface_property wave_shapes writeWaitTime 0
set_interface_property wave_shapes ENABLED true

add_interface_port wave_shapes avs_writedata_wave_shapes writedata Input 8
add_interface_port wave_shapes avs_write_n_wave_shapes write_n Input 1
set_interface_assignment wave_shapes embeddedsw.configuration.isFlash 0
set_interface_assignment wave_shapes embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment wave_shapes embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment wave_shapes embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true

add_interface_port clock_sink csi_clk50 clk Input 1


# 
# connection point clock_sink_1
# 
add_interface clock_sink_1 clock end
set_interface_property clock_sink_1 clockRate 0
set_interface_property clock_sink_1 ENABLED true

add_interface_port clock_sink_1 csi_clk12 clk Input 1


# 
# connection point waveform_left
# 
add_interface waveform_left avalon_streaming start
set_interface_property waveform_left associatedClock clock_sink_1
set_interface_property waveform_left associatedReset reset
set_interface_property waveform_left dataBitsPerSymbol 8
set_interface_property waveform_left errorDescriptor ""
set_interface_property waveform_left firstSymbolInHighOrderBits true
set_interface_property waveform_left maxChannel 0
set_interface_property waveform_left readyLatency 0
set_interface_property waveform_left ENABLED true

add_interface_port waveform_left aso_data_waveform_left data Output 16
add_interface_port waveform_left aso_valid_waveform_left valid Output 1
add_interface_port waveform_left aso_ready_waveform_left ready Input 1


# 
# connection point waveform_right
# 
add_interface waveform_right avalon_streaming start
set_interface_property waveform_right associatedClock clock_sink_1
set_interface_property waveform_right associatedReset reset
set_interface_property waveform_right dataBitsPerSymbol 8
set_interface_property waveform_right errorDescriptor ""
set_interface_property waveform_right firstSymbolInHighOrderBits true
set_interface_property waveform_right maxChannel 0
set_interface_property waveform_right readyLatency 0
set_interface_property waveform_right ENABLED true

add_interface_port waveform_right aso_data_waveform_right data Output 16
add_interface_port waveform_right aso_valid_waveform_right valid Output 1
add_interface_port waveform_right aso_ready_waveform_right ready Input 1


# 
# connection point phase_increments_voice3
# 
add_interface phase_increments_voice3 avalon end
set_interface_property phase_increments_voice3 addressUnits WORDS
set_interface_property phase_increments_voice3 associatedClock clock_sink
set_interface_property phase_increments_voice3 associatedReset reset
set_interface_property phase_increments_voice3 bitsPerSymbol 8
set_interface_property phase_increments_voice3 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice3 burstcountUnits WORDS
set_interface_property phase_increments_voice3 explicitAddressSpan 0
set_interface_property phase_increments_voice3 holdTime 0
set_interface_property phase_increments_voice3 linewrapBursts false
set_interface_property phase_increments_voice3 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice3 readLatency 0
set_interface_property phase_increments_voice3 readWaitTime 1
set_interface_property phase_increments_voice3 setupTime 0
set_interface_property phase_increments_voice3 timingUnits Cycles
set_interface_property phase_increments_voice3 writeWaitTime 0
set_interface_property phase_increments_voice3 ENABLED true

add_interface_port phase_increments_voice3 avs_writedata_phase_increments_voice3 writedata Input 64
add_interface_port phase_increments_voice3 avs_write_n_phase_increments_voice3 write_n Input 1
set_interface_assignment phase_increments_voice3 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice3 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice3 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice3 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point phase_increments_voice4
# 
add_interface phase_increments_voice4 avalon end
set_interface_property phase_increments_voice4 addressUnits WORDS
set_interface_property phase_increments_voice4 associatedClock clock_sink
set_interface_property phase_increments_voice4 associatedReset reset
set_interface_property phase_increments_voice4 bitsPerSymbol 8
set_interface_property phase_increments_voice4 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice4 burstcountUnits WORDS
set_interface_property phase_increments_voice4 explicitAddressSpan 0
set_interface_property phase_increments_voice4 holdTime 0
set_interface_property phase_increments_voice4 linewrapBursts false
set_interface_property phase_increments_voice4 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice4 readLatency 0
set_interface_property phase_increments_voice4 readWaitTime 1
set_interface_property phase_increments_voice4 setupTime 0
set_interface_property phase_increments_voice4 timingUnits Cycles
set_interface_property phase_increments_voice4 writeWaitTime 0
set_interface_property phase_increments_voice4 ENABLED true

add_interface_port phase_increments_voice4 avs_writedata_phase_increments_voice4 writedata Input 64
add_interface_port phase_increments_voice4 avs_write_n_phase_increments_voice4 write_n Input 1
set_interface_assignment phase_increments_voice4 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice4 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice4 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice4 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point phase_increments_voice5
# 
add_interface phase_increments_voice5 avalon end
set_interface_property phase_increments_voice5 addressUnits WORDS
set_interface_property phase_increments_voice5 associatedClock clock_sink
set_interface_property phase_increments_voice5 associatedReset reset
set_interface_property phase_increments_voice5 bitsPerSymbol 8
set_interface_property phase_increments_voice5 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice5 burstcountUnits WORDS
set_interface_property phase_increments_voice5 explicitAddressSpan 0
set_interface_property phase_increments_voice5 holdTime 0
set_interface_property phase_increments_voice5 linewrapBursts false
set_interface_property phase_increments_voice5 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice5 readLatency 0
set_interface_property phase_increments_voice5 readWaitTime 1
set_interface_property phase_increments_voice5 setupTime 0
set_interface_property phase_increments_voice5 timingUnits Cycles
set_interface_property phase_increments_voice5 writeWaitTime 0
set_interface_property phase_increments_voice5 ENABLED true

add_interface_port phase_increments_voice5 avs_writedata_phase_increments_voice5 writedata Input 64
add_interface_port phase_increments_voice5 avs_write_n_phase_increments_voice5 write_n Input 1
set_interface_assignment phase_increments_voice5 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice5 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice5 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice5 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point phase_increments_voice6
# 
add_interface phase_increments_voice6 avalon end
set_interface_property phase_increments_voice6 addressUnits WORDS
set_interface_property phase_increments_voice6 associatedClock clock_sink
set_interface_property phase_increments_voice6 associatedReset reset
set_interface_property phase_increments_voice6 bitsPerSymbol 8
set_interface_property phase_increments_voice6 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice6 burstcountUnits WORDS
set_interface_property phase_increments_voice6 explicitAddressSpan 0
set_interface_property phase_increments_voice6 holdTime 0
set_interface_property phase_increments_voice6 linewrapBursts false
set_interface_property phase_increments_voice6 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice6 readLatency 0
set_interface_property phase_increments_voice6 readWaitTime 1
set_interface_property phase_increments_voice6 setupTime 0
set_interface_property phase_increments_voice6 timingUnits Cycles
set_interface_property phase_increments_voice6 writeWaitTime 0
set_interface_property phase_increments_voice6 ENABLED true

add_interface_port phase_increments_voice6 avs_writedata_phase_increments_voice6 writedata Input 64
add_interface_port phase_increments_voice6 avs_write_n_phase_increments_voice6 write_n Input 1
set_interface_assignment phase_increments_voice6 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice6 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice6 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice6 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point phase_increments_voice7
# 
add_interface phase_increments_voice7 avalon end
set_interface_property phase_increments_voice7 addressUnits WORDS
set_interface_property phase_increments_voice7 associatedClock clock_sink
set_interface_property phase_increments_voice7 associatedReset reset
set_interface_property phase_increments_voice7 bitsPerSymbol 8
set_interface_property phase_increments_voice7 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice7 burstcountUnits WORDS
set_interface_property phase_increments_voice7 explicitAddressSpan 0
set_interface_property phase_increments_voice7 holdTime 0
set_interface_property phase_increments_voice7 linewrapBursts false
set_interface_property phase_increments_voice7 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice7 readLatency 0
set_interface_property phase_increments_voice7 readWaitTime 1
set_interface_property phase_increments_voice7 setupTime 0
set_interface_property phase_increments_voice7 timingUnits Cycles
set_interface_property phase_increments_voice7 writeWaitTime 0
set_interface_property phase_increments_voice7 ENABLED true

add_interface_port phase_increments_voice7 avs_writedata_phase_increments_voice7 writedata Input 64
add_interface_port phase_increments_voice7 avs_write_n_phase_increments_voice7 write_n Input 1
set_interface_assignment phase_increments_voice7 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice7 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice7 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice7 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice3
# 
add_interface note_end_voice3 avalon end
set_interface_property note_end_voice3 addressUnits WORDS
set_interface_property note_end_voice3 associatedClock clock_sink
set_interface_property note_end_voice3 associatedReset reset
set_interface_property note_end_voice3 bitsPerSymbol 8
set_interface_property note_end_voice3 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice3 burstcountUnits WORDS
set_interface_property note_end_voice3 explicitAddressSpan 0
set_interface_property note_end_voice3 holdTime 0
set_interface_property note_end_voice3 linewrapBursts false
set_interface_property note_end_voice3 maximumPendingReadTransactions 0
set_interface_property note_end_voice3 readLatency 0
set_interface_property note_end_voice3 readWaitTime 1
set_interface_property note_end_voice3 setupTime 0
set_interface_property note_end_voice3 timingUnits Cycles
set_interface_property note_end_voice3 writeWaitTime 0
set_interface_property note_end_voice3 ENABLED true

add_interface_port note_end_voice3 avs_writedata_note_end_voice3 writedata Input 8
add_interface_port note_end_voice3 avs_write_n_note_end_voice3 write_n Input 1
set_interface_assignment note_end_voice3 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice3 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice3 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice3 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice4
# 
add_interface note_end_voice4 avalon end
set_interface_property note_end_voice4 addressUnits WORDS
set_interface_property note_end_voice4 associatedClock clock_sink
set_interface_property note_end_voice4 associatedReset reset
set_interface_property note_end_voice4 bitsPerSymbol 8
set_interface_property note_end_voice4 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice4 burstcountUnits WORDS
set_interface_property note_end_voice4 explicitAddressSpan 0
set_interface_property note_end_voice4 holdTime 0
set_interface_property note_end_voice4 linewrapBursts false
set_interface_property note_end_voice4 maximumPendingReadTransactions 0
set_interface_property note_end_voice4 readLatency 0
set_interface_property note_end_voice4 readWaitTime 1
set_interface_property note_end_voice4 setupTime 0
set_interface_property note_end_voice4 timingUnits Cycles
set_interface_property note_end_voice4 writeWaitTime 0
set_interface_property note_end_voice4 ENABLED true

add_interface_port note_end_voice4 avs_writedata_note_end_voice4 writedata Input 8
add_interface_port note_end_voice4 avs_write_n_note_end_voice4 write_n Input 1
set_interface_assignment note_end_voice4 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice4 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice4 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice4 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice5
# 
add_interface note_end_voice5 avalon end
set_interface_property note_end_voice5 addressUnits WORDS
set_interface_property note_end_voice5 associatedClock clock_sink
set_interface_property note_end_voice5 associatedReset reset
set_interface_property note_end_voice5 bitsPerSymbol 8
set_interface_property note_end_voice5 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice5 burstcountUnits WORDS
set_interface_property note_end_voice5 explicitAddressSpan 0
set_interface_property note_end_voice5 holdTime 0
set_interface_property note_end_voice5 linewrapBursts false
set_interface_property note_end_voice5 maximumPendingReadTransactions 0
set_interface_property note_end_voice5 readLatency 0
set_interface_property note_end_voice5 readWaitTime 1
set_interface_property note_end_voice5 setupTime 0
set_interface_property note_end_voice5 timingUnits Cycles
set_interface_property note_end_voice5 writeWaitTime 0
set_interface_property note_end_voice5 ENABLED true

add_interface_port note_end_voice5 avs_writedata_note_end_voice5 writedata Input 8
add_interface_port note_end_voice5 avs_write_n_note_end_voice5 write_n Input 1
set_interface_assignment note_end_voice5 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice5 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice5 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice5 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice6
# 
add_interface note_end_voice6 avalon end
set_interface_property note_end_voice6 addressUnits WORDS
set_interface_property note_end_voice6 associatedClock clock_sink
set_interface_property note_end_voice6 associatedReset reset
set_interface_property note_end_voice6 bitsPerSymbol 8
set_interface_property note_end_voice6 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice6 burstcountUnits WORDS
set_interface_property note_end_voice6 explicitAddressSpan 0
set_interface_property note_end_voice6 holdTime 0
set_interface_property note_end_voice6 linewrapBursts false
set_interface_property note_end_voice6 maximumPendingReadTransactions 0
set_interface_property note_end_voice6 readLatency 0
set_interface_property note_end_voice6 readWaitTime 1
set_interface_property note_end_voice6 setupTime 0
set_interface_property note_end_voice6 timingUnits Cycles
set_interface_property note_end_voice6 writeWaitTime 0
set_interface_property note_end_voice6 ENABLED true

add_interface_port note_end_voice6 avs_writedata_note_end_voice6 writedata Input 8
add_interface_port note_end_voice6 avs_write_n_note_end_voice6 write_n Input 1
set_interface_assignment note_end_voice6 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice6 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice6 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice6 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point note_end_voice7
# 
add_interface note_end_voice7 avalon end
set_interface_property note_end_voice7 addressUnits WORDS
set_interface_property note_end_voice7 associatedClock clock_sink
set_interface_property note_end_voice7 associatedReset reset
set_interface_property note_end_voice7 bitsPerSymbol 8
set_interface_property note_end_voice7 burstOnBurstBoundariesOnly false
set_interface_property note_end_voice7 burstcountUnits WORDS
set_interface_property note_end_voice7 explicitAddressSpan 0
set_interface_property note_end_voice7 holdTime 0
set_interface_property note_end_voice7 linewrapBursts false
set_interface_property note_end_voice7 maximumPendingReadTransactions 0
set_interface_property note_end_voice7 readLatency 0
set_interface_property note_end_voice7 readWaitTime 1
set_interface_property note_end_voice7 setupTime 0
set_interface_property note_end_voice7 timingUnits Cycles
set_interface_property note_end_voice7 writeWaitTime 0
set_interface_property note_end_voice7 ENABLED true

add_interface_port note_end_voice7 avs_writedata_note_end_voice7 writedata Input 8
add_interface_port note_end_voice7 avs_write_n_note_end_voice7 write_n Input 1
set_interface_assignment note_end_voice7 embeddedsw.configuration.isFlash 0
set_interface_assignment note_end_voice7 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment note_end_voice7 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment note_end_voice7 embeddedsw.configuration.isPrintableDevice 0

