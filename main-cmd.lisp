(load "fact")

(defun main ()
  (format t "Please The Number of Integer.~%")
  (let ((x (read-line)))
    (setq x (parse-integer x :junk-allowed t))
    (if (null x)
        (format t "Error. Please Integer.~%")
        (format t "~D~%" (tailcall_fact x)))))
;; below command are normal recursion expression, but cause stack error.
;; (format t "~D~% " (recursion_fact 100000" "))

(main)