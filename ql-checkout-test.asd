#|
  This file is a part of ql-checkout project.
  Copyright (c) 2015 SANO Masatoshi (snmsts@gmail.com)
|#

(in-package :cl-user)
(defpackage ql-checkout-test-asd
  (:use :cl :asdf))
(in-package :ql-checkout-test-asd)

(defsystem ql-checkout-test
  :author "SANO Masatoshi"
  :license "MIT"
  :depends-on (:ql-checkout
               :prove)
  :components ((:module "t"
                        :components
                        ((:test-file "ql-checkout"))))
  :description "Test system for ql-checkout"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                                        (asdf:clear-system c)))
