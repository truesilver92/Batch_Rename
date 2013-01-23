#!/usr/local/bin/guile \
-e main -s
!#
(use-modules (ice-9 getopt-long)
	     (ice-9 ftw))

(define help-display "\

batch_rename [options]
  -h, --help Display this help
  -f, --function [lambda expression] A Lambda expression accepting totalfilecount and current file as arguments and returning the altered filename
  -d, --directory [Directory] The directory containing the files that function will act on

")

(define alist (list))

(define (main args)
  (let*
      ((option-spec
	'((function (single-char #\f) (value optional))
	  (directory (single-char #\d) (value optional))
	  (help (single-char #\h) (value #f))))
       (options (getopt-long args option-spec))
       (function-code (option-ref options 'function #f))
       (directory-name (option-ref options 'directory #f))
       (help-wanted (option-ref options 'help #f)))
       (if help-wanted
	   (display help-display)
	   (begin
	     ;; get all the files out of the directory excluding the current folder and the parent folder
	     (set! alist (cdr (cdr (scandir directory-name))))
	     (display alist)
	     (newline)))))
