(impl-trait 'SP1B576BH3WB6PN0TMX115JGBJC4X0YRT0X688CCY.sip009-nft-trait.sip009-nft-trait)

;; SIP009 NFT Trait | Short Form Stacks Statements As NFTs

;; (impl-trait 'SP1B576BH3WB6PN0TMX115JGBJC4X0YRT0X688CCY.nft-trait.nft-trait)

;; We are exploring the option of having the Statements placed on the blockchain be minted as NFTs. 

;; This is where that theory is experimented with. 

(define-trait sip009-nft-trait
	(
		(get-last-token-id () (response uint uint))
    
		(get-token-uri (uint) (response (optional (string-utf8 333)) uint))

		(get-owner (uint) (response (optional principal) uint))

		(transfer (uint principal principal) (response bool uint))
	)
)

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u1000))
(define-constant err-not-token-owner (err u1001))

(define-non-fungible-token short-form-stx-statement uint)

(define-data-var last-token-id uint u0)

(define-read-only (get-last-token-id)
	(ok (var-get last-token-id))
)

(define-read-only (get-token-uri (short-form-stx-id uint))
	(ok none)
)

(define-read-only (get-owner (short-form-stx-id uint))
	(ok (nft-get-owner? short-form-stx-statement short-form-stx-id))
)

(define-public (transfer (short-form-stx-id uint) (sender principal) (recipient principal))
	(begin
		(asserts! (is-eq tx-sender sender) err-not-token-owner)
		(nft-transfer? short-form-stx-statement short-form-stx-id sender recipient)
	)
)

(define-public (mint (recipient principal))
	(let
		(
			(short-form-stx-id (+ (var-get last-token-id) u1))
		)
		(asserts! (is-eq tx-sender contract-owner) err-owner-only)
		(try! (nft-mint? short-form-stx-statement short-form-stx-id recipient))
		(var-set last-token-id short-form-stx-id)
		(ok short-form-stx-id)
	)
)

