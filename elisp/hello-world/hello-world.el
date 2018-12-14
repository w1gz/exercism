;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(provide 'hello-world)

(defun hello (&optional name)
  (unless name (setq name "World"))
  (format "Hello, %s!" name))

;;; hello-world.el ends here