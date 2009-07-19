;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-stream-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-stream-ffi.lisp $
;;; $Id: cf-stream-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFStream.h"

(fli:define-c-typedef (cf-stream-status
                       (:foreign-name "CFStreamStatus"))
                      (:enum
                       (k-cf-stream-status-not-open 0)
                       (k-cf-stream-status-opening 1)
                       (k-cf-stream-status-open 2)
                       (k-cf-stream-status-reading 3)
                       (k-cf-stream-status-writing 4)
                       (k-cf-stream-status-at-end 5)
                       (k-cf-stream-status-closed 6)
                       (k-cf-stream-status-error 7)))
(fli:define-c-typedef (cf-stream-error-domain
                       (:foreign-name "CFStreamErrorDomain"))
                      (:enum
                       (k-cf-stream-error-domain-custom -1)
                       (k-cf-stream-error-domain-posix 1)
                       (k-cf-stream-error-domain-mac-osstatus 2)))
(fli:define-c-typedef (cf-stream-error (:foreign-name "CFStreamError"))
                      (:struct
                       (domain cf-stream-error-domain)
                       (error sint32)))
(fli:define-c-typedef (cf-stream-event-type
                       (:foreign-name "CFStreamEventType"))
                      (:enum
                       (k-cf-stream-event-none 0)
                       (k-cf-stream-event-open-completed 1)
                       (k-cf-stream-event-has-bytes-available 2)
                       (k-cf-stream-event-can-accept-bytes 4)
                       (k-cf-stream-event-error-occurred 8)
                       (k-cf-stream-event-end-encountered 16)))
(fli:define-c-typedef (cf-stream-client-context
                       (:foreign-name "CFStreamClientContext"))
                      (:struct
                       (version cf-index)
                       (info (:pointer :void))
                       (retain
                        (:pointer
                         (:function
                          ((:pointer :void))
                          (:pointer :void))))
                       (release
                        (:pointer
                         (:function ((:pointer :void)) :void)))
                       (copy-description
                        (:pointer
                         (:function ((:pointer :void)) cf-string-ref)))))
(fli:define-c-struct (__cf-read-stream
                      (:foreign-name "__CFReadStream")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-read-stream-ref
                       (:foreign-name "CFReadStreamRef"))
                      (:pointer (:struct __cf-read-stream)))
(fli:define-c-struct (__cf-write-stream
                      (:foreign-name "__CFWriteStream")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-write-stream-ref
                       (:foreign-name "CFWriteStreamRef"))
                      (:pointer (:struct __cf-write-stream)))
(fli:define-c-typedef (cf-read-stream-client-call-back
                       (:foreign-name "CFReadStreamClientCallBack"))
                      (:pointer
                       (:function
                        (cf-read-stream-ref
                         cf-stream-event-type
                         (:pointer :void))
                        :void)))
(fli:define-c-typedef (cf-write-stream-client-call-back
                       (:foreign-name "CFWriteStreamClientCallBack"))
                      (:pointer
                       (:function
                        (cf-write-stream-ref
                         cf-stream-event-type
                         (:pointer :void))
                        :void)))
