;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-base-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-base-ffi.lisp $
;;; $Id: cf-base-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBase.h"

(fli:define-foreign-variable (k-cf-core-foundation-version-number
                              "kCFCoreFoundationVersionNumber"
                              :source)
                             :type
                             :double)
(fli:define-c-typedef (cf-type-id (:foreign-name "CFTypeID")) uint32)
(fli:define-c-typedef (cf-option-flags (:foreign-name "CFOptionFlags"))
                      uint32)
(fli:define-c-typedef (cf-hash-code (:foreign-name "CFHashCode")) uint32)
(fli:define-c-typedef (cf-index (:foreign-name "CFIndex")) sint32)
(fli:define-c-typedef (cf-type-ref (:foreign-name "CFTypeRef"))
                      (:pointer (:const :void)))
(fli:define-c-struct (__cf-string
                      (:foreign-name "__CFString")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-string-ref (:foreign-name "CFStringRef"))
                      (:pointer (:const (:struct __cf-string))))
(fli:define-c-typedef (cf-mutable-string-ref
                       (:foreign-name "CFMutableStringRef"))
                      (:pointer (:struct __cf-string)))
(fli:define-c-typedef (cf-property-list-ref
                       (:foreign-name "CFPropertyListRef"))
                      cf-type-ref)
(fli:define-c-typedef (cf-comparison-result
                       (:foreign-name "CFComparisonResult"))
                      (:enum
                       (k-cf-compare-less-than -1)
                       (k-cf-compare-equal-to 0)
                       (k-cf-compare-greater-than 1)))
(fli:define-c-typedef (cf-comparator-function
                       (:foreign-name "CFComparatorFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void))
                         (:pointer (:const :void))
                         (:pointer :void))
                        cf-comparison-result)))
(fli:define-c-typedef (cf-range (:foreign-name "CFRange"))
                      (:struct (location cf-index) (length cf-index)))
(fli:define-foreign-function (cf-range-make "CFRangeMake" :source)
                             ((loc cf-index) (len cf-index))
                             :result-type
                             cf-range
                             :language
                             :ansi-c)
(fli:define-foreign-function (__cf-range-make "__CFRangeMake" :source)
                             ((loc cf-index) (len cf-index))
                             :result-type
                             cf-range
                             :language
                             :ansi-c)
(fli:define-c-struct (__cf-null
                      (:foreign-name "__CFNull")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-null-ref (:foreign-name "CFNullRef"))
                      (:pointer (:const (:struct __cf-null))))
