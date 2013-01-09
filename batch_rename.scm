#!/usr/local/bin/guile \
-e main -s
!#
(use-modules (ice-9 getopt-long))

(define help_display "\

batch_rename [options]
  -h, --help Display this help
  -f, --function [lambda expression] A Lambda expression accepting totalfilecount and current file as arguments and returning the altered filename
  -d, --directory [Directory] The directory containing the files that function will act on

")

(define (main args)
  (define option-spec
    '((function (single-char #\f) (value optional))
      (directory (single-char #\d) (value optional))
      (help (single-char #\h) (value #f))))
  (define options (getopt-long args option-spec))
  (define function-code (option-ref options 'function #f))
  (define directory-name (option-ref options 'directory #f))
  (define help-wanted (option-ref options 'help #f))
  (if help-wanted
      (display help_display))
  (write "function-code: ")
  (write function-code)
  (newline)
  (write "directory-name: ")
  (write directory-name)
  (newline))
