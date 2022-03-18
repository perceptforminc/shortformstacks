;;Short Form Stacks, internally known as Statements on Stacks 

;;Data (Finetuning)

(define-map stx-statement (string-utf8 u333) u"Make your mark on the Stacks blockchain.")
(define-map price uint u1000)

  
;;Public Functions (Finetuning)
  
  (define-public (stx-statement (stx-statement-id uint) (stx-statement-count uint))
    (begin
      (asserts! (is-eq owner tx-sender) (err UNAUTHORIZED)) 
      (asserts! (< stx-statement u333) (err STATEMENT_TOO_LONG)) 
      (asserts! (> stx-statement u1) (err STATEMENT_TOO_SHORT))) 
      (try! (print (string-utf8 u333)))
      (ok true))
      
      
    
(print stx-statement (string-utf8 333))


;;Read Only Functions (Assessing)



;;Constants (Finetuning)

(define-constant USER_DID_NOT_PAY u1000)
(define-constant USER_DID_NOT_POST uint)
(define-constant USER_DID_NOT_SIGN_IN uint)

