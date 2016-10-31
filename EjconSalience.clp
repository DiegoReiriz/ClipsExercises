(deffacts init
    (priority first)
    (priority second)
    (priority third))
(defrule fire-first
    (declare (salience 30))
    (priority first)
    =>
    (printout t "Print first" crlf))

(defrule fire-second
    (declare (salience 20))
    (priority second)
    =>
    (printout t "Print second" crlf))

(defrule fire-third
    (declare (salience 10))
    (priority third)
    =>
    (printout t "Print third" crlf))