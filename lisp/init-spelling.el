(require 'ispell)

(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra --lang=en_US"))

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

(provide 'init-spelling)
