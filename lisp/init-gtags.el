(when (maybe-require-package 'counsel-gtags)
  (after-load 'counsel-gtags
    (add-hook 'c-mode-hook 'counsel-gtags-mode)
    (add-hook 'c++-mode-hook 'counsel-gtags-mode)))

(provide 'init-gtags)
