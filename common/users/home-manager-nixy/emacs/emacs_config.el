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

