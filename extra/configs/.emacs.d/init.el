(setq-default
 auto-save-default nil
 auto-save-list-file-prefix nil
 column-number-mode t
;;default-frame-alist '((width . 125) (height . 35))
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
(set-face-foreground 'hl-line "#000000")
(set-face-background 'hl-line "#efebe9")
(set-face-attribute 'button nil :foreground "#000000" :background "#efebe9")
(set-face-attribute 'region nil :foreground "#000000" :background "#efebe9")
(set-face-attribute 'show-paren-match nil :foreground "#000000" :background "#efebe9")
(set-face-attribute 'isearch nil :foreground "#efebe9" :background "#000000")
(set-face-attribute 'lazy-highlight nil :foreground "#000000" :background "#efebe9")
(set-face-attribute 'italic nil :foreground "#000000" :background "#efebe9")
