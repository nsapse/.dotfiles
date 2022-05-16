
; disable the startup message
(setq inhibit-startup-message t)

; make the font readable


(scroll-bar-mode -1) ;disable the visible scrollbars
(tool-bar-mode -1)  ;disable the visible toolbar
(tooltip-mode -1) ;disable tooltips
(set-fringe-mode 10) ;little fringes for A E S T H E T I C S

(menu-bar-mode -1) ;disable the ugly menu bar

(load-theme 'wombat)


					;setup package management


(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'use-package)
(setq use-package-always-ensure t)

; get additional package sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))




(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
			    term-mode-hook
				shell-mode-hook
				eshell-mode-hook
				(add-hook mode (lambda () (display-line-numbers-mode 0))))))
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 25)))

(use-package rainbow-delimiters
  :hook (prog-mode . raindbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  ;(setq which-key-idle-delay 0.3))
  )

(use-package ivy
	:diminish 
	:bind(("C-s" . swiper)
		:map ivy-minibuffer-map	
		("TAB" . ivy-alt-done)
		("C-l" . ivy-alt-done)
		("C-j" . ivy-next-line)
		("C-k" . ivy-previous-line)
		:map ivy-switch-buffer-map
		("C-k" . ivy-previous-line)
		("C-l" . ivy-done)
		("C-d" . ivy-switch-buffer-kill)
		:map ivy-reverse-i-search-map
		("C-k" . ivy-previous-line))
	:config
	(ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
)


(use-package counsel
  :bind (("M-x" . counsel-M-x)
	("C-x b" . counsel-ibuffer)
	("C-x C-f" . counsel-find-file))
  :config
  (setq ivy-initial-input-alist nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ivy-rich which-key use-package rainbow-delimiters evil doom-modeline counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
