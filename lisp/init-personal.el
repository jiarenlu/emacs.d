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

;; (setq default-frame-alist
;;       '((cursor-color . "#ffffff")))

;; (add-hook 'after-init-hook
;;           (lambda ()
;;             ;; 选中替换
;;             ;; Minimal UI
;;             (tool-bar-mode   -1)
;;             (tooltip-mode    -1)
;;             (menu-bar-mode   -1)
;;             (delete-selection-mode t)))


;; 禁用滚动条
;; (setq-default scroll-bar-mode nil)

;; 删除多余空白插件
(when (maybe-require-package 'hungry-delete)
  (require-package 'hungry-delete)
  (global-hungry-delete-mode))

;;; projectile default keybinding

(with-eval-after-load 'projectile
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

(when (maybe-require-package 'cnfonts)
  ;; 让 cnfonts 随着 Emacs 自动生效。
  (cnfonts-enable)

  (add-hook 'after-make-frame-functions 'cnfonts-set-font-with-saved-step)
  (add-hook 'window-setup-hook 'cnfonts-set-font-with-saved-step)
  ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
  (cnfonts-set-spacemacs-fallback-fonts))

;;同时编辑多个区域的插件
;; (require-package 'iedit)
;; (global-set-key (kbd "M-s e") 'iedit-mode)

(when (maybe-require-package 'editorconfig)
  (editorconfig-mode)
  (with-eval-after-load 'projectile
    '(progn
       (add-hook 'projectile-after-switch-project-hook
                 (lambda ()
                   (let editorconfig-config-path (expand-file-name "./.editorconfig" projectile-project-root ))
                   (when (file-exists-p editorconfig-config-path)
                     (setq editorconfig-exec-path editorconfig-config-path))))))
  )

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

(with-eval-after-load 'expand-region
  (global-set-key (kbd "C-|") 'er/contract-region))

;; (windmove-default-keybindings 'super)

(when (maybe-require-package 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(when (maybe-require-package 'define-word)
  (global-set-key (kbd "C-c C-d") 'define-word-at-point)
  (global-set-key (kbd "C-c C-S-d") 'define-word))


(when (maybe-require-package 'super-save)
  (super-save-mode +1)
  (setq auto-save-default nil)
  (setq super-save-hook-triggers (quote (focus-out-hook find-file-hook)))
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 300)
  (setq super-save-remote-files nil)
  (setq super-save-exclude '(".gpg"))
  (setq super-save-triggers (quote (other-window
                                    balance-windows
                                    next-buffer
                                    org-babel-execute-src-block
                                    previous-buffer
                                    split-window-below
                                    split-window-horizontally
                                    start-process-shell-command
                                    switch-to-buffer
                                    windmove-down
                                    windmove-left
                                    windmove-right
                                    windmove-up)))
  (defun save-all-buffers ()
    (save-excursion
      (dolist (buf (buffer-list))
        (set-buffer buf)
        (when (and buffer-file-name
                   (buffer-modified-p (current-buffer))
                   (file-writable-p buffer-file-name)
                   (if (file-remote-p buffer-file-name) super-save-remote-files t))
          (save-buffer)))))

  (advice-add 'super-save-command :override 'save-all-buffers)
  )

;; (setq url-gateway-method 'socks)
;; (setq socks-server '("Default server" "127.0.0.1" 7070 5))
;; (setq url-gateway-local-host-regexp
;;       (concat "\\`" (regexp-opt '("localhost" "127.0.0.1")) "\\'"))

(when (maybe-require-package 'hl-todo)
  (global-hl-todo-mode)
  (with-eval-after-load 'hl-todo
    '(progn
       (define-key hl-todo-mode-map (kbd "C-c M-p") 'hl-todo-previous)
       (define-key hl-todo-mode-map (kbd "C-c M-n") 'hl-todo-next)
       (define-key hl-todo-mode-map (kbd "C-c M-o") 'hl-todo-occur))))

(with-eval-after-load 'grep
  '(progn
     (define-key grep-mode-map
       (kbd "C-x C-q") 'wgrep-change-to-wgrep-mode)
     (define-key ag-mode-map
       (kbd "C-x C-q") 'wgrep-change-to-wgrep-mode)))

(with-eval-after-load 'wgrep
  '(define-key grep-mode-map
     (kbd "C-c C-c") 'wgrep-finish-edit))

(require 'insert-translated-name)

(require 'clip2org)

(provide 'init-personal)
