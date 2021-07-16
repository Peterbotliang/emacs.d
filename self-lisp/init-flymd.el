(require-package 'flymd)

(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

;; (defun my-flymd-browser-function (url)
;;   (let ((process-environment (browse-url-process-environment)))
;;     (apply 'start-process
;;            (concat "google-chrome " url) nil
;;            "google-chrome"
;;            (list "--new-window" "--allow-file-access-from-files" url))))
;; (setq flymd-browser-open-function 'my-flymd-browser-function)

(provide 'init-flymd)
