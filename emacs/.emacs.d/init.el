
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

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
			    term-mode-hook
				shell-mode-hook
				eshell-mode-hook
				(add-hook mode (lambda () (display-line-numbers-mode 0))))))

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

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  )
