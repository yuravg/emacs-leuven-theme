;;; leuven-gray-theme.el --- Awesome Emacs color theme on white background

;; Copyright (C) 2003-2019 Free Software Foundation, Inc.

;; Author: Fabrice Niessen <(concat "fniessen" at-sign "pirilampo.org")>
;; URL: https://github.com/fniessen/emacs-leuven-theme
;; Version: 20191025.1728
;; Keywords: color theme

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This elegant Org-enhancing color theme "leuven" ROCKS!
;; ... and not just for Org mode.
;;
;; To use it, put the following in your Emacs configuration file:
;;
;;   (load-theme 'leuven-gray t)
;;
;; Requirements: Emacs 24+.
;;
;; NOTE -- Would you like implement a version of this for dark backgrounds,
;; please do so!  I'm willing to integrate it...

;;; Code:

;;; Options.

(defgroup leuven-gray nil
  "Leuven-gray theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom leuven-gray-scale-outline-headlines t
  "Scale `outline' (and `org') level-1 headlines.
This can be nil for unscaled, t for using the theme default, or a scaling number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling"))
  :group 'leuven-gray)

(defcustom leuven-gray-scale-org-agenda-structure t
  "Scale Org agenda structure lines, like dates.
This can be nil for unscaled, t for using the theme default, or a scaling number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling"))
  :group 'leuven-gray)

(defun leuven-gray-scale-font (control default-height)
  "Function for splicing optional font heights into face descriptions.
CONTROL can be a number, nil, or t.  When t, use DEFAULT-HEIGHT."
  (cond
   ((numberp control) (list :height control))
   ((eq t control) (list :height default-height))
   (t nil)))

;;; Theme Faces.

(deftheme leuven-gray
  "Face colors with a light background.
Basic, Font Lock, Isearch, Gnus, Message, Org mode, Diff, Ediff,
Flyspell, Semantic, and Ansi-Color faces are included -- and much
more...")

(let ((class '((class color) (min-colors 89)))

      ;; Leuven-gray generic colors
      (code-block '((,class (color))))
      (code-inline '(:foreground "black"))

      (completion-selected-candidate '(:weight bold :foreground "white" :background "#0052A4"))
      (completion-other-candidates '(:weight bold :foreground "black" :background "#EBF4FE"))
      (completion-inline '(:weight normal :foreground "#C0C0C0" :inherit hl-line)) ; Like Google.
      (link '(:weight normal :underline t :foreground "RoyalBlue3"))
      (match '(:weight bold :background "yellow1")) ; occur patterns
      (ol1 '(:weight bold :foreground "blue2" :background "#C1FFC1" :height 1.2 :overline "#A7A7A7" :underline "#A7A7A7"))
      (ol2 '(:weight bold :foreground "blue4" :background "#E5F4FB"))
      (ol3 '(:weight bold :foreground "blue4" :background "#E7EBFA"))
      (ol4 '(:weight bold :foreground "blue4" :background "#EFEFF1"))
      (ol5 '(:weight bold :foreground "gray14" :background "gray91"))
      (ol6 '(:weight bold :foreground "gray20" :background "gray96"))
      (ol7 '(:weight bold :foreground "gray25"))
      (ol8 '(:weight bold :foreground "gray33"))
      (org-block-line '(:weight bold :foreground "DarkSlateGray"))
      (paren-matched '(:background "beige"))
      (region '(:background "LightGoldenrod2"))
      (shadow '(:foreground "gray50"))
      (string '(:foreground "dark green"))
      (volatile-highlight '(:background "LightGoldenrod2")) ; flash-region
      (highlight-current-tag '(:background "#E8E8FF"))
      )

  (custom-theme-set-faces
   'leuven-gray
   `(default ((,class (:foreground "#333333" :background "#FFFFFF"))))
   `(bold ((,class (:weight bold :foreground "black"))))
   `(bold-italic ((,class (:weight bold :slant italic :foreground "black"))))
   `(italic ((,class (:slant italic :foreground "#1A1A1A"))))
   `(underline ((,class (:underline t))))
   `(cursor ((,class (:background "#221F1E"))))

   ;; Highlighting faces
   `(region ((,class ,region)))
   `(secondary-selection ((,class (:weight normal :background "yellow1")))) ; Used by Org-mode for highlighting matched entries and keywords.
   `(isearch ((,class (:background "#E99CE8" :foreground "black")))) ; similar to ivy-minibuffer-match-face-2
   `(isearch-fail ((,class (:background "RosyBrown1"))))
   `(lazy-highlight ((,class (:background "PaleTurquoise")))) ; isearch others
   `(trailing-whitespace ((,class (:foreground "#B3B3B3" :background "#FFFFAB"))))
   `(query-replace ((,class (:inherit isearch))))

   ;; Mode line faces
   `(mode-line ((,class (:foreground "black" :background "gray75" :box (:line-width -1 :color nil :style released-button)))))
   `(mode-line-inactive ((,class (:inherit mode-line :background "gray90" :foreground "gray20" :box (:line-width -1 :color "gray75") :weight light))))
   `(mode-line-buffer-id ((,class (:weight bold :foreground "black"))))
   `(mode-line-emphasis ((,class (:weight bold :foreground "black"))))
   `(mode-line-highlight ((,class (:box (:line-width 2 :color "gray40" :style released-button)))))

   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:weight normal :foreground "black" :background "ghost white"))))
   `(minibuffer-noticeable-prompt ((,class (:weight bold :foreground "black" :background "gold"))))
   `(error ((,class (:foreground "red"))))
   `(warning ((,class (:weight bold :foreground "orange"))))
   `(success ((,class (:weight bold :foreground "green4"))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground "blue1"))))
   `(font-lock-comment-delimiter-face ((,class (:foreground "gray50"))))
   `(font-lock-comment-face ((,class (:slant italic :foreground "gray50"))))
   `(font-lock-constant-face ((,class (:foreground "dark cyan"))))
   `(font-lock-doc-face ((,class (:foreground "dark green"))))
   `(font-lock-function-name-face ((,class (:foreground "blue1"))))
   `(font-lock-keyword-face ((,class (:foreground "dark magenta"))))
   `(font-lock-preprocessor-face ((,class (:inherit font-lock-builtin-face :foreground "tan4"))))
   `(font-lock-regexp-grouping-backslash ((,class (:weight bold :inherit nil))))
   `(font-lock-regexp-grouping-construct ((,class (:weight bold :inherit nil))))
   `(font-lock-string-face ((,class ,string)))
   `(font-lock-type-face ((,class (:weight normal :foreground "blue1"))))
   `(font-lock-variable-name-face ((,class (:weight normal :foreground "blue4")))) ; #800080
   `(font-lock-warning-face ((,class (:weight bold :foreground "red" :slant normal))))

   ;; Button and link faces
   `(link ((,class ,link)))
   `(link-visited ((,class (:underline t :foreground "magenta4"))))
   `(button ((,class (:underline t :foreground "#006DAF"))))

   ;; Flyspell
   (if (version< emacs-version "24.4")
       `(flyspell-duplicate ((,class (:underline "cyan3" :inherit nil))))
     `(flyspell-duplicate ((,class (:underline (:style wave :color "cyan3") :inherit nil)))))
   (if (version< emacs-version "24.4")
       `(flyspell-incorrect ((,class (:underline "cyan3" :inherit nil))))
     `(flyspell-incorrect ((,class (:underline (:style wave :color "cyan3") :inherit nil)))))

   ;; Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color "red") :inherit nil))))
   ;; Writegood
   `(writegood-duplicates-face ((,class (:inherit flyspell-duplicate))))
   `(writegood-passive-voice-face ((,class (:inherit flyspell-duplicate))))

   ;; Anzu
   `(anzu-mode-line ((,class (:foreground "dark green" :weight bold))))
   `(anzu-mode-line-no-match ((,class (:foreground "indian red" :weight bold))))

   ;; Company
   `(company-tooltip-selection ((,class (:weight normal :foreground "#FFFFFF" :background "#4682B4"))))
   `(company-tooltip-common-selection ((,class (:weight normal :inherit company-tooltip-selection))))
   `(company-tooltip-annotation-selection ((,class (:weight normal :foreground "#F9ECCC"))))
   `(company-tooltip-common ((,class (:weight normal :foreground "#5B6367" :inherit company-tooltip))))
   `(company-tooltip ((,class (:weight normal :foreground "#000000" :background "#D3D3D3"))))
   `(company-tooltip-annotation ((,class (:weight normal :foreground "#000000"))))
   `(company-preview-common ((,class (:foreground "#C0C0C0" :background "#F6FECD"))))
   `(company-scrollbar-bg ((,class (:background "#F0F0F0"))))
   `(company-scrollbar-fg ((,class (:background "#C0C0C0"))))

   ;; Compilation
   `(compilation-error ((,class (:weight bold :foreground "red")))) ; Used for grep error messages.
   `(compilation-info ((,class (:weight bold :foreground "#2A489E")))) ; Used for grep hits.
   `(compilation-line-number ((,class (:weight bold :foreground "#A535AE"))))
   `(compilation-warning ((,class (:weight bold :foreground "orange"))))
   `(compilation-mode-line-exit ((,class (:weight bold :foreground "dark green")))) ; :exit[matched]
   `(compilation-mode-line-fail ((,class (:weight bold :foreground "red")))) ; :exit[no match]
   `(compilation-mode-line-run ((,class (:weight bold :foreground "orange")))) ; :run

   `(hl-line ((,class (:background "lavender")))) ; Highlight current line.
   `(next-error ((,class ,volatile-highlight)))

   ;; Org
   `(org-level-1 ((,class ,ol1)))
   `(org-level-2 ((,class ,ol2)))
   `(org-level-3 ((,class ,ol3)))
   `(org-level-4 ((,class ,ol4)))
   `(org-level-5 ((,class ,ol5)))
   `(org-level-6 ((,class ,ol6)))
   `(org-level-7 ((,class ,ol7)))
   `(org-level-8 ((,class ,ol8)))
   `(org-default ((,class (:foreground "#333333" :background "#FFFFFF"))))
   `(org-archived ((,class (:foreground "gray70"))))
   `(org-beamer-tag ((,class (:foreground "#2C2C2C" :background "#FFF8D0" :box (:line-width 1 :color "#FABC18")))))
   `(org-block ((,class ,code-block)))
   `(org-block-begin-line ((,class ,org-block-line)))
   `(org-block-end-line ((,class ,org-block-line)))
   `(org-checkbox ((,class (:foreground "gray10" :background "gray96"))))
   `(org-code ((,class ,code-inline)))
   `(org-date ((,class (:underline t :foreground "#00459E"))))
   `(org-document-info ((,class (:foreground "#484848"))))
   `(org-document-info-keyword ((,class (:foreground "#008ED1" :background "#EAEAFF"))))
   `(org-document-title ((,class (:weight bold :foreground "black"))))
   `(org-drawer ((,class (:foreground "light sky blue"))))
   `(org-ellipsis ((,class (:underline nil :foreground "#999999" :background "#FFF8C0" :box (:line-width 1 :color "#999999"))))) ; #FFEE62
   `(org-example ((,class (:foreground "blue" :background "#EAFFEA"))))
   `(org-footnote ((,class (:underline t :foreground "#008ED1"))))
   `(org-headline-done ((,class (:height 1.0 :weight normal :strike-through t :foreground "#ADADAD"))))

   ;; Outline
   `(outline-1 ((,class ,ol2)))
   `(outline-2 ((,class ,ol3)))
   `(outline-3 ((,class ,ol4)))
   `(outline-4 ((,class ,ol5)))
   `(outline-5 ((,class ,ol6)))
   `(outline-6 ((,class ,ol7)))
   `(outline-7 ((,class ,ol8)))
   `(outline-8 ((,class ,ol8)))

   ;; Markdown
   `(markdown-header-face-1 ((,class ,ol2)))
   `(markdown-header-face-2 ((,class ,ol3)))
   `(markdown-header-face-3 ((,class ,ol4)))
   `(markdown-header-face-4 ((,class ,ol5)))
   `(markdown-header-face-5 ((,class ,ol6)))
   `(markdown-header-face-6 ((,class ,ol7)))
   `(markdown-code-face ((,class (:weight normal))))

   ;; Rst(ReST)
   `(rst-level-1 ((,class ,ol2)))
   `(rst-level-2 ((,class ,ol3)))
   `(rst-level-3 ((,class ,ol4)))
   `(rst-level-4 ((,class ,ol5)))
   `(rst-level-5 ((,class ,ol6)))
   `(rst-level-6 ((,class ,ol7)))

   ;; sh-script
   `(sh-quoted-exec ((,class (:foreground "IndianRed4"))))

   ;; Magit
   `(magit-log-author ((,class (:foreground "gray40"))))
   `(magit-section-highlight ((,class (:background "lavender"))))
   `(magit-branch-current ((,class (:underline t :foreground "dark green" :weight bold :background "#ddffdd" :box (:line-width 1)))))
   `(magit-branch-local ((,class (:underline t :foreground "blue4" :weight bold :background "#E5F4FB"))))
   `(magit-branch-remote ((,class (:underline t :foreground "IndianRed4" :weight bold :background "khaki1"))))
   `(magit-tag ((,class (:underline t :foreground "blue3" :weight bold :background "yellow1"))))

   `(show-paren-match ((,class ,paren-matched)))
   `(tooltip ((,class (:foreground "black" :background "light yellow"))))
   ;; Magit + diff
   `(diff-refine-added ((,class (:foreground "#22AA22" :background "#BBF0BB"))))
   `(magit-diff-added ((,class (:foreground "#22AA22" :background "#DDFFDD"))))
   `(magit-diff-added-highlight ((,class (:foreground "#22AA22" :background "#DDFFDD"))))
   `(diff-refine-removed ((,class (:foreground "#AA2222" :background "#FFBBBB"))))
   `(magit-diff-removed ((,class (:foreground "#AA2222" :background "#FFDDDD"))))
   `(magit-diff-removed-highlight ((,class (:foreground "#AA2222" :backgroun "#FFDDDD"))))

   ;; Git-timemachine
   `(git-timemachine-commit ((,class (:foreground "blue4" :weight normal))))
   `(git-timemachine-minibuffer-author-face ((,class (:foreground "gray35"))))
   `(git-timemachine-minibuffer-detail-face ((,class (:foreground "navy" :weight normal))))

   ;; Completion buffer
   `(completions-common-part ((,class (:foreground "blue4"))))
   `(completions-first-difference ((,class (:foreground "black" :weight bold))))
   `(completions-annotations ((,class (:foreground "gray50"))))

   ;; Grep(ivy-occur-grep-mode)
   `(wgrep-face ((,class (:background "#ddffdd"))))
   `(wgrep-file-face ((,class (:background "#ddffdd"))))

   ;; Dired
   `(diredp-compressed-file-suffix ((,class (:foreground "red2"))))

   ;; Bookmark
   `(bm-face ((,class (:foreground "black" :background "light goldenrod"))))
   `(bm-fringe-face ((,class (:foreground "black" :background "light goldenrod"))))
   `(bm-fringe-persistent-face ((,class (:foreground "black" :background "#C8E7A2"))))
   `(bm-persistent-face ((,class (:foreground "black" :background "#C8E7A2"))))

   ;; cperl
   `(cperl-nonoverridable-face ((,class (:foreground "IndianRed4"))))
   `(cperl-hash-face ((,class (:foreground "IndianRed3" :background "gray93"))))
   `(cperl-array-face ((,class (:foreground "blue1" :background "gray95"))))

   ;; Hexl
   ;; Default: :inherit header-line: foreground: gray20, background: gray90
   `(hexl-address-region ((,class (:background "gray90" :foreground "navy" :inherit header-line))))
   `(hexl-ascii-region ((,class (:background "gray93" :foreground "gray20" :inherit header-line))))

   ;; Smart Mode-Line
   `(sml/line-number ((,class (:weight medium))))
   `(sml/col-number ((,class (:weight medium))))
   `(sml/numbers-separator ((,class (:inherit sml/col-number))))

   ;; Tags
   `(etags-select-highlight-tag-face ((,class (:foreground "white" :background "purple" :weight bold))))

   ;; Elisp
   `(eros-result-overlay-face ((,class (:foreground "black" :background "#CDFFCD" :box (:line-width -1 :color "blue3" :style none)))))

   ;; Tldr
   `(tldr-code-block       ((,class (:foreground "blue3" :background "#E5F4FB" :weight bold))))
   `(tldr-command-argument ((,class (:foreground "black" :background "#E5F4FB" ))))
   `(tldr-command-itself   ((,class (:foreground "blue1" :background "#E5F4FB" :weight bold))))
   `(tldr-description      ((,class (:foreground "black"))))
   `(tldr-introduction     ((,class (:foreground "#525252" :slant italic))))
   `(tldr-title            ((,class (:foreground "DarkGreen" :background "#CDFFCD" :height 1.2 :weight bold))))

   ;; Info
   `(info-command-ref-item ((,class (:foreground "blue" :background "gray94"))))
   `(info-constant-ref-item ((,class (:foreground "DeepPink" :background "gray94"))))
   `(info-double-quoted-name ((,class (:foreground "green4" :background nil))))
   `(info-emphasis ((,class (:foreground nil :background nil))))
   `(info-file ((,class (:foreground "blue" :background "gray94"))))
   `(info-function-ref-item ((,class (:foreground "DarkBlue" :background "gray94"))))
   `(info-header-node ((,class (:foreground nil :background nil))))
   `(info-header-xref ((,class (:foreground nil :background nil))))
   `(info-index-match ((,class (:foreground nil :background nil))))
   `(info-macro-ref-item ((,class (:foreground "DarkMagenta" :background "gray94"))))
   `(info-menu ((,class (:foreground "Blue" :background nil))))
   `(info-menu-header ((,class (:weight bold :foreground nil :background nil))))
   `(info-menu-star ((,class (:foreground "red1" :background nil))))
   `(info-node ((,class (:weight bold :slant italic :foreground "brown"))))
   `(info-quoted-name ((,class (:foreground "DarkViolet" :background nil))))
   `(info-reference-item ((,class (:foreground nil :background "gray94"))))
   `(info-single-quote ((,class (:foreground "magenta" :background nil))))
   `(info-special-form-ref-item ((,class (:foreground "darkmagenta" :background "gray94"))))
   `(info-string ((,class (:foreground "red3" :background nil))))
   `(info-syntax-class-item ((,class (:foreground "DarkGreen" :background "gray94"))))
   `(info-title-1 ((,class (:height 1.2 :inherit info-title-2))))
   `(info-title-2 ((,class (:height 1.2 :inherit info-title-3))))
   `(info-title-3 ((,class (:height 1.2 :inherit info-title-4))))
   `(info-title-4 ((,class (:weight bold :inherit variable-pitch))))
   `(info-user-option-ref-item ((,class (:foreground "red" :background "gray94"))))
   `(info-variable-ref-item ((,class (:foreground "firebrick" :background "gray94"))))
   `(info-xref ((,class (:inherit link))))
   `(info-xref-visited ((,class (:inherit link-visited info-xref))))
   ))

(custom-theme-set-variables
 'leuven-gray

 ;; highlight-sexp-mode.
 '(hl-sexp-background-color "#EFEBE9")

 '(ansi-color-faces-vector
   [default default default italic underline success warning error])

 ;; Colors used in Shell mode.
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 )

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  ;; Add theme folder to `custom-theme-load-path' when installing over MELPA.
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;;###autoload
(when (string-match "/etc/themes/$"
                    (file-name-directory (or load-file-name (buffer-file-name))))
  (message "To stay up-to-date, you should better install and use leuven-theme from MELPA.")
  (sit-for 2))

(provide-theme 'leuven-gray)

;; This is for the sake of Emacs.
;; Local Variables:
;; no-byte-compile: t
;; time-stamp-end: "$"
;; time-stamp-format: "%:y%02m%02d.%02H%02M"
;; time-stamp-start: "Version: "
;; End:

;;; leuven-gray-theme.el ends here
