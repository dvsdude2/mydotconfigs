;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
;; My font settings
;;(setq doom-font (font-spec :family "Hack-Nerd-Font" :size 15)
;;      doom-variable-pitch-font (font-spec :family "Hack-Nerd-Font" :size 15))
;;
;;
;; (setq doom-font (font-spec :family "Droid Sans Mono Nerd Font Complete Mono" :size 15 :weight 'regular)
;;       doom-variable-pitch-font (font-spec :family "DroidSansMono" :size 15))
;;
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;Maximize the window upon startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; adds package menu. ratings, usage.
(require 'paradox)
(paradox-enable)

;; (add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)


;; Keychords ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ============================================================================
(require 'key-chord)
(key-chord-mode 1)
;;
;; Exit insert mode by pressing j and then j quickly
;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.5) ; default 0.1
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than;key-chord-two-keys-delay.
(setq key-chord-one-key-delay 0.6) ; default 0.2
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)


;; Whitespace -- is to color change text that goes beyond limit ;;;;;;;;;;;;;;;;;;;;;
;; ==================================================================================
;;
;;(require 'whitespace)
;;(setq whitespace-line-column 70) ;; limit line length
;;(setq whitespace-style '(face lines-tail))
;;(global-whitespace-mode +1)
;;(add-hook 'prog-mode-hook 'whitespace-mode)

;; (require 'whitespace)
;; (setq whitespace-line-column 68)
;; (setq whitespace-style '(face lines-tail))
;; (global-whitespace-mode 1)

;; `lines-tail`, highlight the part that goes beyond the
;; limit of `whitespace-line-column`
(require 'whitespace)
(setq whitespace-line-column 68)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode 1)

;; this is required for evil surround
;; (require 'evil-surround)
;;     (global-evil-surround-mode 1)
;;
;;
;; org-settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ====================================================================
;;
;; hide regular expression characters eg. /org italic/
;;(setq org-hide-emphasis-markers t)
;;
;; jump to org folder
(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file "~/organizer.org")))

;; default file for notes
(setq org-default-notes-file (concat org-directory "~/notes.org"))
;;
;; Better bullets; having an actual circular bullet, is just nice:
;; (font-lock-add-keywords 'org-mode
;;                            '(("^ +\\([-*]\\) "
;;                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))
;;
;; Org-wiki simple
(require 'plain-org-wiki)
(setq plain-org-wiki-directory "~/org/wiki")

;;
;; completion engine ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; =====================================================================
;;
;;
;; this is a completion engine as reveiwed by https://systemcrafters.cc/emacs-tips/streamline-completions-with-vertico/
(use-package vertico
  :ensure t
  :init
  (vertico-mode))
;; this is to add the vim keybindings
(use-package vertico
  :ensure t
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

