;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-number-formatter-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-number-formatter-ffi.lisp $
;;; $Id: cf-number-formatter-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFNumberFormatter.h"

(fli:define-c-struct (__cf-number-formatter
                      (:foreign-name "__CFNumberFormatter")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-number-formatter-ref
                       (:foreign-name "CFNumberFormatterRef"))
                      (:pointer (:struct __cf-number-formatter)))
(fli:define-foreign-function (cf-number-formatter-get-type-id
                              "CFNumberFormatterGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-number-formatter-style
                       (:foreign-name "CFNumberFormatterStyle"))
                      (:enum
                       (k-cf-number-formatter-no-style 0)
                       (k-cf-number-formatter-decimal-style 1)
                       (k-cf-number-formatter-currency-style 2)
                       (k-cf-number-formatter-percent-style 3)
                       (k-cf-number-formatter-scientific-style 4)))
(fli:define-foreign-function (cf-number-formatter-create
                              "CFNumberFormatterCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (locale cf-locale-ref)
                              (style cf-number-formatter-style))
                             :result-type
                             cf-number-formatter-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-get-locale
                              "CFNumberFormatterGetLocale"
                              :source)
                             ((fmtr cf-number-formatter-ref))
                             :result-type
                             cf-locale-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-get-style
                              "CFNumberFormatterGetStyle"
                              :source)
                             ((fmtr cf-number-formatter-ref))
                             :result-type
                             cf-number-formatter-style
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-get-format
                              "CFNumberFormatterGetFormat"
                              :source)
                             ((fmtr cf-number-formatter-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-set-format
                              "CFNumberFormatterSetFormat"
                              :source)
                             ((fmtr cf-number-formatter-ref)
                              (format-string cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-create-string-with-number
                              "CFNumberFormatterCreateStringWithNumber"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fmtr cf-number-formatter-ref)
                              (num cf-number-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-create-string-with-value
                              "CFNumberFormatterCreateStringWithValue"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fmtr cf-number-formatter-ref)
                              (num-type cf-number-type)
                              (value-ptr (:pointer (:const :void))))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-number-formatter-option-flags
                       (:foreign-name "CFNumberFormatterOptionFlags"))
                      (:enum
                       (k-cf-number-formatter-parse-integers-only 1)))
(fli:define-foreign-function (cf-number-formatter-create-number-from-string
                              "CFNumberFormatterCreateNumberFromString"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fmtr cf-number-formatter-ref)
                              (string cf-string-ref)
                              (rangep (:pointer cf-range))
                              (options cf-option-flags))
                             :result-type
                             cf-number-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-get-value-from-string
                              "CFNumberFormatterGetValueFromString"
                              :source)
                             ((fmtr cf-number-formatter-ref)
                              (string cf-string-ref)
                              (rangep (:pointer cf-range))
                              (num-type cf-number-type)
                              (value-ptr (:pointer :void)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-set-property
                              "CFNumberFormatterSetProperty"
                              :source)
                             ((fmtr cf-number-formatter-ref)
                              (key cf-string-ref)
                              (value cf-type-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-number-formatter-copy-property
                              "CFNumberFormatterCopyProperty"
                              :source)
                             ((fmtr cf-number-formatter-ref)
                              (key cf-string-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-number-formatter-currency-code
                              "kCFNumberFormatterCurrencyCode"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-decimal-separator
                              "kCFNumberFormatterDecimalSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-currency-decimal-separator
                              "kCFNumberFormatterCurrencyDecimalSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-always-show-decimal-separator
                              "kCFNumberFormatterAlwaysShowDecimalSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-grouping-separator
                              "kCFNumberFormatterGroupingSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-use-grouping-separator
                              "kCFNumberFormatterUseGroupingSeparator"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-percent-symbol
                              "kCFNumberFormatterPercentSymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-zero-symbol
                              "kCFNumberFormatterZeroSymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-na-nsymbol
                              "kCFNumberFormatterNaNSymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-infinity-symbol
                              "kCFNumberFormatterInfinitySymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-minus-sign
                              "kCFNumberFormatterMinusSign"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-plus-sign
                              "kCFNumberFormatterPlusSign"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-currency-symbol
                              "kCFNumberFormatterCurrencySymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-exponent-symbol
                              "kCFNumberFormatterExponentSymbol"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-min-integer-digits
                              "kCFNumberFormatterMinIntegerDigits"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-max-integer-digits
                              "kCFNumberFormatterMaxIntegerDigits"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-min-fraction-digits
                              "kCFNumberFormatterMinFractionDigits"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-max-fraction-digits
                              "kCFNumberFormatterMaxFractionDigits"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-grouping-size
                              "kCFNumberFormatterGroupingSize"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-secondary-grouping-size
                              "kCFNumberFormatterSecondaryGroupingSize"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-rounding-mode
                              "kCFNumberFormatterRoundingMode"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-rounding-increment
                              "kCFNumberFormatterRoundingIncrement"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-format-width
                              "kCFNumberFormatterFormatWidth"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-padding-position
                              "kCFNumberFormatterPaddingPosition"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-padding-character
                              "kCFNumberFormatterPaddingCharacter"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-number-formatter-default-format
                              "kCFNumberFormatterDefaultFormat"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-c-typedef (cf-number-formatter-rounding-mode
                       (:foreign-name "CFNumberFormatterRoundingMode"))
                      (:enum
                       (k-cf-number-formatter-round-ceiling 0)
                       (k-cf-number-formatter-round-floor 1)
                       (k-cf-number-formatter-round-down 2)
                       (k-cf-number-formatter-round-up 3)
                       (k-cf-number-formatter-round-half-even 4)
                       (k-cf-number-formatter-round-half-down 5)
                       (k-cf-number-formatter-round-half-up 6)))
(fli:define-c-typedef (cf-number-formatter-pad-position
                       (:foreign-name "CFNumberFormatterPadPosition"))
                      (:enum
                       (k-cf-number-formatter-pad-before-prefix 0)
                       (k-cf-number-formatter-pad-after-prefix 1)
                       (k-cf-number-formatter-pad-before-suffix 2)
                       (k-cf-number-formatter-pad-after-suffix 3)))
(fli:define-foreign-function (cf-number-formatter-get-decimal-info-for-currency-code
                              "CFNumberFormatterGetDecimalInfoForCurrencyCode"
                              :source)
                             ((currency-code cf-string-ref)
                              (default-fraction-digits
                               (:pointer int32-t))
                              (rounding-increment (:pointer :double)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)

