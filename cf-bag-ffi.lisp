;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-bag-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-bag-ffi.lisp $
;;; $Id: cf-bag-ffi.lisp 210 2009-07-19 22:58:54Z greg $
;;;

;;; Copyright (c) 2004-2005, Gregory C. Wuller. All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or
;;; without modification, are permitted provided that the following
;;; conditions are met:
;;;
;;; * Redistributions of source code must retain the above copyright
;;;   notice, this list of conditions and the following disclaimer.
;;;
;;; * Redistributions in binary form must reproduce the above copyright
;;;   notice, this list of conditions and the following disclaimer in
;;;   the documentation and/or other materials provided with the
;;;   distribution.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package :core-foundation)

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBag.h"

(fli:define-c-typedef (cf-bag-retain-call-back
                       (:foreign-name "CFBagRetainCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-bag-release-call-back
                       (:foreign-name "CFBagReleaseCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        :void)))
(fli:define-c-typedef (cf-bag-copy-description-call-back
                       (:foreign-name "CFBagCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-bag-equal-call-back
                       (:foreign-name "CFBagEqualCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void))
                         (:pointer (:const :void)))
                        :boolean)))
(fli:define-c-typedef (cf-bag-hash-call-back
                       (:foreign-name "CFBagHashCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-hash-code)))
(fli:define-c-typedef (cf-bag-call-backs
                       (:foreign-name "CFBagCallBacks"))
                      (:struct
                       (version cf-index)
                       (retain cf-bag-retain-call-back)
                       (release cf-bag-release-call-back)
                       (copy-description
                        cf-bag-copy-description-call-back)
                       (equal cf-bag-equal-call-back)
                       (hash cf-bag-hash-call-back)))
(fli:define-foreign-variable (k-cf-type-bag-call-backs
                              "kCFTypeBagCallBacks"
                              :source)
                             :type
                             (:const cf-bag-call-backs))
(fli:define-foreign-variable (k-cf-copy-string-bag-call-backs
                              "kCFCopyStringBagCallBacks"
                              :source)
                             :type
                             (:const cf-bag-call-backs))
(fli:define-c-typedef (cf-bag-applier-function
                       (:foreign-name "CFBagApplierFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)) (:pointer :void))
                        :void)))
(fli:define-c-struct (__cf-bag
                      (:foreign-name "__CFBag")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-bag-ref (:foreign-name "CFBagRef"))
                      (:pointer (:const (:struct __cf-bag))))
(fli:define-c-typedef (cf-mutable-bag-ref
                       (:foreign-name "CFMutableBagRef"))
                      (:pointer (:struct __cf-bag)))
(fli:define-foreign-function (cf-bag-get-type-id
                              "CFBagGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-create "CFBagCreate" :source)
                             ((allocator cf-allocator-ref)
                              (values (:pointer
                                       (:pointer (:const :void))))
                              (num-values cf-index)
                              (call-backs
                               (:pointer (:const cf-bag-call-backs))))
                             :result-type
                             cf-bag-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-create-copy
                              "CFBagCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (the-bag cf-bag-ref))
                             :result-type
                             cf-bag-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-create-mutable
                              "CFBagCreateMutable"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (call-backs
                               (:pointer (:const cf-bag-call-backs))))
                             :result-type
                             cf-mutable-bag-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-create-mutable-copy
                              "CFBagCreateMutableCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (the-bag cf-bag-ref))
                             :result-type
                             cf-mutable-bag-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-get-count "CFBagGetCount" :source)
                             ((the-bag cf-bag-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-get-count-of-value
                              "CFBagGetCountOfValue"
                              :source)
                             ((the-bag cf-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-contains-value
                              "CFBagContainsValue"
                              :source)
                             ((the-bag cf-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-get-value "CFBagGetValue" :source)
                             ((the-bag cf-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             (:pointer (:const :void))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-get-value-if-present
                              "CFBagGetValueIfPresent"
                              :source)
                             ((the-bag cf-bag-ref)
                              (candidate (:pointer (:const :void)))
                              (value
                               (:pointer (:pointer (:const :void)))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-get-values
                              "CFBagGetValues"
                              :source)
                             ((the-bag cf-bag-ref)
                              (values (:pointer
                                       (:pointer (:const :void)))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-apply-function
                              "CFBagApplyFunction"
                              :source)
                             ((the-bag cf-bag-ref)
                              (applier cf-bag-applier-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-add-value "CFBagAddValue" :source)
                             ((the-bag cf-mutable-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-replace-value
                              "CFBagReplaceValue"
                              :source)
                             ((the-bag cf-mutable-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-set-value "CFBagSetValue" :source)
                             ((the-bag cf-mutable-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-remove-value
                              "CFBagRemoveValue"
                              :source)
                             ((the-bag cf-mutable-bag-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bag-remove-all-values
                              "CFBagRemoveAllValues"
                              :source)
                             ((the-bag cf-mutable-bag-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
