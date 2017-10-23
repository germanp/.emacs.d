(use-package magit
  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))


(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d/snippets")
  (add-hook 'term-mode-hook (lambda()
			      (setq yas-dont-activate t))))


(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package better-defaults)

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package feature-mode)

(use-package php-mode)

(use-package lua-mode)

(use-package projectile
  :config
  (projectile-global-mode))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package markdown-mode)

(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package yaml-mode)
