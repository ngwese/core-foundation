;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-mach-port-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-mach-port-ffi.lisp $
;;; $Id: cf-mach-port-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFMachPort.h"

(fli:define-c-struct (__cf-mach-port
                      (:foreign-name "__CFMachPort")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-mach-port-ref (:foreign-name "CFMachPortRef"))
                      (:pointer (:struct __cf-mach-port)))
(fli:define-c-typedef (cf-mach-port-context
                       (:foreign-name "CFMachPortContext"))
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
(fli:define-c-typedef (cf-mach-port-call-back
                       (:foreign-name "CFMachPortCallBack"))
                      (:pointer
                       (:function
                        (cf-mach-port-ref
                         (:pointer :void)
                         cf-index
                         (:pointer :void))
                        :void)))
(fli:define-c-typedef (cf-mach-port-invalidation-call-back
                       (:foreign-name
                        "CFMachPortInvalidationCallBack"))
                      (:pointer
                       (:function
                        (cf-mach-port-ref (:pointer :void))
                        :void)))
(fli:define-foreign-function (cf-mach-port-get-type-id
                              "CFMachPortGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-create
                              "CFMachPortCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (callout cf-mach-port-call-back)
                              (context (:pointer cf-mach-port-context))
                              (should-free-info (:pointer :boolean)))
                             :result-type
                             cf-mach-port-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-create-with-port
                              "CFMachPortCreateWithPort"
                              :source)
                             ((allocator cf-allocator-ref)
                              (port-num mach-port-t)
                              (callout cf-mach-port-call-back)
                              (context (:pointer cf-mach-port-context))
                              (should-free-info (:pointer :boolean)))
                             :result-type
                             cf-mach-port-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-get-port
                              "CFMachPortGetPort"
                              :source)
                             ((port cf-mach-port-ref))
                             :result-type
                             mach-port-t
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-get-context
                              "CFMachPortGetContext"
                              :source)
                             ((port cf-mach-port-ref)
                              (context (:pointer cf-mach-port-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-invalidate
                              "CFMachPortInvalidate"
                              :source)
                             ((port cf-mach-port-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-is-valid
                              "CFMachPortIsValid"
                              :source)
                             ((port cf-mach-port-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-get-invalidation-call-back
                              "CFMachPortGetInvalidationCallBack"
                              :source)
                             ((port cf-mach-port-ref))
                             :result-type
                             cf-mach-port-invalidation-call-back
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-set-invalidation-call-back
                              "CFMachPortSetInvalidationCallBack"
                              :source)
                             ((port cf-mach-port-ref)
                              (callout
                               cf-mach-port-invalidation-call-back))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-mach-port-create-run-loop-source
                              "CFMachPortCreateRunLoopSource"
                              :source)
                             ((allocator cf-allocator-ref)
                              (port cf-mach-port-ref)
                              (order cf-index))
                             :result-type
                             cf-run-loop-source-ref
                             :language
                             :ansi-c)

