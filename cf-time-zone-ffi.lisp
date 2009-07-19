;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-time-zone-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-time-zone-ffi.lisp $
;;; $Id: cf-time-zone-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFTimeZone.h"

(fli:define-foreign-function (cf-time-zone-get-type-id
                              "CFTimeZoneGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-copy-system
                              "CFTimeZoneCopySystem"
                              :source)
                             ()
                             :result-type
                             cf-time-zone-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-reset-system
                              "CFTimeZoneResetSystem"
                              :source)
                             ()
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-copy-default
                              "CFTimeZoneCopyDefault"
                              :source)
                             ()
                             :result-type
                             cf-time-zone-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-set-default
                              "CFTimeZoneSetDefault"
                              :source)
                             ((tz cf-time-zone-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-copy-known-names
                              "CFTimeZoneCopyKnownNames"
                              :source)
                             ()
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-copy-abbreviation-dictionary
                              "CFTimeZoneCopyAbbreviationDictionary"
                              :source)
                             ()
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-set-abbreviation-dictionary
                              "CFTimeZoneSetAbbreviationDictionary"
                              :source)
                             ((dict cf-dictionary-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-create
                              "CFTimeZoneCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (name cf-string-ref)
                              (data cf-data-ref))
                             :result-type
                             cf-time-zone-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-create-with-time-interval-from-gmt
                              "CFTimeZoneCreateWithTimeIntervalFromGMT"
                              :source)
                             ((allocator cf-allocator-ref)
                              (ti cf-time-interval))
                             :result-type
                             cf-time-zone-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-create-with-name
                              "CFTimeZoneCreateWithName"
                              :source)
                             ((allocator cf-allocator-ref)
                              (name cf-string-ref)
                              (try-abbrev :boolean))
                             :result-type
                             cf-time-zone-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-get-name
                              "CFTimeZoneGetName"
                              :source)
                             ((tz cf-time-zone-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-get-data
                              "CFTimeZoneGetData"
                              :source)
                             ((tz cf-time-zone-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-get-seconds-from-gmt
                              "CFTimeZoneGetSecondsFromGMT"
                              :source)
                             ((tz cf-time-zone-ref)
                              (at cf-absolute-time))
                             :result-type
                             cf-time-interval
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-copy-abbreviation
                              "CFTimeZoneCopyAbbreviation"
                              :source)
                             ((tz cf-time-zone-ref)
                              (at cf-absolute-time))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-time-zone-is-daylight-saving-time
                              "CFTimeZoneIsDaylightSavingTime"
                              :source)
                             ((tz cf-time-zone-ref)
                              (at cf-absolute-time))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
