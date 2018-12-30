;;; init-grep.el --- Settings for grep and grep-like tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default grep-highlight-matches t
              grep-scroll-output t)

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

(when (and (executable-find "ag")
           (maybe-require-package 'ag))
  (require-package 'wgrep-ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "M-?") 'ag-project))

(when (and (executable-find "rg")
           (maybe-require-package 'rg))
  (maybe-require-package 'deadgrep)
  (global-set-key (kbd "M-?") 'rg-project))


(require 'grep-dired)


(provide 'init-grep)
;;; init-grep.el ends here
