;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; encoding
(prefer-coding-system 'utf-8-unix)

;; doom-quit
(setq confirm-kill-emacs nil)

;; scroll smooth?
(setq scroll-margin 30)
(setq hscroll-margin 10)

;; clippy
(map! :leader
      (:prefix ("c h" . "Help info from Clippy")
       :desc "Clippy describes function under point" "f" #'clippy-describe-function
       :desc "Clippy describes variable under point" "v" #'clippy-describe-variable))

;; user information
(setq user-full-name "Dev Odyssey"
      user-mail-address "dev.odyssey@gmail.com")

(setq-default tab-width 2)

;; window position and size
(add-to-list 'default-frame-alist '(top . 40))
(add-to-list 'default-frame-alist '(left . 40))
(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 120))

;; default major-mode
;; (setq-default major-mode 'org-mode)
(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message "\
# This buffer is for notes you don't want to save, and for Emacs Lisp code.
# If you want to create a file, visit that file with C-x C-f,
# then enter the text in that file's own buffer.")

;; theme
;; (setq doom-theme 'doom-tokyo-night)

;; line number
(setq display-line-numbers-type 'visual
      line-move-visual t)
(use-package-hook! evil
  :pre-init
  (setq evil-respect-visual-line-mode t) t)

;; fonts
(setq
  doom-font (font-spec :family "Cascadia Code" :size 22 :weight 'regular)
  doom-big-font (font-spec :family "Cascadia Code" :size 30)
  doom-variable-pitch-font (font-spec :family "Fira Sans"))

;; directories
(setq
  default-directory "~"
  projectile-project-search-path '("~/projects"))

;; revert
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)

;; emoji
;; FIXME - change to nerd-icons
(add-hook 'after-init-hook #'global-emojify-mode)

;; whitespace
(use-package! whitespace
  :config
  (setq
    global-whitespace-mode +1
    whitespace-style '(face tabs spaces trailing lines newline indentation space-mark tab-mark newline-mark)

    whitespace-display-mappings '(
      (space-mark   ?\     [?·]     [?.])
      (space-mark   ?\xA0  [?¤]     [?_])
      (newline-mark ?\n    [?⤶ ?\n])
      (tab-mark     ?\t    [? → ?\t] [?\\ ?\t]))))

;; keymap

;; eval keymap
(map! :map evil-normal-state-map
      :desc "Move to next visual line"
      "j" 'evil-next-visual-line
      :desc "Move to previous visual line"
      "k" 'evil-previous-visual-line)

;; (bind-key* "C-j" #'evil-window-down)
;; (bind-key* "C-k" #'evil-window-up)
;; (bind-key* "C-h" #'evil-window-left)
;; (bind-key* "C-l" #'evil-window-right)
;; (bind-key* "C-q" #'evil-window-delete)
;; (bind-key* "M-q" #'kill-current-buffer)
;; (bind-key* "M-w" #'+workspace/close-window-or-workspace)
;; (bind-key* "S-l" #'next-buffer)
;; (bind-key* "S-h" #'previous-buffer)
;; (bind-key* "M-e" #'+eshell/toggle)
;; (bind-key* (kbd "M-E") #'+eshell/here)

;; beacon (highlight current line)
(beacon-mode 1)

;; solaire-mode
;; (solaire-global-mode +1)

;; vertico
(load! "~/.doom.d/scripts/vertico-posframe.el")
(require 'vertico-posframe)
(vertico-posframe-mode 1)
(setq vertico-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))

;; dashboard
;; TODO: need custom start page
(setq +doom-dashboard-banner-file
      (expand-file-name "images/logo.png" doom-user-dir))

;; dired
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file"           "d v" #'dired-view-file)))

;; modeline
(column-number-mode 1)
(setq
  doom-modeline-height 30
  doom-modeline-window-width-limit nil
  doom-modeline-buffer-file-name-style 'truncate-with-project
  doom-modeline-minor-modes nil
  doom-modeline-buffer-modification-icon t
  doom-modeline-time t
  doom-modeline-vcs-max-length 50
  doom-modeline-buffer-encoding t
  doom-modeline-indent-info t
)

;; neotree or treemacs
;; (map! :leader :desc "Neotree" "e" #'neotree-toggle)
(map! :leader :desc "Treemacs" "e" #'treemacs)

;; golden-ratio
(require 'golden-ratio)
(golden-ratio-mode 1)
;; (golden-ratio-exclude-modes '(...))

;; eat
;; For `eat-eshell-mode'.
(add-hook 'eshell-load-hook #'eat-eshell-mode)

;; For `eat-eshell-visual-command-mode'.
(add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)

;; TODO turn off company in eshell-mode

;; spacious-padding
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8))
(spacious-padding-mode 1)

;; showkey
(load! "~/.doom.d/scripts/showkey.el")

;;;------ Org mode configuration ------;;;
(setq org-directory "~/org"
      org-default-notes-file (expand-file-name "notes.org" org-directory)
      org-agenda-files (list org-directory))

;; Automatically show images but manually control their size
(setq org-startup-with-inline-images t
      org-image-actual-width nil)

(remove-hook 'after-save-hook #'+literate|recompile-maybe)
(set-company-backend! 'org-mode nil)

(require 'evil-org)
(require 'evil-org-agenda)
(add-hook 'org-mode-hook 'evil-org-mode -100)

(after! org (org-eldoc-load))
(with-eval-after-load 'org (global-org-modern-mode))

;; org-auto-tangle
;; FIXME: using auto-tangle, break about unicode
;; (add-hook 'org-mode-hook 'org-auto-tangle-mode)
;; (setq org-auto-tangle-babel-safelist '(
;;                                      "~/.doom.d/config.org"))

;; org ui
(setq
  ;; edit
  org-auto-align-tags nil
  org-tags-column 0
  org-fold-catch-invisible-edits 'show-and-error
  org-special-ctrl-a/e t
  org-insert-heading-respect-content t
  ;; style
  org-hide-emphasis-markers t
  org-pretty-entities t
  org-ellipsis " ▼ "
)
(setq-default line-spacing 0)

;; Better for org source blocks
(setq electric-indent-mode nil)
(setq org-src-window-setup 'current-window)
(set-popup-rule! "^\\*Org Src"
  :side 'top'
  :size 1.1)

;; Top-level headings should be bigger!
(custom-set-faces!
  '(org-level-1 :inherit outline-1 :height 1.3)
  '(org-level-2 :inherit outline-2 :height 1.25)
  '(org-level-3 :inherit outline-3 :height 1.2)
  '(org-level-4 :inherit outline-4 :height 1.1)
  '(org-level-5 :inherit outline-5 :height 1.1)
  '(org-level-6 :inherit outline-6 :height 1.05)
  '(org-level-7 :inherit outline-7 :height 1.05)
  )

;; Add frame borders and window dividers
(modify-all-frames-parameters
  '((right-divider-width . 5)
    (internal-border-width . 5)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

;; phscroll - Horizontal scrolling tables
(add-load-path! "~/.doom.d/scripts/phscroll")
(setq org-startup-truncated nil)
(with-eval-after-load "org"
  (require 'org-phscroll))
(setq phscroll-calculate-in-pixels t)

;; org-side-tree
(require 'org-side-tree)
(setq org-side-tree-persistent nil)
(setq org-side-tree-fontify t)
(setq org-side-tree-enable-folding t)
(defun org-side-tree-create-or-toggle ()
  (interactive)
  (if (or (org-side-tree-has-tree-p) (eq major-mode 'org-side-tree-mode))
      (org-side-tree-toggle)
      (org-side-tree)))
(map! :leader
      "o t" #'org-side-tree-create-or-toggle)
(map! :map org-side-tree-mode-map
      "SPC" nil)

;;;------ Org roam configuration ------;;;
(require 'org-roam)
(require 'org-roam-dailies)
(setq
  org-roam-directory org-directory
  org-roam-db-location (file-name-concat org-roam-directory "org-roam.db")
  org-roam-dailies-directory (concat org-roam-directory "/daily")
  org-roam-node-display-template "${title:65}📝${tags:*}")

(org-roam-db-autosync-mode)

(setq mode-line-misc-info '(
  (which-function-mode (which-func-mode ("" which-func-format " ")))
  ("" so-long-mode-line-info)
  (global-mode-string ("" global-mode-string))
  " "
  org-roam-db-choice))

;; org-roam multi

;; org-roam capture-template
(after! org-roam
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
  :unnarrowed t))))

;; org-roam olivetti
(setq olivetti-style 'fancy
      olivetti-margin-width 100)
(setq-default olivetti-body-width 100)
(defun org-roam-olivetti-mode ()
  (interactive)
  (if (org-roam-file-p)
      (olivetti-mode))
  (if (org-roam-file-p)
      (doom-disable-line-numbers-h)))
(add-hook 'org-mode-hook 'org-roam-olivetti-mode)
(setq +org-roam-auto-backlinks-buffer t)

;; org-roam-dblocks
;; (add-load-path! "~/.emacs.d/scripts/nursery")
;; (require 'org-roam-dblocks)
;; (use-package org-roam-dblocks
;;   :hook (org-mode . org-roam-dblocks-autoupdate-mode))

;;;------ Org agenda configuration ------;;;
;; org agenda
;; Set span for agenda to be just daily
(setq org-agenda-span 1
      org-agenda-start-day "+0d"
      org-agenda-skip-timestamp-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-scheduled-if-deadline-is-shown t
      org-agenda-skip-timestamp-if-deadline-is-shown t)

;; Custom styles for dates in agenda
(custom-set-faces!
  '(org-agenda-date :inherit outline-1 :height 1.15)
  '(org-agenda-date-today :inherit diary :height 1.15)
  '(org-agenda-date-weekend :ineherit outline-2 :height  1.15)
  '(org-agenda-date-weekend-today :inherit outline-4 :height 1.15)
  '(org-super-agenda-header :inherit custom-button :weight bold :height 1.05)
  `(link :foreground unspecified :underline nil :background ,(nth 1 (nth 7 doom-themes--colors)))
  '(org-link :foreground unspecified)
  )

;; Toggle completed entries function
(defun org-agenda-toggle-completed ()
  (interactive)
  (setq org-agenda-skip-timestamp-if-done (not org-agenda-skip-timestamp-if-done)
        org-agenda-skip-deadline-if-done (not org-agenda-skip-timestamp-if-done)
        org-agenda-skip-scheduled-if-done (not org-agenda-skip-timestamp-if-done))
  (org-agenda-redo))
(map!
  :map evil-org-agenda-mode-map
  :after org-agenda
  :nvmeg "s d" #'org-agenda-toggle-completed)

;; Ricing org agenda
(setq org-agenda-current-time-string "")
(setq org-agenda-time-grid '((daily) () "" ""))

(setq org-agenda-prefix-format '(
(agenda . "  %?-2i %t ")
 (todo . " %i %-12:c")
 (tags . " %i %-12:c")
 (search . " %i %-12:c")))

(setq org-agenda-hide-tags-regexp ".*")

(setq org-agenda-category-icon-alist `(("Teaching.p" "" nil nil :ascent center)
                                       ("Family.s" "" nil nil :ascent center)
                                       ("Producer.p" "" nil nil :ascent center)
                                       ("Bard.p" "" nil nil :ascent center)
                                       ("Stories.s" "" nil nil :ascent center)
                                       ("Author.p" "" nil nil :ascent center)
                                       ("Gamedev.s" "" nil nil :ascent center)
                                       ("Knowledge.p" "" nil nil :ascent center)
                                       ("Personal.p" "" nil nil :ascent center)
                                       ))

;; org-super-agenda (setq org-super-agenda-groups '( (:name "Today" :time-grid t
;; :scheduled today) (:name "Due today" :deadline today) (:name "Important"
;; :priority "A") (:name "Overdue" :deadline past) (:name "Due soon" :deadline
;; future) (:name "Big Outcomes" :tag "bo")))

;; slime sbcl
(setq inferior-lisp-program "c:/tools/sbcl/sbcl.exe")

;; go

;; zig
(defun zig-build-run ()
  "build-run using `zig build run`."
  (interactive)
  (zig--run-cmd "build run"))
(defun zig-build-test ()
  "build-test using `zig build test`."
  (interactive)
  (zig--run-cmd "build test"))
(map! :after zig-mode
      :map zig-mode-map
      :localleader

      "r" #'zig-build-run
      "t" #'zig-build-test
      "R" #'zig-run
      "T" #'zig-test-buffer
)

;; odin

;; dummy
(message "hi")
