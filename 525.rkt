(define/contract (find-max-length nums)
  (-> (listof exact-integer?) exact-integer?)
     (let ([location (make-hash)]
           [cnt 0]
           )
         (hash-set! location 0 -1)
         (apply max
                (map (lambda (i n)
                       (set! cnt (+ cnt (if (= n 1) 1 (- 1))))
                       (if (hash-has-key? location cnt)
                           (- i (hash-ref location cnt))
                           (begin (hash-set! location cnt i)
                                  0)
                           ))
                     (range 0 (length nums))
                     nums
                     )
         )
     )
  )
