#|
  This file is a part of ql-checkout project.
  Copyright (c) 2015 SANO Masatoshi (snmsts@gmail.com)
|#

#|
  -

  Author: SANO Masatoshi (snmsts@gmail.com)
|#



(in-package :cl-user)
(defpackage ql-checkout-asd
  (:use :cl :asdf))
(in-package :ql-checkout-asd)


(defsystem ql-checkout
  :version "0.1"
  :author "SANO Masatoshi"
  :mailto "snmsts@gmail.com"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "package"))))
  :description "-"
  :in-order-to ((test-op (load-op :ql-checkout.test))))
