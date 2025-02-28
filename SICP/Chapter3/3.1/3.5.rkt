#lang planet neil/sicp
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* (/ (random 1000) 1000.0) range))))
(define (square x)
  (* x x))
(define (monte-carlo trials experiment)
  (define (iter remain-times passed-times)
    (cond ((= remain-times 0)
           (/ passed-times trials))
          ((experiment)
           (iter (- remain-times 1) (+ passed-times 1)))
          (else (iter (- remain-times 1) passed-times))))
  (iter trials 0))
(define (P x1 x2 y1 y2)
  (< (+ (square (- (random-in-range x1 x2) 5))
        (square (- (random-in-range y1 y2) 7)))
     (square 3)))
(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (test)
    (p x1 x2 y1 y2))
  (* (* (- x2 x1) (- y2 y1))
     (monte-carlo trials test)))
(estimate-integral P 2.0 8.0 4.0 10.0 10000)