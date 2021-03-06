;;; init-deft.el --- deft -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:



(when (maybe-require-package 'deft)
  (setq deft-extensions '("md" "org")
        deft-default-extension "org"
        deft-text-mode 'org-mode
        deft-use-filename-as-title t
        deft-use-filter-string-for-filename t
        deft-recursive t
        deft-file-naming-rules '((nospace . "-"))
        deft-org-mode-title-prefix t)

  (global-set-key (kbd "<f8>") 'deft)
  (global-set-key (kbd "C-<f8>") 'deft-find-file))

(provide 'init-deft)
;;; init-deft.el ends her
