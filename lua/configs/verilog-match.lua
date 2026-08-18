-- Word pairs for % jumping / match highlighting (vim-matchup, matchit-compatible).
-- Set unconditionally so it does not depend on matchit being on the rtp;
-- the stock runtime ftplugins only define these when g:loaded_matchit exists.

local verilog = {
  [[\<begin\>:\<end\>]],
  [[\<class\>:\<endclass\>]], -- not Verilog-2001, but harmless and common in .v files that use SV
  [[\<case\>\|\<casex\>\|\<casez\>:\<endcase\>]],
  [[\<module\>:\<endmodule\>]],
  [[\<if\>:`\@<!\<else\>]],
  [[\<function\>:\<endfunction\>]],
  [[`ifn\?def\>:`elsif\>:`else\>:`endif\>]],
  [[\<task\>:\<endtask\>]],
  [[\<specify\>:\<endspecify\>]],
  [[\<config\>:\<endconfig\>]],
  [[\<generate\>:\<endgenerate\>]],
  [[\<fork\>:\<join\>]],
  [[\<primitive\>:\<endprimitive\>]],
  [[\<table\>:\<endtable\>]],
}

local systemverilog = {
  [[\<begin\>:\<end\>]],
  [[\<case\>\|\<casex\>\|\<casez\>\|\<randcase\>:\<endcase\>]],
  [[\<module\>:\<endmodule\>]],
  [[\<if\>:`\@<!\<else\>]],
  [[\<function\>:\<endfunction\>]],
  [[`ifn\?def\>:`elsif\>:`else\>:`endif\>]],
  [[\<task\>:\<endtask\>]],
  [[\<specify\>:\<endspecify\>]],
  [[\<config\>:\<endconfig\>]],
  [[\<generate\>:\<endgenerate\>]],
  [[\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>]],
  [[\<primitive\>:\<endprimitive\>]],
  [[\<table\>:\<endtable\>]],
  [[\<checker\>:\<endchecker\>]],
  [[\<class\>:\<endclass\>]],
  [[\<clocking\>:\<endclocking\>]],
  [[\<covergroup\>\|\<group\>:\<endgroup\>]],
  [[\<interface\>:\<endinterface\>]],
  [[\<package\>:\<endpackage\>]],
  [[\<program\>:\<endprogram\>]],
  [[\<property\>:\<endproperty\>]],
  [[\<sequence\>:\<endsequence\>]],
}

return {
  verilog = table.concat(verilog, ","),
  systemverilog = table.concat(systemverilog, ","),
}
