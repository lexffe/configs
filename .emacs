(require 'package)

;; Org-mode setup
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Org-mode Literate haskell ghci eval
(org-babel-do-load-languages
 'org-babel-load-languages
 '((haskell . t)))

;; suppress startup message
(setq inhibit-startup-message t)

(setq-default tab-always-indent 'complete)

;; no confirm when eval
(setq org-confirm-babel-evaluate nil)

;; macOS: window size
(setq frame-resize-pixelwise t)

;; macOS: scrolling when using Terminal.app
(mouse-wheel-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))

;; make backups only in .emacs.d, not with the files.
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(tango))
 '(hl-sexp-background-color "#efebe9")
 '(mouse-wheel-progressive-speed nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(haskell-mode))
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)
