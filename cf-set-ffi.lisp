;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-set-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-set-ffi.lisp $
;;; $Id: cf-set-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFSet.h"

(fli:define-c-typedef (cf-set-retain-call-back
                       (:foreign-name "CFSetRetainCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-set-release-call-back
                       (:foreign-name "CFSetReleaseCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        :void)))
(fli:define-c-typedef (cf-set-copy-description-call-back
                       (:foreign-name "CFSetCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-set-equal-call-back
                       (:foreign-name "CFSetEqualCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void))
                         (:pointer (:const :void)))
                        :boolean)))
(fli:define-c-typedef (cf-set-hash-call-back
                       (:foreign-name "CFSetHashCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-hash-code)))
(fli:define-c-typedef (cf-set-call-backs
                       (:foreign-name "CFSetCallBacks"))
                      (:struct
                       (version cf-index)
                       (retain cf-set-retain-call-back)
                       (release cf-set-release-call-back)
                       (copy-description
                        cf-set-copy-description-call-back)
                       (equal cf-set-equal-call-back)
                       (hash cf-set-hash-call-back)))
(fli:define-foreign-variable (k-cf-type-set-call-backs
                              "kCFTypeSetCallBacks"
                              :source)
                             :type
                             (:const cf-set-call-backs))
(fli:define-foreign-variable (k-cf-copy-string-set-call-backs
                              "kCFCopyStringSetCallBacks"
                              :source)
                             :type
                             (:const cf-set-call-backs))
(fli:define-c-typedef (cf-set-applier-function
                       (:foreign-name "CFSetApplierFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)) (:pointer :void))
                        :void)))
(fli:define-c-struct (__cf-set
                      (:foreign-name "__CFSet")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-set-ref (:foreign-name "CFSetRef"))
                      (:pointer (:const (:struct __cf-set))))
(fli:define-c-typedef (cf-mutable-set-ref
                       (:foreign-name "CFMutableSetRef"))
                      (:pointer (:struct __cf-set)))
(fli:define-foreign-function (cf-set-get-type-id
                              "CFSetGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-create "CFSetCreate" :source)
                             ((allocator cf-allocator-ref)
                              (values (:pointer
                                       (:pointer (:const :void))))
                              (num-values cf-index)
                              (call-backs
                               (:pointer (:const cf-set-call-backs))))
                             :result-type
                             cf-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-create-copy
                              "CFSetCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (the-set cf-set-ref))
                             :result-type
                             cf-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-create-mutable
                              "CFSetCreateMutable"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (call-backs
                               (:pointer (:const cf-set-call-backs))))
                             :result-type
                             cf-mutable-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-create-mutable-copy
                              "CFSetCreateMutableCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (the-set cf-set-ref))
                             :result-type
                             cf-mutable-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-get-count "CFSetGetCount" :source)
                             ((the-set cf-set-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-get-count-of-value
                              "CFSetGetCountOfValue"
                              :source)
                             ((the-set cf-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-contains-value
                              "CFSetContainsValue"
                              :source)
                             ((the-set cf-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-get-value "CFSetGetValue" :source)
                             ((the-set cf-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             (:pointer (:const :void))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-get-value-if-present
                              "CFSetGetValueIfPresent"
                              :source)
                             ((the-set cf-set-ref)
                              (candidate (:pointer (:const :void)))
                              (value
                               (:pointer (:pointer (:const :void)))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-get-values
                              "CFSetGetValues"
                              :source)
                             ((the-set cf-set-ref)
                              (values (:pointer
                                       (:pointer (:const :void)))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-apply-function
                              "CFSetApplyFunction"
                              :source)
                             ((the-set cf-set-ref)
                              (applier cf-set-applier-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-add-value "CFSetAddValue" :source)
                             ((the-set cf-mutable-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-replace-value
                              "CFSetReplaceValue"
                              :source)
                             ((the-set cf-mutable-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-set-value "CFSetSetValue" :source)
                             ((the-set cf-mutable-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-remove-value
                              "CFSetRemoveValue"
                              :source)
                             ((the-set cf-mutable-set-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-set-remove-all-values
                              "CFSetRemoveAllValues"
                              :source)
                             ((the-set cf-mutable-set-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)

