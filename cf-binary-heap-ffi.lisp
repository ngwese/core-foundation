;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-binary-heap-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-binary-heap-ffi.lisp $
;;; $Id: cf-binary-heap-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBinaryHeap.h"

(fli:define-c-typedef (cf-binary-heap-compare-context
                       (:foreign-name "CFBinaryHeapCompareContext"))
                      (:struct
                       (version cf-index)
                       (info (:pointer :void))
                       (retain
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          (:pointer (:const :void)))))
                       (release
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          :void)))
                       (copy-description
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          cf-string-ref)))))
(fli:define-c-typedef (cf-binary-heap-call-backs
                       (:foreign-name "CFBinaryHeapCallBacks"))
                      (:struct
                       (version cf-index)
                       (retain
                        (:pointer
                         (:function
                          (cf-allocator-ref (:pointer (:const :void)))
                          (:pointer (:const :void)))))
                       (release
                        (:pointer
                         (:function
                          (cf-allocator-ref (:pointer (:const :void)))
                          :void)))
                       (copy-description
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          cf-string-ref)))
                       (compare
                        (:pointer
                         (:function
                          ((:pointer (:const :void))
                           (:pointer (:const :void))
                           (:pointer :void))
                          cf-comparison-result)))))
(fli:define-foreign-variable (k-cf-string-binary-heap-call-backs
                              "kCFStringBinaryHeapCallBacks"
                              :source)
                             :type
                             (:const cf-binary-heap-call-backs))
(fli:define-c-typedef (cf-binary-heap-applier-function
                       (:foreign-name "CFBinaryHeapApplierFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)) (:pointer :void))
                        :void)))
(fli:define-c-struct (__cf-binary-heap
                      (:foreign-name "__CFBinaryHeap")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-binary-heap-ref
                       (:foreign-name "CFBinaryHeapRef"))
                      (:pointer (:struct __cf-binary-heap)))
(fli:define-foreign-function (cf-binary-heap-get-type-id
                              "CFBinaryHeapGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-create
                              "CFBinaryHeapCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (call-backs
                               (:pointer
                                (:const cf-binary-heap-call-backs)))
                              (compare-context
                               (:pointer
                                (:const
                                 cf-binary-heap-compare-context))))
                             :result-type
                             cf-binary-heap-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-create-copy
                              "CFBinaryHeapCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (heap cf-binary-heap-ref))
                             :result-type
                             cf-binary-heap-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-get-count
                              "CFBinaryHeapGetCount"
                              :source)
                             ((heap cf-binary-heap-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-get-count-of-value
                              "CFBinaryHeapGetCountOfValue"
                              :source)
                             ((heap cf-binary-heap-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-contains-value
                              "CFBinaryHeapContainsValue"
                              :source)
                             ((heap cf-binary-heap-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-get-minimum
                              "CFBinaryHeapGetMinimum"
                              :source)
                             ((heap cf-binary-heap-ref))
                             :result-type
                             (:pointer (:const :void))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-get-minimum-if-present
                              "CFBinaryHeapGetMinimumIfPresent"
                              :source)
                             ((heap cf-binary-heap-ref)
                              (value
                               (:pointer (:pointer (:const :void)))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-get-values
                              "CFBinaryHeapGetValues"
                              :source)
                             ((heap cf-binary-heap-ref)
                              (values (:pointer
                                       (:pointer (:const :void)))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-apply-function
                              "CFBinaryHeapApplyFunction"
                              :source)
                             ((heap cf-binary-heap-ref)
                              (applier cf-binary-heap-applier-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-add-value
                              "CFBinaryHeapAddValue"
                              :source)
                             ((heap cf-binary-heap-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-remove-minimum-value
                              "CFBinaryHeapRemoveMinimumValue"
                              :source)
                             ((heap cf-binary-heap-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-binary-heap-remove-all-values
                              "CFBinaryHeapRemoveAllValues"
                              :source)
                             ((heap cf-binary-heap-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)

