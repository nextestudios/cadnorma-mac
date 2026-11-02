(defun c:fibratec () (load (strcat cnp_root "/fabricantes/fibratec.lsp")))

(setq lib_blkpfx "fbtc"
      lib_blkfam "01"
      lib_type "fabr"
      cn9_lib_label "Biblioteca Fibratec"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)
