(require-package 'matlab-mode)

;; (add-to-list 'load-path "~/.emacs.d/elpa-25.2/matlab-emacs")
;; (load-library "matlab-load")
;; (require 'matlab-load)
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("//.m//'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 152)) ; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

(unless (version< emacs-version "26.0")
  (add-hook 'matlab-mode-hook 'display-line-numbers-mode))

(defun my-matlab-shell-mode-hook ()
  '())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
(global-font-lock-mode t)
;(matlab-mode-hilit)
(autoload 'tlc-mode "tlc" "tlc Editing Mode" t)
(add-to-list 'auto-mode-alist '("//.tlc$" . tlc-mode))
(setq tlc-indent-function t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(matlab-mode-install-path (quote ("/home/mingchao/Software/matlab/toolbox")))
 '(matlab-shell-command "/home/mingchao/Software/matlab/bin/matlab"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun endless/comment-line-or-region (n)
  "Comment or uncomment current line and proceed to the next line.
With positive prefix, apply to N lines including current one.
With negative prefix, apply to -N lines above.
If region is active, apply to active region instead."
  (interactive "p")
  (if (use-region-p)
      (comment-or-uncomment-region
       (region-beginning) (region-end))
    (let ((range
           (list (line-beginning-position)
                 (goto-char (line-end-position n)))))
      (comment-or-uncomment-region
       (apply #'min range)
       (apply #'max range)))
    (forward-line 1)
    (back-to-indentation)))

(with-eval-after-load 'matlab
  (define-key matlab-mode-map (kbd "M-;") nil))

;; (global-set-key (kbd "M-;") #'endless/comment-line-or-region) 

(provide 'init-matlab)

