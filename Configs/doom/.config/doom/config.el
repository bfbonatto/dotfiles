;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Bruno Bonatto")

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
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "FiraCode Nerd Font"
                           :size 12 :weight 'normal)
      doom-symbol-font (font-spec :family "Fira Code Symbol"
                                  :size 12 :weight 'normal))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(map! :desc "Open agenda" :n "SPC o a f" (cmd! (find-file "~/org/agenda.org")))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq evil-split-window-below  t
      evil-vsplit-window-right t)

(after! evil-escape
  (setq evil-escape-key-sequence "jk"))

(display-time)
(setq display-time-day-and-date nil
      display-time-load-average nil
      display-time-default-load-average nil
      doom-modeline-time-analogue-clock nil
      doom-modeline-icon t
      doom-modeline-support-imenu t
      doom-modeline-hud t
      doom-modeline-major-mode-icon t
      doom-modeline-buffer-encoding nil
      doom-modeline-major-mode-color-icon t
      doom-modeline-unicode-fallback nil
      doom-modeline-modal t
      doom-modeline-modal-icon t
      auto-revert-check-vc-info t)


(global-prettify-symbols-mode -1)

(global-display-fill-column-indicator-mode)

(add-hook! '(prog-mode-hook json-mode-hook yaml-mode-hook sql-mode-hook) '(highlight-indent-guides-mode rainbow-delimiters-mode-enable))

(after! highlight-indent-guides
  (setq! highlight-indent-guides-method 'character
         highlight-indent-guides-auto-odd-face-perc 20
         highlight-indent-guides-auto-even-face-perc 20
         highlight-indent-guides-auto-character-face-perc 30))

