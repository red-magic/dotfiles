(setq auto-save-default nil
      auto-save-list-file-prefix nil
      make-backup-files nil
      require-final-newline t
      tramp-histfile-override "/dev/null"
      use-short-answers t)

(setq-default fill-column 80)

(column-number-mode t)
(global-display-line-numbers-mode t)
(size-indication-mode t)
(menu-bar-mode -1)
;;(global-font-lock-mode -1)
;;(show-paren-mode -1)

(defun my/insert-tab-or-indent ()
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (insert "\t")))

(global-set-key (kbd "TAB") 'my/insert-tab-or-indent)
(global-set-key (kbd "C-x k") 'kill-current-buffer)

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
