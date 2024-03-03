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

(global-set-key (kbd "TAB") 'self-insert-command)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
