;;; Bart's .emacs file
;;;

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

;; nano
(define-key global-map "\C-c\C-w" 'word-count)
(define-key global-map "\C-c\C-r" 'revert-buffer)
;; soft-fold lines beyond 90 or so.
(add-hook 'markdown-mode-hook 'longlines-mode)
;; count words in buffer
(defun word-count nil "Count words in buffer" (interactive)
(shell-command-on-region (point-min) (point-max) "wc -w"))

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
;;(require 'evil-leader)
;;(global-evil-leader-mode)
; set , as leader key
;;(evil-leader/set-leader ",")

; the toggle key, since I already have C-z mapped to undo.
(setq evil-toggle-key "\C-c\C-e")
(require 'evil)
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

;; color-mode
;(add-to-list 'load-path "/usr/share/emacs23/site-lisp/emacs-goodies-el/")

(add-to-list 'load-path "~/.emacs.d/elisp/magit-0.8.2/")
;;(add-to-list 'load-path "~/.emacs.d/elisp/sass-mode/")
;;(add-to-list 'load-path "~/.emacs.d/elisp/haml-mode/")
;;(add-to-list 'load-path "~/.emacs.d/elisp/scss-mode/")
;;(add-to-list 'load-path "~/.emacs.d/elisp/emacs-color-theme-solarized/")
(add-to-list 'load-path "/usr/share/emacs22/site-lisp/emacs-goodies-el/")
(add-to-list 'load-path "~/.emacs.d/elisp/")
;;(require 'pink-bliss)
;; turn off opening splash screen
(setq inhibit-splash-screen t inhibit-startup-echo-area-message t)

;; magit-status
;;   s: stage file, u: unstage, c: commit-log
;;   C-c C-c: commit, P: push
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
;;(require 'haml-mode)
;;(require 'sass-mode)
;;(require 'scss-mode)
;;(autoload 'scss-mode "scss-mode")
;;(add-to-list 'auto-mode-alist '("\\(sass\\|scss\\)$" . scss-mode))
;;(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;;(load "~/.emacs.d/elisp/nxhtml/autostart.el")
;; (require 'seamus256)
;; (require 'color-theme)
;; (color-theme-initialize)
;; (require 'zenburn)
;; (require 'color-theme-solarized)


;;(require 'color-theme-tango)
; (setq color-theme-is-global t)
;; if emacs is in its own x-window: use robin-hood, else its in a terminal: use the lovely zenburn
;; (if window-system
;;     (color-theme-robin-hood)
;;   (color-theme-seamus256))
;;(color-theme-katester)
;;(color-theme-tango)
;;(color-theme-lethe)  ;; fave 8 color, but looks awful in 256 colors
;;(color-theme-lawrence)
;;(color-theme-charcoal-black)
;;(color-theme-dark-laptop)
;; always turn on auto-fill/word-wrap in text-mode

;; (setq my-color-themes (list 'color-theme-solarized-dark 'color-theme-solarized-light
;;                             'color-theme-comidia 'color-theme-robin-hood
;;                             'color-theme-calm-forest 'color-theme-clarity 'color-theme-goldenrod
;;                             'color-theme-seamus256 'color-theme-zenburn
;;                             'color-theme-charcoal-black 'color-theme-dark-laptop))



;; (defun my-theme-set-default () ; Set the first row
;;   (interactive)
;;   (setq theme-current my-color-themes)
;;   (funcall (car theme-current)))

;; (defun my-describe-theme () ; Show the current theme
;;   (interactive)
;;   (message "%s" (car theme-current)))

; Set the next theme (fixed by Chris Webber - tanks)
;; (defun my-theme-cycle ()
;;   (interactive)
;;   (setq theme-current (cdr theme-current))
;;   (if (null theme-current)
;;       (setq theme-current my-color-themes))
;;   (funcall (car theme-current))
;;   (message "%S" (car theme-current)))

; (setq theme-current my-color-themes)
; (setq color-theme-is-global nil) ; Initialization
; (my-theme-set-default)
; (global-set-key [f12] 'my-theme-cycle)


(add-hook 'text-mode-hook 'turn-on-auto-fill)


;; (defun drupal-drush-cc-all (&rest args)
;;   (interactive)
;;   (call-process "drush" nil "* drush *" nil "cc" "all"))


;; (defun drupal-drush-variable-get (variable)
;;   (interactive
;;    (if (and current-prefix-arg (not (consp current-prefix-arg)))
;;        ""
;;      (list (read-string "variable: "))))
;;   (call-process "drush" nil "*Drush*" t "variable-get" variable))
;; ;

;; php-mode
(add-to-list 'load-path "~/projects/drupal-mode")
(require 'drupal-mode)
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-mode))
(add-to-list 'auto-mode-alist '("\\(php\\|inc\\)$" . drupal-mode))
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

;; make regions visible
(custom-set-variables

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2 t)
;; '(custom-safe-themes (quote ("60e70079a187df634db25db4bb778255eaace1ef4309e56389459fb9418b4840" default)))
 '(transient-mark-mode t))

(put 'downcase-region 'disabled nil)

;; start each session by opening .emacs file (for now)
(find-file "~/projects/nanowrimo2013/off-planet-storage.md")
(find-file "~/.emacs")
(find-file "~/cheatsheet_emacs.txt")

(setq-default tab-width 2)
(add-hook 'css-mode-hook
          (lambda()
            (set (make-local-variable 'tab-width) 2)
            ))


(setq css-indent-offset 2)
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#232323"))))
;;  '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#343434"))))
;;  '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) (:background "#000000"))))
;;  '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) (:background "#4F4F4F"))))
;;  '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) (:background "#4F4F4F")))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#232323"))) t)
;;  '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#343434"))) t)
;;  '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) (:background "#000000"))) t)
;;  '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) (:background "#4F4F4F"))) t)
;;  '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) (:background "#4F4F4F"))) t))

