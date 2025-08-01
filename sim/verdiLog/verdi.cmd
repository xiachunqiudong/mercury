verdiSetActWin -dock widgetDock_<Message>
debImport "-elab" "./build/simv.daidir/kdb"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcHBSelect "sim_tb.mercury" -win $_nTrace1
srcSetScope "sim_tb.mercury" -delim "." -win $_nTrace1
srcHBSelect "sim_tb.mercury" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "sim_tb.mercury.exu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.ifu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.exu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.ifu" -win $_nTrace1
srcSetScope "sim_tb.mercury.ifu" -delim "." -win $_nTrace1
srcHBSelect "sim_tb.mercury.ifu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.exu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.exu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.exu" -win $_nTrace1
srcSetScope "sim_tb.mercury.exu" -delim "." -win $_nTrace1
srcHBSelect "sim_tb.mercury.exu" -win $_nTrace1
srcHBSelect "sim_tb.mercury.exu.laneA_decoder" -win $_nTrace1
srcSetScope "sim_tb.mercury.exu.laneA_decoder" -delim "." -win $_nTrace1
srcHBDrag -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {1 8 1 1 5 1} -backward
srcDeselectAll -win $_nTrace1
debExit
