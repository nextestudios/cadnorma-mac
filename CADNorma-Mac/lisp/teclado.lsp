;********************************
;Cadnorma Professional
;por Denio Guimarães - ddenio@uol.com.br
;Atalhos de teclado
;********************************

;comandos numericos
(defun c:0   () (command "._layer" "s" "0" "") (princ))
(defun c:2   () (command "._layer" "t" "*" "") (princ))
(defun c:3   () (command "._zoom" "_p") (princ))
(defun c:4   () (command "._script") (princ))
(defun C:8   () (command "._zoom" ".8X") (princ))
(defun c:12  () (command "._zoom" "1.2x") (princ))


;blips
(defun c:bmo () (command "._blipmode" "_on") (princ))
(defun c:bmf () (command "._blipmode" "_off") (princ))

;layers
(defun C:LM  () (command "._layer" "_M") (princ))
(defun C:LS  () (command "._layer" "_S") (princ))
(defun C:LF  () (command "._layer" "_F") (princ))
(defun C:LT  () (command "._layer" "_T") (princ))
(defun C:LC  () (command "._layer" "_C") (princ))
(defun c:ms  () (command "._mspace") (princ))


;UCS
(defun c:uw  () (command "._ucs" "") (princ))
(defun c:ug  () (command "._ucs" "_s" "ucs1") (princ))
(defun c:ur  () (command "._ucs" "_r" "ucs1") (princ))
(defun c:up  () (command "._ucs" "_p") (princ))

;undo
(defun c:um  () (command "._undo" "_m") (princ))
(defun c:ub  () (command "._undo" "_b") (princ))

;view
(defun c:vg  () (command "._view" "_s" "vista1") (princ))
(defun C:vr  () (command "._view" "_r" "vista1") (princ))

;zoom
(defun C:ZA  () (command "._ZOOM" "_A") (princ))
(defun C:ZC  () (command "._ZOOM" "_C") (princ))
(defun C:ZD  () (command "._ZOOM" "_D") (princ))
(defun C:ZE  () (command "._ZOOM" "_E") (princ))
(defun C:ZL  () (command "._ZOOM" "_L") (princ))
(defun C:ZZ  () (command "._ZOOM" "_P") (princ))
(defun C:ZM  () (command "._ZOOM" "_VMAX") (princ))

;diversos
(defun c:c   () (command "._copy") (princ))
(defun c:cc  () (command "._circle") (princ))
(defun c:cg  () (command "._change") (princ))
(defun c:cl  () (command "._chprop" "_l" "" "_la") (princ))
(defun c:d   () (command "._dist") (princ))
(defun c:da  () (command "._ddatte") (princ))
(defun c:ddl () (command "._ddlmodes") (princ))
(defun c:ent () (setq ent (entget (car (entsel)))))
(defun c:et  () (command "._extend") (princ))
(defun c:mu  () (command "._measure") (princ))
(defun c:mt  () (command "._mtext") (princ))
(defun c:oo  () (command "._oops") (princ))
(defun c:pg  () (command "._polygon") (princ))
(defun c:pua () (command "._purge" "_a" "" "_n") (princ))
(defun c:q   () (command "._qsave") (princ))
(defun c:r   () (command "._rotate") (princ))
(defun c:rd  () (command "._redo") (princ))
(defun c:rw  () (command "._redraw") (princ))
(defun c:sk  () (command "._sketch") (princ))
(defun c:sd  () (command "._shade") (princ))
(defun c:sde () (command "._shadedge") (princ))
(defun c:se  () (command "._select") (princ))
(defun c:xp  () (command "._explode") (princ))

;mensagem após carregar
(prompt "\nComandos de Teclado carregados...")
(princ)