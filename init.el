;; Bart's init.el file
;;;
;;; important modules I use: org-mode, JDE, remember, tramp, color-theme, org-mobile
;;; modules I load but am not sold on yet: ido, erc, twittering-mode (too many authorizations)

;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;;;;;
;;
;; Set kbd shortcuts
;;
;;;;;;

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)
; lets try this, it opens buffer menu and moves to that buffer
(global-set-key "\C-x\C-b" 'list-buffers)
(global-set-key (kbd "C-M-;") 'comment-region)
;; UNDO ctrl-z
(global-set-key (kbd "C-z") 'undo)

;; turn off opening splash screen
(setq inhibit-splash-screen t inhibit-startup-echo-area-message t)

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-oauth/")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/elisp_stuff/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/jde/lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet-common")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet-contrib")
(load-file "/usr/share/emacs/site-lisp/cedet-common/cedet.el")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/elib")
; java developer environment
(require 'jde)

;(add-to-list 'load-path "~/elisp_stuff/color-theme-seamus/")
;;(add-to-list 'load-path "~/vendor/pink-bliss/")
;; solarized theme
;;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized/")

;; Rinari, ruby on rails mode
(add-to-list 'load-path "~/.emacs.d/vendor/rinari/")
(require 'rinari)
;;(require 'color-theme-library)
;; gas-mode for assembly
;; (require 'gas-mode)
;; (add-to-list 'auto-mode-alist '("\\.S\\'" . gas-mode))

;; coffee-mode!!
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
;; idiomatic coffee-script uses 2 spaces, 
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))
(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
;; compile-on-save: compile coffee-script into js on save
(add-hook 'coffee-mode-hook '(lambda () (coffee-cos-mode t)))

;; graphviz
(require 'graphviz-dot-mode)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))
(add-to-list 'auto-mode-alist '("\\.gv\\'" . graphviz-dot-mode))

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
;;(require 'identica-mode)
;; how do you want to edit status updates? 
;;   choices: 'edit-buffer or 'minibuffer
;;(setq identica-update-status-method 'edit-buffer)

;; pink-bliss
;;(require 'pink-bliss)

;; magit
(require 'magit)

;; jekyll
;;(require 'jekyll)
;;(global-set-key (kbd "C-c b n") 'jekyll-draft-post)
;;(global-set-key (kbd "C-c b P") 'jekyll-publish-post)
;; (global-set-key (kbd "C-c b p") (lambda () 
;;                                   (interactive)
;;                                   (find-file "~/Sources/blog/_posts/")))
;; (global-set-key (kbd "C-c b d") (lambda () 
;;                                   (interactive)
;;                                   (find-file "~/Sources/blog/_drafts/")))

;(require 'textile-mode)

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

;; Do you a HASKELL!!
;(load "~/.emacs.d/vendor/haskell-mode/haskell-site-file")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq jde-global-classpath "/home/bart/javastuff/")
(getenv "CLASSPATH")
(setq jde-global-classpath nil)
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

;; debian package maintainer fucked up emacs23 emacs-goodies so use this old directory
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/")

;; auth stuff
(require 'mystuff-init)

;; try new python.el
(require 'python)

;; processing-mode stuff
;; (require 'processing-mode)
;; (autoload 'processing-mode "processing-mode" "Processing mode" t)
;; (add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
;; (setq processing-location "~/.emacs.d/processing-mode.el")

(global-font-lock-mode t)
;; color-mode
;;/usr/share/emacs23/site-lisp/emacs-goodies-el/color-theme.el
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-robin-hood)
(require 'color-theme-tango)
(require 'color-theme-zenburn)
;(require 'color-theme-seamus)
;;(require 'color-theme-solarized)
;;(require 'color-theme-inkpot)
;;(require 'color-theme-desertex)
;;(color-theme-goldenrod)
;;(color-theme-calm-forest)
;; use this to try other themes
;; (color-theme-select)
;;(color-theme-clarity)
;;(color-theme-blippblopp)
;;(setq blink-cursor-mode nil)
;;(message "made it passed the color shit")
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


(set-fill-column 80)
;; old remember stuff
;;(org-remember-insinuate)
;;(require 'remember)
;;(setq remember-data-file "~/notes.txt")
;;(add-to-list 'load-path "~/.emacs.d/vendor/remember")
;;; org-mode remember templates
;; (setq org-remember-templates
;;       '(("Todo" ?t "* TODO %?\n  SCHEDULED: %t" "~/notes/personal.org" "My Todos")
;; 	("Note" ?n "* %? %u" "~/notes/notes.org" "Notes")
;; 	;; ("Review" ?r "* %u %?" "~/notes/reviews.org" "Reviews")
;; 	("Journal" ?j "* %u %?" "~/notes/journal.org" "Journal")))
;; 	;; ("Garden Journal" ?g "* %u %?" "~/notes/garden.org" "Garden Journal")


(setq org-directory "~/notes/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(global-set-key "\C-cc" 'org-capture)
;; this is set via C-c [ now
;(setq org-agenda-files (list "~/notes/personal.org"
;                             "~/notes/underhill.org"
;                             "~/notes/metro-hw.org"))


;; count words in buffer
(defun word-count nil "Count words in buffer" (interactive)
(shell-command-on-region (point-min) (point-max) "wc -w"))

;; word count minor mode
(autoload 'word-count-mode "word-count"
  "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

(setq org-capture-templates
      '(("j" "Journal" entry (file+datetree "~/notes/journal.org") "* %?\nEntered on %U\n %i\n %a")  
        ("t" "TODO" entry (file+headline "~/notes/personal.org" "Tasks") "** TODO %?\n %i\n %a ") 
        ("c" "Homework Calculus" entry (file+headline "~/notes/metro-hw.org" "Calc III") "** %?\nDEADLINE:%^{Due date:}t " )
        ("p" "Homework Probs and Stats" entry (file+headline "~/notes/metro-hw.org" "Probs and Stats") "** %?\nDEADLINE:%^{Due date:}t " )))
;; add WAITING to todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "DONE")))
;; set number of days to show in agenda to 7
(setq org-agenda-ndays 7)
;; start on current day, not Monday
(setq org-agenda-start-on-weekday nil)
;; log when todo items are toggled to done
(setq org-log-done 'time)
;; log when a recurring todo was done
(setq org-log-repeat 'time)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; display images, graphs after code execution
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
;; Org-babel
;; NOT WORKING in 11.10
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t)
;;    (R . t)
;;    (ruby . t)
;;    (dot . t)
;;    (python . t)
;;    (scheme . t)))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate 'y-or-no-p)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "ditaa"))
  (not (string= lang "dot"))
  (not (string= lang "R"))
  (not (string= lang "ruby")))  ; don't ask for ditaa, R, dot or Ruby
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; Org-mobile settings
(require 'org-mobile)
(setq org-mobile-directory "/scpc:grayjay@denvertech.org:org/")
(setq org-mobile-files
      (list "~/notes/metro-hw.org"))
(setq org-mobile-inbox-for-pull "~/notes/mobiles.org")
; add keyboard shortcut to run org-mobile-push
(define-key org-mode-map "\C-cp" 'org-mobile-push)

;; org-mode toodledo
;;(require 'org-toodledo.el)

;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory, instead of leaving tilde files everywhere 
(setq backup-directory-alist (quote ((".*" . "~/.my_emacs_backups/"))))

;; start each session by opening .emacs file (for now)
(find-file "~/.emacs.d/init.el")
;(find-file "~/cheatsheet_emacs.txt")
(find-file "~/notes/")


(require 'edit-server)
(edit-server-start)
(server-start)
;; hit max size when I'm writing lisp stuff
;;setq max-specpdl-size 3000)


(defun confirm-exit-emacs ()
        "ask for confirmation before exiting emacs"
        (interactive)
        (if (yes-or-no-p "Are you sure you want to exit? ")
                (save-buffers-kill-emacs)))

(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)

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

;;; lilypond stuff
;(autoload 'LilyPond-mode "lilypond-mode")
;; (setq auto-mode-alist;;
;;      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
;; (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
;; majorursa.net
(setq org-publish-project-alist
      '(
         ("blog-posts"
         :base-directory "~/webdev/posts/"
         :author "Seamys Grayshanks"
         :email "seamys@majorursa.net"
         :base-extension "org"
         :publishing-directory "/ssh:grayjay@denvertech.org:~/public_html/mu/"
         :inline-images t
         :makeindex nil
         :table-of-contents nil
         :link-up "./index.html"
         :drawers nil
         :todo-keywords nil ; Skip todo keywords
         :exclude "draft*" ; TODO fix
         :section-numbers nil
         :auto-preamble nil
         :auto-postamble nil
         :recursive t
         :style-extra "<link rel='stylesheet' href='http://majorursa.net/my-orgmode.css' type='text/css'/><link href='http://fonts.googleapis.com/css?family=Ubuntu:regular,italic,bold' rel='stylesheet' type='text/css'/>"
         )
         ("blog-static"
          :base-directory "~/webdev/posts/"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory "/ssh:grayjay@denvertech.org:~/public_html/mu/"
          :recursive t
          :publishing-function org-publish-attachment
          )
        ("blog-pages" ;; This section is optional.
         :base-directory "~/webdev/pages/"
         :author "Seamys Grayshanks"
         :email "seamys@majorursa.net"
         :base-extension "org"
         :publishing-directory "/ssh:grayjay@denvertech.org:~/public_html/mu/pages/"
         :inline-images t
         :table-of-contents nil
         :drawers nil
         :todo-keywords nil ; Skip todo keywords
         :section-numbers nil
         :auto-preamble nil
         :auto-postamble nil
         ;; :completion-function
         )
        ("blog" :components ("blog-posts" "blog-pages" "blog-static"))))
      

;; #+LaTeX_CLASS: beamer in org files
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;   ;; beamer class, for presentations
;;   '("beamer"
;;      "\\documentclass[11pt]{beamer}\n
;;       \\mode<{{{beamermode}}}>\n
;;       \\usetheme{{{{beamertheme}}}}\n
;;       \\usecolortheme{{{{beamercolortheme}}}}\n
;;       \\beamertemplateballitem\n
;;       \\setbeameroption{show notes}
;;       \\usepackage[utf8]{inputenc}\n
;;       \\usepackage[T1]{fontenc}\n
;;       \\usepackage{hyperref}\n
;;       \\usepackage{color}
;;       \\usepackage{listings}
;;       \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
;;   frame=single,
;;   basicstyle=\\small,
;;   showspaces=false,showstringspaces=false,
;;   showtabs=false,
;;   keywordstyle=\\color{blue}\\bfseries,
;;   commentstyle=\\color{red},
;;   }\n
;;       \\usepackage{verbatim}\n
;;       \\institute{{{{beamerinstitute}}}}\n          
;;        \\subject{{{{beamersubject}}}}\n"

;;      ("\\section{%s}" . "\\section*{%s}")
     
;;      ("\\begin{frame}[fragile]\\frametitle{%s}"
;;        "\\end{frame}"
;;        "\\begin{frame}[fragile]\\frametitle{%s}"
;;        "\\end{frame}")))
;; article class
;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")))  

;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


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
 '(jde-jdk-registry (quote (("1.6.0.22" . "/usr/lib/jvm/java-6-openjdk/"))))
 '(lj-fill-function (quote lj-fill-by-paragraph))
 '(org-agenda-files (quote ("~/notes/metro-hw.org" )))
 '(org-modules (quote (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
