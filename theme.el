;; Remove scrollbars and make hippie expand
;; work nicely with yasnippet

(set-face-attribute 'default nil
                :family "Inconsolata" :height 130 :weight 'normal)


;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "#555")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default


(provide 'theme)


