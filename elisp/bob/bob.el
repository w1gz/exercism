;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(provide 'bob)

(defun is_empty (str)
  (string-match-p "\\`[ \t]*\\'" str))

(defun is_upper (str)
  (and
   (string-equal (upcase str) str)
   (string-match-p "\\`.*[A-Z]+.*\\'" str)))

(defun is_question (str)
  (equal
   (string-match-p (regexp-quote "?") str)
   (- (length str) 1)))

(defun response-for (str)
  (cond ((is_empty str) (format "Fine. Be that way!"))
        ((is_upper str) (format "Whoa, chill out!"))
        ((is_question str) (format "Sure."))
        ((format "Whatever."))))

;;; bob.el ends here