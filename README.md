# Pollen Mode

An Emacs mode for writing files in the [Pollen](http://pollenpub.com/) Markup
language. For now, it only provides simple syntax highlighting via
font-lock. Feel free to add more features and submit a pull request.

The code is based on Xah Lee's
[Emacs Major Mode tutorial](http://ergoemacs.org/emacs/elisp_syntax_coloring.html)
and the [Scribble Emacs mode](https://github.com/emacs-pe/scribble-mode).

## Installation

Download `pollen-mode` to your emacs lisp directory.

```bash
    git clone https://github.com/basus/pollen-mode.git ~/.emacs.d/lisp/pollen-mode
```

Then add the following to `~/.emacs.d/init.el`:

```bash
	(add-to-list 'load-path (expand-file-name "lisp/pollen-mode" user-emacs-directory))
    (autoload 'pollen-mode "pollen" "A major mode for the pollen preprocessor." t)
```

Restart emacs. `pollen-mode` should activate when you open a file with
a `.pp` extension.

## Syntax highlighting

Currently the mode provides the following syntax highlighting using Emacs'
predefined font-lock faces:

+ Tag names beginning with ◊ (lozenge) are highlighted as function names.
+ Attribute keys starting with a single quote or backtick are highlighted as
  constants.
+ Quote-delimited strings in attributes (or in the Racket-mode argument to tags) are highlighted
  as strings.
+ The `#lang language` line is highlighted as a preprocessor directive.
