(defun c:acqualife () (load (strcat cnp_root "/fabricantes/acqualife.lsp")))

(setq lib_blkpfx "acql"
      lib_blkfam "01"
      cn9_lib_label "Biblioteca Acqualife - http://www.acqualifehidro.com.br/"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)
