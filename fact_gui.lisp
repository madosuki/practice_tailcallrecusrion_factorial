(ql:quickload 'ltk)

(defpackage :cl-ltk
  (:use
   :common-lisp
   :ltk))

(in-package :cl-ltk)

(defun tailcall_fact(n &optional (result 1))
  (cond ((= n 1)
         result)
        ((/= n 1)
         (tailcall_fact (- n 1) (* n result)))))

(defvar *x* 10)
(defvar *y* 0)
(defvar *min* 640)
(defvar *width* 800)
(defvar *height* 600)
(defvar *title* "Factorial Calculator with GUI")

(defun main()  
  (with-ltk()
    (wm-title *tk* *title*)
    
    (let* ((sc (make-instance 'scrolled-canvas))
           (c (canvas sc))
           (lb (make-instance 'label :master c :text "Please input number"))
           (entry (make-instance 'entry :master c))
           (button (make-instance 'button :master c :text "Start Calculation!"))
           (output (make-instance 'label :master c :wraplength *min*)))
      
      (pack sc :expand 1 :fill :both)
      (pack lb)
      (pack entry)
      (pack button)
      (pack output)
      
      ;; (configure f :borderwidth 3)
      ;; (configure f :relief :sunken)

      (scrollregion c 0 0 *width* *height*)
      
      (set-geometry *tk* *width* *height* 0 0)
      
      (bind button "<ButtonRelease-1>"
            (lambda(e)
              (declare (ignore e))
              (when (ltk:text output)
                (setf (ltk:text output)
                      (tailcall_fact
                       (parse-integer (ltk:text entry))))))))))
(main)
