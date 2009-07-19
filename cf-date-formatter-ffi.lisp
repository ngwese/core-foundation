;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-date-formatter-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-date-formatter-ffi.lisp $
;;; $Id: cf-date-formatter-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFDateFormatter.h"

(fli:define-c-struct (__cf-date-formatter
                      (:foreign-name "__CFDateFormatter")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-date-formatter-ref
                       (:foreign-name "CFDateFormatterRef"))
                      (:pointer (:struct __cf-date-formatter)))
(fli:define-foreign-function (cf-date-formatter-get-type-id
                              "CFDateFormatterGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-date-formatter-style
                       (:foreign-name "CFDateFormatterStyle"))
                      (:enum
                       (k-cf-date-formatter-no-style 0)
                       (k-cf-date-formatter-short-style 1)
                       (k-cf-date-formatter-medium-style 2)
                       (k-cf-date-formatter-long-style 3)
                       (k-cf-date-formatter-full-style 4)))
(fli:define-foreign-function (cf-date-formatter-create
                              "CFDateFormatterCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (locale cf-locale-ref)
                              (date-style cf-date-formatter-style)
                              (time-style cf-date-formatter-style))
                             :result-type
                             cf-date-formatter-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-get-locale
                              "CFDateFormatterGetLocale"
                              :source)
                             ((fmtr cf-date-formatter-ref))
                             :result-type
                             cf-locale-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-get-date-style
                              "CFDateFormatterGetDateStyle"
                              :source)
                             ((fmtr cf-date-formatter-ref))
                             :result-type
                             cf-date-formatter-style
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-get-time-style
                              "CFDateFormatterGetTimeStyle"
                              :source)
                             ((fmtr cf-date-formatter-ref))
                             :result-type
                             cf-date-formatter-style
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-get-format
                              "CFDateFormatterGetFormat"
                              :source)
                             ((fmtr cf-date-formatter-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-set-format
                              "CFDateFormatterSetFormat"
                              :source)
                             ((fmtr cf-date-formatter-ref)
                              (format-string cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-create-string-with-date
                              "CFDateFormatterCreateStringWithDate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fmtr cf-date-formatter-ref)
                              (date cf-date-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-create-string-with-absolute-time
                              "CFDateFormatterCreateStringWithAbsoluteTime"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fmtr cf-date-formatter-ref)
                              (at cf-absolute-time))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-create-date-from-string
                              "CFDateFormatterCreateDateFromString"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fmtr cf-date-formatter-ref)
                              (string cf-string-ref)
                              (rangep (:pointer cf-range)))
                             :result-type
                             cf-date-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-get-absolute-time-from-string
                              "CFDateFormatterGetAbsoluteTimeFromString"
                              :source)
                             ((fmtr cf-date-formatter-ref)
                              (string cf-string-ref)
                              (rangep (:pointer cf-range))
                              (atp (:pointer cf-absolute-time)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-set-property
                              "CFDateFormatterSetProperty"
                              :source)
                             ((fmtr cf-date-formatter-ref)
                              (key cf-string-ref)
                              (value cf-type-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-formatter-copy-property
                              "CFDateFormatterCopyProperty"
                              :source)
                             ((fmtr cf-date-formatter-ref)
                              (key cf-string-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-date-formatter-is-lenient
                              "kCFDateFormatterIsLenient"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-date-formatter-time-zone
                              "kCFDateFormatterTimeZone"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-date-formatter-calendar-name
                              "kCFDateFormatterCalendarName"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-date-formatter-default-format
                              "kCFDateFormatterDefaultFormat"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-gregorian-calendar
                              "kCFGregorianCalendar"
                              :source)
                             :type
                             (:const cf-string-ref))

