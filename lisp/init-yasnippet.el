;; loading yasnippet will slow the startup
;; but it's necessary cost

(require-package 'yasnippet)



(yas-global-mode t)
;;加载模板位置
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)

(provide 'init-yasnippet)
