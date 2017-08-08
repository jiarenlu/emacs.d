(require 'ispell)

;; use apsell as ispell backend
(setq-default ispell-program-name "aspell")
;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

(provide 'init-spelling)