(setq +format-on-save-enable-modes
      '(not tex-mode latex-mode org-msg-edit-mode python-mode))

(after! lsp-mode
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3577#issuecomment-1709232622
  (delete 'lsp-terraform lsp-client-packages))

(after! flycheck
  (map! :leader :desc "flycheck list errors" :n "c X" #'flycheck-list-errors))

(after! elisp-mode
  (add-hook! elisp-mode #'prettify-symbols-mode))

(after! rustic
  (add-hook! rust-mode #'prettify-symbols-mode))

(after! python
  (setq! dap-python-debugger 'debugpy)
  (add-hook! python-mode
             #'prettify-symbols-mode
             #'uv-mode-auto-activate-hook)
  (setq python-shell-completion-native-enable nil)
  (setq lsp-pyright-langserver-command "basedpyright"))

(after! (:and python python-pytest)
  (setq! python-pytest-executable "uv run pytest")
  (map! :mode python-mode
        :desc "pytest-function-dwim" :n "SPC m t t" #'python-pytest-function-dwim
        :desc "pytest-function" :n "SPC m t T" #'python-pytest-function
        :desc "pytest-all" :n "SPC m t a" #'python-pytest))

(after! (:and python lsp-mode)
  (load! "~/Documents/flycheck-ruff.el")
  (add-to-list 'flycheck-checkers 'ruff)
  (lsp-flycheck-add-mode 'python-mode)
  (flycheck-add-next-checker 'lsp 'ruff))

(after! (:and python lsp-pyright)
  (setq! lsp-pyright-multi-root nil))

(after! json-mode
  (add-hook! json-mode
             #'prettify-symbols-mode))

(after! scala-mode
  (add-hook! scala-mode
             #'prettify-symbols-mode))

(after! go-mode
  (map! :mode (go-mode godoc-mode)
        :desc "godoc" :n "SPC m h h" #'godoc
        :desc "godoc at point" :n "SPC m h ." #'godoc-lookup)
  (setq-hook! 'go-mode-hook +format-with-lsp nil)
  (setq! gorepl-command "gomacro")
  (set-repl-handler! 'go-mode #'gomacro-run)
  (set-formatter! 'golines '("golines" "-m" "79"))
  (add-hook! go-mode
             #'prettify-symbols-mode))

(after! (:and go-mode apheleia)
  (setf (alist-get 'go-mode apheleia-mode-alist) '(golines)))

(defconst gorepl-version "1.0.0")
(defconst gorepl-buffer "*Go REPL*")
(defconst gorepl-buffer-name "Go REPL")
(defconst gomacro-command "gomacro")

(defun gomacro-run ()
  "Run an inferior instance of `gomacro' inside Emacs."
  (interactive)
  (pop-to-buffer
   (let ((buf-ok (comint-check-proc gorepl-buffer-name)))
     (if buf-ok gorepl-buffer-name
       (apply #'make-comint-in-buffer gorepl-buffer-name nil gorepl-command nil)))))


(after! (:and go-mode lsp-mode flycheck-golangci-lint)
  (load! "~/Documents/flycheck-revive.el")
  (add-to-list 'flycheck-checkers 'revive)
  (flycheck-golangci-lint-setup)
  (lsp-flycheck-add-mode 'go-mode)
  (flycheck-add-next-checker 'lsp 'go-build )
  (flycheck-add-next-checker 'go-build 'go-vet)
  (flycheck-add-next-checker 'go-vet 'revive)
  (flycheck-add-next-checker 'revive 'golangci-lint))

(after! ligatures
  (plist-put! +ligatures-extra-symbols :str nil :bool nil :list nil :true 8868 :false 8869))

(after! corfu
  (setq corfu-preselect 'first))

(after! coq
  (setq! company-box-doc-enable nil)
  (setq! coq-compile-before-require t))

(setq! eshell-history-size 2048)

(plist-put! +ligatures-extra-symbols
            :str nil
            :true nil
            :false nil)

(setq shr-inhibit-images t
      shr-use-fonts nil)

(map! :leader :prefix ("o w" . "eww")
      :desc "eww" :n "w" #'eww
      :desc "bookmarks" :n "b" #'eww-list-bookmarks)

(defun godoc-lookup (identifier)
  "Show Go documentation for IDENTIFIER (defaults to the symbol at point)."
  (interactive (list (doom-thing-at-point-or-region)))
  (when (null identifier) (user-error "Nothing under point"))
  (let ((package (or
                  (save-excursion
                    (goto-char 0)
                    (if (re-search-forward "package .+ // import \"\\(.+\\)\"" nil t)
                        (concat (match-string 1) "." ) ""))
                  (save-excursion
                    (goto-char 0)
                    (if (re-search-forward "package \\(.+\\) //" nil t)
                        (concat (match-string 1) "." ) "")) )))
    (godoc (concat package identifier))))

(defun log-counter (&optional pattern)
  (projectile-with-default-dir (projectile-acquire-root)
    (unless pattern
      (setq pattern "*"))
    (let* ((command (format "rg -iNIoe \"[\\s\\\"](\\d\\d\\d\\d) - \" -g '%s' -r '$1' . | sort | tail -1" pattern))
           (s (shell-command-to-string command))
           (n (string-to-number s)))
      (format "%04d - " (1+ n)))))


(defun calc-eval-at-point (START END)
  "Replace region with its result."
  (interactive "rP")
  (save-excursion
    (let ((text (buffer-substring-no-properties START END)))
      (delete-region START END)
      (insert (calc-eval text)))))

(map! :desc "Calc" :v "SPC i c" #'calc-eval-at-point)

(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("-j=3"
          "--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--header-insertion-decorators=0"))
  (set-lsp-priority! 'clangd 2))

(defun random-password (&optional length numbers symbols)
  "Return a random password of LENGTH characters.
Include digits if NUMBERS is not nil. Include symbols if SYMBOLS is not nil."
  (let ((length (if length length 44))
        (sample (concat "abcdefghijklmnopqrstuvwxyz"
                        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                        (if numbers "0123456789" "")
                        (if symbols "!@#$%&*()-+=/,.;:[]{}"))))
    (concat (cl-loop repeat length collect (seq-random-elt sample)))))

(defun random-passsword! (length numbers symbols)
  "Yank a random password of LENGTH characters.
Include digits if NUMBERS is not nil. Include symbols if SYMBOLS is not nil."
  (interactive "nlength: \nsnumbers? \nssymbols? ")
  (kill-new (random-password
             length
             (not (or (string= numbers "") (string= numbers "no")))
             (not (or (string= symbols "") (string= symbols "no"))))))


(add-to-list 'auto-mode-alist '("\\(?:J\\|j\\)enkinsfile\\'" . groovy-mode))

(defun from-snake-to-camel-case (START END)
  "Transform the region into camel case."
  (interactive "rP")
  (save-excursion
    (goto-char START)
    (while (re-search-forward "_\\(\\w\\)" END t)
      (replace-match (upcase (match-string 1))))))


(load! "host-settings.el")

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
