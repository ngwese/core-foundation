;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-socket-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-socket-ffi.lisp $
;;; $Id: cf-socket-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFSocket.h"

(fli:define-c-typedef (cf-socket-native-handle
                       (:foreign-name "CFSocketNativeHandle"))
                      :int)
(fli:define-c-struct (__cf-socket
                      (:foreign-name "__CFSocket")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-socket-ref (:foreign-name "CFSocketRef"))
                      (:pointer (:struct __cf-socket)))
(fli:define-c-typedef (cf-socket-error (:foreign-name "CFSocketError"))
                      (:enum
                       (k-cf-socket-success 0)
                       (k-cf-socket-error -1)
                       (k-cf-socket-timeout -2)))
(fli:define-c-typedef (cf-socket-signature
                       (:foreign-name "CFSocketSignature"))
                      (:struct
                       (protocol-family sint32)
                       (socket-type sint32)
                       (protocol sint32)
                       (address cf-data-ref)))
(fli:define-c-typedef (cf-socket-call-back-type
                       (:foreign-name "CFSocketCallBackType"))
                      (:enum
                       (k-cf-socket-no-call-back 0)
                       (k-cf-socket-read-call-back 1)
                       (k-cf-socket-accept-call-back 2)
                       (k-cf-socket-data-call-back 3)
                       (k-cf-socket-connect-call-back 4)
                       (k-cf-socket-write-call-back 8)))
(fli:define-c-typedef (cf-socket-call-back
                       (:foreign-name "CFSocketCallBack"))
                      (:pointer
                       (:function
                        (cf-socket-ref
                         cf-socket-call-back-type
                         cf-data-ref
                         (:pointer (:const :void))
                         (:pointer :void))
                        :void)))
