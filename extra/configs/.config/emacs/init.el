(setq auto-save-default nil
      auto-save-list-file-prefix nil
      make-backup-files nil
      require-final-newline t
      use-short-answers t
      tramp-histfile-override t)

(setq-default fill-column 80)

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
 '(isearch ((t (:foreground "black" :background "blue"))))
 '(italic ((t (:foreground "blue" :background "black"))))
 '(lazy-highlight ((t (:foreground "black" :background "blue"))))
 '(region ((t (:foreground "black" :background "blue"))))
 '(show-paren-match ((t (:foreground "black" :background "white"))))
 '(show-paren-match ((t (:inverse-video t))))
 '(shr-h3 ((t (:foreground "blue" :background "black")))))

(advice-add 'eww--dwim-expand-url :filter-return
	    (lambda (url) (replace-regexp-in-string "http://" "https://" url)))
