(setq standard-indent 2)

(load-theme 'catppuccin :no-confirm)

(global-display-line-numbers-mode)

(tool-bar-mode -1)

(add-hook 'after-init-hook 'global-company-mode)

(xclip-mode 1) 
