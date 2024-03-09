(custom-set-variables
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(require-final-newline t)
 '(sh-basic-offset 8)
 '(show-paren-mode nil)
 '(size-indication-mode t)
 '(use-short-answers t))

(custom-set-faces
 '(italic ((t (:foreground "blue"))))
 '(shr-h3 ((t (:foreground "blue")))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(advice-add 'eww--dwim-expand-url
	    :around
	    (lambda (orig &rest args)
	      "Use https"
	      (let ((orig-url (apply orig args)))
		(if (string-match "http://" orig-url)
		    (replace-match "https://" nil nil orig-url)
		  orig-url))))
