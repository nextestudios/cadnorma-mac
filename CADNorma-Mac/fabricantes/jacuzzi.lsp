(defun c:jacuzzi () (load (strcat cnp_root "/fabricantes/jacuzzi.lsp")))

(setq lib_blkpfx "jacz"
      lib_blkfam "01"
      lib_type "fabr"
      cn9_lib_label "Biblioteca Jacuzzi - www.jacuzzi.com.br"
)
(lib_lastlib_readfile)
(lib_cfgmain_lib)
