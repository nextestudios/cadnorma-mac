(defun c:eternit () (load (strcat cnp_root "/fabricantes/eternit.lsp")))

(setq lib_blkpfx "etrn"
      lib_blkfam "01"
      lib_type "fabr"
      cn9_lib_label "Biblioteca Eternit - www.eternit.com.br"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)

