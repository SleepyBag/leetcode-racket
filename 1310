(require math/array)
(define/contract (xor-queries arr queries)
  (-> (listof exact-integer?) (listof (listof exact-integer?)) (listof exact-integer?))
    (let ((prefix-sum (list 0)))
      (for-each 
        (lambda (n) 
          (set! prefix-sum 
            (cons (bitwise-xor (car prefix-sum) n) prefix-sum)
          )
        ) 
        arr
      )
      (set! prefix-sum (list->array (reverse prefix-sum)))
      (map
        (lambda (query)
          (bitwise-xor 
            (array-ref prefix-sum (vector (car query))) 
            (array-ref prefix-sum (vector (+ 1 (car (cdr query)))))
          )
        )
        queries
      )
    )
  )
