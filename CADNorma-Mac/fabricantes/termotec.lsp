(defun c:termotec () (load (strcat cnp_root "/fabricantes/termotec.lsp")))

(setq lib_blkpfx "trmt"
      lib_blkfam "01"
      lib_type "fabr"
      cn9_lib_label "Termotec - Aterramento e SPDA - www.tel.com.br"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)

