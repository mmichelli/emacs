(setq package-user-dir (concat dotfiles-dir "elpa"))

(defvar packages (list
                  'coffee-mode
                  'color-theme
                  'color-theme-solarized
                  'color-theme-twilight
                  'erlang
                  'full-ack
                  'haskell-mode
                  'inf-ruby
                  'magit
                  'mustache-mode
                  'rhtml
                  'ruby-mode
                  'starter-kit
                  'starter-kit-lisp
                  'starter-kit-ruby
                  'textmate)
  "Libraries that should be installed by default.")

(defun elpa-install ()
  "Install all starter-kit packages that aren't installed."
  (interactive)
  (package-refresh-contents)
  (dolist (package packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(require 'package)
(dolist (source '(("josh" . "http://josh.github.com/elpa/")
                  ("technomancy" . "http://repo.technomancy.us/emacs/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(provide 'elpa)
