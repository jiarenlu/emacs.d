(after-load 'company
  (add-hook 'c-mode-common-hook
            (lambda () (progn
                    ;;company-c-headers
                    (when (maybe-require-package 'company-c-headers)
                      (sanityinc/local-push-company-backend #'company-c-headers))
                    ;;company-clang
                    (sanityinc/local-push-company-backend #'company-clang)
                    (setq company-backends (delete 'company-semantic company-backends))))))

(provide 'init-cc-mode)
