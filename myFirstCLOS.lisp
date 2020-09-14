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
       (t (cons 'very x))))

;(emphasize3 (VERY LONG DAY)) -> (VERY VERY LONG DAY)

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
;2020-09-10, 4.11.(133)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun first-zero (first second third)
      (cond ((zerop first) 'first)
            ((zerop second) 'second)
            ((zerop third) 'third)
            (t 'none)))

;neko

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-10, 4.12.(133)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun cycle (x)
    (cond ((zerop (- x 99)) 1)
          (t (+ x 1))))

;neko
;(zerop (- x 99)) -> (equal x 99)でも良い

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-11, 4.13.(133)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun howcompare (first second third)
    (cond ((equal third (* first second)) 'product-of)
          ((equal third (+ first second)) 'sum-of)
          (t 'beats-me)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-12, 4.14.(135)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;foe
;fee
;foe
;nil
;yes
;t

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-12, 4.15.(136)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun geq (x y)
    (or (> x y)
        (equal x y)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-12, 4.16.(136)->498
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun question4_16 (x)
    (cond ((and (oddp x) (> x 0)) (* x x))
          ((and (oddp x) (< x 0)) (* x 2))
          (t (/ x 2))))
;別の定義の仕方がありそう。oddpを二回書かなくてはいけない必要はないはず。
#|(defun question4_16_2 (x))
  |#
;neko

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-12, 4.17.(136)->499
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun question4_17 (x y)
      (or
               (and (or (equal x 'boy) (equal x 'girl)) (equal y 'child))
               (and (or (equal x 'man) (equal x 'woman)) (equal y 'adult))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-12, 4.18.(137)->499
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
(defun janken_strength (fist second))

|#


(defun janken (first second)
      (cond
               ((equal first second) 'tie)
               ((or  (and (equal first 'rock)     (equal second 'scissers))
                     (and (equal first 'scissers) (equal second 'paper))
                     (and (equal first 'paper)    (equal second 'rock)))    'first-win)
               (t 'second-win)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-13, 4.19.(140)->499
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(defun question4_19_1 (x y z w)  (cond ((not (equal x nil)) x) ((not (equal y nil)) y) ((not (equal z nil)) z) ((not (equal w)) w) (t nil)))
(defun question4_19_1 (x y z w)
    (cond ((equal x nil) nil)
          ((equal y nil) nil)
          ((equal z nil) nil)
          ((equal w nil) nil)
          (t w)))
;見本
(cond ((not x) nil)
      ((not y) nil)
      ((not z) nil)
      (t w))

 ;neko
(defun question4_19_2 (x y z w)
  (if (equal x nil) nil
    (if (equal y nil) nil
      (if (equal z nil) nil
        (if (equal w nil) nil w)))))
;見本
(if x
  (if y
    (if z w)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-13, 4.20.(140)->499
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;define by COND
(defun compare-cond (x y)
  (cond ((equal x y) 'numbers-are-same)
        ((> x y) 'first-is-bigger)
        (t 'second-is-bigger)))

;define by AND and OR
(defun compare-and-or (x y)
  (or (and (equal x y) 'numbers-are-same)
      (and (> x y) 'first-is-bigger)
      'second-is-bigger))

;define by IF
(defun compare-if (x y)
  (if (equal x y) 'numbers-are-the-same
     (if (> x y) 'first-is-bigger 'second-is-bigger)))
;↑最後のifにカッコをつけ忘れてた！！

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-13,14, 4.21.(140->499,500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;gtest,if
(defun gtest-if (x y)
  (if (> x y) t
    (if (zerop x) t (zerop y))))

;grest, cond
(defun gtest-cond (x y)
  (cond ((> x y) t)
        ((zerop x) t)
        ((zerop y) t)
        (t nil)))
;見本
(defun gtest-cond_2 (x y)
  (cond ((> x y) t)
        ((zerop x) t)
        (t (zerop y))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.22.(140->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun boilingp (temp scale)
  (cond ((equal scale 'fahrenheit) (> temp 211))
        ((equal scale 'celsius)    (> temp 99))
        (t (list 'error scale 'is 'unknown 'scale))))

(defun boilingp-if (temp scale)
  (if (equal scale 'fahrenheit) (> temp 211)
    (if (equal scale 'celsius) (> temp 99) (list 'error scale 'is 'unknown 'scale))))

(defun boilingp-AndOr (temp scale)
  (or (and (equal scale 'fahrenheit) (> temp 211))
      (and (equal scale 'celsius)    (> temp 99))
      (list 'error scale 'is 'unknown 'scale)))
;mihonn
(defun boilingp-text (temp scale)
  (or (and (> temp 212)
           (equal scale 'fahrenheit))
      (and (> temp 100)
           (equal scale 'celsius))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.23.(140->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;when WHERE-IS function has eight COND clauses, WHERE-IS-2 needs SEVEN IFs, WHERE-IS-3 needs ONE OR and SEVEN ANDs.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.24.(141->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;conditions are important because condition makes it possible to make a desigion by its situations.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.25.(141->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;If the second condition is T, the third input will evaluate, if the second condition is NIL, it will return NIL.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.26.(141->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Because the input of IF can be also IF, this is why if can evaluate many conditions.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.27.(141->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;error

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.28.(141->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;because true-part of the test return NIL, it do not work well.
(or (and test true-part)
    (and test false-part))
;これだとfalse-partが永遠に評価されない。だから
;見本
(or (and test true-part)
    (and (not test) false-part))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.29.(145->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun logical-and-if (x y)
  (if x
    (if y t)))

(defun logical-and-cond (x y)
  (cond (x)
    (cond y t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.30.(145->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun logical-or (x y)
  (or (and x t)
      (and y t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.31.(145->500)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;not is a boolean function.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.37.(148->501)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun logical-and-nand (x y)
  (nand (nand x y) (nand x y)))

;mihon
(defun logical-or-nand (x y)
  (nand (nand x x) (nand y y)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;2020-09-14, 4.37.(148->501)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
