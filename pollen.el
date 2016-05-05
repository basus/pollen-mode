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


;; Utility functions
(defun pollen-insert-lozenge ()
  (interactive)
  (insert (decode-char 'ucs 9674)))

;; Syntax highlighting for Pollen Markup Mode
(defvar pollen-font-lock-defaults nil "Font lock defaults for Pollen mode.")

(setq pollen-tag-name-regexp "\\(◊[[:alnum:]]+\\)")
(setq pollen-attr-key-regexp "\\(['\|`][[:alnum:]]+\\):")
(setq pollen-attr-string-regexp "\\[\.*\\(\".+\"\\)\\]")
(setq pollen-lang-regexp "^#\.+$")

(setq pollen-font-lock-defaults
      `((,pollen-tag-name-regexp . (1 font-lock-function-name-face))
        (,pollen-attr-key-regexp . (1 font-lock-constant-face))
        (,pollen-attr-string-regexp . (1 font-lock-string-face))
        (,pollen-lang-regexp . font-lock-preprocessor-face)
        ))

;; Keymap for Pollen Markup Mode
(defvar pollen-mode-map nil "Keymap for Pollen mode")

(when (not pollen-mode-map)
  ;; Pollen keybindings
  (setq pollen-mode-map (make-sparse-keymap))
  (define-key pollen-mode-map (kbd "C-c C-l") 'pollen-insert-lozenge)

  ;; Pollen menu
  (define-key pollen-mode-map [menu-bar] (make-sparse-keymap))

  (let ((pollen-menu-map (make-sparse-keymap "Pollen")))
    (define-key pollen-mode-map [menu-bar pollen]
      (cons "Pollen" pollen-menu-map))
    (define-key pollen-menu-map [insert-lozenge]
      '("Insert lozenge" . pollen-insert-lozenge))))

;; Created new mode based on Fundamental Mode
(define-derived-mode pollen-mode fundamental-mode
  (setq-local font-lock-defaults '(pollen-font-lock-defaults))
  (setq-local pollen-mode-map '(pollen-mode-map))
  (setq mode-name "Pollen"))

;;;###autoload
(mapc (lambda (pair)
        (or (assoc (car pair) auto-mode-alist)
            (push pair auto-mode-alist)))
      '(("\\.p$'"     . pollen-mode)
        ("\\.pp$'"    . pollen-mode)
        ("\\.pm$"     . pollen-mode)
        ("\\.pmd$"    . pollen-mode)
        ("\\.ptree$"  . pollen-mode)))

(provide 'pollen)
