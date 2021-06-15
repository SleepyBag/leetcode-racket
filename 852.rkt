(define/contract (peak-index-in-mountain-array arr)
  (-> (listof exact-integer?) exact-integer?)
     (index-of arr (apply max arr))
  )