(fli:define-foreign-function (cf-read-stream-get-type-id
                              "CFReadStreamGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-get-type-id
                              "CFWriteStreamGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-stream-property-data-written
                              "kCFStreamPropertyDataWritten"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-function (cf-read-stream-create-with-bytes-no-copy
                              "CFReadStreamCreateWithBytesNoCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (bytes (:pointer (:const uint8)))
                              (length cf-index)
                              (bytes-deallocator cf-allocator-ref))
                             :result-type
                             cf-read-stream-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-create-with-buffer
                              "CFWriteStreamCreateWithBuffer"
                              :source)
                             ((alloc cf-allocator-ref)
                              (buffer (:pointer uint8))
                              (buffer-capacity cf-index))
                             :result-type
                             cf-write-stream-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-create-with-allocated-buffers
                              "CFWriteStreamCreateWithAllocatedBuffers"
                              :source)
                             ((alloc cf-allocator-ref)
                              (buffer-allocator cf-allocator-ref))
                             :result-type
                             cf-write-stream-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-create-with-file
                              "CFReadStreamCreateWithFile"
                              :source)
                             ((alloc cf-allocator-ref)
                              (file-url cf-url-ref))
                             :result-type
                             cf-read-stream-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-create-with-file
                              "CFWriteStreamCreateWithFile"
                              :source)
                             ((alloc cf-allocator-ref)
                              (file-url cf-url-ref))
                             :result-type
                             cf-write-stream-ref
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-stream-property-append-to-file
                              "kCFStreamPropertyAppendToFile"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-stream-property-file-current-offset
                              "kCFStreamPropertyFileCurrentOffset"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-stream-property-socket-native-handle
                              "kCFStreamPropertySocketNativeHandle"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-stream-property-socket-remote-host-name
                              "kCFStreamPropertySocketRemoteHostName"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-stream-property-socket-remote-port-number
                              "kCFStreamPropertySocketRemotePortNumber"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-function (cf-stream-create-pair-with-socket
                              "CFStreamCreatePairWithSocket"
                              :source)
                             ((alloc cf-allocator-ref)
                              (sock cf-socket-native-handle)
                              (read-stream
                               (:pointer cf-read-stream-ref))
                              (write-stream
                               (:pointer cf-write-stream-ref)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-stream-create-pair-with-socket-to-host
                              "CFStreamCreatePairWithSocketToHost"
                              :source)
                             ((alloc cf-allocator-ref)
                              (host cf-string-ref)
                              (port uint32)
                              (read-stream
                               (:pointer cf-read-stream-ref))
                              (write-stream
                               (:pointer cf-write-stream-ref)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-stream-create-pair-with-peer-socket-signature
                              "CFStreamCreatePairWithPeerSocketSignature"
                              :source)
                             ((alloc cf-allocator-ref)
                              (signature
                               (:pointer (:const cf-socket-signature)))
                              (read-stream
                               (:pointer cf-read-stream-ref))
                              (write-stream
                               (:pointer cf-write-stream-ref)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-get-status
                              "CFReadStreamGetStatus"
                              :source)
                             ((stream cf-read-stream-ref))
                             :result-type
                             cf-stream-status
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-get-status
                              "CFWriteStreamGetStatus"
                              :source)
                             ((stream cf-write-stream-ref))
                             :result-type
                             cf-stream-status
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-get-error
                              "CFReadStreamGetError"
                              :source)
                             ((stream cf-read-stream-ref))
                             :result-type
                             cf-stream-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-get-error
                              "CFWriteStreamGetError"
                              :source)
                             ((stream cf-write-stream-ref))
                             :result-type
                             cf-stream-error
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-open
                              "CFReadStreamOpen"
                              :source)
                             ((stream cf-read-stream-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-open
                              "CFWriteStreamOpen"
                              :source)
                             ((stream cf-write-stream-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-close
                              "CFReadStreamClose"
                              :source)
                             ((stream cf-read-stream-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-close
                              "CFWriteStreamClose"
                              :source)
                             ((stream cf-write-stream-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-has-bytes-available
                              "CFReadStreamHasBytesAvailable"
                              :source)
                             ((stream cf-read-stream-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-read
                              "CFReadStreamRead"
                              :source)
                             ((stream cf-read-stream-ref)
                              (buffer (:pointer uint8))
                              (buffer-length cf-index))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-get-buffer
                              "CFReadStreamGetBuffer"
                              :source)
                             ((stream cf-read-stream-ref)
                              (max-bytes-to-read cf-index)
                              (num-bytes-read (:pointer cf-index)))
                             :result-type
                             (:pointer (:const uint8))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-can-accept-bytes
                              "CFWriteStreamCanAcceptBytes"
                              :source)
                             ((stream cf-write-stream-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-write
                              "CFWriteStreamWrite"
                              :source)
                             ((stream cf-write-stream-ref)
                              (buffer (:pointer (:const uint8)))
                              (buffer-length cf-index))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-copy-property
                              "CFReadStreamCopyProperty"
                              :source)
                             ((stream cf-read-stream-ref)
                              (property-name cf-string-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-copy-property
                              "CFWriteStreamCopyProperty"
                              :source)
                             ((stream cf-write-stream-ref)
                              (property-name cf-string-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-set-property
                              "CFReadStreamSetProperty"
                              :source)
                             ((stream cf-read-stream-ref)
                              (property-name cf-string-ref)
                              (property-value cf-type-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-set-property
                              "CFWriteStreamSetProperty"
                              :source)
                             ((stream cf-write-stream-ref)
                              (property-name cf-string-ref)
                              (property-value cf-type-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-set-client
                              "CFReadStreamSetClient"
                              :source)
                             ((stream cf-read-stream-ref)
                              (stream-events cf-option-flags)
                              (client-cb
                               cf-read-stream-client-call-back)
                              (client-context
                               (:pointer cf-stream-client-context)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-set-client
                              "CFWriteStreamSetClient"
                              :source)
                             ((stream cf-write-stream-ref)
                              (stream-events cf-option-flags)
                              (client-cb
                               cf-write-stream-client-call-back)
                              (client-context
                               (:pointer cf-stream-client-context)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-schedule-with-run-loop
                              "CFReadStreamScheduleWithRunLoop"
                              :source)
                             ((stream cf-read-stream-ref)
                              (run-loop cf-run-loop-ref)
                              (run-loop-mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-schedule-with-run-loop
                              "CFWriteStreamScheduleWithRunLoop"
                              :source)
                             ((stream cf-write-stream-ref)
                              (run-loop cf-run-loop-ref)
                              (run-loop-mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-read-stream-unschedule-from-run-loop
                              "CFReadStreamUnscheduleFromRunLoop"
                              :source)
                             ((stream cf-read-stream-ref)
                              (run-loop cf-run-loop-ref)
                              (run-loop-mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-write-stream-unschedule-from-run-loop
                              "CFWriteStreamUnscheduleFromRunLoop"
                              :source)
                             ((stream cf-write-stream-ref)
                              (run-loop cf-run-loop-ref)
                              (run-loop-mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
