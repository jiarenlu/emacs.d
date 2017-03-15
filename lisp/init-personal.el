 ;;; personal.el --- Emacs Prelude: Personal settings
;;
;;; Commentary:
;; Personal settings to augment those of Prelude
;; Install Emacs through homebrew with --cocoa --srgb

;;; Code:

;;; make cursor style bar
(setq-default cursor-type 'box)

;; (require-package 'cursor-chg)
;; (curchg-default-cursor-color )
;; (setq evil-default-cursor "#ffffff")
;; (set-cursor-color "#ffffff")
(setq default-frame-alist
      '((cursor-color . "#ffffff")))

(scroll-bar-mode -1)
(delete-selection-mode 1)
(global-linum-mode -1)
;;; projectile default keybinding

(after-load 'projectile
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

;; If I'm running emacs, then I want it to be a server
(require 'server)
(unless (server-running-p)
  (server-start))

(require-package 'chinese-fonts-setup)
(require 'chinese-fonts-setup)

(chinese-fonts-setup-enable)

;;同时编辑多个区域的插件
;; (require-package 'iedit)
;; (global-set-key (kbd "M-s e") 'iedit-mode)

;; (require-packages '(editorconfig))
;; (require 'editorconfig)
;;; personal.el ends here

;; (require-package 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-item 10)

;;禁止 Emacs 自动生成备份文件
(setq make-backup-files nil)


;; (setq auto-save-default nil)

;; (require-package 'auto-save-buffers-enhanced)


;; (setq auto-save-buffers-enhanced-interval 1)

;; (setq auto-save-buffers-enhanced-include-regexps '(".+"))

;; (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
;; (setq auto-save-buffers-enhanced-quiet-save-p t)
;; (setq auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
;; (setq auto-save-buffers-enhanced-file-related-with-scratch-buffer
;;       (locate-user-emacs-file "scratch"))
;; (auto-save-buffers-enhanced t)

;; (global-set-key "\C-xas" 'auto-save-buffers-enhanced-toggle-activity)

;; (require 'auto-save) ;; 加载自动保存模块
;; (auto-save-enable)              ;; 开启自动保存功能
;; (setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我

;; 将所选区域缩小到其先前的带大小的快捷键
(require 'expand-region)
(global-set-key (kbd "C-|") 'er/contract-region)

(setq ispell-extra-args '("--lang=en_US"))


(windmove-default-keybindings 'super)

(provide 'init-personal)
