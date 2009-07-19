;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-preferences-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-preferences-ffi.lisp $
;;; $Id: cf-preferences-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFPreferences.h"

(fli:define-foreign-variable (k-cf-preferences-any-application
                              "kCFPreferencesAnyApplication"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-preferences-current-application
                              "kCFPreferencesCurrentApplication"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-preferences-any-host
                              "kCFPreferencesAnyHost"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-preferences-current-host
                              "kCFPreferencesCurrentHost"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-preferences-any-user
                              "kCFPreferencesAnyUser"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-preferences-current-user
                              "kCFPreferencesCurrentUser"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-function (cf-preferences-copy-app-value
                              "CFPreferencesCopyAppValue"
                              :source)
                             ((key cf-string-ref)
                              (application-id cf-string-ref))
                             :result-type
                             cf-property-list-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-get-app-boolean-value
                              "CFPreferencesGetAppBooleanValue"
                              :source)
                             ((key cf-string-ref)
                              (application-id cf-string-ref)
                              (key-exists-and-has-valid-format
                               (:pointer :boolean)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-get-app-integer-value
                              "CFPreferencesGetAppIntegerValue"
                              :source)
                             ((key cf-string-ref)
                              (application-id cf-string-ref)
                              (key-exists-and-has-valid-format
                               (:pointer :boolean)))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-set-app-value
                              "CFPreferencesSetAppValue"
                              :source)
                             ((key cf-string-ref)
                              (value cf-property-list-ref)
                              (application-id cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-add-suite-preferences-to-app
                              "CFPreferencesAddSuitePreferencesToApp"
                              :source)
                             ((application-id cf-string-ref)
                              (suite-id cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-remove-suite-preferences-from-app
                              "CFPreferencesRemoveSuitePreferencesFromApp"
                              :source)
                             ((application-id cf-string-ref)
                              (suite-id cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-app-synchronize
                              "CFPreferencesAppSynchronize"
                              :source)
                             ((application-id cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-copy-value
                              "CFPreferencesCopyValue"
                              :source)
                             ((key cf-string-ref)
                              (application-id cf-string-ref)
                              (user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             cf-property-list-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-copy-multiple
                              "CFPreferencesCopyMultiple"
                              :source)
                             ((keys-to-fetch cf-array-ref)
                              (application-id cf-string-ref)
                              (user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-set-value
                              "CFPreferencesSetValue"
                              :source)
                             ((key cf-string-ref)
                              (value cf-property-list-ref)
                              (application-id cf-string-ref)
                              (user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-set-multiple
                              "CFPreferencesSetMultiple"
                              :source)
                             ((keys-to-set cf-dictionary-ref)
                              (keys-to-remove cf-array-ref)
                              (application-id cf-string-ref)
                              (user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-synchronize
                              "CFPreferencesSynchronize"
                              :source)
                             ((application-id cf-string-ref)
                              (user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-copy-application-list
                              "CFPreferencesCopyApplicationList"
                              :source)
                             ((user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-copy-key-list
                              "CFPreferencesCopyKeyList"
                              :source)
                             ((application-id cf-string-ref)
                              (user-name cf-string-ref)
                              (host-name cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-preferences-app-value-is-forced
                              "CFPreferencesAppValueIsForced"
                              :source)
                             ((key cf-string-ref)
                              (application-id cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)

