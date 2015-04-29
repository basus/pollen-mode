# Pollen Mode

An Emacs mode for writing files in the [Pollen](http://pollenpub.com/) Markup
language. For now, it only provides simple syntax highlighting via
font-lock. Feel free to add more features and submit a pull request.

The code is based on Xah Lee's
[Emacs Major Mode tutorial](http://ergoemacs.org/emacs/elisp_syntax_coloring.html)
and the [Scribble Emacs mode](https://github.com/emacs-pe/scribble-mode).

## Syntax highlighting

Currently the mode provides the following syntax highlighting using Emacs'
predefined font-lock faces:

+ Tag names beginning with ◊ (lozenge) are highlighted as function names.
+ Attribute keys starting with a single quote or backtick are highlighted as
  constants.
+ Quote-delimited strings in attributes (or in the Racket-mode argument to tags) are highlighted
  as strings.
+ The `#lang language` line is highlighted as a preprocessor directive.
