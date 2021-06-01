(define/contract (can-eat candiesCount queries)
  (-> (listof exact-integer?) (listof (listof exact-integer?)) (listof boolean?))

    (define (prefix-sum nums cur)
       (if (null? nums)
           (list cur)
           (cons cur (prefix-sum (cdr nums) (+ cur (car nums))))
           )
       )
     (define least (list->vector (prefix-sum candiesCount 0)))
     (map (lambda (query)
            (let ([type (add1 (car query))]
                  [day (add1 (cadr query))]
                  [cap (caddr query)])
              (and (< (vector-ref least (sub1 type)) (* day cap))
                   (<= day (vector-ref least type))))
            )
          queries)
  )
