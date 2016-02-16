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

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Anaconda
(eval-after-load "company"
 '(progn
    (add-to-list 'company-backends 'company-anaconda)))

(add-hook 'python-mode-hook 'anaconda-mode)

(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; Company Mode
(add-hook 'after-init-hook 'global-company-mode)
