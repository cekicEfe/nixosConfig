(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

(require 'exwm)


;; For eshell colours
(add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "xterm-256color"))) 


;; Allow all actions without y/n confirmations
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-confirm-webhook nil)
(setq dired-listing-switches "-laGh1v")

(setq display-time-day-and-date t) 
(setq display-time-24hr t) ;; Set to 't' prefer 24-hour time format 'nil' otherwise
(display-time-mode 1)
(tab-bar-mode 1)
(setq tab-bar-format '(tab-bar-format-tabs 
                       tab-bar-format-align-right 
                       tab-bar-format-global))    

;; Set the total number of workspaces (i3 defaults to 10)
(setq exwm-workspace-number 10)
    
;; Configure i3-like workspace switching and moving
(dotimes (i 10)
  ;; Bind Super + [0-9] to switch to the corresponding workspace
  (exwm-input-set-key (kbd (format "s-%d" i))
                      `(lambda ()
                         (interactive)
                         (exwm-workspace-switch-create ,i))))

;; We create alist to iterate through below
;; Does not work in other keyboards only works for trq       
(defvar my-trq-workspace-alist
  '(("=" . 0)  ;; Shift + 0
    ("!" . 1)  ;; Shift + 1
    ("'" . 2)  ;; Shift + 2
    ("^" . 3)  ;; Shift + 3
    ("+" . 4)  ;; Shift + 4
    ("%" . 5)  ;; Shift + 5
    ("&" . 6)  ;; Shift + 6
    ("/" . 7)  ;; Shift + 7
    ("(" . 8)  ;; Shift + 8
    (")" . 9))) ;; Shift + 9

;; We iterate through alist and create keybings to move window
(dolist (pair my-trq-workspace-alist)
  (let ((key (car pair))
        (value (cdr pair)))
    (exwm-input-set-key (kbd (format "s-%s" key))
                      `(lambda ()
                        (interactive)
                        (exwm-workspace-move-window ,value)))))
    
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

;; Rebind buffer list to neater version
(global-set-key (kbd "C-x C-b") 'ibuffer)

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
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; ------ Things releted with agda ------
(setq treesit-extra-load-path '("/run/current-system/sw/lib"))

(global-set-key (kbd "M-SPC") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-list
        try-expand-line))

;; ------ CPP related things ------
(defun insert-cpp-header-guard ()
  "Insert C/C++ header guards based on the current buffer name."
  (interactive)
  (let* ((buf-name (buffer-name))
         (clean-name (upcase (replace-regexp-in-string "[^A-Za-z0-9]" "_" buf-name))))
    (save-excursion
      (goto-char (point-min))
      (insert (format "#ifndef %s\n#define %s\n\n" clean-name clean-name))
      (goto-char (point-max))
      (insert (format "\n#endif /* %s */\n" clean-name)))))

(defun insert-cpp-template-class (class-name template-type)
  "Insert a C++ template class skeleton at the current cursor position."
  (interactive
   (list (read-string "Class name: ")
         (let ((type (read-string "Template type [default T]: ")))
           (if (string-empty-p type) "T" type))))
  (let ((start (point)))
    (insert (format "template <typename %s>\n" template-type))
    (insert (format "class %s {\n" class-name))
    (insert "public:\n")
    (insert (format "    %s() = default;\n" class-name))
    (insert (format "    ~%s() = default;\n" class-name))
    (insert (format "    %s(const %s& other);\n" class-name class-name))
    (insert (format "    %s& operator=(const %s& other);\n" class-name class-name))
    (insert (format "    %s(%s&& other) noexcept;\n" class-name class-name))
    (insert (format "    %s& operator=(%s&& other);\n" class-name class-name))    
    (insert "\nprivate:\n")
    (insert "    \n")
    (insert "};\n")
    
    ;; Indent the newly inserted region according to c++-mode rules
    (indent-region start (point))
    
    ;; Move the cursor to the blank line inside the private section
    (search-backward "private:")
    (forward-line 1)
    (end-of-line)
    (indent-according-to-mode)))

