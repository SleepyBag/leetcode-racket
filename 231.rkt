(define/contract (is-power-of-two n)
  (-> exact-integer? boolean?)
    (if (= n 0) #f (= n (bitwise-and n (- n))))
  )
