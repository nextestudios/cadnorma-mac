; WALL-L.LSP
;
; Copyright, 1986, 1987, 1988, 1989 ** KETIV **
; KETIV Technologies, Inc.
; 6645 NE 78th Court #C2
; Portland, OR  97218
;
; Layer Group: None
;
; Menu Location: Tablet H22
;
; Purpose:
;
;   Wall (multiple line segment) "L" (elbox) intersection
;
; Prompts:
;
;   Select objects/<Inside corner>:
;     Outside corner:
;     - OR -
;     Select objects:
;     ...
;     Point to inside of wall:
;
; Error Messages:
;
;  error: Use MEND to join colinear walls.
;  error: Only two walls may be cleaned.
;  error: Walls have unequal number of lines.
;
;-----------------------------------------------------------------------------
(defun c:ll (/ >90 @work ang1 ang2 dists edata eqpnt etype fuzzy get
                   getslope head merge perp perps pt0 pt1 neatl slope sort
                   ss ssfunc tail temp walls work
                )
  (setq clayer nil)
  
  (princ "\nLoading -")
  
  (setq @WORK '("\\" "|" "/" "-"))
  (defun WORK ()
    ; Backspace
    (prompt "\010")
    (setq @work (append (cdr @work) (list (princ (car @work)))))
  )
  
  (work)
  (defun NEATL (dist1 dist2 / line1 line2 pt1 pt2 pt3 pt4 ipt pp1 pp2 x y
                              group edata enm)
    (mapcar
     '(lambda (x y)
        (work)
        (setq
          x     (cadr x)
          y     (cadr y)
          line1 (nth x (car  walls))
          line2 (nth y (cadr walls))
          pt1   (cadr  line1)
          pt2   (caddr line1)
          pt3   (cadr  line2)
          pt4   (caddr line2)
          pp1   (nth (1- x) (car  perps))
          pp2   (nth (1- y) (cadr perps))
          ipt   (inters pt1 pt2 pt3 pt4 nil)
        )
        (mapcar
         '(lambda (enm pt1 pt2 pp)
            (work)
            (setq
              ang1  (angle pp ipt)
              ang2  (angle pt1 pt2)
              group (if (eqpnt (polar ipt ang1 1.0) (polar ipt ang2 1.0)) 11 10)
              edata (entget enm)
            )
            (entmod (subst (cons group ipt) (assoc group edata) edata))
          )
          (list (car line1) (car line2))
          (list pt1 pt3)
          (list pt2 pt4)
          (list pp1 pp2)
        )
  
      )
      dist1
      dist2
    )
  )
  
  (work)
  (defun FUZZY (x y)
    (< (abs (- x y)) 1.0e-6)
  )
  
  (work)
  (defun EQPNT (p1 p2)
    (< (distance p1 p2) 1.0e-6)
  )
  
  (work)
  (defun GET (key alist)
    (if (atom key)
      (cdr (assoc key alist))
      (mapcar '(lambda (x) (cdr (assoc x alist))) key)
    )
  )
  
  (work)
  (defun SORT (x)
    (work)
    (cond
      ((null (cdr x)) x)
      (T
        (merge
          (sort (head x (1- (length x))))
          (sort (tail x (1- (length x))))
        )
      )
    )
  )
  
  (work)
  (defun MERGE (a b)
    (work)
    (cond
      ((null a) b)
      ((null b) a)
      ((< (caar a) (caar b))
        (cons (car a) (merge (cdr a) b))
      )
      (t (cons (car b) (merge a (cdr b))))
    )
  )
  
  (work)
  (defun HEAD (l n)
    (cond
      ((minusp n) nil)
      (t (cons (car l) (head (cdr l) (- n 2))))
    )
  )
  
  (work)
  (defun TAIL (l n)
    (cond
      ((minusp n) l)
      (t (tail (cdr l) (- n 2)))
    )
  )
  
  (work)
  (defun GETSLOPE (pt1 pt2 / x)
    ; Vertical?
    (if (fuzzy (setq x (abs (- (car pt1) (car pt2)))) 0.0)
      ; Yes, return NIL
      nil
      ; No, compute slope
      (rtos (/ (abs (- (cadr pt1) (cadr pt2))) x) 2 4)
    )
  )
  
  (work)
  (defun ETYPE (edata match)
    (member (get 0 edata) (if (listp match) match (list match)))
  )
  
  (work)
  (defun SSFUNC (ss func / i ename)
    (setq i -1)
    (while (setq ename (ssname ss (setq i (1+ i))))
      (apply func nil)
    )
  )
  
  (work)
  (defun PERP (pt0 pt1 pt2)
    (inters pt1 pt2 pt0 (polar pt0 (+ (angle pt1 pt2) >90) 1.0) nil)
  )
  
  
  (setq >90 (/ pi 2))
  
  (setvar "CmdEcho" 0)
  
  (princ "\rLoaded.  ")
  (while
    (progn
      (initget "Select")
      (setq pt0 (getpoint "\nSelect objects/<Inside corner>: "))
    )
    (setq
      dists nil
      perps nil
      walls nil
    )
    (cond
      ((eq (type pt0) 'LIST)
        (initget 33)
        (setq
          pt1 (getcorner pt0 "\nOutside corner: ")
          ss  (ssget "C" pt0 pt1)
        )
      )
      (T
        (while
          (progn
            (princ "\nSelect objects: ")
            (command ".SELECT" "Au" pause)
            (not (setq ss (ssget "P")))
          )
          (print "No objects selected, try again.")
        )
        (initget 1)
        (setq pt0 (getpoint "\nPoint to inside of wall: "))
      )
    )
  
    (princ "\nWorking  ")
    (command ".UNDO" "Group")
  
    (ssfunc ss
     '(lambda ()
        (work)
        (setq edata (entget ename))
        ; Issa LINE entity, fall thru
        (if (etype edata "LINE")
          (setq
            ; Get relevant groups
            edata  (get '(-1 10 11) edata)
            slope  (getslope (cadr edata) (caddr edata))
            walls
              ; Does this slope already exist in walls list
              (if (setq temp (assoc slope walls))
                ; Yes, add new line info to assoc group
                (subst (append temp (list edata)) temp walls)
                ; Nope, add new assoc group w/line info
                (cons (cons slope (list edata)) walls)
              )
          )
        )
      )
    )
  
    (cond
      ((< (length walls) 2)
        (princ "\rerror: Use MEND to join colinear walls.")
      )
      ((> (length walls) 2)
        (princ "\rerror: Only two walls may be cleaned.")
      )
      ((not (apply '= (mapcar 'length walls)))
        (princ "\rerror: Walls have unequal number of lines.")
      )
      (T
  
        ;-------------------------------
        ; Create List of Perpendiculars
        ;-------------------------------
        (setq perps
          (mapcar
           '(lambda (x)
              (work)
              (mapcar
               '(lambda (y)
                  (work)
                  (perp pt0 (cadr y) (caddr y))
                )
                (cdr x)
              )
            )
            walls
          )
        )
  
        ;--------------------------
        ; Create List of Distances
        ;--------------------------
        (setq dists
          (mapcar
           '(lambda (x)
              (work)
              (setq i 0)
              (mapcar
               '(lambda (y)
                  (work)
                  ; Create list of distances (with pointers to WALLS)
                  (list
                    ; Compute distances
                    (distance pt0 y)
                    ; Key
                    (setq i (1+ i))
                  )
                )
                x
              )
            )
            ; List of perpendicular points
            perps
          )
        )
  
        ; Sort distance index
        (setq dists (mapcar 'sort dists))
  
        ; Clean intersections
  
        (neatl (car dists) (cadr dists))
        (princ "\rComplete.")
      )
    )
    (command ".UNDO" "End")
  )
  
  ;----------------------------
  ; Restore enviroment, memory
  ;----------------------------
  (princ)
  
  ; ----< End Of File >----
)
(princ)


