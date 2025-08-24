;; ---------------------------------------------------------
;; Tip Jar Contract
;; A simple contract to collect STX tips for the owner
;; ---------------------------------------------------------

(define-constant ERR-NOT-OWNER (err u100))

;; The owner of the tip jar (set at deployment)
(define-constant contract-owner tx-sender)

;; Track total STX tips received
(define-data-var total-tips uint u0)

;; Event for logging tips
;; (Clarity does not support custom event definitions; remove this line)

;; ---------------------------------------------------------
;; Public Functions
;; ---------------------------------------------------------

;; (tip amount) - send STX to the jar
(define-public (tip (amount uint))
  (let ((transfer-result (stx-transfer? amount tx-sender contract-owner)))
    (if (is-ok transfer-result)
        (begin
          (var-set total-tips (+ (var-get total-tips) amount))
          (ok true)
        )
        (err u102)
    )
  )
)

;; (withdraw amount) - owner withdraws tips
(define-public (withdraw (amount uint))
  (if (is-eq tx-sender contract-owner)
      (begin
        (try! (stx-transfer? amount tx-sender contract-owner))
        (var-set total-tips (- (var-get total-tips) amount))
        (ok true)
      )
      ERR-NOT-OWNER
  )
)

;; (get-total-tips) - read-only: check total tips
(define-read-only (get-total-tips)
  (ok (var-get total-tips))
)
