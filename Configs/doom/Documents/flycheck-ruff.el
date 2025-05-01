;;; flycheck-ruff.el --- Ruff syntax checker provided by flycheck -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Bruno Bonatto
;;
;; Author: Bruno Bonatto <bfbonatto@bruno-pc>
;; Maintainer: Bruno Bonatto <bfbonatto@bruno-pc>
;; Created: fevereiro 02, 2024
;; Modified: fevereiro 02, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/bfbonatto/flycheck-ruff
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Ruff syntax checker provided by flycheck
;;
;;; Code:

(require 'flycheck)

(flycheck-define-checker ruff
  "A fast Python linter."
  :command ("ruff" "check" ".")
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": " (message) line-end))
  :modes python-mode)


(provide 'flycheck-ruff)
;;; flycheck-ruff.el ends here
