;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Kajetan Puchalski"
      user-mail-address "kajetan.puchalski@tuta.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

;; Appearance
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'semi-bold))
(setq doom-theme 'doom-gruvbox)
(setq display-line-numbers-type 'relative)

;; Org mode
(setq org-directory "~/org/")

;; Play nice with fish
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))

;; Chezmoi helpers

(defvar doom-chezmoi-config-dir (expand-file-name "~/.local/share/chezmoi/dot_config/doom/"))

(defun open-doom-chezmoi-config ()
  "Browse chezmoi doom config"
  (interactive)
  (doom-project-browse doom-chezmoi-config-dir))

(defun chezmoi-apply ()
  "Apply chezmoi config changes"
  (interactive)
  (shell-command "chezmoi apply"))

;; Custom hooks

(add-hook 'rust-mode-hook 'subword-mode)
(add-hook 'elisp-mode-hook 'subword-mode)
(add-hook 'c-mode-hook 'subword-mode)
(add-hook 'python-mode-hook 'subword-mode)

;; Custom Bindings

(map! :map custom-bindings
      :leader "f p" 'open-doom-chezmoi-config
      :leader "f a" 'chezmoi-apply
      :leader "s c" 'evil-ex-nohighlight
      :leader "t S" 'subword-mode)

(map! :map evil-visual-state-map
      "$" 'evil-beginning-of-line
      "#" 'evil-end-of-line
      "gh" 'evil-beginning-of-line
      "gl" 'evil-end-of-line)

(map! :map evil-normal-state-map
      "$" 'evil-beginning-of-line
      "#" 'evil-end-of-line
      "gh" 'evil-beginning-of-line
      "gl" 'evil-end-of-line)

;; Package configs

(use-package! hledger-mode
  :load-path "packages/rest/hledger-mode/"
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :commands hledger-enable-reporting
  :defer t

  :init
  (setq hledger-jfile (expand-file-name "~/Documents/Finance/hledger/2024.journal"))

  :config
  (add-hook 'hledger-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (add-to-list 'company-backends 'hledger-company))))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
