(require math/matrix)
(require racket/set)

(define (num-ways n relation k)
  (let* ([relation (list->set relation)]
         [matrix (build-matrix 
                  n n 
                  (lambda (i j) 
                    (if (set-member? relation (list i j))
                        1 
                        0)
                    )
                  )]
         )
    (matrix-ref 
     (let chain* ([matrix matrix]
                     [k k])
      (if (= k 1)
          matrix
          (matrix* matrix (chain* matrix (sub1 k)))
          )
      )
     0 (sub1 n)
     )
    )
  )
