(setq auto-save-default nil
      auto-save-list-file-prefix nil
      make-backup-files nil
      require-final-newline t
      use-short-answers t)

(menu-bar-mode -1)
(column-number-mode t)
(global-display-line-numbers-mode t)
(show-paren-mode t)
(size-indication-mode t)

(defun my/insert-tab-or-indent ()
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (insert "\t")))

(global-set-key (kbd "TAB") 'my/insert-tab-or-indent)

(add-hook 'sh-mode-hook
	  (lambda ()
	    (setq sh-indentation 4)
	    (setq indent-tabs-mode nil)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-faces
 '(isearch ((t (:background "blue" :foreground "black"))))
 '(italic ((t (:foreground "blue"))))
 '(lazy-highlight ((t (:background "blue" :foreground "black"))))
 '(region ((t (:background "blue" :foreground "black"))))
 '(show-paren-match ((t (:background "white" :foreground "black"))))
 '(shr-h3 ((t (:foreground "blue")))))

(advice-add 'eww--dwim-expand-url :filter-return
	    (lambda (url) (replace-regexp-in-string "http://" "https://" url)))
