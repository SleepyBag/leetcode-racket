(define (find-max-length nums [location (hash 0 0)] [cnt 0] [i 0])
     (if (null? nums) 0
       (let* ([n (car nums)]
              [i (add1 i)]
              [next-nums (cdr nums)]
              [cnt (+ cnt (if (= n 1) 1 (- 1)))]
              [ans (if (hash-has-key? location cnt) (- i (hash-ref location cnt)) 0)]
              [next-location (if (hash-has-key? location cnt) location (hash-set location cnt i))]
              )
         (max ans (find-max-length next-nums next-location cnt i))
       )
     )
  )
