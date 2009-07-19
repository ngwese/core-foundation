;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-array-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-array-ffi.lisp $
;;; $Id: cf-array-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFArray.h"

(fli:define-c-typedef (cf-array-retain-call-back
                       (:foreign-name "CFArrayRetainCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-array-release-call-back
                       (:foreign-name "CFArrayReleaseCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        :void)))
(fli:define-c-typedef (cf-array-copy-description-call-back
                       (:foreign-name
                        "CFArrayCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-array-equal-call-back
                       (:foreign-name "CFArrayEqualCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void))
                         (:pointer (:const :void)))
                        :boolean)))
(fli:define-c-typedef (cf-array-call-backs
                       (:foreign-name "CFArrayCallBacks"))
                      (:struct
                       (version cf-index)
                       (retain cf-array-retain-call-back)
                       (release cf-array-release-call-back)
                       (copy-description
                        cf-array-copy-description-call-back)
                       (equal cf-array-equal-call-back)))
(fli:define-foreign-variable (k-cf-type-array-call-backs
                              "kCFTypeArrayCallBacks"
                              :source)
                             :type
                             (:const cf-array-call-backs))
(fli:define-c-typedef (cf-array-applier-function
                       (:foreign-name "CFArrayApplierFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)) (:pointer :void))
                        :void)))
(fli:define-c-struct (__cf-array
                      (:foreign-name "__CFArray")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-array-ref (:foreign-name "CFArrayRef"))
                      (:pointer (:const (:struct __cf-array))))
(fli:define-c-typedef (cf-mutable-array-ref
                       (:foreign-name "CFMutableArrayRef"))
                      (:pointer (:struct __cf-array)))
(fli:define-foreign-function (cf-array-get-type-id
                              "CFArrayGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-create "CFArrayCreate" :source)
                             ((allocator cf-allocator-ref)
                              (values (:pointer
                                       (:pointer (:const :void))))
                              (num-values cf-index)
                              (call-backs
                               (:pointer (:const cf-array-call-backs))))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-create-copy
                              "CFArrayCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (the-array cf-array-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-create-mutable
                              "CFArrayCreateMutable"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (call-backs
                               (:pointer (:const cf-array-call-backs))))
                             :result-type
                             cf-mutable-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-create-mutable-copy
                              "CFArrayCreateMutableCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (the-array cf-array-ref))
                             :result-type
                             cf-mutable-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-get-count
                              "CFArrayGetCount"
                              :source)
                             ((the-array cf-array-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-get-count-of-value
                              "CFArrayGetCountOfValue"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-contains-value
                              "CFArrayContainsValue"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (value (:pointer (:const :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-get-value-at-index
                              "CFArrayGetValueAtIndex"
                              :source)
                             ((the-array cf-array-ref) (idx cf-index))
                             :result-type
                             (:pointer (:const :void))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-get-values
                              "CFArrayGetValues"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (values (:pointer
                                       (:pointer (:const :void)))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-apply-function
                              "CFArrayApplyFunction"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (applier cf-array-applier-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-get-first-index-of-value
                              "CFArrayGetFirstIndexOfValue"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-get-last-index-of-value
                              "CFArrayGetLastIndexOfValue"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-bsearch-values
                              "CFArrayBSearchValues"
                              :source)
                             ((the-array cf-array-ref)
                              (range cf-range)
                              (value (:pointer (:const :void)))
                              (comparator cf-comparator-function)
                              (context (:pointer :void)))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-append-value
                              "CFArrayAppendValue"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-insert-value-at-index
                              "CFArrayInsertValueAtIndex"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (idx cf-index)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-set-value-at-index
                              "CFArraySetValueAtIndex"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (idx cf-index)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-remove-value-at-index
                              "CFArrayRemoveValueAtIndex"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (idx cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-remove-all-values
                              "CFArrayRemoveAllValues"
                              :source)
                             ((the-array cf-mutable-array-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-replace-values
                              "CFArrayReplaceValues"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (range cf-range)
                              (new-values
                               (:pointer (:pointer (:const :void))))
                              (new-count cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-exchange-values-at-indices
                              "CFArrayExchangeValuesAtIndices"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (idx1 cf-index)
                              (idx2 cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-sort-values
                              "CFArraySortValues"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (range cf-range)
                              (comparator cf-comparator-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-array-append-array
                              "CFArrayAppendArray"
                              :source)
                             ((the-array cf-mutable-array-ref)
                              (other-array cf-array-ref)
                              (other-range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)

