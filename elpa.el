(require 'package)
(package-initialize)

(defvar packages (list
		  'inf-ruby
		  'js2-mode
		  'magit
		  'nxml-mode
		  'rinari
		  'ruby-mode)
  "Libraries that should be installed by default.")

(defun elpa-install ()
  "Install all starter-kit packages that aren't installed."
  (interactive)
  (dolist (package packages)
    (unless (or (member package package-activated-list)
		(functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(provide 'elpa)
