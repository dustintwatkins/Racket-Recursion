#lang racket

;temp-checks1
;checks if list of temperatures is between 5 and 95
(define (check-temps1 temps)
  (check-temps temps 5 95)
  )

;temp-check
; return true if list of temperatures is between given range
(define (check-temps temps low high)
  (if (empty? temps)
      true
      (if (and (> (first temps)(- low 1))(< (first temps)(+ high 1)))
           (check-temps(rest temps) low high) false)                
                    )
  )

;convertFC
; converts a list of fahrenheit temps to celsius temps
(define (convertFC lst)
  (if (empty? lst) empty
      (cons (FtoC (first lst))
            (convertFC (rest lst))
            );end cons
      );end if
  );end function

; Does conversion for Fahrenheit to Celsius
(define (FtoC temp)
  (* (- temp 32) (/ 5 9))
  )

;duple
; returns a list of tuples from the original list input, i.e 123 returns 11 22 33
(define (duple lst)
  (if (empty? lst) empty
      (cons ( list (first lst) (first lst))
            (duple (rest lst)));end cons
      );end if
   );end function

;average
; returns the average of the input list
(define (average lst)
  (avgHelp lst 0 0)
  );end function

(define (avgHelp lst sum count)
  (if (empty? lst)
      (if(zero? count) count
         (/ sum count))
      (avgHelp (rest lst) (+ sum (first lst)) (+ count 1)))
  );end function

;convert
; returns a list of digits in the reverse order it was received, i.e 123 returns 321
(define (convert temps)
      (if (empty? temps) empty
          (convertHelper(reverse temps) 0)          
      );end if
  );end function

(define (convertHelper nums res)
      (if (empty? nums) res
          (convertHelper (rest nums) (+(* res 10)(first nums)))
          );end if
  ); end function

;eliminate-larger
; removes any numbers from list that are larger than the following number
;i.e list 1 2 3 5 4 9 returns list 1 2 3 4 5
(define (eliminate-larger lst)
  true)

;get-nth
; n is non-negative number < length of the list
; returns nth item of the list using zero-based indexing
;i.e list 1 2 3 4 n = 2 returns 3

(define (get-nth lst n)
  (getHelp lst n 0)
  );end function

(define (getHelp lst n index)
  (if (empty? lst) "not in list"
      (if (= n index) (first lst)
          (getHelp (rest lst) n (+ index 1))
          );inner if
      );end if
  );end function

;find-item
; returns the index of the value in the list that matches the 'target' val
; i.e list 1 2 3 4 target = 3 returns 2
; if item dne in list, return -1

(define (find-item lst target)
  (if(empty? lst) false
     (if (= (first lst) target) true
         (find-item (rest lst) target)
     );end inner if
   );end if
 );end function

;For lab 3
(define a (list 1 2 3 4 5 6 7))

(map even? a)
(map (lambda (x) (+ x 1)) a)
(filter even? a)


