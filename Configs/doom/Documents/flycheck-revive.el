;;; flycheck-revive.el --- Revive syntax checking provided by flycheck -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Bruno Bonatto
;;
;; Author: Bruno Bonatto <bfbonatto@bruno-pc>
;; Maintainer: Bruno Bonatto <bfbonatto@bruno-pc>
;; Created: fevereiro 02, 2024
;; Modified: fevereiro 02, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/bfbonatto/flycheck-revive
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Revive syntax checking provided by flycheck
;;
;;; Code:

(require 'flycheck)

;; (flycheck-def-option-var flycheck-revive-config "~/.revive.toml" revive
;;   "Path to revive configuration file."
;;   :safe #'stringp)

(flycheck-define-checker revive
  "A Go syntax checker using revive.

See URL `https://github.com/mgechev/revive'."
  :command ("revive" ".")
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": " (message) line-end))
  :modes go-mode)

(provide 'flycheck-revive)
;;; flycheck-revive.el ends here
