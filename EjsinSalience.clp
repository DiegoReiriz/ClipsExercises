(deffacts init
    (priority first)
    (priority second)
    (priority third))
(defrule fire-first
    (priority first)
    =>
    (printout t "Print first" crlf))

(defrule fire-second
    (priority second)
    =>
    (printout t "Print second" crlf))

(defrule fire-third
    (priority third)
    =>
    (printout t "Print third" crlf))