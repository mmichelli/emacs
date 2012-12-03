(defun large-font ()
  (interactive)
  (set-face-font
   'default
   "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-20-*-*-*-m-0-iso10646-"))

(defun restore-frame ()
  (interactive)
  (set-frame-size (selected-frame)
                  (cdr (assoc 'width default-frame-alist))
                  (cdr (assoc 'height default-frame-alist)))
  (set-frame-position (selected-frame)
                      (cdr (assoc 'left default-frame-alist))
                      (cdr (assoc 'top default-frame-alist))))

(defun maximize-frame ()
  (interactive)
  (set-frame-size (selected-frame)
                  (display-pixel-width)
                  (display-pixel-height))
  (set-frame-position (selected-frame) 0 0))

(defun close-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun esk-tabify-buffer ()
  (interactive)
  (tabify (point-min) (point-max)))

(defun esk-cleanup-on-save ()
  (add-hook 'before-save-hook 'esk-cleanup-buffer))

(defun esk-cleanup-buffer ()
  (interactive)
  (if indent-tabs-mode
      (esk-tabify-buffer)
    (esk-untabify-buffer))
  (delete-trailing-whitespace))

(defun esk-ident-on-return ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(defun esk-paredit-nonlisp ()
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))


;; Function to run Tidy HTML parser on buffer
;; NOTE: this requires external Tidy program
(defun tidy-buffer ()
  "Run Tidy HTML parser on current buffer."
  (interactive)
  (if (get-buffer "tidy-errs") (kill-buffer "tidy-errs"))
  (shell-command-on-region (point-min) (point-max)
                           "tidy -f /tmp/tidy-errs -q -i -wrap 72 -c" t)
  (find-file-other-window "/tmp/tidy-errs")
  (other-window 1)
  (delete-file "/tmp/tidy-errs")
  (message "buffer tidy'ed")
  )
(global-set-key (kbd "C-x t") 'tidy-buffer)


(defun pretty-print-xml-region (begin end)
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))


(defun prelude-insert-empty-line ()
  "Insert an empty line after the current line and positon
the curson at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode))

(defun prelude-move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(defun prelude-move-line-down ()
  "Move down the current line."
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(defun prelude-swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let* ((w1 (first (window-list)))
           (w2 (second (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))
  (other-window 1))


;; find recent file
(defun ido-find-file-recent ()
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-x C-r") 'ido-find-file-recent)


(provide 'defuns)






