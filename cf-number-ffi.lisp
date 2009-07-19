;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-number-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-number-ffi.lisp $
;;; $Id: cf-number-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumber.h"

(fli:define-c-struct (__cf-boolean
                      (:foreign-name "__CFBoolean")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-boolean-ref (:foreign-name "CFBooleanRef"))
                      (:pointer (:const (:struct __cf-boolean))))
(fli:define-foreign-variable (k-cf-boolean-true
                              "kCFBooleanTrue"
                              :source)
                             :type
                             (:const cf-boolean-ref))
(fli:define-foreign-variable (k-cf-boolean-false
                              "kCFBooleanFalse"
                              :source)
                             :type
                             (:const cf-boolean-ref))
(fli:define-foreign-function (cf-boolean-get-type-id
                              "CFBooleanGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-boolean-get-value
                              "CFBooleanGetValue"
                              :source)
                             ((boolean cf-boolean-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-number-type (:foreign-name "CFNumberType"))
                      (:enum
                       (k-cf-number-sint8-type 1)
                       (k-cf-number-sint16-type 2)
                       (k-cf-number-sint32-type 3)
                       (k-cf-number-sint64-type 4)
                       (k-cf-number-float32-type 5)
                       (k-cf-number-float64-type 6)
                       (k-cf-number-char-type 7)
                       (k-cf-number-short-type 8)
                       (k-cf-number-int-type 9)
                       (k-cf-number-long-type 10)
                       (k-cf-number-long-long-type 11)
                       (k-cf-number-float-type 12)
                       (k-cf-number-double-type 13)
                       (k-cf-number-cf-index-type 14)
                       (k-cf-number-max-type 14)))
(fli:define-c-struct (__cf-number
                      (:foreign-name "__CFNumber")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-number-ref (:foreign-name "CFNumberRef"))
                      (:pointer (:const (:struct __cf-number))))
(fli:define-foreign-variable (k-cf-number-positive-infinity
                              "kCFNumberPositiveInfinity"
                              :source)
                             :type
                             (:const cf-number-ref))
(fli:define-foreign-variable (k-cf-number-negative-infinity
                              "kCFNumberNegativeInfinity"
                              :source)
                             :type
                             (:const cf-number-ref))
(fli:define-foreign-variable (k-cf-number-na-n "kCFNumberNaN" :source)
                             :type
                             (:const cf-number-ref))
(fli:define-foreign-function (cf-number-get-type-id
                              "CFNumberGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-create "CFNumberCreate" :source)
                             ((allocator cf-allocator-ref)
                              (the-type cf-number-type)
                              (value-ptr (:pointer (:const :void))))
                             :result-type
                             cf-number-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-get-type
                              "CFNumberGetType"
                              :source)
                             ((num cf-number-ref))
                             :result-type
                             cf-number-type
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-get-byte-size
                              "CFNumberGetByteSize"
                              :source)
                             ((num cf-number-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-is-float-type
                              "CFNumberIsFloatType"
                              :source)
                             ((num cf-number-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-get-value
                              "CFNumberGetValue"
                              :source)
                             ((num cf-number-ref)
                              (the-type cf-number-type)
                              (value-ptr (:pointer :void)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-compare
                              "CFNumberCompare"
                              :source)
                             ((num cf-number-ref)
                              (other-number cf-number-ref)
                              (context (:pointer :void)))
                             :result-type
                             cf-comparison-result
                             :language
                             :ansi-c)
