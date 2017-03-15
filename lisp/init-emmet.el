(require-package 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(eval-after-load 'emmet-mode '(progn
                                (setq emmet-move-cursor-between-quotes t)
                                (setq emmet-expand-jsx-className? t)
                                (setq emmet-self-closing-tag-style " /")))

(provide 'init-emmet)
