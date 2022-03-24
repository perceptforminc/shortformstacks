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

(define-map write { stx-statement-id: uint } { printed-statement: uint })

(define-map totals { every-statement: uint } { every-principal: uint })

;; Private 

(define-read-only (get-stx-statement) (var-get stx-statement))

;; Public 

