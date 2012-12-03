;; load paths
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)


(setq custom-file (concat dotfiles-dir "custom.el"))

(setq recentf-save-file "~/.emacs.d/recentf")

 (setenv "BACKGROUND" "dark")
(require 'cl)
(require 'elpa)
(require 'global)
(require 'defuns)
(require 'bindings)
(require 'buffers)
(require 'modes)
(require 'theme)

(load custom-file 'noerror)
(load (concat dotfiles-dir "me.el"))

(provide 'init)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'ido-exit-minibuffer 'disabled nil)
