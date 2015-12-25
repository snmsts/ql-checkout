#|
  This file is a part of ql-checkout project.
  Copyright (c) 2015 SANO Masatoshi (snmsts@gmail.com)
|#

(in-package :cl-user)
(defpackage ql-checkout
  (:use :cl)
  (:export :*checkout-path* :checkout))

(in-package :ql-checkout)

(defvar *checkout-path*
  (or #+quicklisp (first ql:*local-project-directories*)
      #-quicklisp (merge-pathnames ".qlcheckout/" (user-homedir-pathname))))

(defun notyet (system uri &rest params)
  (list system uri params))

(defun git (system uri &rest params)
  (declare (ignorable params))
  (uiop:run-program "which git")
  (let ((path (merge-pathnames (format nil "~A/" (string-downcase system)) *checkout-path*)))
    (if (probe-file path)
        (error "~A already exists" path)
        (uiop:run-program (format nil "git clone ~A ~A" uri path))))
  uri)

(defun kmr-git (system base)
  (git system (format nil "http://git.kpe.io/~A.git" base)))

(defun xach-http (system base)
  (git system (format nil "https://github.com/xach/~A.git" base)))

(defun froydware-http (system base)
  (git system (format nil "https://github.com/froydnj/~A.git" base)))

(defvar *handler*
  '(
    ("git" . git)                       ;:1am
    ("latest-github-release" . git)     ;:yason
    ("branched-git" . git)              ;:antik
    ("kmr-git" . kmr-git)               ;:cl-base64
    ("tagged-git" . git)                ;:bordeaux-threads
    ("xach-http" . xach-http)           ;:buildapp github?
    ("froydware-http" . froydware-http) ;:ironclad

    ("mercurial" . notyet)              ;:big-string
    ("svn" . notyet)                    ;:cl-kanren-trs
    ("darcs" . notyet)                  ;:arnesi
    ("clnet-darcs" . notyet)            ;:iterate

    ("wcpware-http" .  notyet)          ;:tiff4cl
    ("naked-http" . notyet)             ;:date-calc
    ("ediware-http" . notyet)           ;:cl-ppcre
    ("http-bz2" . notyet)               ;:binge
    ("https" . notyet)                  ;:asdf-flv
    ("http" . notyet)                   ;:adw-charting
    ("single-file" . notyet)            ;:conduit-packages
    ))

(defun checkout (system)
  (let ((tmp (split-sequence:split-sequence
       #\Space
       (string-right-trim
        (string #\lf)
        (dex:get
  (format nil "https://raw.githubusercontent.com/quicklisp/quicklisp-projects/master/projects/~A/source.txt"
   (string-downcase system)))))))
    (apply (cdr (assoc (first tmp) *handler* :test 'equal)) system (rest tmp))))
