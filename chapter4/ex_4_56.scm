; the names of all people who are supervised by Ben Bitdiddle, together with
; their addresses;
(and (supervisor ?person (Ben Bitdiddle))
     (address ?person))

; all people whose salary is less than Ben Bitdiddle’s, together with their
; salary and Ben Bitdiddle’s salary;

(and (lisp-value < ?person-salary ?bb-salary)
     (salary (Ben Bitdiddle) ?bb-salary)
     (salary ?person ?person-salary))


; all people who are supervised by someone who is not in the computer division,
; together with the supervisor’s name and job.

(and (supervisor ?person ?boss)
     (not (job ?boss (computer . ?boss-job-type))))
