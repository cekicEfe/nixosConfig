;;(setq standard-indent 2)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; Show line numbers
(global-display-line-numbers-mode)

;; Get rid of tool bar
(tool-bar-mode -1)

;; Get rid of menu bar
(menu-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Set font
(set-frame-font "JetBrains Mono Bold 12" nil t)

;; Disable horizontal scroll bar
(horizontal-scroll-bar-mode -1)

;; Init complete (company version)
(add-hook 'after-init-hook 'global-company-mode)

;; Add xclip support so we can copy/paste from emacs
(xclip-mode 1) 

;; Dunno probably gets rid of redundant save files
;; Stole it from SO
(setq make-backup-files t  
      backup-directory-alist '(("." . "~/.emacs.d/backups/"))  
      version-control 't  
      kept-old-versions 2  
      kept-new-versions 2  
      delete-old-versions t  
      backup-by-copying-when-linked t  
      backup-by-copying t)  
(make-directory "~/.emacs.d/backups/" t)  

;; Disable scroll bars
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

;; ------ Move Text Keybindings -------
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "M-<up>") 'move-text-up)

;; ------ Move Window Keybindings -------
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; ------ Edit Multiple Lines ------
(global-set-key (kbd "C-x C-a") 'mc/edit-lines)

;; ------ Things releted with agda ------;;
(setq treesit-extra-load-path '("/run/current-system/sw/lib"))
