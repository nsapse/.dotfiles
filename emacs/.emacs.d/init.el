
; disable the startup message
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ;disable the visible scrollbars
(tool-bar-mode -1)  ;disable the visible toolbar
(tooltip-mode -1) ;disable tooltips
(set-fringe-mode 10) ;little fringes for A E S T H E T I C S

(menu-bar-mode -1) ;disable the ugly menu bar

(load-theme 'wombat)


					;setup package management


(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'package)
(setq package-archives '(
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; intialize use-package if we're on a non-linux platform
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil counsel swiper doom-modeline ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package doom-modeline)
(doom-modeline-mode 1)

(use-package command-log-mode)
(use-package ivy
  :bind(("C-s" . swiper))
  :config
  (ivy-mode 1))

;; setup evil

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  )
