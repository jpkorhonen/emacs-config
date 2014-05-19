(setq-default indent-tabs-mode nil)

(put 'upcase-region 'disabled nil)

;; https://github.com/defunkt/coffee-mode.git
;; Add mode for CoffeeScript
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace

(defun coffee-custom ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2)

  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--bare"))

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

  ;; Riding edge.
  (setq coffee-command "coffee")

  ;; Compile '.coffee' files on every save
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))

(add-hook 'coffee-mode-hook 'coffee-custom)

;; Cucumber
;;
;; Install:
;; cd ~/.emacs.d
;; git clone git://github.com/michaelklishin/cucumber.el.git
;;
(add-to-list 'load-path "~/.emacs.d/cucumber.el/")
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Rinari
;;
;; Install
;; cd ~/.emacs.d
;; git clone https://github.com/eschulte/rinari.git
;; cd rinari
;; git submodule init
;; git submodule update

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;;(add-to-list 'load-path "~/.emacs.d/rinari")
;;(require 'rinari)
;;
;;  ;;; nxml (HTML ERB template support)
;;(load "~/.emacs.d/nxhtml/autostart.el")
;;     
;;(setq
;;  nxhtml-global-minor-mode t
;;  mumamo-chunk-coloring 'submode-colored
;;  nxhtml-skip-welcome t
;;  indent-region-mode t
;;  rng-nxml-auto-validate-flag nil
;;  nxml-degraded t)
;;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))
;;
;; Turns on flymake for all files which have a flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-to-list 'load-path "/home/opinsys/.emacs.d/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
    (lambda () (flymake-mode t)))

(require 'color-theme)
    (color-theme-initialize)
    (color-theme-robin-hood)
