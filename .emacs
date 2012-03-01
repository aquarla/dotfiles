;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; 日本語の設定
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)

;; スクロールバーの位置を右側に変更する
(set-scroll-bar-mode 'right)

;; Emacsから外部エディタにCopy/Pasteできるようにする
(setq x-select-enable-clipboard t)

;; フォント
(cond (window-system
       (set-default-font
        "-*-fixed-medium-r-normal--16-*-*-*-*-*-*-*")
       (progn
         (set-face-font 'default
                        "-shinonome-gothic-medium-r-normal--16-*-*-*-*-*-*-*")
         (set-face-font 'bold
                        "-shinonome-gothic-bold-r-normal--16-*-*-*-*-*-*-*")
         (set-face-font 'italic
                        "-shinonome-gothic-medium-i-normal--16-*-*-*-*-*-*-*")
         (set-face-font 'bold-italic
                        "-shinonome-gothic-bold-i-normal--16-*-*-*-*-*-*-*")
       )))

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; for ruby development
;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; indent for ruby-mode
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

;; タブ, 全角スペース、改行直前の半角スペースを表示する
(when (require 'jaspace nil t)
  (when (boundp 'jaspace-modes)
    (setq jaspace-modes (append jaspace-modes
                                (list 'php-mode
                                      'yaml-mode
                                      'javascript-mode
                                      'ruby-mode
                                      'text-mode
                                      'fundamental-mode))))
  (when (boundp 'jaspace-alternate-jaspace-string)
    (setq jaspace-alternate-jaspace-string "□"))
  (when (boundp 'jaspace-highlight-tabs)
    (setq jaspace-highlight-tabs ?^))
  (add-hook 'jaspace-mode-off-hook
            (lambda()
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace nil))))
  (add-hook 'jaspace-mode-hook
            (lambda()
              (progn
                (when (boundp 'show-trailing-whitespace)
                  (setq show-trailing-whitespace t))
                (face-spec-set 'jaspace-highlight-jaspace-face
                               '((((class color) (background light))
                                  (:foreground "blue"))
                                 (t (:foreground "green"))))
                (face-spec-set 'jaspace-highlight-tab-face
                               '((((class color) (background light))
                                  (:foreground "red"
                                   :background "unspecified"
                                   :strike-through nil
                                   :underline t))
                                 (t (:foreground "purple"
                                     :background "unspecified"
                                     :strike-through nil
                                     :underline t))))
                (face-spec-set 'trailing-whitespace
                               '((((class color) (background light))
                                  (:foreground "red"
                                   :background "unspecified"
                                   :strike-through nil
                                   :underline t))
                                 (t (:foreground "purple"
                                     :background "unspecified"
                                     :strike-through nil
                                     :underline t))))))))

(put 'narrow-to-region 'disabled nil)
