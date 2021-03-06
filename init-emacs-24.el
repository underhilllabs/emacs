;;; Bart's .emacs file
;;;

;; map PageUp and PageDown on a mac to beginning/end of line
(if (eq system-type 'darwin)
    (progn 
      (global-set-key (kbd "<home>") 'beginning-of-line)
      (global-set-key (kbd "<end>") 'end-of-line)
      (global-set-key (kbd "<prior>") 'scroll-down-command)
      (global-set-key (kbd "<next>") 'scroll-up-command)))
      
;; emacs 24 packages!!
(require 'package)
(package-initialize)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-z") 'undo)

;; stuff for nanowrimo
(define-key global-map "\C-c\C-w" 'word-count)
(define-key global-map "\C-c\C-r" 'revert-buffer)
;; soft-fold lines beyond 90 or so.
(add-hook 'markdown-mode-hook 'longlines-mode)
;; count words in buffer
(defun word-count ()
  "Count words in buffer"
  (interactive)
  (shell-command-on-region
   (point-min)
   (point-max)
   "wc -w"))

;; stop using M-x, stop folding thumb under
(define-key global-map "\C-c\C-m" 'execute-extended-command)

;; good theme for terminals
(load-theme 'wombat)

;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)
; lets try this, it opens buffer menu and moves to that buffer
(global-set-key "\C-x\C-b" 'list-buffers)

;============================
; yep, it's come to this...
;
; Evil-mode configuration
;===========================

;; the toggle key, since I already have C-z mapped to undo.
;; must set toggle-key before requiring 'evil
(setq evil-toggle-key "\C-c\C-e")

(require 'evil)
;; let's try toggling between emacs and vim-normal mode
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

; use Emacs C-d
(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)

; use the Emacs C-k
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)

; I want to use C-e for end-of-line
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)

(evil-mode 1)

;;;;;;;;;;;;;;;;;;
;   How to set and unset key bindings
;
;   this is how to define a key for a specific mode-map
;   (define-key texinfo-mode-map "\C-c\C-cg" 'texinfo-insert-@group)
;
;   ** Define a key globally! **
;   (global-set-key "\C-x\C-b" 'list-buffers)
;     ** or **
;   (define-key global-map "\C-c t" 'twittering-mode)
;
;   use square brackets for function keys, mouse keys, non-ascii chars
;;  (global-set-key [f6] 'line-to-top-of-window)

(add-to-list 'load-path "~/.emacs.d/elisp/magit-0.8.2/")
(add-to-list 'load-path "/usr/share/emacs22/site-lisp/emacs-goodies-el/")
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; turn off opening splash screen
(setq inhibit-splash-screen t inhibit-startup-echo-area-message t)

;; magit-status
;;   s: stage file, u: unstage, c: commit-log
;;   C-c C-c: commit, P: push
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; turn on autofill for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; php!!
(require 'php-mode)
(require 'flymake)
(add-hook 'php-mode-hook (lambda() (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

;;jshint
(add-to-list 'load-path "~/.emacs.d/vendor/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
     (lambda () (flymake-mode t)))

;; ruby on rails
(require 'rinari)


;; php-mode and drupal-mode
;(add-to-list 'load-path "~/projects/drupal-mode")
;(require 'drupal-mode)
;(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
;(add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
;(add-to-list 'auto-mode-alist '("\\.info" . conf-mode))
;(add-to-list 'auto-mode-alist '("\\(php\\|inc\\)$" . drupal-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl.php$" . nxhtml-mumamo-mode))

;; I prefer drupal-mode to php-mode
;; drupal-mode
;(require 'setup-php)
;(setup-php)

;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory, instead of leaving tilde files everywhere
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Custom Variables
(custom-set-variables

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2 t)
;; '(custom-safe-themes (quote ("60e70079a187df634db25db4bb778255eaace1ef4309e56389459fb9418b4840" default)))
 '(transient-mark-mode t))

(put 'downcase-region 'disabled nil)

;; start each session by opening .emacs file (for now) and some other files
(find-file "~/.emacs")
(find-file "~/cheatsheet_emacs.txt")

(setq-default tab-width 2)
(add-hook 'css-mode-hook
          (lambda()
            (set (make-local-variable 'tab-width) 2)
            ))


(setq css-indent-offset 2)
