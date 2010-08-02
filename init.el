;;; Bart's init.el file
;;;
;;; important modules I use: org-mode, remember, gist, tramp, color-theme, org-mobile
;;; modules I load but am not sold on yet: ido, erc, twittering-mode (too many authorizations)

;;;    
;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; from emacs-starter-kit
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)
; lets try this, it opens buffer menu and moves to that buffer
(global-set-key "\C-x\C-b" 'list-buffers)


;; imaxima stuff 
(add-to-list 'load-path "/usr/share/emacs23/site-lisp/maxima/")
(autoload 'imaxima "imaxima" "Image support for Maxima." t)
(setq imaxima-pt-size 9)
(setq imaxima-fnt-size "large")


(add-to-list 'load-path "~/.emacs.d/vendor/")

;; magit
(require 'magit)

;; ljupdate
(add-to-list 'load-path "~/.emacs.d/vendor/ljupdate")
(require 'ljupdate)

;; scpaste.el
(autoload 'scpaste "scpaste" "Paste the current buffer." t nil)

;; ido: not into it..
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

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


(add-to-list 'load-path "/usr/share/emacs23/site-lisp/emacs-goodies-el/")
(add-to-list 'load-path "~/.emacs.d/elisp/")

(add-to-list 'load-path "~/.emacs.d/vendor/identica-mode/")
(require 'identica-mode)
(add-to-list 'load-path "~/.emacs.d/")
;; auth stuff
(require 'mystuff-init)

;; clojure-mode stuff
(add-to-list 'load-path "~/.emacs.d/vendor/clojure-mode/")
(require 'clojure-mode)

;; color-mode
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-robin-hood)
;;(setq blink-cursor-mode nil)

;; Twitter-mode
;;(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode/")
;;(require 'twittering-mode)
;;(global-set-key "\C-ct" 'twittering-mode)
;;(setq twittering-icon-mode t)

;; enable tramp for editing remote files 
(require 'tramp)

;; always turn on auto-fill/word-wrap in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; load gist mode
(add-to-list 'load-path "~/.emacs.d/vendor/gist.el")
(require 'gist)

;; android-mode
(add-to-list 'load-path "~/.emacs.d/vendor/android-mode/")
(require 'android-mode)
(setq android-mode-sdk-dir "~/android-sdk-linux_86/")


;; php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode t)
(org-remember-insinuate)
(setq org-directory "~/notes/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(add-to-list 'load-path "~/.emacs.d/vendor/remember")
(require 'remember)
;;(setq remember-data-file "~/notes.txt")
(global-set-key "\C-cr" 'org-remember)
(setq org-agenda-files (list "~/notes/TODO.org"
                             "~/notes/ideas.org" 
                             "~/notes/underhill.org"
			     "~/notes/denvertech.org"))
;; add WAITING to todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "DONE")))
;; set number of days to show in agenda to 7
(setq org-agenda-ndays 7)
;; start on current day, not Monday
(setq org-agenda-start-on-weekday nil)
;; log when todo items are toggled to done
(setq org-log-done 'note)
;;; org-mode remember templates
(setq org-remember-templates
      '(("Todo" ?t "* TODO %?\n  SCHEDULED: %t" "~/notes/TODO.org" "My Todos")
	("Note" ?n "* %? %u" "~/notes/notes.org" "Notes")
	("Review" ?r "* %u %?" "~/notes/reviews.org" "Reviews")
	("Journal" ?j "* %u %?" "~/notes/journal.org" "Journal")
	("Garden Journal" ?g "* %u %?" "~/notes/garden.org" "Garden Journal")))


;;; Emacs IRC client
(require 'erc)

;;; set the default browswer
;;(setq browse-url-generic-program (executable-find "google-chrome")
;; wow, conkeror rocks!! who needs a mouse.
(setq browse-url-generic-program (executable-find "conkeror")
browse-url-browser-function 'browse-url-generic)

;; this is the happyblogger org-settings.el file
(setq org-publish-project-alist
      '(
         ("blog-posts"
         :base-directory "~/blog/_org/posts/"
         :base-extension "org"
         :publishing-directory "~/blog/_posts"
         :inline-images t
         :table-of-contents nil
         :drawers nil
         :todo-keywords nil ; Skip todo keywords
         :exclude "draft*" ; TODO fix
         :section-numbers nil
         :auto-preamble nil
         :auto-postamble nil
         )
        ("blog-pages" ;; This section is optional.
         :base-directory "~/blog/_org/pages/"
         :base-extension "org"
         :publishing-directory "~/blog/pages"
         :inline-images t
         :table-of-contents nil
         :drawers nil
         :todo-keywords nil ; Skip todo keywords
         :section-numbers nil
         :auto-preamble nil
         :auto-postamble nil
         ;; :completion-function
         )
        ("blog" :components ("blog-posts" "blog-pages"))))

;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory, instead of leaving tilde files everywhere 
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; dot-emacs junkyard
;;
;;;;;;;;;;;;;;;;;;;;;;;;

;;; lilypond stuff
;(autoload 'LilyPond-mode "lilypond-mode")
;(setq auto-mode-alist
;     (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
;(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; php-mode-improved.el
;;(setq load-path (add-to-list 'load-path "~/.emacs.d/elisp/php-mode-improved.el"))

;; muse
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/muse-3.20/lisp/")
;;(require 'muse-mode)
;;(require 'muse-publish)
;;(require 'muse-html)  ;; and so on



;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(lj-fill-function (quote lj-fill-by-paragraph)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
