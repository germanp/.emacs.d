(use-package company-anaconda
  :config
  (eval-after-load "company"
    '(progn
       (add-to-list 'company-backends 'company-anaconda)))

  )

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