; WALL-T.LSP
;
; Copyright, 1986, 1987, 1988, 1989 ** KETIV **
; KETIV Technologies, Inc.
; 6645 NE 78th Court #C2
; Portland, OR  97218
;
; Layer Group: None
;
; Menu Location: Tablet H23
;
; Purpose:
;
;   Wall (multiple line segments) "Tee" intersection
;
; Prompts:
;
;   Select objects/<First corner>:
;     Other corner:
;      - OR -
;     Select objects:
;     ...
;     Point to left of 'leg' wall:
;
; Error Messages:
;
;  error: Use MEND to join colinear walls.
;  error: Only two walls may be cleaned.
;  error: Walls have unequal number of lines.
;  error: Unable to cleanup specified intersection.
;
;-----------------------------------------------------------------------------
(defun c:tt (/ >90 @work ang dist1 dist2 dists edata eqpnt etype fuzzy
                   get getside getslope head i merge neatt1 neatt2 neatt3
                   nukenz perp perps pt0 pt1 pt2 pt3 pt4 slope sort ss ssfunc
                   temp tail wall1 wall2 walls work x y
                )

  (setq clayer nil)
  
  (princ "\nLoading -")
  
  (setq @WORK '("\\" "|" "/" "-"))
  (defun WORK ()
    ; Backspace
    (prompt "\010")
    (setq @work (append (cdr @work) (list (princ (car @work)))))
  )
  
  (work)
  (defun NUKENZ (x)
    (cdr (reverse (cdr x)))
  )
  
  (work)
  (defun NEATT1 (dist1 dist2 / x y line1 line2 pt1 pt2 ip1)
    (work)
    (cond
      ((cdr dist1)
        (setq
          x (cadar dist1)
          y (cadr (last dist1))
        )
        (neatt2
          ; 2nd wall - line 1
          (nth (cadar dist2) wall2)
          ; 1st wall - line 1
          (nth x wall1)
          ; 1st wall - line 2
          (nth y wall1)
          ; 1st wall - perpend 1
          (nth (1- x) perps)
          ; 1st wall - perpend 2
          (nth (1- y) perps)
        )
        (neatt1 (nukenz dist1) (cdr dist2))
      )
      ((car dist1)
        (setq
          ; 1st line
          line1 (nth (cadar dist1) wall1)
          ; 2nd line
          line2 (nth (cadar dist2) wall2)
          ; 1st line endpoints
          pt1   (cadr  line1)
          pt2   (caddr line1)
          ; Intersection point
          ip1   (inters pt1 pt2 (cadr line2) (caddr line2) nil)
        )
        (neatt3 line1 ip1 (nth (1- (cadar dist1)) perps))
      )
      (T nil)
    )
  )
  
  (work)
  (defun NEATT2 (line1 line2 line3 pp2 pp3 / pt1 pt2 ip2 ip3)
    (work)
    (setq
      ; 1st line endpoints
      pt1 (cadr  line1)
      pt2 (caddr line1)
      ; Intersection points
      ip2 (inters pt1 pt2 (cadr line2) (caddr line2) nil)
      ip3 (inters pt1 pt2 (cadr line3) (caddr line3) nil)
    )
    (command ".BREAK" (car line1) ip2 ip3)
    (neatt3 line2 ip2 pp2)
    (neatt3 line3 ip3 pp3)
  )
  
  (work)
  (defun NEATT3 (line1 ip1 pp1 / edata group ang1 ang2)
    (work)
    (setq
      pt1   (cadr   line1)
      pt2   (caddr  line1)
      ang1  (angle pp1 ip1)
      ang2  (angle pt1 pt2)
      group (if (eqpnt (polar ip1 ang1 1.0) (polar ip1 ang2 1.0)) 11 10)
      edata (entget (car line1))
    )
    (entmod (subst (cons group ip1) (assoc group edata) edata))
  )
  
  (work)
  (defun GETSIDE (pt0 pp1 pp2 / temp)
    ; Get delta angle
    (setq temp (- (angle pt0 pp2) (angle pt0 pp1)))
    ; Figure postive or negative angle direction
    (if ((if (minusp temp) < >) (abs temp) pi) nil T)
  )
  
  (work)
  (defun FUZZY (x y)
    (< (abs (- x y)) 1.0e-6)
  )
  
  (work)
  (defun EQPNT (p1 p2)
    (< (distance p1 p2) 1.0e-6)
  )
  
  
  (work)
  (defun GET (key alist)
    (if (atom key)
      (cdr (assoc key alist))
      (mapcar '(lambda (x) (cdr (assoc x alist))) key)
    )
  )
  
  (work)
  (defun SORT (x)
    (work)
    (cond
      ((null (cdr x)) x)
      (T
        (merge
          (sort (head x (1- (length x))))
          (sort (tail x (1- (length x))))
        )
      )
    )
  )
  
  (work)
  (defun MERGE (a b)
    (work)
    (cond
      ((null a) b)
      ((null b) a)
      ((< (caar a) (caar b))
        (cons (car a) (merge (cdr a) b))
      )
      (t (cons (car b) (merge a (cdr b))))
    )
  )
  
  (work)
  (defun HEAD (l n)
    (cond
      ((minusp n) nil)
      (T (cons (car l) (head (cdr l) (- n 2))))
    )
  )
  
  (work)
  (defun TAIL (l n)
    (cond
      ((minusp n) l)
      (T (tail (cdr l) (- n 2)))
    )
  )
  
  (work)
  (defun GETSLOPE (pt1 pt2 / x)
    ; Vertical?
    (if (fuzzy (setq x (abs (- (car pt1) (car pt2)))) 0.0)
      ; Yes, return NIL
      nil
      ; No, compute slope
      (rtos (/ (abs (- (cadr pt1) (cadr pt2))) x) 2 4)
    )
  )
  
  (work)
  (defun ETYPE (edata match)
    (member (get 0 edata) (if (listp match) match (list match)))
  )
  
  (work)
  (defun SSFUNC (ss func / i ename)
    (setq i -1)
    (while (setq ename (ssname ss (setq i (1+ i))))
      (apply func nil)
    )
  )
  
  (work)
  (defun PERP (pt0 pt1 pt2)
    (inters pt1 pt2 pt0 (polar pt0 (+ (angle pt1 pt2) >90) 1.0) nil)
  )
  
  (setq >90 (/ pi 2))
  
  (setvar "CmdEcho" 0)
  (setvar "BlipMode" 0)
  
  (princ "\rLoaded.  ")
  (while
    (progn
      (initget "Select")
      (setq pt0 (getpoint "\nSelect objects/<First corner>: "))
    )
    (setq
      dists nil
      perps nil
      walls nil
    )
    (cond
      ((eq (type pt0) 'LIST)
        (initget 33)
        (setq
          pt1 (getcorner pt0 "\nOther corner: ")
          ss  (ssget "C" pt0 pt1)
        )
      )
      (T
        (while
          (progn
            (princ "\nSelect objects: ")
            (command ".SELECT" "Au" pause)
            (not (setq ss (ssget "P")))
          )
          (print "No objects selected, try again.")
        )
        (initget 1)
        (setq pt0 (getpoint "\nPoint to left of 'leg' wall: "))
      )
    )
  
    (princ "\nWorking  ")
    (command ".UNDO" "Group")
  
    (ssfunc ss
     '(lambda ()
        (work)
        (setq edata (entget ename))
        ; Issa LINE entity, fall thru
        (if (etype edata "LINE")
          (setq
            ; Get relevant groups
            edata  (get '(-1 10 11) edata)
            slope  (getslope (cadr edata) (caddr edata))
            walls
              ; Does this slope already exist in walls list
              (if (setq temp (assoc slope walls))
                ; Yes, add new line info to assoc group
                (subst (append temp (list edata)) temp walls)
                ; Nope, add new assoc group w/line info
                (cons (cons slope (list edata)) walls)
              )
          )
        )
      )
    )
  
    (cond
      ((< (length walls) 2)
        (princ "\rerror: Use MEND to join colinear walls.")
      )
      ((> (length walls) 2)
        (princ "\rerror: Only two walls may be cleaned.")
      )
      ; Quick way to compare numbers of lines per wall
      ((not (apply '= (mapcar 'length walls)))
        (princ "\rerror: Walls have unequal number of lines.")
      )
      (T
  
        ;-------------------------------
        ; Create List of Perpendiculars
        ;-------------------------------
        (setq perps
          (mapcar
           '(lambda (x)
              (work)
              (mapcar
               '(lambda (y)
                  (work)
                  (perp pt0 (cadr y) (caddr y))
                )
                (cdr x)
              )
            )
            walls
          )
        )
  
        ;--------------------------
        ; Create List of Distances
        ;--------------------------
        (setq dists
          (mapcar
           '(lambda (x)
              (work)
              (setq i 0)
              (mapcar
               '(lambda (y)
                  (work)
                  ; Create list of distances (with pointers to WALLS)
                  (list
                    ; Compute distances
                    (distance pt0 y)
                    ; Key
                    (setq i (1+ i))
                  )
                )
                x
              )
            )
            ; List of perpendicular points
            perps
          )
        )
  
        ; Sort distance index
        (setq dists (mapcar 'sort dists))
        (work)
  
        (cond
          ; Determine acute angle
          ((getside pt0 (caar perps) (caadr perps))
            (setq
              perps (car  perps)
              wall1 (car  walls)
              wall2 (cadr walls)
              dist1 (car  dists)
              dist2 (cadr dists)
            )
          )
          (T
            (setq
              perps (cadr perps)
              wall1 (cadr walls)
              wall2 (car  walls)
              dist1 (cadr dists)
              dist2 (car  dists)
            )
          )
        )
        (work)
  
        ; Ensure proper intersection specification
        (setq
          line1 (cadr  wall1)
          line2 (cadr  wall2)
          pt1   (cadr  line1)
          pt2   (caddr line1)
          pt3   (cadr  line2)
          pt4   (caddr line2)
          ang   (angle pt1 pt2)
          pt0   (inters pt1 pt2 pt3 pt4 nil)
        )
  
        (cond
          ((inters pt3 pt4 pt0 (polar pt0 ang 1.0))
            ; Clean intersections
            (neatt1 dist1 dist2)
            (princ "\rComplete.")
          )
          (T
            (princ "\rerror: Unable to cleanup specified intersection.")
          )
        )
      )
    )
    (command ".UNDO" "End")
  )
  
  
  ;----------------------------
  ; Restore enviroment, memory
  ;----------------------------
  (princ)
  
  ; ----< End Of File >----
)
(princ)


