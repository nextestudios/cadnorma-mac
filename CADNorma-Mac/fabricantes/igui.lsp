(defun c:igui () (load (strcat cnp_root "/fabricantes/igui.lsp")))

(setq lib_blkpfx "igui"
      lib_blkfam "01"
      lib_type "fabr"
      cn9_lib_label "Biblioteca Igui Piscinas"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)