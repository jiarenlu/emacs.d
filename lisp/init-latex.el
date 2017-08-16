(require-package 'auctex)
(require-package 'cdlatex)

;;----------------------------------------------------------------------------
;; cdlatex
;;----------------------------------------------------------------------------
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (cdlatex-mode t)
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")
            (setq TeX-save-query  nil )
            (setq TeX-show-compilation t)))

(provide 'init-latex)
