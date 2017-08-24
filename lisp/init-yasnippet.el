;; loading yasnippet will slow the startup
;; but it's necessary cost

(require-package 'yasnippet)



(yas-global-mode t)
;;加载模板位置
(setq yas/root-directory (expand-file-name "./snippets" user-emacs-directory))
(yas/load-directory yas/root-directory)

(setf yas-indent-line 'fixed)

(provide 'init-yasnippet)
