#lang racket

;temp-checks1
;checks if list of temperatures is between 5 and 95
(define (check-temps1 temps)
  (if (empty? temps) true)
  (check-temps(temps 5 95))
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

