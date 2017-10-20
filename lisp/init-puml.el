(when (maybe-require-package 'plantuml-mode)
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode)))

(provide 'init-puml)
