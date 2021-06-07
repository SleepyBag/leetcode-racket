(require racket/hash)

(define/contract (find-target-sum-ways nums target [cnt (hash 0 1)])
  (->* ((listof exact-integer?) exact-integer?) (hash?) exact-integer?)
     (if (null? nums)
         (hash-ref cnt target 0)
         (find-target-sum-ways (cdr nums) 
                               target 
                               (let ([n (car nums)])
                                 (hash-union (make-immutable-hash (map (lambda (x) (cons (+ (car x) n) (cdr x))) (hash->list cnt)))
                                             (make-immutable-hash (map (lambda (x) (cons (- (car x) n) (cdr x))) (hash->list cnt)))
                                             #:combine +
                                             )
                                 )
            )
         )
  )
