
# ql-checkout - 

[![Build Status](https://travis-ci.org/snmsts/ql-checkout.svg?branch=master)](https://travis-ci.org/snmsts/ql-checkout)

## Usage

```common-lisp
(ql-checkout:checkout :babel)
;=> #P"/home/snmsts/.roswell/local-projects/babel/"
;"git://github.com/cl-babel/babel.git"
```

## Dependencies
quicklisp and git tested on sbcl on linux.

## Installation

```
$ cd ~/common-lisp
$ git clone https://github.com/snmsts/ql-checkout
```

```common-lisp
(ql:quickload :ql-checkout)
```

## Author

* SANO Masatoshi (snmsts@gmail.com)

## Copyright

Copyright (c) 2015 SANO Masatoshi (snmsts@gmail.com)

# License

Licensed under the MIT License.


