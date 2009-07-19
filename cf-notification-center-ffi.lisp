;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-notification-center-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-notification-center-ffi.lisp $
;;; $Id: cf-notification-center-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFNotificationCenter.h"

(fli:define-c-struct (__cf-notification-center
                      (:foreign-name "__CFNotificationCenter")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-notification-center-ref
                       (:foreign-name "CFNotificationCenterRef"))
                      (:pointer (:struct __cf-notification-center)))
(fli:define-c-typedef (cf-notification-callback
                       (:foreign-name "CFNotificationCallback"))
                      (:pointer
                       (:function
                        (cf-notification-center-ref
                         (:pointer :void)
                         cf-string-ref
                         (:pointer (:const :void))
                         cf-dictionary-ref)
                        :void)))
(fli:define-c-typedef (cf-notification-suspension-behavior
                       (:foreign-name
                        "CFNotificationSuspensionBehavior"))
                      (:enum
                       (cf-notification-suspension-behavior-drop 1)
                       (cf-notification-suspension-behavior-coalesce 2)
                       (cf-notification-suspension-behavior-hold 3)
                       (cf-notification-suspension-behavior-deliver-immediately
                        4)))
(fli:define-foreign-function (cf-notification-center-get-type-id
                              "CFNotificationCenterGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-notification-center-get-distributed-center
                              "CFNotificationCenterGetDistributedCenter"
                              :source)
                             ()
                             :result-type
                             cf-notification-center-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-notification-center-add-observer
                              "CFNotificationCenterAddObserver"
                              :source)
                             ((center cf-notification-center-ref)
                              (observer (:pointer (:const :void)))
                              (call-back cf-notification-callback)
                              (name cf-string-ref)
                              (object (:pointer (:const :void)))
                              (suspension-behavior
                               cf-notification-suspension-behavior))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-notification-center-remove-observer
                              "CFNotificationCenterRemoveObserver"
                              :source)
                             ((center cf-notification-center-ref)
                              (observer (:pointer (:const :void)))
                              (name cf-string-ref)
                              (object (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-notification-center-remove-every-observer
                              "CFNotificationCenterRemoveEveryObserver"
                              :source)
                             ((center cf-notification-center-ref)
                              (observer (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-notification-center-post-notification
                              "CFNotificationCenterPostNotification"
                              :source)
                             ((center cf-notification-center-ref)
                              (name cf-string-ref)
                              (object (:pointer (:const :void)))
                              (user-info cf-dictionary-ref)
                              (deliver-immediately :boolean))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-notification-center-post-notification-with-options
                              "CFNotificationCenterPostNotificationWithOptions"
                              :source)
                             ((center cf-notification-center-ref)
                              (name cf-string-ref)
                              (object (:pointer (:const :void)))
                              (user-info cf-dictionary-ref)
                              (options cf-option-flags))
                             :result-type
                             :void
                             :language
                             :ansi-c)

