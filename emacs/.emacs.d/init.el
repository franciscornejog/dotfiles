(require 'package)                   ; enable package
(setq package-enable-at-startup nil) ; do not start package at init
(setq package-archives               ; access repositories
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))
(package-initialize)                 ; initialize package

(require 'exwm)
(require 'exwm-config)
(exwm-config-default)
(toggle-frame-fullscreen)

(menu-bar-mode -1)                   ; disable menu bar
(scroll-bar-mode -1)                 ; disable scroll bar
(tool-bar-mode -1)                   ; disable tool bar
(show-paren-mode 1)                  ; enable paren mode
(global-hl-line-mode 1)              ; enable hl mode
(column-number-mode)                 ; view column location
(fset 'yes-or-no-p 'y-or-n-p)        ; simplify yes/no prompts
(global-auto-revert-mode t)          ; auto update buffer
(setq-default indent-tabs-mode nil)  ; convert tabs to spaces
(setq ring-bell-function 'ignore)    ; disable bell indicators

(cond ((eq system-type 'darwin)
       ;; MacOS
       ;; set font
       (set-face-attribute 'default nil :font "Inconsolata" :height 135)
       ;; merge OS titlebar with Emacs
       (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
       ))

(setq tramp-default-method "ssh")         ; set ssh method for tramp
(setq custom-file "~/.emacs.d/custom.el") ; set custom file
(load custom-file nil t)                  ; load custom file
(setq make-backup-files nil)              ; disable backup files
(setq create-lockfiles nil)               ; disable lockfiles
(setq version-control t)                  ; enable version control
(setq auto-save-file-name-transforms      ; autosave in tmp directory
      `((".*" ,temporary-file-directory t)))
(setq c-default-style "stroustrup")       ; set c style

(unless (package-installed-p 'use-package)  ; install use-package
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))  ; enable use-package
(setq use-package-always-ensure t)          ; ensure packages are loaded

;(use-package diminish) ; hide minor modes

(global-set-key (kbd "C-c fR") 'rename-file)
(global-set-key (kbd "C-c lf") 'load-file)

(global-set-key (kbd "C-c mp") '(lambda () (interactive)
                                  (find-file "/ssh:fc6631@queeg.cs.rit.edu:/home/stu11/s2/fc6631/Courses/CS243/.")))
(global-set-key (kbd "C-c fi") '(lambda () (interactive)
                                  (find-file "~/.emacs.d/init.org")))
(global-set-key (kbd "C-c ft") '(lambda () (interactive)
                                  (find-file "~/.emacs.d/noired-theme.org")))
(global-set-key (kbd "C-c sa") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/life.txt")))
(global-set-key (kbd "C-c sr") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/rit.txt")))
(global-set-key (kbd "C-c ss") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/wint95.txt")))
(global-set-key (kbd "C-c sp") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/math251.txt")))
(global-set-key (kbd "C-c sm") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/csci243.txt")))
(global-set-key (kbd "C-c sc") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/csci262.txt")))
(global-set-key (kbd "C-c se") '(lambda () (interactive)
                                  (find-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/swen261.txt")))

(use-package autothemer) ; easier theming
(load-theme 'noired t)   ; load theme

(use-package helpful   ; better help context
  :commands (helpful-variable helpful-callable
                              helpful-function helpful-command)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package rainbow-mode :commands (rainbow-mode)) ; add colors

(use-package ivy      ; general completion
  :diminish           ; hide ivy mode
  :bind (("C-s" . swiper))
  :init (ivy-mode 1))

(use-package ivy-rich      ; more context
  :after ivy               ; load after ivy
  :init (ivy-rich-mode 1)) ; add context

(use-package counsel                           ; add functionality
  :bind (("M-x" . counsel-M-x))
  :config (setq ivy-initial-inputs-alist nil)) ; remove ^ from searches

(use-package which-key                      ; view keybindings
  :diminish                                 ; hide WK mode
  :init (which-key-mode)                    ; start WK mode
  :config (setq which-key-idle-delay 0.3))  ; set delay

(use-package evil                       ; vim mode
  :config (evil-mode 1))                ; enable evil mode

(use-package org                            ; organize life
  :mode ("\\.txt\\'" . org-mode)            ; read text files into org mode
  :bind (("C-c a" . org-agenda)
         ("C-c C" . org-capture)
         ("C-c tl" . org-toggle-link-display)
         ("C-c tu" . org-timestamp-up-day))
  :config (setq org-src-fontify-natively t
                org-src-tab-acts-natively t
                org-src-preserve-indentation nil
                org-src-window-setup 'current-window
                org-agenda-window-setup 'current-window
                org-agenda-files (list "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/")
                org-agenda-file-regexp "\\`[^.].*\\.txt\\'"
                org-agenda-span 14))

(add-hook 'org-mode-hook ; org mode hook
          '(lambda ()
             (global-visual-line-mode 1)
             (auto-fill-mode 1)
             (set-fill-column 79)
             (display-fill-column-indicator-mode 1)))

(add-hook 'prog-mode-hook ; prog mode hook
          '(lambda ()
             (display-line-numbers-mode 1)
             (global-visual-line-mode 1)
             (auto-fill-mode 1)
             (set-fill-column 79)
             (display-fill-column-indicator-mode 1)))

(require 'org-tempo) ; autocomplete templates
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("cc" . "src C"))
(add-to-list 'org-structure-template-alist '("cpp" . "src C++"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("css" . "src css"))

(with-eval-after-load 'org
  (setq org-confirm-babel-evaluate nil) ; disable babel prompt
  (org-babel-do-load-languages          ; load languages
   'org-babel-load-languages
   '((emacs-lisp . t)                   ; load emacs lisp
     (C          . t)                   ; load C, C++, D
     (shell      . t)                   ; load shell
     (css        . t)                   ; load css
     (plantuml   . t))))                ; load plantuml

(use-package org-roam                        ; connect notes
  :diminish                                  ; hide OrgRoam mode
  :bind (("C-c rf" . org-roam-find-file)
         ("C-c ri" . org-roam-insert))
  :hook (after-init . org-roam-mode)         ; start after init
  :custom
  (org-roam-directory "~/Documents/neuron/") ; set directory
  (org-roam-file-extensions '("txt")))       ; use txt files
