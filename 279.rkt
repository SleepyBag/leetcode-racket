(define memo (make-hash))
(define/contract (num-squares n)
  (-> exact-integer? exact-integer?)
     (if (integer? (sqrt n))
         1
         (if (hash-has-key? memo n)
             (hash-ref memo n)
             (let ([ans (add1 (apply min 
                                     (for/list ([i (range 1 (sqrt n))])
                                               (num-squares (- n (* i i))))))])
               (hash-set! memo n ans)
               ans
               )
             )
         )
  )
