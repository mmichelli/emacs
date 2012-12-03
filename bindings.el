;; buffer menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)


;; speedbar
;;(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;; window
;;(global-set-key (kbd "s-w") 'close-buffer)
;;(global-set-key (kbd "s-k") 'kill-this-buffer)



;; Fullscreen
;;(global-set-key (kbd "<s-return>") 'ns-toggle-fullscreen)

(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c C-g") 'magit-status)

(global-set-key (kbd "M-n") 'dired-find-alternate-file)
(global-set-key (kbd "M-p") 'dired-up-directory)

;;(global-set-key [(shift return)] 'prelude-insert-empty-line)
;;(global-set-key [(control shift up)]  'prelude-move-line-up)
(global-set-key (kbd "C-c r") 'prelude-rename-file-and-buffer)
(global-set-key (kbd "C-c s") 'prelude-swap-windows)
;;(global-set-key [(control shift down)]  'prelude-move-line-down)


(global-set-key (kbd "C-x f") 'recentf-open-files)



(global-set-key (kbd "C-x g") 'magit-status)







(provide 'bindings)


