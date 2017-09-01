(maybe-require-package 'emojify)
(add-hook 'after-init-hook #'global-emojify-mode)
(after-load 'emojify-mode
  (when (maybe-require-package 'company-emoji)
    (sanityinc/local-push-company-backend 'company-emoji)))


(provide 'init-emojify)
