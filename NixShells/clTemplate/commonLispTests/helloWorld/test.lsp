(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))

(defmacro do-primes (var-and-range &rest body)
  (let ((var (first var-and-range))
        (start (second var-and-range))
        (end (third var-and-range)))
   `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
         ((> ,var ,end))
       ,@body)))

(do-primes (p 0 19)
  (format t "Prime :~d," p))

(defun foo (n)
  (dotimes (i 10)
    (dotimes (j 10)
      (when (> (* i j) n)
        (return-from foo (list i j))))))

(defparameter *x* (make-array 5 :fill-pointer 0))
(vector-push 'a *x*)

(defun read-my-file ()
  (let ((in (open "test.txt" :if-does-not-exist nil)))
  (when in
    (format t "~a~%" (read-line in))
    (close in)))) 

;;COUNT	Item and sequence	Number of times item appears in sequence
;;FIND	Item and sequence	Item or NIL
;;POSITION	Item and sequence	Index into sequence or NIL
;;REMOVE	Item and sequence	Sequence with instances of item removed
;;SUBSTITUTE	New item, item, and sequence	Sequence with instances of item replaced with new item

;;(defparameter *x* (vector 1 2 3))
;;(length *x*) ==> 3
;;(setf (elt *x* 0) 10)
;;*x* ==> #(10 2 3)

