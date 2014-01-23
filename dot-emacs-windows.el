(require 'package)
(package-initialize)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'load-path "~/.emacs.d/vendor/")
;; packages
(add-to-list 'load-path "~/.emacs.d/elpa/")

(add-to-list 'load-path "~/.emacs.d/vendor/php-mode/")
(require 'php-mode)

(global-set-key (kbd "C-z") 'undo)
;; this wraps lines at word boundaries and moves and kills lines by visual line
(global-visual-line-mode 1) 

; the toggle key, since I already have C-z mapped to 
(setq evil-toggle-key "\C-c\C-e")

;; Emacs VI Layer
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

;; FUCK evil mode and its crappy undo tree
(setq evil-want-fine-undo t)
(evil-mode 1)
;;(evil-mode 0b)
(setq tramp-default-method
      (case system-type
        (windows-nt "plinkx")
        (otherwise "sshx")))
;; load AFTER elpa is loaded!
;(load-theme 'misterioso t)
(load-theme 'solarized-dark 
;; [in .emacs]
;; Use 12-pt Consolas as default font
(set-face-attribute 'default nil
                    :family "Consolas" :height 120)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-font-lock-mode t)
(require 'magit)

;;(setq 'linum-mode t)
(require 'tramp)
;;(setq tramp-default-method "ftp") 
;;(setq tramp-default-method "pscp")
;;(add-to-list 'exec-path "C:/Program Files (x86)/plink")
;;(setq tramp-default-method "pscp")`

;;(setq eshell-path-env (concat "C:/ProgramData/Drush/;C:\\Program Files (x86)\\Drush\\GnuWin32\\bin\\;C:/Program\ Files\ \(x86\)/Drush/Php/" ";" eshell-path-env))

(add-to-list 'exec-path "C:/Users/lantzba/AppData/Local/Github/PortableGit_015aa71ef18c047ce8509ffb2f9e4bb0e3e73f13/bin/")
(add-to-list 'exec-path "C:/Program Files (x86)/Drush/Php/")
;; okay cygwin
(if (file-directory-p "c:/cygwin64/bin")
    (add-to-list 'exec-path "c:/cygwin64/bin"))
(setq shell-file-name "bash")
(setq explicit-shell-file-name shell-file-name)
 (cond  ((eq window-system 'w32)
	 (setq tramp-default-method "scpx"))
	(t
	 (setq tramp-default-method "scpc")))


;; toggle line number mode
(global-set-key "\C-x\C-l" 'linum-mode)

;; add evil-surround
(require 'surround)
(global-surround-mode 1)

;; still need to get this working in windows
(global-set-key (kbd "C-x g") 'magit-status)

; lets try this, it opens buffer menu and moves to that buffer
(global-set-key "\C-x\C-b" 'list-buffers)
(global-set-key (kbd "C-M-;") 'comment-region)

;; find file at point ; actually, I'll just use vim's gf
(global-set-key "\C-cgf" 'ffap)

;;(global-linum-mode 0) 
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))

(find-file "~/.emacs")
(find-file "C:/Users/lantzba/Documents/notes/")


;; (require 'elfeed)
;; (global-set-key (kbd "C-x w") 'elfeed)
;; (setq elfeed-feeds
;;       '("http://planet.emacsen.org/atom.xml"
;;         "http://www.terminally-incoherent.com/blog/feed/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(scroll-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

