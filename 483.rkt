(define (power a b)
  (if (= b 0)
      1
      (let ([c (power a (quotient b 2))])
        (if (>= c 1000000000000000001)
            1000000000000000001
            (* c c (if (= (remainder b 2) 1) a 1))
            )
        )
      )
  )

(define (sum lst)
  (if (null? lst)
      0
      (min (+ (car lst) (sum (cdr lst))) 1000000000000000001)
      )
  )

(define/contract (smallest-good-base n)
  (-> string? string?)
     (let ([n (string->number n)])
       (number->string 
        (first
         (filter-map
          (lambda (len)
            (let bisect ([l 2] [r (add1 n)])
              (let ([m (quotient (+ l r) 2)])
                (if (> l r)
                    #f
                    (let ([cur (sum (map (lambda (ll) (power m ll)) (range 0 (add1 len))))])
                      (if (= cur n)
                          m
                          (if (< cur n)
                              (bisect (add1 m) r)
                              (bisect l (sub1 m))
                              )
                          )
                      )
                    )
                )
              )
            )
          (range 50 0 (- 1))
          )
         )
        )
       )
  )
