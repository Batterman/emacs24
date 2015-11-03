;----------------------;
;;;packages and paths;;;
;----------------------;

;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; configure general settings
(require 'general-settings)

;elpy packages
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;melpa packages
(package-initialize)
(elpy-enable)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))


;neotree
(add-to-list 'load-path "/directory/containing/neotree/")
(require 'neotree)




;---------------;
;;; Utilities ;;;
;---------------;

;;auto-complete
(require 'auto-complete-config)
;(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(global-auto-complete-mode t)

;neotree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;-----------;
;;; Modes ;;;
;-----------;

;minimap-mode
(global-set-key [f9] 'minimap-mode)
(setq minimap-major-modes '(prog-mode html-mode org-mode))

;ido mode
(require 'ido)
(ido-mode t)

;org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cc" 'org-capture) ny binding nedenunder:
(global-set-key (kbd "<f5>") 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;org mode: auto save for org mode)
(add-hook 'org-mode-hook 'my-org-mode-autosave-settings)
(defun my-org-mode-autosave-settings ()
  ;; (auto-save-mode 1)   ; this is unnecessary as it is on by default
  (set (make-local-variable 'auto-save-visited-file-name) t)
  (setq auto-save-interval 20))

;org mode: capture
     (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

;yasnippet
(yas-global-mode 1)

;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
