;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-locale-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-locale-ffi.lisp $
;;; $Id: cf-locale-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFLocale.h"

(fli:define-c-struct (__cf-locale
                      (:foreign-name "__CFLocale")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-locale-ref (:foreign-name "CFLocaleRef"))
                      (:pointer (:const (:struct __cf-locale))))
(fli:define-foreign-function (cf-locale-get-type-id
                              "CFLocaleGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-get-system
                              "CFLocaleGetSystem"
                              :source)
                             ()
                             :result-type
                             cf-locale-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-copy-current
                              "CFLocaleCopyCurrent"
                              :source)
                             ()
                             :result-type
                             cf-locale-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-create-canonical-locale-identifier-from-string
                              "CFLocaleCreateCanonicalLocaleIdentifierFromString"
                              :source)
                             ((allocator cf-allocator-ref)
                              (locale-identifier cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-create-canonical-locale-identifier-from-script-manager-codes
                              "CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes"
                              :source)
                             ((allocator cf-allocator-ref)
                              (lcode lang-code)
                              (rcode region-code))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-create "CFLocaleCreate" :source)
                             ((allocator cf-allocator-ref)
                              (locale-identifier cf-string-ref))
                             :result-type
                             cf-locale-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-create-copy
                              "CFLocaleCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (locale cf-locale-ref))
                             :result-type
                             cf-locale-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-get-identifier
                              "CFLocaleGetIdentifier"
                              :source)
                             ((locale cf-locale-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-locale-get-value
                              "CFLocaleGetValue"
                              :source)
                             ((locale cf-locale-ref) (key cf-string-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-locale-measurement-system
                              "kCFLocaleMeasurementSystem"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-locale-decimal-separator
                              "kCFLocaleDecimalSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-locale-grouping-separator
                              "kCFLocaleGroupingSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-locale-currency-symbol
                              "kCFLocaleCurrencySymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-locale-currency-code
                              "kCFLocaleCurrencyCode"
                              :source)
                             :type
                             (:const cf-string-ref))

