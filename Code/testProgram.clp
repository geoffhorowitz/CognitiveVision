(defrule is-it-a-duck
(animal-has webbed-feet)
(animal-has feathers)
=>
(assert (animal-is duck)))

(defrule duck
(animal-is duck)
=>
(assert (sound-is quack))
(printout t "It is a duck!" crlf))

; CLIPS> (reset) 
; CLIPS> (assert (animal-has webbed-feet)) 
; CLIPS> (assert (animal-has feathers)) 
; CLIPS> (run)