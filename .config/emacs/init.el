(setq auto-save-default nil
      auto-save-list-file-prefix nil
      make-backup-files nil
      require-final-newline t
      tramp-histfile-override "/dev/null"
      use-short-answers t)

(setq-default fill-column 60
              indent-tabs-mode nil
              truncate-lines t)

(column-number-mode t)
(global-display-line-numbers-mode t)
(size-indication-mode t)
(menu-bar-mode -1)
(show-paren-mode -1)
(global-font-lock-mode -1)

(defun my/insert-tab-or-indent ()
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (insert "\t")))

(global-set-key (kbd "TAB") 'my/insert-tab-or-indent)
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-indentation 4)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(advice-add 'eww--dwim-expand-url :filter-return
            (lambda (url) (replace-regexp-in-string "http://" "https://" url)))
