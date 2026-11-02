(defun c:gravia () (load (strcat cnp_root "/fabricantes/gravia.lsp")))

(setq lib_blkpfx "grvi"
      lib_blkfam "01"
      lib_type "fabr"
      cn9_lib_label "Biblioteca de Esquadrias Gravia - www.gravia.com.br"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)