; WALL-X.LSP
;
; Copyright, 1986, 1987, 1988, 1989 ** KETIV **
; KETIV Technologies, Inc.
; 6645 NE 78th Court #C2
; Portland, OR  97218
;
; Layer Group: None
;
; Menu Location: Tablet H24
;
; Purpose:
;
;   Multiple line wall crossing intersection cleanup
;
; Prompts:
;
;   Select objects/<First corner>:
;     Other corner:
;      - OR -
;     Select objects:
;     ...
;     Point to outside of wall:
;
; Error Messages:
;
;  error: Use MEND to join colinear walls.
;  error: Only two walls may be cleaned.
;  error: Walls have unequal number of lines.
;
;-----------------------------------------------------------------------------
(defun c:xx (/ >90 @work dists edata etype fuzzy get getslope head i l0
                   merge neatx1 nukenz perp perps pt0 pt1 pt2 pt3 pt4 pt5 pt6
                   slope sort ss ssfunc tail wall1 wall2 walls work
                )
  (setq clayer nil)
  
  (princ "\nLoading -")
  
  (setq @WORK '("\\" "|" "/" "-"))
  (defun WORK ()
    ; Backspace
    (prompt "\010")
    (setq @work (append (cdr @work) (list (princ (car @work)))))
  )
  
  (work)
  (defun NUKENZ (x)
    (cdr (reverse (cdr x)))
  )
  
  (work)
  (defun NEATX1 (dist1 dist2)
    (cond
      ((cdr dist1)
        (work)
        (neatx2
          ; 1st wall - line 1
          (nth (cadar dist1) wall1)
          ; 1st wall - line 2
          (nth (cadr (last dist1)) wall1)
          ; 2nd wall - line 1
          (nth (cadar dist2) wall2)
          ; 2nd wall - line 2
          (nth (cadr (last dist2)) wall2)
        )
        (neatx1 (nukenz dist1) (nukenz dist2))
      )
      (T (princ "\rComplete."))
    )
  )
  
  (work)
  (defun NEATX2 (a1 a2 b1 b2)
    (mapcar
     '(lambda (x l1 l2)
        (work)
        (setq
          pt1 (cadr  l1)
          pt2 (caddr l1)
          pt3 (cadr  l2)
          pt4 (caddr l2)
        )
        (foreach
          l0
          x
          (setq
            pt5 (cadr  l0)
            pt6 (caddr l0)
          )
          (command
            ".BREAK" (car l0)
            (inters pt5 pt6 pt1 pt2)
            (inters pt5 pt6 pt3 pt4)
          )
        )
      )
      (list (list a1 a2) (list b1 b2))
      (list b1 a1)
      (list b2 a2)
    )
  )
  
  (work)
  (defun GET (key alist)
    (if (atom key)
      (cdr (assoc key alist))
      (mapcar '(lambda (x) (cdr (assoc x alist))) key)
    )
  )
  
  (work)
  (defun FUZZY (x y)
    (< (abs (- x y)) 1.0e-6)
  )
  
  (work)
  (defun SORT (x)
    (work)
    (cond
      ((null (cdr x)) x)
      (T
        (merge
          (sort (head x (1- (length x))))
          (sort (tail x (1- (length x))))
        )
      )
    )
  )
  
  (work)
  (defun MERGE (a b)
    (work)
    (cond
      ((null a) b)
      ((null b) a)
      ((< (caar a) (caar b))
        (cons (car a) (merge (cdr a) b))
      )
      (t (cons (car b) (merge a (cdr b))))
    )
  )
  
  (work)
  (defun HEAD (l n)
    (cond
      ((minusp n) nil)
      (t (cons (car l) (head (cdr l) (- n 2))))
    )
  )
  
  (work)
  (defun TAIL (l n)
    (cond
      ((minusp n) l)
      (t (tail (cdr l) (- n 2)))
    )
  )
  
  (work)
  (defun GETSLOPE (pt1 pt2 / x)
    ; Vertical?
    (if (fuzzy (setq x (abs (- (car pt1) (car pt2)))) 0.0)
      ; Yes, return NIL
      nil
      ; No, compute slope
      (rtos (/ (abs (- (cadr pt1) (cadr pt2))) x) 2 4)
    )
  )
  
  (work)
  (defun ETYPE (edata match)
    (member (get 0 edata) (if (listp match) match (list match)))
  )
  
  (work)
  (defun SSFUNC (ss func / i ename)
    (setq i -1)
    (while (setq ename (ssname ss (setq i (1+ i))))
      (apply func nil)
    )
  )
  
  (work)
  (defun PERP (pt0 pt1 pt2)
    (inters pt1 pt2 pt0 (polar pt0 (+ (angle pt1 pt2) >90) 1.0) nil)
  )
  
  ;---------------
  ; Main Function
  ;---------------
  (setq >90 (/ pi 2))
  
  ; Stuff Gary will want to fix...
  (setvar "CmdEcho" 0)
  (setvar "BlipMode" 0)
  
  (princ "\rLoaded.  ")
  (while
    (progn
      (initget "Select")
      (setq pt0 (getpoint "\nSelect objects/<First corner>: "))
    )
    (setq
      dists nil
      perps nil
      walls nil
    )
    (cond
      ((eq (type pt0) 'LIST)
        (initget 33)
        (setq
          pt1 (getcorner pt0 "\nOther corner: ")
          ss  (ssget "C" pt0 pt1)
        )
      )
      (T
        (while
          (progn
            (princ "\nSelect objects: ")
            (command ".SELECT" "Au" pause)
            (not (setq ss (ssget "P")))
          )
          (print "No objects selected, try again.")
        )
        (initget 1)
        (setq pt0 (getpoint "\nPoint to outside of wall: "))
      )
    )
  
    (princ "\nWorking  ")
    (command ".UNDO" "Group")
  
    (ssfunc ss
     '(lambda ()
        (work)
        (setq edata (entget ename))
        ; Issa LINE entity, fall thru
        (if (etype edata "LINE")
          (setq
            ; Get relevant groups
            edata  (get '(-1 10 11) edata)
            slope  (getslope (cadr edata) (caddr edata))
            walls
              ; Does this slope already exist in walls list
              (if (setq temp (assoc slope walls))
                ; Yes, add new line info to assoc group
                (subst (append temp (list edata)) temp walls)
                ; Nope, add new assoc group w/line info
                (cons (cons slope (list edata)) walls)
              )
          )
        )
      )
    )
  
    (cond
      ((< (length walls) 2)
        (princ "\rerror: Use MEND to join colinear walls.")
      )
      ((> (length walls) 2)
        (princ "\rerror: Only two walls may be cleaned.")
      )
      ((not (apply '= (mapcar 'length walls)))
        (princ "\rerror: Walls have unequal number of lines.")
      )
      (T
  
        ;-------------------------------
        ; Create List of Perpendiculars
        ;-------------------------------
        (setq perps
          (mapcar
           '(lambda (x)
              (work)
              (mapcar
               '(lambda (y)
                  (work)
                  (perp pt0 (cadr y) (caddr y))
                )
                (cdr x)
              )
            )
            walls
          )
        )
  
        ;--------------------------
        ; Create List of Distances
        ;--------------------------
        (setq dists
          (mapcar
           '(lambda (x)
              (work)
              (setq i 0)
              (mapcar
               '(lambda (y)
                  (work)
                  ; Create list of distances (with pointers to WALLS)
                  (list
                    ; Compute distances
                    (distance pt0 y)
                    ; Key
                    (setq i (1+ i))
                  )
                )
                x
              )
            )
            ; List of perpendicular points
            perps
          )
        )
  
        ; Sort distance index
        (setq dists (mapcar 'sort dists))
  
        ; Clean intersections
        (setq wall1 (car walls) wall2 (cadr walls))
        (neatx1 (car dists) (cadr dists))
      )
    )
    (command ".UNDO" "End")
  )
  
  ;----------------------------
  ; Restore enviroment, memory
  ;----------------------------
  (princ)
  
  ;---< End Of File >---
)
(princ)

