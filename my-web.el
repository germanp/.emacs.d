(use-package web-mode
  :bind (("C-c ]" . emmet-next-edit-point)
         ("C-c [" . emmet-prev-edit-point)
         ("C-c o b" . browse-url-of-file))
  :mode
  (("\\.js\\'" . web-mode)
   ("\\.html?\\'" . web-mode)
   ("\\.phtml?\\'" . web-mode)
   ("\\.tpl\\.php\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.hbs\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.vue$" . web-mode)
   ("\\.jsx$" . web-mode))

  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  ;; :: Add this to .dir-locals.el to use node_modules/ installed tools (useful for eslint)
  ;; ((nil . ((eval . (progn
  ;;                    (add-to-list 'exec-path (concat (locate-dominating-file default-directory ".dir-locals.el") "node_modules/.bin/")))))))



  ;; highlight enclosing tags of the element under cursor
  (setq web-mode-enable-current-element-highlight t)

  ;; editing enhancements for web-mode
  ;; https://github.com/jtkDvlp/web-mode-edit-element
  (use-package web-mode-edit-element
    :config (add-hook 'web-mode-hook 'web-mode-edit-element-minor-mode))

  ;; snippets for HTML
  ;; https://github.com/smihica/emmet-mode
  (use-package emmet-mode
    :init (setq emmet-move-cursor-between-quotes t) ;; default nil
    :diminish (emmet-mode . " e"))
  (add-hook 'web-mode-hook 'emmet-mode)

  (defun my-web-mode-hook ()
    "Hook for `web-mode' config for company-backends."
    (set (make-local-variable 'company-backends)
         '((company-tern company-css company-web-html company-files))))
  (add-hook 'web-mode-hook 'my-web-mode-hook)

  ;; Enable JavaScript completion between <script>...</script> etc.
  (defadvice company-tern (before web-mode-set-up-ac-sources activate)
    "Set `tern-mode' based on current language before running company-tern."
    ;;(message "advice")
    (if (equal major-mode 'web-mode)
	(let ((web-mode-cur-language
	       (web-mode-language-at-pos)))
	  (if (or (string= web-mode-cur-language "javascript")
		  (string= web-mode-cur-language "jsx"))
	      (unless tern-mode (tern-mode))
	    (if tern-mode (tern-mode -1))))))

  (add-hook 'web-mode-hook 'company-mode)

  ;; to get completion for twitter bootstrap
  (use-package ac-html-bootstrap :defer t)

  ;; to get completion for HTML stuff
  ;; https://github.com/osv/company-web
  (use-package company-web)

  (add-hook 'web-mode-hook 'company-mode))

;; configure CSS mode company backends
(use-package css-mode
  :config
  (defun my-css-mode-hook ()
    (set (make-local-variable 'company-backends)
         '((company-css company-dabbrev-code company-files))))
  (add-hook 'css-mode-hook 'my-css-mode-hook)
  (add-hook 'css-mode-hook 'company-mode))

;; impatient mode - Live refresh of web pages
;; https://github.com/skeeto/impatient-mode
(use-package impatient-mode
  :diminish (impatient-mode . " i")
  :commands (impatient-mode))

(provide 'my-web)