(fli:define-c-typedef (cf-socket-context
                       (:foreign-name "CFSocketContext"))
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
(fli:define-foreign-function (cf-socket-get-type-id
                              "CFSocketGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-create "CFSocketCreate" :source)
                             ((allocator cf-allocator-ref)
                              (protocol-family sint32)
                              (socket-type sint32)
                              (protocol sint32)
                              (call-back-types cf-option-flags)
                              (callout cf-socket-call-back)
                              (context
                               (:pointer (:const cf-socket-context))))
                             :result-type
                             cf-socket-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-create-with-native
                              "CFSocketCreateWithNative"
                              :source)
                             ((allocator cf-allocator-ref)
                              (sock cf-socket-native-handle)
                              (call-back-types cf-option-flags)
                              (callout cf-socket-call-back)
                              (context
                               (:pointer (:const cf-socket-context))))
                             :result-type
                             cf-socket-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-create-with-socket-signature
                              "CFSocketCreateWithSocketSignature"
                              :source)
                             ((allocator cf-allocator-ref)
                              (signature
                               (:pointer (:const cf-socket-signature)))
                              (call-back-types cf-option-flags)
                              (callout cf-socket-call-back)
                              (context
                               (:pointer (:const cf-socket-context))))
                             :result-type
                             cf-socket-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-create-connected-to-socket-signature
                              "CFSocketCreateConnectedToSocketSignature"
                              :source)
                             ((allocator cf-allocator-ref)
                              (signature
                               (:pointer (:const cf-socket-signature)))
                              (call-back-types cf-option-flags)
                              (callout cf-socket-call-back)
                              (context
                               (:pointer (:const cf-socket-context)))
                              (timeout cf-time-interval))
                             :result-type
                             cf-socket-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-set-address
                              "CFSocketSetAddress"
                              :source)
                             ((s cf-socket-ref) (address cf-data-ref))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-connect-to-address
                              "CFSocketConnectToAddress"
                              :source)
                             ((s cf-socket-ref)
                              (address cf-data-ref)
                              (timeout cf-time-interval))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-invalidate
                              "CFSocketInvalidate"
                              :source)
                             ((s cf-socket-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-is-valid
                              "CFSocketIsValid"
                              :source)
                             ((s cf-socket-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-copy-address
                              "CFSocketCopyAddress"
                              :source)
                             ((s cf-socket-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-copy-peer-address
                              "CFSocketCopyPeerAddress"
                              :source)
                             ((s cf-socket-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-get-context
                              "CFSocketGetContext"
                              :source)
                             ((s cf-socket-ref)
                              (context (:pointer cf-socket-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-get-native
                              "CFSocketGetNative"
                              :source)
                             ((s cf-socket-ref))
                             :result-type
                             cf-socket-native-handle
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-create-run-loop-source
                              "CFSocketCreateRunLoopSource"
                              :source)
                             ((allocator cf-allocator-ref)
                              (s cf-socket-ref)
                              (order cf-index))
                             :result-type
                             cf-run-loop-source-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-get-socket-flags
                              "CFSocketGetSocketFlags"
                              :source)
                             ((s cf-socket-ref))
                             :result-type
                             cf-option-flags
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-set-socket-flags
                              "CFSocketSetSocketFlags"
                              :source)
                             ((s cf-socket-ref) (flags cf-option-flags))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-disable-call-backs
                              "CFSocketDisableCallBacks"
                              :source)
                             ((s cf-socket-ref)
                              (call-back-types cf-option-flags))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-enable-call-backs
                              "CFSocketEnableCallBacks"
                              :source)
                             ((s cf-socket-ref)
                              (call-back-types cf-option-flags))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-send-data
                              "CFSocketSendData"
                              :source)
                             ((s cf-socket-ref)
                              (address cf-data-ref)
                              (data cf-data-ref)
                              (timeout cf-time-interval))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-register-value
                              "CFSocketRegisterValue"
                              :source)
                             ((name-server-signature
                               (:pointer (:const cf-socket-signature)))
                              (timeout cf-time-interval)
                              (name cf-string-ref)
                              (value cf-property-list-ref))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-copy-registered-value
                              "CFSocketCopyRegisteredValue"
                              :source)
                             ((name-server-signature
                               (:pointer (:const cf-socket-signature)))
                              (timeout cf-time-interval)
                              (name cf-string-ref)
                              (value (:pointer cf-property-list-ref))
                              (name-server-address
                               (:pointer cf-data-ref)))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-register-socket-signature
                              "CFSocketRegisterSocketSignature"
                              :source)
                             ((name-server-signature
                               (:pointer (:const cf-socket-signature)))
                              (timeout cf-time-interval)
                              (name cf-string-ref)
                              (signature
                               (:pointer (:const cf-socket-signature))))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-copy-registered-socket-signature
                              "CFSocketCopyRegisteredSocketSignature"
                              :source)
                             ((name-server-signature
                               (:pointer (:const cf-socket-signature)))
                              (timeout cf-time-interval)
                              (name cf-string-ref)
                              (signature (:pointer cf-socket-signature))
                              (name-server-address
                               (:pointer cf-data-ref)))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-unregister
                              "CFSocketUnregister"
                              :source)
                             ((name-server-signature
                               (:pointer (:const cf-socket-signature)))
                              (timeout cf-time-interval)
                              (name cf-string-ref))
                             :result-type
                             cf-socket-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-set-default-name-registry-port-number
                              "CFSocketSetDefaultNameRegistryPortNumber"
                              :source)
                             ((port uint16))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-socket-get-default-name-registry-port-number
                              "CFSocketGetDefaultNameRegistryPortNumber"
                              :source)
                             ()
                             :result-type
                             uint16
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-socket-command-key
                              "kCFSocketCommandKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-socket-name-key
                              "kCFSocketNameKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-socket-value-key
                              "kCFSocketValueKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-socket-result-key
                              "kCFSocketResultKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-socket-error-key
                              "kCFSocketErrorKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-socket-register-command
                              "kCFSocketRegisterCommand"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-socket-retrieve-command
                              "kCFSocketRetrieveCommand"
                              :source)
                             :type
                             (:const cf-string-ref))

