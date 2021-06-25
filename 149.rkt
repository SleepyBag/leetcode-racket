(define (max-points points)
    (let cnt ([lst (apply append
                 (for/list ([p points])
                           (for/list ( [q points]
                                       #:when (not (eq? p q)))
                                     (let* ([px (car p)]
                                            [py (cadr p)]
                                            [qx (car q)]
                                            [qy (cadr q)]
                                            [k (if (= (- qx px) 0)
                                                   100000000000 
                                                   (/ (- qy py) (- qx px)))]
                                            [b (- qy (* qx k))]
                                            )
                                       (if (= k 100000000000)
                                           (cons k qx)
                                           (cons k b)
                                           )
                                       )
                                     )
                           )
                 )]
              [res (hash)]
          )
      (if (null? lst) 
          (if (hash-empty? res)
              1
              (/ (add1 (sqrt (add1 (* (apply max (hash-values res)) 4)))) 2)
          )
          (cnt (cdr lst) (hash-set res (car lst) (add1 (hash-ref res (car lst) 0))))
          )
     )
  )
