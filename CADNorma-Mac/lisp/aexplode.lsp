;;===============================================
;; Programmer's Toolbox    October 96
;; Bill Kramer
;;
;;-----------------------------------------------
;; Listing 1: Attribute Gather given insert object
;;-----------------------------------------------
(defun Gather_Attribs (
       EN  ;;entity name of INSERT object
       /
       EN2 ;;temporary entity name
       EL  ;;entity list
       )
   ;; Get first attrib entity.
   (setq EN2 (entnext EN)
         EL (entget EN2)
         ATTS nil  ;;note that ATTS is global!
   )
   ;; So long as there are attributes...
   (while (= (cdr (assoc 0 EL)) "ATTRIB")
     ;;build ATTS data list containing tag name
     ;;and attribute value.
     (setq ATTS (cons
                   (list (cdr (assoc 2 EL))
                         (cdr (assoc 1 EL))
                   )
                   ATTS)
           EN2 (entnext EN2)
           EL (entget EN2)
     )
   )
)
;;-----------------------------------------------
;; Listing 2: Explode INSERT, save attributes
;;-----------------------------------------------
(defun C:AEXPLODE ( /
           EN   ;;entity name
           EL   ;;entity data list
           EN2  ;;another entity name
           )
  (setq EN
    (car
      (entsel "\nPick a block to explode: ")))
  (if EN (progn  ;;did operator select something?
     (setq EL (entget EN)) ;;what is it?
     (if (= (cdr (assoc 0 EL)) "INSERT") (progn
        (setvar "CMDECHO" 0) ;;turn off command
                             ;;viewing.
        ;; Set a marker at the last object
        ;; and save the insert point.
        ;; Variables AEXPLODE_EN and AEXPLODE_INS
        ;; are both global variables.
        (setq AEXPLODE_EN (entlast)
              AEXPLODE_INS (cdr (assoc 10 EL))
        )
        ;; Now check to see if there are attribs.
        (if (= (cdr (assoc 66 EL)) 1)
           (Gather_Attribs EN)
           (prompt "\nNo attributes attached.")
        )
        ;; Explode the block insert.
        (setq EN2 AEXPLODE_EN)
        (command "_EXPLODE" EN)
        ;; Go through new objects and look for
        ;; attribute definitions to change to
        ;; text.
        (while EN2
           (setq EL (entget EN2)
                 EN2 (entnext EN2)
           )
           (if (= (cdr (assoc 0 EL)) "ATTDEF")
             (ATT_2_TEXT EL)
           )
        )
        (prompt "\nEnter REBUILD when done.")
     ) (prompt "\nThat object is not a block!"))
  ) (prompt "\nNothing was selected."))
)
;;-----------------------------------------------
;; Listing 3: Attribute to Text object conversion
;;-----------------------------------------------
(defun Att_2_text (EL)
   ; register the application ID of the Xdata
   ; for the preserving the attribute definition
   ; information.
   (if (null (tblsearch "APPID" "AEXPLODE"))
      (regapp "AEXPLODE"))
   ; Get rid of the attribute definition, we
   ; are replacing it with the TEXT object.
   (entdel (cdr (assoc -1 EL)))
   (entmake (list
      '(0 . "TEXT")
       (assoc 8 EL) ;layer
       (assoc 10 EL) ;insert point
       (if (assoc 11 EL)
          (assoc 11 EL) ;alignment point
          '(11 0.0 0.0 0.0)
       )
       (assoc 40 EL) ;text size
       (cons 1  ;;text value
          (cadr
            (assoc
              (cdr
                (assoc 2 EL))
              ATTS)))
       (assoc 50 EL) ;rotation
       (assoc 51 EL) ;obliq angle
       (assoc 41 EL) ;width factor
       (assoc 71 EL) ;generation flags
       (assoc 72 EL)
       (assoc 73 EL)
       (assoc 7 EL)  ;text style
       (list -3 ;;extended data attach
         (list "AEXPLODE"
           ; tag name
           (cons 1000 (cdr (assoc 2 EL)))
           ; prompt string
           (cons 1000 (cdr (assoc 3 EL)))
           ; default value
           (cons 1000 (cdr (assoc 1 EL)))
           ; attribute flags
           (cons 1070 (cdr (assoc 70 EL)))
         )
       )
   ))
)
;;-----------------------------------------------
;; Listing 4: Rebuild function
;;-----------------------------------------------
;; C:REBUILD - build a block from exploded pieces
;;             in the drawing.
;;
(defun C:REBUILD ( /
       SS1    ;;selection set
       EN     ;;entity name
       ATTS   ;;attribute list (("tag" "val")...
       EL     ;;entity data list
       BN     ;;block name string
       ENA    ;;another entity name
       TAG    ;;tag string of attribute
       )
   (if (and AEXPLODE_EN ;;marker exist?
            (/= ""  ;;and user supplies a
              (setq BN   ;;block name?
                (getstring
                  "\nBlock name to use: "))))
     (progn
      ;; Disable command echo, initialize a
      ;; selection set, move EN to first part
      ;; of exploded set.
      (setvar "CMDECHO" 0)
      (setq SS1 (ssadd)
            EN (entnext AEXPLODE_EN)
      )
      ;; Loop through remainder of database,
      ;; converting TEXT with the extended data
      ;; attached back to ATTDEF objects.
      ;; All entities are added to the selection
      ;; set SS1.
      (while EN
         ;; Get entity data list with Xdata
         (setq EL (entget EN '("AEXPLODE"))
               EN (entnext EN)
         )
         ;; Is it a TEXT object with Xdata?
         (if (and (= (cdr (assoc 0 EL)) "TEXT")
                  (cdr (assoc -3 EL))
             ) (progn
                ;;Then convert to ATTDEF
                (Text_2_Att EL)
                (setq ENA (entlast))
               )
                ;;else continue on...
                (setq ENA EN)
        )
        ;; If we have a good entity name, add
        ;; it to the selection set.
        (if ENA (setq SS1 (ssadd ENA SS1)))
      ) ;;end WHILE loop
      ;; Now rebuild the block.  Turn off the
      ;; attributes required flag, set the EXPERT
      ;; setting to 4 so that we can redefine
      ;; a block name if needed.
      (setvar "ATTREQ" 0)
      (setvar "EXPERT" 4)
      (command "_BLOCK"
               BN       ;;block name
               AEXPLODE_INS ;;global, from
                            ;;(C:AEXPLODE)
               SS1 ""
               "_INSERT" ;;insert the block
               BN
               AEXPLODE_INS
               "" "" ""     ;;no scaling/rotating
      )
      ; Re-enable attributes, now update all the
      ; attribute settings from the ATTS list.
      ; The last entity in the database is now
      ; the INSERT just created.
      (setvar "ATTREQ" 1)
      (setq EN (entnext (entlast))
            EL (if EN (entget EN) nil)
      )
      ; So long as we are working with attributes
      (while (and EL
               (= (cdr (assoc 0 EL)) "ATTRIB"))
         ; Get the tag name, use it to find the
         ; text value in the ATTS list and
         ; substitute that value with the
         ; current text value in the entity
         ; data list.
         (setq TAG (cdr (assoc 2 EL))
               EL (subst
                    (cons
                      1
                      (cadr
                        (assoc TAG ATTS)))
                    (assoc 1 EL)
                    EL)
         )
         ; Update the entity database with
         ; the new attribute data list.
         (entmod EL)
         ; Get the next object
         (setq EN (entnext EN)
               EL (entget EN)
         )
      ) ;end WHILE loop
      ; now update the insert object,
      ; complex objects require this!
      (entupd (entlast))
      (prompt "\nREBUILD is done.")
   ) (prompt "\nREBUILD exits."))
   (princ)
)
;;-----------------------------------------------
;; Listing 5: TEXT to ATTDEF conversion
;; Note that Symbol ATTS is global with respect
;; to this function.
;;
(defun TEXT_2_ATT (EL / ATTData TagName Val)
  (entdel (cdr (assoc -1 EL)))
  (setq ATTDATA (cdadr (assoc -3 EL))
        TagName (cdar ATTDATA)
        Val (cdr (assoc 1 EL))
        ATTS (cons (list TagName Val) ATTS)
  )
  (entmake (list
    '(0 . "ATTDEF")
    (assoc 8 EL) ;layer
    (cons 70 (cdr (nth 3 ATTDATA)))
    (cons 1 (cdr (nth 2 ATTDATA)))
    (cons 2 TagName)
    (cons 3 (cdr (nth 1 ATTDATA)))
    (assoc 10 EL) ;;insert point
    (assoc 11 EL) ;;alignment point
    (assoc 7 EL)  ;;style
    (assoc 40 EL) ;;height
    (assoc 41 EL) ;;width factor
    (assoc 50 EL) ;;rotation
    (assoc 51 EL) ;;oblique
    (assoc 71 EL) ;;text generation flags
    (assoc 72 EL)
    (assoc 73 EL)
  ))
)
