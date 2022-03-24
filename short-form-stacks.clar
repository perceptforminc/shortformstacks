;; Short Form Stacks aka Statements on Stacks 

;; Submission for the Clarity Camp Cohort 2 Hackathon 
;; Inspired by the Stacks Genesis Block statement that was printed and is viewable on the explorer. 
;; For reference, here is the Genesis contract address: SP000000000000000000002Q6VF78.genesis

;;Constants 

(define-constant ERR_STATEMENT_DID_NOT_POST u101)

(define-constant ERR_NOT_SIGNED_IN u102)

(define-constant ERR_STX_TRANSFER u103)

(define-constant CONTRACT-OWNER tx-sender)

;; Data
    
(define-data-var stx-statement (string-utf8 333) u"Make your mark on the Stack blockchain.")

(define-data-var price uint u1000)

(define-data-var statement-counter uint u0)

(define-map statement-by-principal { owner: principal } { ids: (list 1000 uint) })

(define-data-var write-statement uint u333)

;; Read Only 

(define-read-only (get-stx-statement) (var-get stx-statement))

;; Public

(define-public (set-write-statement (print (string-utf8 333)))
    (let ((new-statement (var-get stx-statement))
          (cur-price (+ u1)))

        (unwrap! (stx-transfer? cur-price tx-sender (as-contract tx-sender)) (err ERR_STX_TRANSFER))

        (var-set price cur-price)

        (ok cur-price)))
