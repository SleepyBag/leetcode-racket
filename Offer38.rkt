(define (permutation s)
  (if (string=? s "")
      '("")
      (remove-duplicates
       (apply append 
              (map 
               (lambda (i)
                 (map 
                  (lambda (perm) (string-append (substring s i (add1 i)) perm))
                  (permutation 
                   (string-append 
                    (substring s 0 i)
                    (substring s (add1 i))
                    ))
                  )
                 )
               (range 0 (string-length s))
               )
              )
       )
      )
  )
