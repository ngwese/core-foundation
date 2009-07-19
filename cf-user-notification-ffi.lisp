;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-user-notification-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-user-notification-ffi.lisp $
;;; $Id: cf-user-notification-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFUserNotification.h"

(fli:define-c-struct (__cf-user-notification
                      (:foreign-name "__CFUserNotification")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-user-notification-ref
                       (:foreign-name "CFUserNotificationRef"))
                      (:pointer (:struct __cf-user-notification)))
(fli:define-c-typedef (cf-user-notification-call-back
                       (:foreign-name "CFUserNotificationCallBack"))
                      (:pointer
                       (:function
                        (cf-user-notification-ref cf-option-flags)
                        :void)))
(fli:define-foreign-function (cf-user-notification-get-type-id
                              "CFUserNotificationGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-create
                              "CFUserNotificationCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (timeout cf-time-interval)
                              (flags cf-option-flags)
                              (error (:pointer sint32))
                              (dictionary cf-dictionary-ref))
                             :result-type
                             cf-user-notification-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-receive-response
                              "CFUserNotificationReceiveResponse"
                              :source)
                             ((user-notification
                               cf-user-notification-ref)
                              (timeout cf-time-interval)
                              (response-flags
                               (:pointer cf-option-flags)))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-get-response-value
                              "CFUserNotificationGetResponseValue"
                              :source)
                             ((user-notification
                               cf-user-notification-ref)
                              (key cf-string-ref)
                              (idx cf-index))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-get-response-dictionary
                              "CFUserNotificationGetResponseDictionary"
                              :source)
                             ((user-notification
                               cf-user-notification-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-update
                              "CFUserNotificationUpdate"
                              :source)
                             ((user-notification
                               cf-user-notification-ref)
                              (timeout cf-time-interval)
                              (flags cf-option-flags)
                              (dictionary cf-dictionary-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-cancel
                              "CFUserNotificationCancel"
                              :source)
                             ((user-notification
                               cf-user-notification-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-create-run-loop-source
                              "CFUserNotificationCreateRunLoopSource"
                              :source)
                             ((allocator cf-allocator-ref)
                              (user-notification
                               cf-user-notification-ref)
                              (callout cf-user-notification-call-back)
                              (order cf-index))
                             :result-type
                             cf-run-loop-source-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-display-notice
                              "CFUserNotificationDisplayNotice"
                              :source)
                             ((timeout cf-time-interval)
                              (flags cf-option-flags)
                              (icon-url cf-url-ref)
                              (sound-url cf-url-ref)
                              (localization-url cf-url-ref)
                              (alert-header cf-string-ref)
                              (alert-message cf-string-ref)
                              (default-button-title cf-string-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-display-alert
                              "CFUserNotificationDisplayAlert"
                              :source)
                             ((timeout cf-time-interval)
                              (flags cf-option-flags)
                              (icon-url cf-url-ref)
                              (sound-url cf-url-ref)
                              (localization-url cf-url-ref)
                              (alert-header cf-string-ref)
                              (alert-message cf-string-ref)
                              (default-button-title cf-string-ref)
                              (alternate-button-title cf-string-ref)
                              (other-button-title cf-string-ref)
                              (response-flags
                               (:pointer cf-option-flags)))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-check-box-checked
                              "CFUserNotificationCheckBoxChecked"
                              :source)
                             ((i cf-index))
                             :result-type
                             cf-option-flags
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-secure-text-field
                              "CFUserNotificationSecureTextField"
                              :source)
                             ((i cf-index))
                             :result-type
                             cf-option-flags
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-user-notification-pop-up-selection
                              "CFUserNotificationPopUpSelection"
                              :source)
                             ((n cf-index))
                             :result-type
                             cf-option-flags
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-user-notification-icon-urlkey
                              "kCFUserNotificationIconURLKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-sound-urlkey
                              "kCFUserNotificationSoundURLKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-localization-urlkey
                              "kCFUserNotificationLocalizationURLKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-alert-header-key
                              "kCFUserNotificationAlertHeaderKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-alert-message-key
                              "kCFUserNotificationAlertMessageKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-default-button-title-key
                              "kCFUserNotificationDefaultButtonTitleKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-alternate-button-title-key
                              "kCFUserNotificationAlternateButtonTitleKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-other-button-title-key
                              "kCFUserNotificationOtherButtonTitleKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-progress-indicator-value-key
                              "kCFUserNotificationProgressIndicatorValueKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-pop-up-titles-key
                              "kCFUserNotificationPopUpTitlesKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-text-field-titles-key
                              "kCFUserNotificationTextFieldTitlesKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-check-box-titles-key
                              "kCFUserNotificationCheckBoxTitlesKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-text-field-values-key
                              "kCFUserNotificationTextFieldValuesKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-user-notification-pop-up-selection-key
                              "kCFUserNotificationPopUpSelectionKey"
                              :source)
                             :type
                             (:const cf-string-ref))

