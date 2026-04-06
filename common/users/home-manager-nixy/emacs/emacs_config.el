;;(setq standard-indent 2)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; Show catppuccin
(load-theme 'catppuccin :no-confirm)

;; Show line numbers
(global-display-line-numbers-mode)

;; Get rid of tool bar
(tool-bar-mode -1)

;; Get rid of menu bar
(menu-bar-mode -1)

;; Init complete
(add-hook 'after-init-hook 'global-company-mode)

;; Add xclip support so we can copy/paste from emacs
(xclip-mode 1) 

;; Dunno probably gets rid of redundant save files
(setq make-backup-files t  
      backup-directory-alist '(("." . "~/.emacs.d/backups/"))  
      version-control 't  
      kept-old-versions 2  
      kept-new-versions 2  
      delete-old-versions t  
      backup-by-copying-when-linked t  
      backup-by-copying t)  
(make-directory "~/.emacs.d/backups/" t)  


;; ------ Things releted with agda ------;;
(setq treesit-extra-load-path '("/run/current-system/sw/lib"))

(defun my-setup-agda-ts ()
  "Setup tree-sitter for Agda."
  (when (treesit-ready-p 'agda)
    (treesit-parser-create 'agda)
    ;; Treesit-font-lock-settings would go here
    (treesit-major-mode-setup)))

;; If you use the standard agda-mode, you can hook into it
(add-hook 'agda-mode-hook #'my-setup-agda-ts)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda --emacs-mode locate")))
