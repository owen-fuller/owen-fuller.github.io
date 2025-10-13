;; straight.el setup
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; Setting up use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-always-defer nil)
;; gc
(setq garbage-collection-messages t)

(save-place-mode t)
(global-auto-revert-mode t)


;;; Early loaded settings

(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(context-menu-mode 1)

;; (setq-default line-spacing 0.15)
(fringe-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)
(blink-cursor-mode 0)
(setq-default cursor-in-non-selected-windows nil)

;; Ensures scaling window properly
(setq frame-resize-pixelwise t)

(fset 'yes-or-no-p 'y-or-n-p)
;; Annoying backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-by-moving-to-trash t
      create-lockfiles nil
      auto-save-default nil
      inhibit-startup-screen t
      ring-bell-function 'ignore)

(setq native-comp-async-report-warnings-errors 'silent)
;(set-frame-parameter nil 'internal-border-width 20)



;; Mouse autoselect
(setq-default indent-tabs-mode nil)
;; For some reason makes scrolling smoother
(setq jit-lock-defer-time 0)
;; Scrolling
(setq pixel-scroll-precision-mode t)
(setq redisplay-dont-pause t
  scroll-margin 3
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)



(setq show-paren-delay 0.05)
(show-paren-mode 1)


(use-package exec-path-from-shell
  :defer nil
  :init
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

(use-package all-the-icons)
(use-package all-the-icons-completion)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)

(setq-default custom-safe-themes t) ;treat all themes as safe

(use-package doom-themes
  :config
  ;; (load-theme 'doom-tomorrow-night t)
  (load-theme 'doom-one-light t)
  ;; (load-theme 'doom-ir-black t)
  ;; (load-theme 'doom-manegarm t)
  ;; (load-theme 'doom-gruvbox t)
  )

;; (use-package moe-theme
  ;; :config
  ;; (load-theme 'moe-dark t))


;; (defun my/apply-theme (appearance)
;;   "Load theme, taking current system APPEARANCE into consideration."
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (pcase appearance
;;     ('light (load-theme 'doom-gruvbox t))
;;     ('dark (load-theme 'doom-gruvbox t))))

;; (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)





;; (add-to-list 'default-frame-alist '(background-color . "#121212"))


;; (use-package modus-themes
;;   :ensure t
;;   :config
;;   ;; Add all your customizations prior to loading the themes
;;   (setq modus-themes-italic-constructs t
;;         modus-themes-bold-constructs nil)

;;   ;; Maybe define some palette overrides, such as by using our presets
;;   (setq modus-themes-common-palette-overrides
;;         modus-themes-preset-overrides-intense)
;;     ;; Remove the border
;;     (setq modus-themes-common-palette-overrides
;;         '((border-mode-line-active unspecified)
;;             (border-mode-line-inactive unspecified)))
;;   ;; Load the theme of your choice.
;;   (load-theme 'modus-vivendi)
;;   (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

;; Lines
;; (global-visual-line-mode t)
;; (setq linum-format "%3d\u2502")
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-width 2)
(global-hl-line-mode t)

(use-package solaire-mode
  :config
  (solaire-global-mode +1)
  )
(use-package goggles
  :hook ((prog-mode text-mode) . goggles-mode)
  :config
  (setq-default goggles-pulse t)) ;; set to nil to disable pulsin:g

(use-package telephone-line
  :init
   (setq telephone-line-primary-left-separator 'telephone-line-flat
      telephone-line-secondary-left-separator 'telephone-line-flat
      telephone-line-primary-right-separator 'telephone-line-flat
      telephone-line-secondary-right-separator 'telephone-line-flat)
  :config
  (telephone-line-mode 1)
(setq telephone-line-height 26)
   (setq telephone-line-evil-use-short-tag nil)
  )

;;; Keybinds

(setq mac-option-modifier 'meta)
;(setq mac-command-modifier 'control)

;; Key chords, convert -- into -> in C mode
;; (use-package key-chord
;;   :config
;;   (key-chord-mode 1)
;;   (key-chord-define-global "--"     "->")
;;   )

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode-hook 'set-newline-and-indent)

(bind-key "s-/" 'comment-line)
;; windows
(bind-key "C-q" 'kill-buffer-and-window)
(bind-key "M-d" 'dired-jump)

(bind-key "C-c C-p" 'popout)

(bind-key "C-c C-r" 'replace-string)
(bind-key "C-c C-e" 'count-words)
(bind-key* "C-c C-n" 'next-buffer)
(bind-key* "s-<left>" 'previous-buffer)
(bind-key "C-c C-f" 'lsp-find-definition)
(bind-key "C-c C-m C-m" 'emms-browser)
(bind-key "C-c C-s" 'rgrep)
(bind-key "C-c C-c" 'projectile-find-other-file)
                                        ;"m c" 'emms-stop
   ;; Open stuff
(bind-key "s-o" 'find-file)
(bind-key* "M-o" 'open-emacs-config)

(bind-key* "C-x C-x" 'tmtxt/open-current-dir-in-terminal)

;(bind-key "<escape>" 'keyboard-escape-quit)
(bind-key "`" "\\" )

(defun open-nvim ()
  (interactive)
  (call-process "kitty" nil 0 nil "nvim" buffer-file-name)
  )

(defun open-kitty ()
  (interactive)
  (call-process "kitty" nil 0 nil)
  )

;; Open config file
(defun open-emacs-config ()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

;; New framme
(defun popout ()
  (interactive)
  (make-frame)
  (other-frame 1))

(use-package evil)
(evil-mode 1)
;; (setq evil-default-state 'emacs)

(dolist (p '((minibuffer-inactive-mode . emacs)
             (calendar-mode . emacs)
             (grep-mode . emacs)
             (Info-mode . emacs)
             (term-mode . emacs)
             (help-mode . emacs)
             (eshell-mode . emacs)
             (shell-mode . emacs)
             (vterm-mode . emacs)
             (dired-mode . emacs)
             (compilation-mode . emacs)
             (messages-buffer-mode . normal)
             ))
  (evil-set-initial-state (car p) (cdr p)))


(define-key evil-normal-state-map (kbd "/") 'consult-line)
;; (define-key evil-normal-state-map (kbd "M-.") 'consult-line)
(define-key evil-normal-state-map (kbd "M-.") 'embark-dwim)
(define-key evil-normal-state-map (kbd "s-b") 'evil-switch-to-windows-last-buffer)
;; (define-key evil-motion-state-map ";" #'evil-ex)
;; (define-key evil-motion-state-map ":" #'evil-repeat-find-char)

;; (define-key evil-normal-state-map (kbd "n") 'evil-next-line)
;; (define-key evil-normal-state-map (kbd "e") 'evil-previous-line)
;; (define-key evil-normal-state-map (kbd "i") '<right>)
;; (define-key evil-normal-state-map (kbd "M-.") 'embark-dwim)

(setq evil-normal-state-cursor '(box "red")
      evil-insert-state-cursor '(bar "green"))

(use-package evil-leader)

(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ;; "j" 'evil-window-down
  ;; "k" 'evil-window-up
  ;; "h" 'evil-window-left
  ;; "l" 'evil-window-right
  ;; "J" 'evil-window-move-very-bottom
  ;; "K" 'evil-window-move-very-top
  ;; "H" 'evil-window-move-far-left
  ;; "L" 'evil-window-move-far-right
  ";" 'execute-extended-command
  ":" 'eval-expression
  "x" 'execute-extended-command
  "d" 'dired-jump
  "n" 'dirvish-side
  "b" 'ibuffer
  "e" 'neotree-toggle
  "f" 'find-file
  "s" '(lambda ()
         (interactive)
         (split-window-horizontally)
         (switch-to-buffer "*scratch*")
         (balance-windows))
  "o" 'open-emacs-config
  "g" 'magit-status
  "p" 'evil-buffer
  ;; "w" 'whitespace-cleanup
  "w" 'save-buffer
  "k" 'open-kitty
  "q" 'save-buffers-kill-emacs
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  ",," 'evilnc-comment-operator)


;;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)



(use-package emacs
  :custom
  (help-window-select t "Switch to help buffers automatically"))

(use-package vertico
  :init
  (vertico-mode))
;; Persist history over Emacs restarts. Vertico sorts by history position.

;; Configure directory extension.
(use-package vertico-directory
  :straight nil
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))


;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("M-." . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package igrep)

;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key (kbd "M-.")
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
)


(use-package jinx
  :init 
  (add-hook 'org-mode-hook 'jinx-mode)
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages)))


(electric-pair-mode t)



(use-package markdown-mode)
(use-package yasnippet
  :config 
  (yas-global-mode 1))
(use-package lsp-bridge
  :defer nil
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  :config
  (setq lsp-bridge-python-lsp-server 'pylsp)
  ;; (setq lsp-bridge-python-lsp-server 'pyright)
  (setq lsp-bridge-enable-hover-diagnostic t)
)

;; (use-package web-mode)
;; (use-package typescript-mode)
;; (use-package js2-mode
;; :defer nil)






(use-package bufler)
(bind-key* "M-b" 'bufler-switch-buffer)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;;; Dired
(use-package neotree
  :defer t)

(use-package all-the-icons-dired
  :defer t
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; Addtional syntax highlighting for dired
(use-package diredfl
  :hook
  ((dired-mode . diredfl-mode)
   ;; highlight parent and directory preview as well
   (dirvish-directory-view-mode . diredfl-mode))
  :config
  (set-face-attribute 'diredfl-dir-name nil :bold t))




(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :custom
  ;; Go back home? Just press `bh'
  (dirvish-bookmark-entries
   '(("H" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
     ("m" "/mnt/"                       "Drives")
     ("t" "~/.local/share/Trash/files/" "TrashCan")))
  ;; Don't worry, Dirvish is still performant even you enable all these attributes
  ;; (dirvish-attributes '(all-the-icons file-size collapse subtree-state vc-state git-msg))
  ;; Maybe the icons are too big to your eyes
  ;; (dirvish-all-the-icons-height 0.8)
  ;; In case you want the details at startup like `dired'
  ;; (dirvish-hide-details nil)
  (dirvish-header-line-format '(:left (path) :right (free-space)))
  :config
  (setq dirvish-preview-disabled-exts '("iso" "bin" "exe" "gpg" "elc" "eln"))
  (dirvish-peek-mode)
  ;; Dired options are respected except a few exceptions, see *In relation to Dired* section above
  (setq dired-dwim-target t)
  (setq delete-by-moving-to-trash t)
  ;; Enable mouse drag-and-drop files to other applications
  (setq dired-mouse-drag-files t)                   ; added in Emacs 29
  (setq mouse-drag-and-drop-region-cross-program t) ; added in Emacs 29
  ;; Make sure to use the long name of flags when exists
  ;; eg. use "--almost-all" instead of "-A"
  ;; Otherwise some commands won't work properly
  ;; (setq dired-listing-switches
  ;; "-l --almost-all --human-readable --time-style=long-iso --group-directories-first --no-group")

(dirvish-define-preview exa (file)
"Use `exa' to generate directory preview."
:require ("exa") ; tell Dirvish to check if we have the executable
(when (file-directory-p file) ; we only interest in directories here
`(shell . ("exa" "--color=always" "-al" ,file)))) ; use the command output as preview
(add-to-list 'dirvish-preview-dispatchers 'exa)

  :bind
  ;; Bind `dirvish|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish-fd)
   ;; Dirvish has all the keybindings (except `dired-summary') in `dired-mode-map' already
   :map dirvish-mode-map
   ("h" . dired-up-directory)
   ("j" . dired-next-line)
   ("k" . dired-previous-line)
   ("l" . dired-find-file)
   ;; ("i" . wdired-change-to-wdired-mode)
   ("." . dired-omit-mode)
   ("b"   . dirvish-bookmark-jump)
   ("f"   . dirvish-file-info-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ;; ("h"   . dirvish-history-jump) ; remapped `describe-mode'
   ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
   ("TAB" . dirvish-subtree-toggle)
   ("M-n" . dirvish-history-go-forward)
   ("M-p" . dirvish-history-go-backward)
   ("M-l" . dirvish-ls-switches-menu)
   ("M-m" . dirvish-mark-menu)
   ("M-f" . dirvish-toggle-fullscreen)
   ("M-s" . dirvish-setup-menu)
   ("M-e" . dirvish-emerge-menu)
   ("M-j" . dirvish-fd-jump)))

(setq insert-directory-program "gls")
;; (when (string= system-type "darwin")
  ;; (setq dired-use-ls-dired nil))
;; (use-package dired
;;   :straight nil
;;   :demand
;;   :config
;;   (add-hook 'dired-mode-hook
;;             (lambda ()
;;               (dired-hide-details-mode)))
;;   (add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

;;   (setq-default dired-omit-files-p t)
;;   (setq dired-omit-files "^\\.DS_Store")
;;   (setq delete-by-moving-to-trash t)

;;   (defun mydired-sort ()
;;   "Sort dired listings with directories first."
;;   (save-excursion
;;     (let (buffer-read-only)
;;       (forward-line 2) ;; beyond dir. header
;;       (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
;;     (set-buffer-modified-p nil)))

;; (defadvice dired-readin
;;   (after dired-after-updating-hook first () activate)
;;   "Sort dired listings with directories first before adding marks."
;;   (mydired-sort))

;;   :bind
;;   (:map dired-mode-map
;;         (("j" . dired-next-line)
;;          ("k" . dired-previous-line)
;;          ("h" . dired-up-directory)
;;          ("l" . dired-find-file)
;;          ("i" . peep-dired)))
;;   )


(use-package magit
  :defer t)
(use-package projectile)
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)


;; compilation
(use-package smart-compile
  :config 
  
  (add-to-list 'smart-compile-alist '("\\.js$" . "node %f"))
)
(use-package fancy-compilation
  :commands (fancy-compilation-mode))
(with-eval-after-load 'compile
  (fancy-compilation-mode))

(bind-key "s-<return>" 'recompile)

(setq compilation-ask-about-save nil)




(use-package leetcode
  :defer t)



;; Open large files
(use-package vlf)
(require 'vlf-setup)




(use-package csv-mode)


(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))                ; For echo area hints







(set-face-background 'line-number (color-darken-name (face-attribute 'default :background) 2))
















































































































































































































































