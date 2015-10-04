; ~/.emacs.d/my-loadpackages.el
; loading package
(load "~/.emacs.d/my-packages.el")

;; Magit

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

;; Yasnippet

(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate t)))

;; Elpy
(elpy-enable)

;; Inline help
(company-quickhelp-mode 1)
