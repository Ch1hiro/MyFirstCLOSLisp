;2020, February, Sano, Chihiro
;this is the lisp file for practice

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3.5.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun half (x) (/ x 2))

(defun cube (x) (* x (* x x)))

(defun onemorep (x) (zerop (- x 1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3.6.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun square (x) (* x x))
(defun pythag (x y) (sqrt (+ (square x) (square y))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3.7.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
	(/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3.8.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;I wrote this in the text book by my hand

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3.25.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(list 'cons t nil) => (cons t nil)
;(eval (list 'cons t nil)) => (t nil)
;↑it's wrong, (cons t nil) <=> (cons t ()) <=> (t)

;(eval (eval (list 'cons t nil))) => undefined error
;(apply #'cons '(t nil)) => (t nil)

;(eval nil) => nil
;(list 'eval nil) => (nil)
;(eval nil)だよー

;(eval (list 'eval nil)) => nil

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;4.1..
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun make-even (x)
  (if (oddp x)
    (+ x 1)
    x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;4.2..
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun further (x)
  (if (< x 0)
    (- x 1)
    (+ x 1)))
;this function will output 1 if its input is 0.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;4.3.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-not (x) (if (equalp x nil) 'T 'nil))
(defun my-not (x) (if x nil t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;4.4.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun orderd (x y) (if (> x y) (list y x) (list x y)))

;2020-09-05, Next:4.4 "USING T AS A TEST" (P117)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;4.6..(130)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-abs-cond (x)
	(cond ((> x 0) x)
				(t (* -1 x))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.7.(132)->497
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;1, 4が変。3も変らしい。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.8.(133)->497
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun emphasize3 (x)
 	(cond ((equal (first x) 'good) (cons 'great (rest x)))
			((equal (first x) 'bad) (cons 'awful (rest x)))
			(t (cons 'very x)))

(emphasize3 (VERY LONG DAY)) -> (VERY VERY LONG DAY)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.9.(133)->497
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;順番が逆。先に(not (oddp x))で始まる節を入れる。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.10.(133)->497
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;cond version
(defun constraint-cond (x min max)
				(cond ((> max x) max)
							((> x min) min)
							(t x)))

;if version
(defun constraint-if (x min max)
				(if (> max x) max (if (> x min) min x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.10.(133)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun first-zero (first second third)
			(cond ((zerop first) 'first)
						((zerop second) 'second)
						((zerop third) 'third)
						(t 'none)))

;neko

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.11.(133)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun cycle (x)
		(cond ((zerop (- x 99)) 1)
					(t (+ x 1))))

;neko
;(zerop (- x 99)) -> (equal x 99)でも良い
