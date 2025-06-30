(load (sb-ext:posix-getenv "ASDF"))
(asdf:load-system 'alexandria)
(asdf:load-system 'local-time)

;;COUNT	Item and sequence	Number of times item appears in sequence
;;FIND	Item and sequence	Item or NIL
;;POSITION	Item and sequence	Index into sequence or NIL
;;REMOVE	Item and sequence	Sequence with instances of item removed
;;SUBSTITUTE	New item, item, and sequence	Sequence with instances of item replaced with new item

;;(defparameter *x* (vector 1 2 3))
;;(length *x*) ==> 3
;;(setf (elt *x* 0) 10)
;;*x* ==> #(10 2 3)

(defparameter *vector* (make-array 5 :fill-pointer 0 :adjustable t))

(print (length *vector*))

(dotimes (i 10)
  (vector-push-extend (+ i 1) *vector*))

(print *vector*)

(cl-user::quit)
