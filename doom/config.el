;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Kajetan Puchalski"
      user-mail-address "kajetan.puchalski@tuta.io")

;; Appearance
(setq doom-font (font-spec :family "MonacoBSemi" :size 11))
(setq doom-theme 'doom-gruvbox)
(setq display-line-numbers-type t)

;; Org mode setup
(setq org-directory "~/Documents/Org/")
(setq evil-snipe-scope 'buffer)
(setq deft-directory "~/Documents/Org/deft")
(setq org-brain-path "~/Documents/Org/")
(setq org-brain-scan-directories-recursively 1)

;; LSP & completion setup
(setq rustic-lsp-server 'rls)
(add-hook 'vue-mode-hook #'lsp!)
(add-hook 'java-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'racer-mode)
(setq lsp-auto-guess-root nil)
(setq gc-cons-threshold 100000000)

;; PATH setup
(setenv "PATH" (concat (getenv "PATH") "/home/kajetan/.gem/ruby/2.7.0/bin/"))
(setenv "PATH" (concat (getenv "PATH") "/home/kajetan/.local/bin"))
(setq exec-path (append exec-path '("/home/kajetan/.gem/ruby/2.7.0/bin/")))
(setq exec-path (append exec-path '("/home/kajetan/.local/bin")))

(load! "mu4e-config.el")

;; Custom Bindings

;; evil key rebinds

(define-key evil-normal-state-map (kbd "$") 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "#") 'evil-end-of-line)

(define-key evil-normal-state-map (kbd "f") 'evilem-motion-forward-word-begin)
(define-key evil-normal-state-map (kbd "F") 'evilem-motion-backward-word-begin)

;; Org Brain

(map! :map org-brain-bindings
      :leader "r a e" 'org-brain-add-entry
      :leader "r a r" 'org-brain-add-resource
      :leader "r a c" 'org-brain-new-child

      :leader "r c f" 'org-brain-add-friendship
      :leader "r c c" 'org-brain-add-child
      :leader "r c p" 'org-brain-add-parent

      :leader "r r f" 'org-brain-remove-friendship
      :leader "r r c" 'org-brain-remove-child
      :leader "r r p" 'org-brain-remove-parent

      :leader "r v v" 'org-brain-visualize
      :leader "r v p" 'org-brain-visualize-parent
      :leader "r v c" 'org-brain-visualize-child
      :leader "r v f" 'org-brain-visualize-friend
      :leader "r v b" 'org-brain-visualize-back
      :leader "r v e" 'org-brain-visualize-entry-at-pt
      :leader "r v r" 'org-brain-visualize-add-resource

      :leader "r g g" 'org-brain-goto
      :leader "r g p" 'org-brain-goto-parent
      :leader "r g c" 'org-brain-goto-child
      :leader "r g f" 'org-brain-goto-friend

      :leader "r s s" 'org-brain-select
      :leader "r s c" 'org-brain-clear-selected

      :leader "r p" 'org-brain-pin
      :leader "r t" 'org-brain-set-title
      :leader "r e" 'org-brain-annotate-edge
      :leader "r m" 'org-brain-visualize-mind-map
      :leader "r f" 'org-brain-visualize-follow
      :leader "r w" 'org-brain-switch-brain)

(map! :map personal-bindings
      :leader "t m" '=mu4e
      :leader "t c" '=calendar
      :leader "t t" '=twitter

      :leader "a c c" '=configs
      :leader "a c q" '+configs/quit

      :leader "a b b" '=brain
      :leader "a b q" '+brain/quit

      :leader "a o o" '=org
      :leader "a o q" '+org/quit
      :leader "o o t c" 'org-table-create

      :leader "t p p" 'pass
      :leader "t p s" '+pass/ivy

      :leader "m r r" '+make/run
      :leader "m r l" '+make/run-last

      :leader "m e r" 'ert

      :leader "c r" 'recompile
      :leader "c r" 'recompile
      :leader "t n" 'neotree-toggle)

(map! :mode 'mu4e-main-mode
      :leader "m m" 'mu4e~headers-jump-to-maildir)

(setq scroll-margin 5)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
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
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;
