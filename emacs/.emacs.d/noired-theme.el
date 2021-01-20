(require 'autothemer)

(autothemer-deftheme
 noired "A minimalistic monochrome dark theme with red highlights"

 ((((class color) (min-colors #xFFFFFF))) ;; Support Emacs GUI
  ;; Color palette
  (noired-black     "#000000")
  (noired-rd-gray   "#0a0a0a")
  (noired-bg-gray   "#121212")
  (noired-dk-gray   "#585858")
  (noired-at-gray   "#8a8a8a")
  (noired-gray      "#bcbcbc")
  (noired-lt-gray   "#d0d0d0")
  (noired-white     "#eeeeee")
  (noired-dk-red    "#870000")
  (noired-red       "#ff0000")
  (noired-yellow    "yellow")
  (noired-green     "green"))

  ((default                        (:foreground noired-gray :background noired-black))
   (cursor                         (:background noired-red))
   (fringe                         (:foreground noired-lt-gray :background noired-black))
   (secondary-selection            (:foreground noired-black :background noired-lt-gray))
   (isearch                        (:foreground noired-black :background noired-lt-gray))
   (line-number                    (:foreground noired-dk-gray))
   (line-number-current-line       (:foreground noired-red))
   (region                         (:background noired-red))

   ;; Font lock faces
   (font-lock-builtin-face         (:foreground noired-white))
   (font-lock-constant-face        (:foreground noired-gray))
   (font-lock-keyword-face         (:foreground noired-white))
   (font-lock-type-face            (:foreground noired-white))
   (font-lock-function-name-face   (:foreground noired-gray))
   (font-lock-variable-name-face   (:foreground noired-gray))
   (font-lock-comment-face         (:foreground noired-dk-gray))
   (font-lock-doc-face             (:foreground noired-dk-gray))
   (font-lock-string-face          (:foreground noired-red))
   (font-lock-warning-face         (:foreground noired-yellow))

   ;; Highlight
   (highlight                                 (:background noired-bg-gray))
   (lazy-highlight                            (:foreground noired-black :background noired-lt-gray))
   (highlight-symbol-face                     (:background "#333333"))
   (highlight-indentation-current-column-face (:background "gray40"))
   (highlight-indentation-face                (:background "gray20"))
   (highlight-numbers-number                  (:foreground noired-red))

   ;; Mode line faces
   (mode-line          (:foreground noired-at-gray :background noired-black))
   (mode-line-inactive (:foreground noired-dk-gray :background noired-black))

   ;; Escape and prompt faces
   (minibuffer-prompt (:weight 'bold :foreground noired-white))
   (escape-glyph      (:foreground noired-lt-gray))
   (error             (:weight 'bold :slant 'italic :foreground noired-red))
   (warning           (:foreground noired-yellow))
   (success           (:foreground noired-green))

   ;; whitespace
   (trailing-whitespace (:background noired-red))
   (whitespace-empty    (:foreground noired-red))
   (whitespace-line     (:background noired-lt-gray :underline t))
   (whitespace-newline  (:background nil :foreground noired-bg-gray))
   (whitespace-space    (:foreground noired-bg-gray :background nil))
   (whitespace-tab      (:foreground noired-bg-gray :background nil))

   (fill-column-indicator (:foreground noired-bg-gray))

   ;; parens
   (show-paren-match           (:background noired-dk-red))
   (show-paren-mismatch        (:background noired-red))
   (sp-show-pair-match-face    (:background noired-dk-red))
   (sp-show-pair-mismatch-face (:background noired-red))

   ;; Speedbar
   (speedbar-button-face    (:foreground noired-gray))
   (speedbar-file-face      (:foreground noired-lt-gray))
   (speedbar-directory-face (:weight 'bold :foreground noired-white))
   (speedbar-tag-face       (:foreground noired-gray))
   (speedbar-selected-face  (:underline noired-lt-gray :foreground noired-lt-gray))
   (speedbar-highlight-face (:weight 'bold :background noired-black :foreground noired-white))

   ;; ido
   (ido-first-match (:foreground noired-lt-gray))
   (ido-only-match  (:underline noired-lt-gray :foreground noired-lt-gray))
   (ido-subdir      (:weight 'bold :foreground noired-white))

   ;; Gnus faces
   (gnus-group-news-1      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-news-1-low  (:foreground noired-lt-gray))
   (gnus-group-news-2      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-news-2-low  (:foreground noired-lt-gray))
   (gnus-group-news-3      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-news-3-low  (:foreground noired-lt-gray))
   (gnus-group-news-4      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-news-4-low  (:foreground noired-lt-gray))
   (gnus-group-news-5      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-news-5-low  (:foreground noired-lt-gray))
   (gnus-group-news-low    (:foreground noired-lt-gray))
   (gnus-group-mail-1      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-mail-1-low  (:foreground noired-lt-gray))
   (gnus-group-mail-2      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-mail-2-low  (:foreground noired-lt-gray))
   (gnus-group-mail-3      (:weight 'bold :foreground noired-lt-gray))
   (gnus-group-mail-3-low  (:foreground noired-lt-gray))
   (gnus-group-mail-low    (:foreground noired-lt-gray))
   (gnus-header-content    (:foreground noired-lt-gray))
   (gnus-header-from       (:weight 'bold :foreground noired-lt-gray))
   (gnus-header-subject    (:foreground noired-lt-gray))
   (gnus-header-name       (:foreground noired-lt-gray))
   (gnus-header-newsgroups (:foreground noired-lt-gray))

   ;; Message faces
   (message-header-name    (:foreground noired-lt-gray))
   (message-header-cc      (:foreground noired-lt-gray))
   (message-header-other   (:foreground noired-lt-gray))
   (message-header-subject (:foreground noired-lt-gray))
   (message-header-to      (:weight 'bold :foreground noired-lt-gray))
   (message-cited-text     (:slant 'italic :foreground noired-lt-gray))
   (message-separator      (:weight 'bold :foreground noired-lt-gray))

   ;; EShell
   (eshell-prompt        (:foreground noired-white :'bold t))
   (eshell-ls-archive    (:inherit ''eshell-ls-unreadable))
   (eshell-ls-backup     (:inherit ''eshell-ls-unreadable))
   (eshell-ls-clutter    (:inherit ''eshell-ls-unreadable))
   (eshell-ls-directory  (:foreground noired-lt-gray :'bold t))
   (eshell-ls-executable (:inherit ''eshell-ls-unreadable))
   (eshell-ls-missing    (:inherit ''eshell-ls-unreadable))
   (eshell-ls-product    (:inherit ''eshell-ls-unreadable))
   (eshell-ls-readonly   (:inherit ''eshell-ls-unreadable))
   (eshell-ls-special    (:inherit ''eshell-ls-unreadable))
   (eshell-ls-symlink    (:inherit ''eshell-ls-unreadable))

   ;; easy-kill
   (easy-kill-selection (:background "#333333"))

   ;; diff
   (diff-added             (:foreground noired-green))
   (diff-context           (:foreground noired-white :weight 'bold))
   (diff-file-header       (:foreground noired-white :weight 'bold))
   (diff-header            (:background noired-black))
   (diff-indicator-added   (:foreground noired-green))
   (diff-indicator-removed (:foreground noired-red))
   (diff-refine-added      (:inherit 'diff-refine-change :background  noired-green :foreground noired-black :weight 'bold))
   (diff-refine-removed    (:background  noired-red :foreground noired-white :weight 'bold))
   (diff-removed           (:foreground noired-red))

   ;; Flyspell
   (flyspell-duplicate (:underline noired-lt-gray))
   (flyspell-incorrect (:underline noired-dk-red))

   ;; Button and link faces
   (link         (:foreground noired-lt-gray :underline t))
   (link-visited (:foreground noired-lt-gray :underline t))

   ;; Org-mode
   (org-document-title        (:foreground noired-red))
   (org-document-info         (:foreground noired-red))
   (org-document-info-keyword (:foreground noired-dk-gray))
   (org-meta-line             (:foreground noired-dk-gray))
   (org-tag                   (:foreground noired-dk-gray))
   (org-link                  (:foreground noired-gray  :underline t))
   (org-todo                  (:foreground noired-red   :'bold t))
   (org-done                  (:foreground noired-green :'bold t))
   (org-verbatim              (:foreground noired-dk-gray))
   (org-table                 (:foreground noired-dk-gray))
   (org-block                 (:extend t :background noired-rd-gray))
   (org-block-begin-line      (:foreground noired-dk-gray))
   (org-block-end-line        (:foreground noired-dk-gray))

   (org-level-1               (:height 1.2 :weight 'bold))
   (org-level-2               (:height 1.1 :weight 'bold))
   (org-level-3               (:height 1.05 :weight 'bold))
   (org-level-4               (:height 1.0 :weight 'bold))
   (org-level-5               (:height 1.1 :weight 'bold))
   (org-level-6               (:height 1.1 :weight 'bold))
   (org-level-7               (:height 1.1 :weight 'bold))
   (org-level-8               (:height 1.1 :weight 'bold))

   ;; Ivy
   (ivy-current-match (:extend t :background noired-red :foreground noired-black))

   ;; Which Key
   (which-key-group-description-face (:foreground noired-red))

   ;; Magit
   (magit-diff-add             (:foreground noired-green))
   (magit-diff-del             (:foreground noired-red))
   (magit-diff-file-header     (:foreground noired-lt-gray))
   (magit-diff-hunk-header     (:weight 'bold))
   (magit-item-highlight       (:weight 'bold))
   (magit-section-title        (:underline t :weight 'bold))
   (magit-key-mode-button-face (:foreground noired-yellow :weight 'bold))
   (magit-key-mode-switch-face (:foreground noired-yellow :weight 'bold))
   (makey-key-mode-button-face (:foreground noired-yellow :weight 'bold))

  ;; (custom-theme-set-variables
   ;; 'noired
   ;; (ansi-color-names-vector [noired-black noired-lt-gray noired-gray])
  ))

 (provide-theme 'noired)
