(define (convert-to-title columnNumber)
  (if (= columnNumber 0)
      ""
      (let ([columnNumber (sub1 columnNumber)])
        (string-append 
         (convert-to-title (quotient columnNumber 26))
         (string (integer->char (+ (modulo columnNumber 26) (char->integer #\A))))
         )
        )
      )
  )
