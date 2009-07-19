;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-message-port-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-message-port-ffi.lisp $
;;; $Id: cf-message-port-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFMessagePort.h"

(fli:define-c-struct (__cf-message-port
                      (:foreign-name "__CFMessagePort")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-message-port-ref
                       (:foreign-name "CFMessagePortRef"))
                      (:pointer (:struct __cf-message-port)))
(fli:define-c-typedef (cf-message-port-context
                       (:foreign-name "CFMessagePortContext"))
                      (:struct
                       (version cf-index)
                       (info (:pointer :void))
                       (retain
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          (:pointer (:const :void)))))
                       (release
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          :void)))
                       (copy-description
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          cf-string-ref)))))
(fli:define-c-typedef (cf-message-port-call-back
                       (:foreign-name "CFMessagePortCallBack"))
                      (:pointer
                       (:function
                        (cf-message-port-ref
                         sint32
                         cf-data-ref
                         (:pointer :void))
                        cf-data-ref)))
(fli:define-c-typedef (cf-message-port-invalidation-call-back
                       (:foreign-name
                        "CFMessagePortInvalidationCallBack"))
                      (:pointer
                       (:function
                        (cf-message-port-ref (:pointer :void))
                        :void)))
(fli:define-foreign-function (cf-message-port-get-type-id
                              "CFMessagePortGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-create-local
                              "CFMessagePortCreateLocal"
                              :source)
                             ((allocator cf-allocator-ref)
                              (name cf-string-ref)
                              (callout cf-message-port-call-back)
                              (context
                               (:pointer cf-message-port-context))
                              (should-free-info (:pointer :boolean)))
                             :result-type
                             cf-message-port-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-create-remote
                              "CFMessagePortCreateRemote"
                              :source)
                             ((allocator cf-allocator-ref)
                              (name cf-string-ref))
                             :result-type
                             cf-message-port-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-is-remote
                              "CFMessagePortIsRemote"
                              :source)
                             ((ms cf-message-port-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-get-name
                              "CFMessagePortGetName"
                              :source)
                             ((ms cf-message-port-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-set-name
                              "CFMessagePortSetName"
                              :source)
                             ((ms cf-message-port-ref)
                              (new-name cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-get-context
                              "CFMessagePortGetContext"
                              :source)
                             ((ms cf-message-port-ref)
                              (context
                               (:pointer cf-message-port-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-invalidate
                              "CFMessagePortInvalidate"
                              :source)
                             ((ms cf-message-port-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-is-valid
                              "CFMessagePortIsValid"
                              :source)
                             ((ms cf-message-port-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-get-invalidation-call-back
                              "CFMessagePortGetInvalidationCallBack"
                              :source)
                             ((ms cf-message-port-ref))
                             :result-type
                             cf-message-port-invalidation-call-back
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-set-invalidation-call-back
                              "CFMessagePortSetInvalidationCallBack"
                              :source)
                             ((ms cf-message-port-ref)
                              (callout
                               cf-message-port-invalidation-call-back))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-send-request
                              "CFMessagePortSendRequest"
                              :source)
                             ((remote cf-message-port-ref)
                              (msgid sint32)
                              (data cf-data-ref)
                              (send-timeout cf-time-interval)
                              (rcv-timeout cf-time-interval)
                              (reply-mode cf-string-ref)
                              (return-data (:pointer cf-data-ref)))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-message-port-create-run-loop-source
                              "CFMessagePortCreateRunLoopSource"
                              :source)
                             ((allocator cf-allocator-ref)
                              (local cf-message-port-ref)
                              (order cf-index))
                             :result-type
                             cf-run-loop-source-ref
                             :language
                             :ansi-c)
