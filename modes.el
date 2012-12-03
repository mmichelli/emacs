(remove-hook 'esk-coding-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'esk-coding-hook 'esk-pretty-lambdas)

(add-hook 'esk-coding-hook 'esk-turn-on-whitespace)
(add-hook 'esk-coding-hook 'esk-cleanup-on-save)
(add-hook 'esk-coding-hook 'esk-ident-on-return)

;; geben
(setq load-path (cons "~/.emacs.d/vendor/geben" load-path))
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

;; C
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq c-basic-offset 8)
             (setq tab-width 8)
             (setq indent-tabs-mode t)))

(add-hook 'c-mode-hook 'esk-run-coding-hook)
(add-hook 'c-mode-hook 'esk-paredit-nonlisp)

;; CSS
(add-hook 'css-mode-hook
          '(lambda ()
             (setq css-indent-offset 2)))

(add-hook 'css-mode-hook 'esk-run-coding-hook)
(add-hook 'css-mode-hook 'esk-paredit-nonlisp)

;; Diff
(add-hook 'diff-mode-hook 'turn-on-auto-fill)
(add-hook 'diff-mode-hook '(lambda ()
                             (setq fill-column 72)
                             (flyspell-mode 1)))

;; HTML
(add-hook 'html-mode-hook
          '(lambda()
             (setq tab-width 2)))

(add-hook 'html-mode-hook 'esk-run-coding-hook)
(add-hook 'html-mode-hook 'esk-paredit-nonlisp)
(add-to-list 'auto-mode-alist '("\\.pbs\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.pbo\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))


;; SCSS
(setq exec-path (cons (expand-file-name "~/.gem/ruby/1.8/bin") exec-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(eval-after-load
    "scss-mode"
  '(progn
     ;; Don't need Emacs to autogenerate the compiled CSS files for me
     (setq scss-compile-at-save nil)))

;; js
(setq load-path (cons "~/.emacs.d/vendor/js3-mode" load-path))

(custom-set-variables
 
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-lazy-dots t)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(js3-curly-indent-offset 2)
)

(autoload 'js3-mode "js3" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;; javascript lint
(defun jslint-thisfile ()
  (interactive)
  (compile (format "jsl -process %s" (buffer-file-name))))

;;smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(add-to-list 'load-path (concat dotfiles-dir "/vendor/actionscript-mode/"))
(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))


;; YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; coffee
(add-hook 'coffee-mode-hook
          '(lambda()
             (setq tab-width 2)
             (local-set-key (kbd "RET") 'newline)))

(add-hook 'coffee-mode-hook 'esk-run-coding-hook)
(add-hook 'coffee-mode-hook 'esk-paredit-nonlisp)

;; eshell
(eval-after-load 'esh-opt
  '(progn
     (setq eshell-prompt-regexp "^$ ")
     (setq eshell-prompt-function (lambda () "$ "))
     (setq eshell-history-file-name "~/.history")
     (setq eshell-history-size 10000)))

;; text
(add-hook 'text-mode-hook '(lambda () (flyspell-mode 1)))
(remove-hook 'text-mode-hook 'turn-on-auto-fill)


;; org mode

;;disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;;enable syntax highlighting
(global-font-lock-mode t)
(transient-mark-mode 1)

;;;;org-mode configuration
;;enable org-mode
(require 'org)
;;make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


;; php
(add-to-list 'load-path (concat dotfiles-dir "/vendor/php-mode/"))
(require 'php-mode)


(add-to-list 'load-path (concat dotfiles-dir "/vendor/silverstripe-mode"))
(require 'silverstripe-mode)

(cua-mode)


;; magit
(require 'magit)


(require 'tramp)
(setq tramp-default-method "ssh")
                                        ;(setq tramp-default-method "scpc") ; also works
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(setq tramp-verbose 10)

(require 'multi-project)
(global-multi-project-mode)



;; autoload visual-basic-mode
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ; VBscript
(add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))  ; visual basic .NET file
(add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode)) ; visual basic form
(add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode)) ; basic language source
(add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode)) ; C++ class definition file


;;Jade
(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'sws-mode)
(require 'stylus-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;;complete
(add-to-list 'load-path "/Users/mario/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/mario/.emacs.d/ac-dict")
(ac-config-default)


;;Zencoding
(add-to-list 'load-path "~/.emacs.d/vendor/zencoding")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes


;;mustache
(add-to-list 'load-path "~/.emacs.d/vendor/mustache-mode")
(require 'mustache-mode)

;;commentary
(add-to-list 'load-path "~/.emacs.d/vendor/apache-mode")
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))




(provide 'modes)
