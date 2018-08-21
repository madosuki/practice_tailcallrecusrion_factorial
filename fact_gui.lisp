(ql:quickload 'ltk)
(defpackage :cl-ltk
  (:use :common-lisp :ltk))
(in-package :cl-ltk)

(defun tailcall_fact(n &optional (result 1))
  (cond ((= n 1)
         result)
        ((/= n 1)
         (tailcall_fact (- n 1) (* n result)))))

(defvar *x* 10)
(defvar *y* 0)
(defvar *min* 640)

(defun main()
  (with-ltk()
    
    (wm-title *tk* "Factorial Calculator with GUI")
    
    (let* ((f (make-instance 'frame))
           (lb (make-instance 'label :master f :text "Please input number"))
           (entry (make-instance 'entry :master f))
           (button (make-instance 'button :master f :text "Start Calculation!"))
           (output (make-instance 'label :master f :wraplength *min*)))
      
      (pack f)
      (pack lb)
      (pack entry)
      (pack button)
      (pack output)
      
      (configure f :borderwidth 3)
      (configure f :relief :sunken)
      
      (set-geometry *tk* 800 600 0 0)
      
      (bind button "<ButtonRelease-1>"
            (lambda(e)
              (declare (ignore e))
              (when (ltk:text output)
                (setf (ltk:text output)
                      (tailcall_fact
                       (parse-integer (ltk:text entry))))))))))

(main)
