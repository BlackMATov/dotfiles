;;; .emacs --- Emacs dot file by Matvey Cherevko <BlackMATov@gmail.com>
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; --------------------------------------
;; auto install
;; --------------------------------------

(defvar my/package-list '(undo-tree zenburn-theme osx-clipboard smooth-scrolling reverse-im
                          cmake-mode cmake-project
                          projectile helm-projectile
                          company flycheck
                          helm helm-company
                          yaml-mode
                          markdown-mode
                          omnisharp
                          erlang
                          intero
                          irony company-irony company-irony-c-headers flycheck-irony modern-cpp-font-lock
                          evil evil-leader evil-visualstar evil-terminal-cursor-changer
                          ace-jump-mode ace-jump-buffer
                          neotree))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package my/package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; --------------------------------------
;; common
;; --------------------------------------

;; disable alarm bell
;; https://www.emacswiki.org/emacs/AlarmBell
(setq ring-bell-function 'ignore)

(menu-bar-mode -1)
(if (display-graphic-p) (tool-bar-mode -1))
(if (display-graphic-p) (scroll-bar-mode -1))

(ido-mode +1)
(show-paren-mode +1)
(electric-pair-mode +1)
(column-number-mode +1)
(global-hl-line-mode +1)

(winner-mode t)
(windmove-default-keybindings)

(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)
(setq-default lisp-body-indent 2)
(setq-default indent-tabs-mode nil)

(setq-default truncate-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq vc-follow-symlinks t)
(setq find-file-visit-truename t)

(setq auto-save-default nil)
(setq make-backup-files nil)

(unless (display-grayscale-p)
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line))

;; --------------------------------------
;; packages
;; --------------------------------------

;; package undo-tree
(require 'undo-tree)
(defun my/undo-tree-mode-hook ()
  "My undo-tree mode hook."
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t))
(add-hook 'undo-tree-mode-hook 'my/undo-tree-mode-hook)
(global-undo-tree-mode +1)

