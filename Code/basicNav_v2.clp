; comments
; (load "basicNav.clp")

;(clear)
;(reset)
(watch facts)


; User Input:

(defrule read-current-loc
	=>
	(printout t "What is the current location?  classroom or hallway?" crlf)
	(assert(current-loc(read)))
)

; Example inputs for no user interaction

; 1st: to leave room:
	(assert (current-loc classroom))
	(assert (see sign))
	(assert(sign-reads exit))
	; or answer question after run

	; (reset)

; 2nd: in hallway:
	(assert (current-loc hallway))
	(assert (see sign))
	(assert (sign-reads exit))

	; (reset)

; 3rd:
	(assert (current-loc hallway))
	(assert (see common-area))

	; (reset)
	
; 4th:
	(assert (current-loc hallway))
	(assert (see sign))
	(assert (sign-reads bathroom-entrance))

	; (reset)



: Logic Flow - start with most specific rules, more general rules later

(defrule classroom
	"exit via door"
	(current-loc classroom)
=>
	(assert(exit-via door))
	(printout t "exit room via door" crlf)
)

(defrule bathroom-sign
	"follow bathroom sign"
	(current-loc hallway)
	(sign bathroom)
=>
	(printout t "proceed towards bathroom sign --> rerun engine at next decision point" crlf)
)

(defrule exit-sign
	"exit sign"
	(current-loc hallway)
	(see sign)
	(sign-reads exit)

	;(not sign-reads bathroom)??
=>
	(printout t "proceed towards exit sign --> rerun engine at next decision point" crlf)
)

(defrule stairs-sign
	"stairs sign"
	(current-loc hallway)
	(see sign)
	(sign-reads stairs)
=>
	(printout t "proceed towards stairs sign --> rerun engine at next decision point" crlf)
)

(defrule commonArea
	"Common Area"
	(current-loc hallway)
	(see common-area)
=>
	(printout t "proceed towards common area --> rerun engine at next decision point" crlf)
)

(defrule twoHallwaysIntersect
	"two hallways intersect"
	(current-loc hallway)
	(see hallway-intersection)
=>
	(printout t "proceed toward the intersection of two hallways --> rerun engine at next decision point" crlf)
)

(defrule reached-bathroom
	(current-loc hallway)
	(see sign)
	(sign-reads bathroom-entrance)
=>
	(printout t "You have reached the bathroom!  Please enter and do your business" crlf)
)


;(retract *) ; retracts all facts in memory

; to run program
; type in asserts for facts desired
; type (reset)
; type (run)