(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(setq x-select-enable-clipboard t)
(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard and clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        (shell-command-on-region (region-beginning) (region-end) "xclip -i -selection clipboard")
        )
    (if (region-active-p)
        (progn
          (call-interactively 'clipboard-kill-ring-save)
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to x-clipboard and clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(global-set-key (kbd "M-w") 'copy-to-clipboard)

(setq c-default-style "linux"
      c-basic-offset 4)

(require 'auto-complete)
(global-auto-complete-mode t)

(provide 'init-local)
