(custom-set-variables
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(require-final-newline t)
 '(show-paren-mode nil)
 '(size-indication-mode t)
 '(use-short-answers t))

(add-hook 'sh-mode-hook
	  (lambda ()
	    (setq sh-basic-offset 4)
	    (setq sh-indentaion 4)
	    (setq indent-tabs-mode nil)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-faces
 '(isearch ((t (:background "blue" :foreground "black"))))
 '(italic ((t (:foreground "blue"))))
 '(lazy-highlight ((t (:background "blue" :foreground "black"))))
 '(region ((t (:background "blue" :foreground "black"))))
 '(shr-h3 ((t (:foreground "blue")))))

(advice-add 'eww--dwim-expand-url
	    :around
	    (lambda (orig &rest args)
	      "Use https"
	      (let ((orig-url (apply orig args)))
		(if (string-match "http://" orig-url)
		    (replace-match "https://" nil nil orig-url)
		  orig-url))))