;; package zenburn-theme
(require 'zenburn-theme)
(load-theme 'zenburn t)

;; packages osx-clipboard
(require 'osx-clipboard)
(osx-clipboard-mode +1)

;; packages smooth-scrolling
(require 'smooth-scrolling)
(defun my/smooth-scrolling-mode-hook ()
  "My smooth-scroll mode hook."
  (setq smooth-scroll-margin 4))
(add-hook 'smooth-scrolling-mode-hook 'my/smooth-scrolling-mode-hook)
(smooth-scrolling-mode +1)

;; packages reverse-im
(require 'reverse-im)
(reverse-im-activate "russian-computer")

;; package company
(require 'company)
(defun my/company-mode-hook ()
  "My company mode hook."
  (setq company-idle-delay 0))
(add-hook 'company-mode-hook 'my/company-mode-hook)
(global-company-mode +1)

;; package flycheck
(require 'flycheck)
(global-flycheck-mode +1)

;; --------------------------------------
;; cmake-mode
;; --------------------------------------

(require 'cmake-mode)

(require 'cmake-project)

;; --------------------------------------
;; helm
;; --------------------------------------

(require 'helm)
(helm-mode +1)

(require 'helm-company)

;; --------------------------------------
;; projectile
;; --------------------------------------

(require 'projectile)
(projectile-mode +1)

(require 'helm-projectile)
(helm-projectile-on)

;; --------------------------------------
;; nxml-mode
;; --------------------------------------

(require 'nxml-mode)

(defun my/nxml-mode-hook ()
  "My nxml mode hook."
  (hs-minor-mode))
(add-hook 'nxml-mode-hook 'my/nxml-mode-hook)
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
                "<!--\\|<[^/>]*[^/]>" ;; regexp for start block
                "-->\\|</[^/>]*[^/]>" ;; regexp for end block
                "<!--"
                nxml-forward-element
                nil))

;; --------------------------------------
;; org-mode
;; --------------------------------------

(require 'org)

(define-key org-mode-map (kbd "TAB") nil)
(define-key org-mode-map (kbd "<S-tab>") nil)
(define-key org-mode-map (kbd "<backtab>") nil)

(define-key org-mode-map (kbd "<M-S-up>") nil)
(define-key org-mode-map (kbd "<M-S-down>") nil)

(define-key org-mode-map (kbd "<M-up>") nil)
(define-key org-mode-map (kbd "<M-down>") nil)

(define-key org-mode-map (kbd "<M-S-left>") nil)
(define-key org-mode-map (kbd "<M-S-right>") nil)

(define-key org-mode-map (kbd "<M-left>") nil)
(define-key org-mode-map (kbd "<M-right>") nil)

(define-key org-mode-map (kbd "<S-up>") nil)
(define-key org-mode-map (kbd "<S-down>") nil)
(define-key org-mode-map (kbd "<S-left>") nil)
(define-key org-mode-map (kbd "<S-right>") nil)

(define-key org-mode-map (kbd "<C-up>") nil)
(define-key org-mode-map (kbd "<C-down>") nil)

(define-key org-mode-map (kbd "C-<tab>") nil)
(define-key org-mode-map (kbd "C-S-<tab>") nil)

(defun my/org-mode-hook ()
  "My org mode hook."
  (org-indent-mode t)
  (evil-local-set-key 'normal (kbd "]]") 'org-forward-heading-same-level)
  (evil-local-set-key 'normal (kbd "[[") 'org-backward-heading-same-level)

  (evil-local-set-key 'normal (kbd "SPC") 'org-todo)
  (evil-local-set-key 'normal (kbd "RET") 'org-cycle)

  (evil-local-set-key 'normal (kbd "TAB") 'org-metaright)
  (evil-local-set-key 'normal (kbd "S-<tab>") 'org-metaleft)
  (evil-local-set-key 'normal (kbd "<backtab>") 'org-metaleft)

  (evil-local-set-key 'visual (kbd "TAB") 'org-metaright)
  (evil-local-set-key 'visual (kbd "S-<tab>") 'org-metaleft)
  (evil-local-set-key 'visual (kbd "<backtab>") 'org-metaleft)

  (evil-leader/set-key
    "ta"  'org-table-align
    "tc"  'org-table-create
    "ts"  'org-table-sort-lines
    "tr"  'org-table-recalculate
    "tir" 'org-table-insert-row
    "tic" 'org-table-insert-column
    "tt"  'org-show-todo-tree))
(add-hook 'org-mode-hook 'my/org-mode-hook)

;; --------------------------------------
;; yaml-mode
;; --------------------------------------

(require 'yaml-mode)

;; --------------------------------------
;; markdown-mode
;; --------------------------------------

(require 'markdown-mode)

;; --------------------------------------
;; omnisharp-mode
;; --------------------------------------

(require 'omnisharp)
(defun my/csharp-mode-hook ()
  "My csharp mode hook."
  (setq omnisharp-eldoc-support nil)
  (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")
  (omnisharp-mode)
  (evil-leader/set-key
    "gt" 'omnisharp-go-to-definition
    "gT" 'omnisharp-go-to-definition-other-window))
(add-hook 'csharp-mode-hook 'my/csharp-mode-hook)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

;; --------------------------------------
;; erlang-mode
;; --------------------------------------

(require 'erlang-start)
(setq flycheck-erlang-include-path '("../include/"))

;; --------------------------------------
;; haskell-mode
;; --------------------------------------

(require 'intero)
(defun my/haskell-mode-hook ()
  "My haskell mode hook."
  (intero-mode)
  (evil-leader/set-key
    "ro" 'intero-repl
    "rl" 'intero-repl-load
    "rc" 'intero-repl-clear-buffer
    "rr" 'intero-restart
    "gt" 'intero-goto-definition))
(add-hook 'haskell-mode-hook 'my/haskell-mode-hook)

;; --------------------------------------
;; irony-mode
;; --------------------------------------

(require 'irony)
(defun my/irony-mode-hook ()
  "My irony mode hook."
  (hs-minor-mode)
  (setq irony-additional-clang-options '("-std=c++14" "-stdlib=libc++"))
  (setq flycheck-clang-args '("-std=c++14" "-stdlib=libc++"))
  (setq flycheck-clang-standard-library "libc++")
  (setq flycheck-clang-language-standard "c++14")
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'my/irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony-c-headers))

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)

;; --------------------------------------
;; evil-mode
;; --------------------------------------

;; must be before evil packages
(defvar evil-want-C-i-jump t)
(defvar evil-want-C-u-scroll t)

;; package evil-terminal-cursor-changer
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate))

;; package evil-visualstar
(require 'evil-visualstar)
(global-evil-visualstar-mode t)

;; package evil-leader
(require 'evil-leader)
(evil-leader/set-leader "\\")
(evil-leader/set-key
  "n"   'neotree-toggle
  "u"   'undo-tree-visualize
  "ff"  'helm-projectile
  "gg"  'helm-projectile-grep
  "cc"  'comment-region
  "cu"  'uncomment-region
  "be"  'helm-buffers-list
  "bs"  'split-window-vertically
  "bv"  'split-window-horizontally
  "k"   'kill-this-buffer
  "\\b" 'ace-jump-buffer
  "\\w" 'ace-jump-word-mode)
(global-evil-leader-mode +1)

;; package evil
(require 'evil)
(defun my/evil-mode-hook ()
  "My evil mode hook."
  (setq evil-emacs-state-cursor 'box)
  (setq evil-motion-state-cursor 'box)
  (setq evil-normal-state-cursor 'box)
  (setq evil-visual-state-cursor 'box)
  (setq evil-insert-state-cursor 'bar)
  (setq evil-replace-state-cursor 'hbar)
  (setq evil-operator-state-cursor 'box))
(add-hook 'evil-mode-hook 'my/evil-mode-hook)
(evil-mode +1)

;; --------------------------------------
;; ace-jump
;; --------------------------------------

;; package ace-jump-mode
(require 'ace-jump-mode)

;; package ace-jump-buffer
(require 'ace-jump-buffer)

;; --------------------------------------
;; neotree
;; --------------------------------------

(require 'neotree)
(defun my/neotree-mode-hook ()
  "My neotree mode hook."
  (setq neo-window-width 30)
  (setq neo-window-fixed-size nil)
  (evil-local-set-key 'normal (kbd "RET") 'neotree-enter)
  (evil-local-set-key 'normal (kbd "a")   'neotree-stretch-toggle)
  (evil-local-set-key 'normal (kbd "h")   'neotree-hidden-file-toggle)
  (evil-local-set-key 'normal (kbd "r")   'neotree-refresh)
  (evil-local-set-key 'normal (kbd "c")   'neotree-change-root)
  (evil-local-set-key 'normal (kbd "q")   'neotree-hide))
(add-hook 'neotree-mode-hook 'my/neotree-mode-hook)

;; --------------------------------------
;; auto package stuff
;; --------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
	(yaml-mode neotree ace-jump-buffer ace-jump-mode evil-terminal-cursor-changer evil-visualstar evil-leader evil flycheck-irony modern-cpp-font-lock company-irony-c-headers company-irony irony intero erlang omnisharp markdown-mode helm helm-company flycheck company helm-projectile projectile cmake-project cmake-mode reverse-im smooth-scrolling osx-clipboard zenburn-theme undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; .emacs ends here
