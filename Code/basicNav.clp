(defrule turn-right
(on-right door)
(on-right stairs)
=>
(assert (turn right)))

(printout t "Turn Right -->" crlf)