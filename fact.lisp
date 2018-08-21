(defun tailcall_fact(n &optional (result 1))
  (cond ((= n 1)
         result)
        ((/= n 1)
         (tailcall_fact (- n 1) (* n result)))))

(defun recursion_fact(n)
  (cond ((= n 1)
         1)
        ((/= n 1)
         (* n (recursion_fact (- n 1))))))

(defun main()
  (format t "~D~%" (tailcall_fact 1000))
  ;; below normal recursion expression is stack error.
  ;; (format t "~D~%" (recursion_fact 100000))
  )

(compile 'tailcall_fact)
(compile 'main)
(main)
