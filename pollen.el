(defconst pollen-mode-title "Pollen Emacs Mode")
(defconst pollen-mode-version "0.1")
(defconst pollen-mode-date "2015-04-29")

(defconst pollen-mode-legal-notices
  "Copyright (c) 2015 Shrutarshi Basu.  This program is Free Software; you can
redistribute it and/or modify it under the terms of the GNU Lesser General
Public License as published by the Free Software Foundation; either version
3 of the License (LGPL 3), or (at your option) any later version. This
program is distributed in the hope that it will be useful, but without any
warranty; without even the implied warranty of merchantability or fitness
for a particular purpose.  See http://www.gnu.org/licenses/ for details.
For other licenses and consulting, please contact the author.")

(defvar pollen-font-lock-defaults nil "Value for font-lock-defaults.")

(setq pollen-tag-name-regexp "\\(◊[[:alnum:]]+\\)")
(setq pollen-attr-key-regexp "\\(['\|`][[:alnum:]]+\\):")
(setq pollen-attr-string-regexp "\\[\.*\\(\".+\"\\)\\]")
(setq pollen-lang-regexp "#\.+$")

(setq pollen-font-lock-defaults
      `((,pollen-tag-name-regexp . (1 font-lock-function-name-face))
        (,pollen-attr-key-regexp . (1 font-lock-constant-face))
        (,pollen-attr-string-regexp . (1 font-lock-string-face))
        (,pollen-lang-regexp . font-lock-preprocessor-face)
        ))

(define-derived-mode pollen-mode fundamental-mode
  (setq font-lock-defaults '(pollen-font-lock-defaults))
  (setq mode-name "Pollen"))

;;;###autoload
(mapc (lambda (pair)
        (or (assoc (car pair) auto-mode-alist)
            (push pair auto-mode-alist)))
      '(("\\.pm$\\'" . scribble-mode)))


(provide 'pollen)
