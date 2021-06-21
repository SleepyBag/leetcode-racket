(define (one-count n)
  (if (= n 0)
      0
      (+ (bitwise-and n 1) (one-count (arithmetic-shift n (- 1))))
      )
  )

(define/contract (read-binary-watch turnedOn)
  (-> exact-integer? (listof string?))
     (filter-map
      (lambda (time)
        (let ([hour (quotient time 60)]
              [minute (remainder time 60)])
          (if (= (+ (one-count hour) (one-count minute)) turnedOn)
              (string-append (number->string hour) ":" (~r minute #:min-width 2 #:pad-string "0"))
              #f
              )
          )
        )
      (range 0 (* 12 60))
      )
  )
