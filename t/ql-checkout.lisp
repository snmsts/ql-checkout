(in-package :cl-user)
(defpackage ql-checkout-test
  (:use :cl
        :ql-checkout
        :prove))
(in-package :ql-checkout-test)

(plan 1)

(subtest "checkout"
         (ok (checkout :babel)
             "Can checkout babel")

         (ok (checkout :ironclad)
             "Can checkout ironclad")

         (is-error (checkout :asdf-flv)
                   'error))


(finalize)
