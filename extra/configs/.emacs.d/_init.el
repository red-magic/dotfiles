(setq-default
 auto-save-default nil
 auto-save-list-file-prefix nil
 column-number-mode t
;;default-frame-alist '((width . 120) (height . 35))
;;inhibit-startup-screen t
 make-backup-files nil
 require-final-newline t
 show-trailing-whitespace t
 size-indication-mode t
 use-short-answers t)

;;(desktop-save-mode 1)
;;(global-font-lock-mode -1)
;;(fringe-mode 0)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
;;(load-theme 'modus-operandi)
(menu-bar-mode -1)
;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(set-face-foreground 'hl-line "black")
(set-face-background 'hl-line "white")
(set-face-attribute 'default nil :foreground "white" :background "black")
(set-face-attribute 'cursor nil :foreground "black" :background "white")
(set-face-attribute 'region nil :foreground "black" :background "orange")
(set-face-attribute 'isearch nil :foreground "orange" :background "black")
(set-face-attribute 'show-paren-match nil :foreground "black" :background "orange")
(set-face-attribute 'button nil :foreground "orange" :background "black")
(set-face-attribute 'lazy-highlight nil :foreground "black" :background "orange")
