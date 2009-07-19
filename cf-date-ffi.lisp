;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-date-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-date-ffi.lisp $
;;; $Id: cf-date-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFDate.h"

(fli:define-c-typedef (cf-time-interval
                       (:foreign-name "CFTimeInterval"))
                      :double)
(fli:define-c-typedef (cf-absolute-time
                       (:foreign-name "CFAbsoluteTime"))
                      cf-time-interval)
(fli:define-foreign-function (cf-absolute-time-get-current
                              "CFAbsoluteTimeGetCurrent"
                              :source)
                             ()
                             :result-type
                             cf-absolute-time
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-absolute-time-interval-since1970
                              "kCFAbsoluteTimeIntervalSince1970"
                              :source)
                             :type
                             (:const cf-time-interval))
(fli:define-foreign-variable (k-cf-absolute-time-interval-since1904
                              "kCFAbsoluteTimeIntervalSince1904"
                              :source)
                             :type
                             (:const cf-time-interval))
(fli:define-c-struct (__cf-date
                      (:foreign-name "__CFDate")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-date-ref (:foreign-name "CFDateRef"))
                      (:pointer (:const (:struct __cf-date))))
(fli:define-foreign-function (cf-date-get-type-id
                              "CFDateGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-create "CFDateCreate" :source)
                             ((allocator cf-allocator-ref)
                              (at cf-absolute-time))
                             :result-type
                             cf-date-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-get-absolute-time
                              "CFDateGetAbsoluteTime"
                              :source)
                             ((the-date cf-date-ref))
                             :result-type
                             cf-absolute-time
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-get-time-interval-since-date
                              "CFDateGetTimeIntervalSinceDate"
                              :source)
                             ((the-date cf-date-ref)
                              (other-date cf-date-ref))
                             :result-type
                             cf-time-interval
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-date-compare "CFDateCompare" :source)
                             ((the-date cf-date-ref)
                              (other-date cf-date-ref)
                              (context (:pointer :void)))
                             :result-type
                             cf-comparison-result
                             :language
                             :ansi-c)
(fli:define-c-struct (__cf-time-zone
                      (:foreign-name "__CFTimeZone")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-time-zone-ref (:foreign-name "CFTimeZoneRef"))
                      (:pointer (:const (:struct __cf-time-zone))))
(fli:define-c-typedef (cf-gregorian-date
                       (:foreign-name "CFGregorianDate"))
                      (:struct
                       (year sint32)
                       (month sint8)
                       (day sint8)
                       (hour sint8)
                       (minute sint8)
                       (second :double)))
(fli:define-c-typedef (cf-gregorian-units
                       (:foreign-name "CFGregorianUnits"))
                      (:struct
                       (years sint32)
                       (months sint32)
                       (days sint32)
                       (hours sint32)
                       (minutes sint32)
                       (seconds :double)))
(fli:define-c-typedef (cf-gregorian-unit-flags
                       (:foreign-name "CFGregorianUnitFlags"))
                      (:enum
                       (k-cf-gregorian-units-years 1)
                       (k-cf-gregorian-units-months 2)
                       (k-cf-gregorian-units-days 4)
                       (k-cf-gregorian-units-hours 8)
                       (k-cf-gregorian-units-minutes 16)
                       (k-cf-gregorian-units-seconds 32)
                       (k-cf-gregorian-all-units 16777215)))
(fli:define-foreign-function (cf-gregorian-date-is-valid
                              "CFGregorianDateIsValid"
                              :source)
                             ((gdate cf-gregorian-date)
                              (unit-flags cf-option-flags))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-gregorian-date-get-absolute-time
                              "CFGregorianDateGetAbsoluteTime"
                              :source)
                             ((gdate cf-gregorian-date)
                              (tz cf-time-zone-ref))
                             :result-type
                             cf-absolute-time
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-absolute-time-get-gregorian-date
                              "CFAbsoluteTimeGetGregorianDate"
                              :source)
                             ((at cf-absolute-time)
                              (tz cf-time-zone-ref))
                             :result-type
                             cf-gregorian-date
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-absolute-time-add-gregorian-units
                              "CFAbsoluteTimeAddGregorianUnits"
                              :source)
                             ((at cf-absolute-time)
                              (tz cf-time-zone-ref)
                              (units cf-gregorian-units))
                             :result-type
                             cf-absolute-time
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-absolute-time-get-difference-as-gregorian-units
                              "CFAbsoluteTimeGetDifferenceAsGregorianUnits"
                              :source)
                             ((at1 cf-absolute-time)
                              (at2 cf-absolute-time)
                              (tz cf-time-zone-ref)
                              (unit-flags cf-option-flags))
                             :result-type
                             cf-gregorian-units
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-absolute-time-get-day-of-week
                              "CFAbsoluteTimeGetDayOfWeek"
                              :source)
                             ((at cf-absolute-time)
                              (tz cf-time-zone-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-absolute-time-get-day-of-year
                              "CFAbsoluteTimeGetDayOfYear"
                              :source)
                             ((at cf-absolute-time)
                              (tz cf-time-zone-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-absolute-time-get-week-of-year
                              "CFAbsoluteTimeGetWeekOfYear"
                              :source)
                             ((at cf-absolute-time)
                              (tz cf-time-zone-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
