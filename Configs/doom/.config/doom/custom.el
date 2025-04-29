(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" default))
 '(ignored-local-variable-values '((ssh-deploy-on-explicit-save)))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(safe-local-variable-values
   '((dape-configs
      (go-debug-main modes
       (go-mode go-ts-mode)
       command "dlv" command-args
       ("dap" "--listen" "127.0.0.1:55878" "--log-dest" "/tmp/dlv.log")
       host "127.0.0.1" port 55878 :request "launch" :mode "debug" :type "go" :showLog "true")
      (go-test modes
       (go-mode go-ts-mode)
       command "dlv" command-args
       ("dap" "--listen" "127.0.0.1:55878")
       host "127.0.0.1" port 55878 :request "launch" :mode "test" :type "go"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/src/" :recursive t :auto-sitemap nil :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/src/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/src/" :recursive t :auto-sitemap t :sitemap-filename "index.html" :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/src/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/src/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/src/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/src/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist" :makeindex t)
      ("images" :base-directory "~/Documentos/Docs/src/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/src/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist" :auto-sitemap t)
      ("images" :base-directory "~/Documentos/Docs/src/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/src/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist" :auto-sitemap t)
      ("images" :base-directory "~/Documentos/Docs/src/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist" :auto-sitemap t))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist" :auto-sitemap t)
      ("images" :base-directory "~/Documentos/Docs/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist" :auto-sitemap t))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documentos/Docs/dist/images"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documenots/Docs/dist/images/"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")
      ("images" :base-directory "~/Documentos/Docs/images/" :recursive t :base-extension "jpg\\|git\\|png\\|svg" :publishing-function org-publish-attachment :publishing-directory "~/Documenots/Docs/dist/images/"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :recursive t :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs/" :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist
      ("Docs" :base-directory "~/Documentos/Docs" :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist"))
     (org-publish-project-alist quote
      (("Docs" :base-directory "~/Documentos/Docs" :publishing-function org-html-publish-to-html :publishing-directory "~/Documentos/Docs/dist")))
     (eval doom-enable-line-numbers-h)
     (org-use-property-inheritance . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
