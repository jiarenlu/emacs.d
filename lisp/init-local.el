;;; init-local.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'after-make-frame-functions
             (lambda (new-frame)
               (select-frame new-frame)
               ;; English Font
               (set-face-attribute 'default nil :font "Fira Mono 12")
               ;; Chinese Font
               (dolist (charset '(kana han symbol cjk-misc bopomofo))
                 (set-fontset-font (frame-parameter nil 'font)
                                   charset (font-spec :family "Noto Sans CJK SC" :size 16)))))

(provide 'init-local)
