;;; init-email.el --- mu4e support  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(defvar mu4e-installation-path nil
  "Installation path for mu4e.")

(setq mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")

(add-to-list 'load-path mu4e-installation-path)



(when (file-exists-p mu4e-installation-path)
  (require 'mu4e)

  (setq mu4e-maildir       "~/mail"
        mu4e-sent-folder   "/sent"
        mu4e-drafts-folder "/drafts"
        mu4e-trash-folder  "/trash"
        mu4e-refile-folder "/archive")

  (setq mu4e-get-mail-command "fetchmail -v || [ $? -eq 1 ]"
        mu4e-update-interval 300)

  ;; sending mail
  (setq message-send-mail-function 'message-send-mail-with-sendmail
        sendmail-program "/usr/bin/msmtp")


  (when (maybe-require-package 'mu4e-alert)
    ;; Choose the style you prefer for desktop notifications
    ;; If you are on Linux you can use
    ;; 1. notifications - Emacs lisp implementation of the Desktop Notifications API
    ;; 2. libnotify     - Notifications using the `notify-send' program, requires `notify-send' to be in PATH
    ;;
    ;; On Mac OSX you can set style to
    ;; 1. notifier      - Notifications using the `terminal-notifier' program, requires `terminal-notifier' to be in PATH
    ;; 1. growl         - Notifications using the `growl' program, requires `growlnotify' to be in PATH
    (mu4e-alert-set-default-style 'libnotify)
    (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
    (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display))

  (when (maybe-require-package 'mu4e-overview)))

(provide 'init-email)