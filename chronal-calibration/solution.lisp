(defun get-frequency-changes ()
  (let ((input (open "input" :if-does-not-exist nil))
        (frequency-changes (make-array 5 :fill-pointer 0 :adjustable t)))
    (loop for line = (read-line input nil)
          while line do (vector-push-extend (parse-integer line) frequency-changes))
    frequency-changes))

(defun part-one ()
  (reduce #'+ (get-frequency-changes)))

(defun part-two ()
  (let ((visited-frequencies (make-hash-table))
        (frequency 0))
    (loop (loop for change across (get-frequency-changes)
                if (gethash frequency visited-frequencies) do
                  (return-from part-two frequency)
                else do (setf (gethash frequency visited-frequencies) t)
                do (incf frequency change)))))
