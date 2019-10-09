(require-package 'yasnippet)

(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; 设置 f2 为 yas 扩展快捷键
(define-key yas-minor-mode-map (kbd "<f2>") 'yas-expand)

(provide' init-yasnippet)
