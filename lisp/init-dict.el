(when (maybe-require-package 'youdao-dictionary)
  (setq url-automatic-caching t)
  (global-set-key (kbd "C-c C-y") 'youdao-dictionary-search-at-point))

(provide 'init-dict)