(fli:define-foreign-function (cf-null-get-type-id
                              "CFNullGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-null "kCFNull" :source)
                             :type
                             (:const cf-null-ref))
(fli:define-c-struct (__cf-allocator
                      (:foreign-name "__CFAllocator")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-allocator-ref
                       (:foreign-name "CFAllocatorRef"))
                      (:pointer (:const (:struct __cf-allocator))))
(fli:define-foreign-variable (k-cf-allocator-default
                              "kCFAllocatorDefault"
                              :source)
                             :type
                             (:const cf-allocator-ref))
(fli:define-foreign-variable (k-cf-allocator-system-default
                              "kCFAllocatorSystemDefault"
                              :source)
                             :type
                             (:const cf-allocator-ref))
(fli:define-foreign-variable (k-cf-allocator-malloc
                              "kCFAllocatorMalloc"
                              :source)
                             :type
                             (:const cf-allocator-ref))
(fli:define-foreign-variable (k-cf-allocator-null
                              "kCFAllocatorNull"
                              :source)
                             :type
                             (:const cf-allocator-ref))
(fli:define-foreign-variable (k-cf-allocator-use-context
                              "kCFAllocatorUseContext"
                              :source)
                             :type
                             (:const cf-allocator-ref))
(fli:define-c-typedef (cf-allocator-retain-call-back
                       (:foreign-name "CFAllocatorRetainCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-allocator-release-call-back
                       (:foreign-name "CFAllocatorReleaseCallBack"))
                      (:pointer
                       (:function ((:pointer (:const :void))) :void)))
(fli:define-c-typedef (cf-allocator-copy-description-call-back
                       (:foreign-name
                        "CFAllocatorCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-allocator-allocate-call-back
                       (:foreign-name "CFAllocatorAllocateCallBack"))
                      (:pointer
                       (:function
                        (cf-index cf-option-flags (:pointer :void))
                        (:pointer :void))))
(fli:define-c-typedef (cf-allocator-reallocate-call-back
                       (:foreign-name "CFAllocatorReallocateCallBack"))
                      (:pointer
                       (:function
                        ((:pointer :void)
                         cf-index
                         cf-option-flags
                         (:pointer :void))
                        (:pointer :void))))
(fli:define-c-typedef (cf-allocator-deallocate-call-back
                       (:foreign-name "CFAllocatorDeallocateCallBack"))
                      (:pointer
                       (:function
                        ((:pointer :void) (:pointer :void))
                        :void)))
(fli:define-c-typedef (cf-allocator-preferred-size-call-back
                       (:foreign-name
                        "CFAllocatorPreferredSizeCallBack"))
                      (:pointer
                       (:function
                        (cf-index cf-option-flags (:pointer :void))
                        cf-index)))
(fli:define-c-typedef (cf-allocator-context
                       (:foreign-name "CFAllocatorContext"))
                      (:struct
                       (version cf-index)
                       (info (:pointer :void))
                       (retain cf-allocator-retain-call-back)
                       (release cf-allocator-release-call-back)
                       (copy-description
                        cf-allocator-copy-description-call-back)
                       (allocate cf-allocator-allocate-call-back)
                       (reallocate cf-allocator-reallocate-call-back)
                       (deallocate cf-allocator-deallocate-call-back)
                       (preferred-size
                        cf-allocator-preferred-size-call-back)))
(fli:define-foreign-function (cf-allocator-get-type-id
                              "CFAllocatorGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-set-default
                              "CFAllocatorSetDefault"
                              :source)
                             ((allocator cf-allocator-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-get-default
                              "CFAllocatorGetDefault"
                              :source)
                             ()
                             :result-type
                             cf-allocator-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-create
                              "CFAllocatorCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (context (:pointer cf-allocator-context)))
                             :result-type
                             cf-allocator-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-allocate
                              "CFAllocatorAllocate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (size cf-index)
                              (hint cf-option-flags))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-reallocate
                              "CFAllocatorReallocate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (ptr (:pointer :void))
                              (newsize cf-index)
                              (hint cf-option-flags))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-deallocate
                              "CFAllocatorDeallocate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (ptr (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-get-preferred-size-for-size
                              "CFAllocatorGetPreferredSizeForSize"
                              :source)
                             ((allocator cf-allocator-ref)
                              (size cf-index)
                              (hint cf-option-flags))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-allocator-get-context
                              "CFAllocatorGetContext"
                              :source)
                             ((allocator cf-allocator-ref)
                              (context (:pointer cf-allocator-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-get-type-id-imp "CFGetTypeID" :source)
                             ((cf cf-type-ref))
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-copy-type-id-description-imp
                              "CFCopyTypeIDDescription"
                              :source)
                             ((type-id cf-type-id))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-retain-imp "CFRetain" :source)
                             ((cf1 cf-type-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-release-imp "CFRelease" :source)
                             ((cf cf-type-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-get-retain-count-imp
                              "CFGetRetainCount"
                              :source)
                             ((cf1 cf-type-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-equal-imp "CFEqual" :source)
                             ((cf1 cf-type-ref) (cf2 cf-type-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-hash-imp "CFHash" :source)
                             ((cf cf-type-ref))
                             :result-type
                             cf-hash-code
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-copy-description-imp
                              "CFCopyDescription"
                              :source)
                             ((cf cf-type-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-get-allocator-imp "CFGetAllocator" :source)
                             ((cf cf-type-ref))
                             :result-type
                             cf-allocator-ref
                             :language
                             :ansi-c)
