;;; Bart's init.el file
;;;
;;; important modules I use: org-mode, JDE, remember, tramp, color-theme, org-mobile
;;; modules I load but am not sold on yet: ido, erc, twittering-mode (too many authorizations)

;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
;; magit-statuspublic 
(global-set-key (kbd "C-x g") 'magit-status)
; lets try this, it opens buffer menu and moves to that buffer
(global-set-key "\C-x\C-b" 'list-buffers)

;; turn off opening splash screen
(setq inhibit-splash-screen t inhibit-startup-echo-area-message t)

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-oauth/")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/elisp_stuff/")
(add-to-list 'load-path "~/vendor/pink-bliss/")
;; solarized theme
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized/")

;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari/")
(require 'rinari)

;; (require 'color-theme-wombat)
;; use system font
(setq font-use-system-font t)

;;python stuff 
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)

;; automatically make scripts executable
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;; imaxima stuff 
; (add-to-list 'load-path "/usr/share/emacs23/site-lisp/maxima/")
; (autoload 'imaxima "imaxima" "Image support for Maxima." t)
; (setq imaxima-pt-size 11)
; (setq imaxima-fnt-size "large")



;; identica
(require 'identica-mode)
;; how do you want to edit status updates? 
;;   choices: 'edit-buffer or 'minibuffer
(setq identica-update-status-method 'edit-buffer)

;; pink-bliss
; (require 'pink-bliss)
;; magit
(require 'magit)

;; jekyll
(require 'jekyll)
(global-set-key (kbd "C-c b n") 'jekyll-draft-post)
(global-set-key (kbd "C-c b P") 'jekyll-publish-post)
;; (global-set-key (kbd "C-c b p") (lambda () 
;;                                   (interactive)
;;                                   (find-file "~/Sources/blog/_posts/")))
;; (global-set-key (kbd "C-c b d") (lambda () 
;;                                   (interactive)
;;                                   (find-file "~/Sources/blog/_drafts/")))



(require 'textile-mode)

; netflix-mode
; (require 'netflix-mode)

;; ljupdate
; (add-to-list 'load-path "~/.emacs.d/vendor/ljupdate")
; (require 'ljupdate)

;; scpaste.el
; (autoload 'scpaste "scpaste" "Paste the current buffer." t nil)

;; ido: not into it..
;;(require 'ido)
;;(ido-mode t)
;;(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; undo ctrl-z
(global-set-key (kbd "C-z") 'undo)

;; Do you a HASKELL!!
; (load "~/.emacs.d/vendor/haskell-mode/haskell-site-file")
; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;(setq jde-global-classpath "/home/bart/javastuff/")
;; (getenv "CLASSPATH")
;;(setq jde-global-classpath nil)
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

;; auth stuff
(require 'mystuff-init)

;; try new python.el
(require 'python)

;; processing-mode stuff
;;(require 'processing-mode)
;(autoload 'processing-mode "processing-mode" "Processing mode" t)
;(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
;(setq processing-location "~/.emacs.d/processing-mode.el")

;; color-mode
;;/usr/share/emacs23/site-lisp/emacs-goodies-el/color-theme.el
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-robin-hood)
(require 'color-theme-tango)
(require 'color-theme-zenburn)
(require 'color-theme-solarized)
(require 'color-theme-inkpot)
(require 'color-theme-desertex)

;;(color-theme-goldenrod)
;;(color-theme-calm-forest)
;; use this to try other themes
;; (color-theme-select)
;;(color-theme-clarity)
;;(color-theme-blippblopp)
;;(setq blink-cursor-mode nil)

;; enable tramp for editing remote files 
(require 'tramp)

;; always turn on auto-fill/word-wrap in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; load gist mode
(add-to-list 'load-path "~/.emacs.d/vendor/gist.el")
(require 'gist)

;;(add-to-list 'classpath ".")
;; android-mode
;(add-to-list 'load-path "~/.emacs.d/vendor/android-mode/")
;(require 'android-mode)
;(setq android-mode-sdk-dir "~/android-sdk-linux_86/")

;; php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;
;; org-mode
;;
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode t)
(org-remember-insinuate)
(setq org-directory "~/notes/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(add-to-list 'load-path "~/.emacs.d/vendor/remember")
(require 'remember)
;;(setq remember-data-file "~/notes.txt")
(global-set-key "\C-cr" 'org-remember)
(setq org-agenda-files (list "~/notes/underhill.org"
                             "~/notes/metro-hw.org"))
;; add WAITING to todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "DONE")))
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
	;; ("Review" ?r "* %u %?" "~/notes/reviews.org" "Reviews")
	("Journal" ?j "* %u %?" "~/notes/journal.org" "Journal")))
	;; ("Garden Journal" ?g "* %u %?" "~/notes/garden.org" "Garden Journal")
;; Org-mobile settings
(require 'org-mobile)
(setq org-mobile-directory "/scpc:bart@denvertech.org:org/")
(setq org-mobile-files
      (list "~/notes/metro-hw.org"))
(setq org-mobile-inbox-for-pull "~/notes/mobiles.org")
;; add keyboard shortcut to run org-mobile-push
(define-key org-mode-map "\C-cp" 'org-mobile-push)

;; org-mode toodledo
(require 'org-toodledo.el)


;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory, instead of leaving tilde files everywhere 
(setq backup-directory-alist (quote ((".*" . "~/.my_emacs_backups/"))))

;; start each session by opening .emacs file (for now)
(find-file "~/.emacs.d/init.el")
(find-file "~/cheatsheet_emacs.txt")

;; hit max size when I'm writing lisp stuff
;;setq max-specpdl-size 3000)

;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; dot-emacs junkyard
;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Twitter-mode
;;(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode/")
;;(require 'twittering-mode)
;;(global-set-key "\C-ct" 'twittering-mode)
;;(setq twittering-icon-mode t)

;;; Emacs IRC client
;;;(require 'erc)

;;; set the default browswer
;;(setq browse-url-generic-program (executable-find "google-chrome")
;; wow, conkeror rocks!! who needs a mouse.
;;;(setq browse-url-generic-program (executable-find "conkeror")
;;;  browse-url-browser-function 'browse-url-generic)

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
;; this is the happyblogger org-settings.el file
;;(setq org-publish-project-alist
;;      '(
;;         ("blog-posts"
;;         :base-directory "~/blog/_org/posts/"
;;         :base-extension "org"
;;         :publishing-directory "~/blog/_posts"
;;         :inline-images t
;;         :table-of-contents nil
;;         :drawers nil
;;         :todo-keywords nil ; Skip todo keywords
;;         :exclude "draft*" ; TODO fix
;;         :section-numbers nil
;;         :auto-preamble nil
;;         :auto-postamble nil
;;         )
;;        ("blog-pages" ;; This section is optional.
;;         :base-directory "~/blog/_org/pages/"
;;         :base-extension "org"
;;         :publishing-directory "~/blog/pages"
;;         :inline-images t
;;         :table-of-contents nil
;;         :drawers nil
;;         :todo-keywords nil ; Skip todo keywords
;;         :section-numbers nil
;;         :auto-preamble nil
;;         :auto-postamble nil
;;         ;; :completion-function
;;         )
;;        ("blog" :components ("blog-posts" "blog-pages"))))

;; clojure-mode stuff
;;(add-to-list 'load-path "~/.emacs.d/vendor/clojure-mode/")
;;(require 'clojure-mod)e

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
 '(jde-enable-abbrev-mode t)
 '(jde-global-classpath (quote ("/home/bart/javastuff/:.")))
 '(jde-jdk-registry (quote (("1.6.0.22" . "/usr/lib/jvm/java-6-sun/"))))
 '(lj-fill-function (quote lj-fill-by-paragraph)))

