;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-run-loop-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-run-loop-ffi.lisp $
;;; $Id: cf-run-loop-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/usr/include/mach/ppc/boolean.h"

(fli:define-c-typedef (boolean-t (:foreign-name "boolean_t")) :int)

;;; Derived from file : "/usr/include/mach/ppc/vm_types.h"

(fli:define-c-typedef (natural-t (:foreign-name "natural_t"))
                      (:unsigned :int))
(fli:define-c-typedef (integer-t (:foreign-name "integer_t")) :int)
(fli:define-c-typedef (vm-offset-t (:foreign-name "vm_offset_t"))
                      natural-t)
(fli:define-c-typedef (vm-size-t (:foreign-name "vm_size_t")) natural-t)

;;; Derived from file : "/usr/include/mach/port.h"

(fli:define-c-typedef (port-name-t (:foreign-name "port_name_t"))
                      natural-t)
(fli:define-c-typedef (port-name-array-t
                       (:foreign-name "port_name_array_t"))
                      (:pointer port-name-t))
(fli:define-c-typedef (port-t (:foreign-name "port_t")) port-name-t)
(fli:define-c-typedef (mach-port-t (:foreign-name "mach_port_t"))
                      port-t)
(fli:define-c-typedef (mach-port-array-t
                       (:foreign-name "mach_port_array_t"))
                      (:pointer port-t))
(fli:define-c-typedef (mach-port-name-t
                       (:foreign-name "mach_port_name_t"))
                      port-name-t)
(fli:define-c-typedef (mach-port-name-array-t
                       (:foreign-name "mach_port_name_array_t"))
                      (:pointer mach-port-name-t))
(fli:define-c-typedef (mach-port-right-t
                       (:foreign-name "mach_port_right_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-type-t
                       (:foreign-name "mach_port_type_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-type-array-t
                       (:foreign-name "mach_port_type_array_t"))
                      (:pointer mach-port-type-t))
(fli:define-c-typedef (mach-port-urefs-t
                       (:foreign-name "mach_port_urefs_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-delta-t
                       (:foreign-name "mach_port_delta_t"))
                      integer-t)
(fli:define-c-typedef (mach-port-seqno-t
                       (:foreign-name "mach_port_seqno_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-mscount-t
                       (:foreign-name "mach_port_mscount_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-msgcount-t
                       (:foreign-name "mach_port_msgcount_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-rights-t
                       (:foreign-name "mach_port_rights_t"))
                      natural-t)
(fli:define-c-typedef (mach-port-srights-t
                       (:foreign-name "mach_port_srights_t"))
                      (:unsigned :int))
(fli:define-c-struct (mach-port-status
                      (:foreign-name "mach_port_status"))
                     (mps-pset mach-port-name-t)
                     (mps-seqno mach-port-seqno-t)
                     (mps-mscount mach-port-mscount-t)
                     (mps-qlimit mach-port-msgcount-t)
                     (mps-msgcount mach-port-msgcount-t)
                     (mps-sorights mach-port-rights-t)
                     (mps-srights boolean-t)
                     (mps-pdrequest boolean-t)
                     (mps-nsrequest boolean-t)
                     (mps-flags (:unsigned :int)))
(fli:define-c-typedef (mach-port-status-t
                       (:foreign-name "mach_port_status_t"))
                      (:struct mach-port-status))
(fli:define-c-struct (mach-port-limits
                      (:foreign-name "mach_port_limits"))
                     (mpl-qlimit mach-port-msgcount-t))
(fli:define-c-typedef (mach-port-limits-t
                       (:foreign-name "mach_port_limits_t"))
                      (:struct mach-port-limits))
(fli:define-c-typedef (mach-port-info-t
                       (:foreign-name "mach_port_info_t"))
                      (:pointer integer-t))
(fli:define-c-typedef (mach-port-flavor-t
                       (:foreign-name "mach_port_flavor_t"))
                      :int)
(fli:define-c-struct (mach-port-qos (:foreign-name "mach_port_qos"))
                     (name (:bit-field boolean-t 1))
                     (prealloc (:bit-field boolean-t 1))
                     (pad1 (:bit-field boolean-t 30))
                     (len natural-t))
(fli:define-c-typedef (mach-port-qos-t
                       (:foreign-name "mach_port_qos_t"))
                      (:struct mach-port-qos))

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFRunLoop.h"

(fli:define-c-struct (__cf-run-loop
                      (:foreign-name "__CFRunLoop")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-run-loop-ref (:foreign-name "CFRunLoopRef"))
                      (:pointer (:struct __cf-run-loop)))
(fli:define-c-struct (__cf-run-loop-source
                      (:foreign-name "__CFRunLoopSource")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-run-loop-source-ref
                       (:foreign-name "CFRunLoopSourceRef"))
                      (:pointer (:struct __cf-run-loop-source)))
(fli:define-c-struct (__cf-run-loop-observer
                      (:foreign-name "__CFRunLoopObserver")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-run-loop-observer-ref
                       (:foreign-name "CFRunLoopObserverRef"))
                      (:pointer (:struct __cf-run-loop-observer)))
(fli:define-c-struct (__cf-run-loop-timer
                      (:foreign-name "__CFRunLoopTimer")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-run-loop-timer-ref
                       (:foreign-name "CFRunLoopTimerRef"))
                      (:pointer (:struct __cf-run-loop-timer)))
(fli:define-c-typedef (cf-run-loop-activity
                       (:foreign-name "CFRunLoopActivity"))
                      (:enum
                       (k-cf-run-loop-entry 1)
                       (k-cf-run-loop-before-timers 2)
                       (k-cf-run-loop-before-sources 4)
                       (k-cf-run-loop-before-waiting 32)
                       (k-cf-run-loop-after-waiting 64)
                       (k-cf-run-loop-exit 128)
                       (k-cf-run-loop-all-activities 268435455)))
(fli:define-foreign-variable (k-cf-run-loop-default-mode
                              "kCFRunLoopDefaultMode"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-run-loop-common-modes
                              "kCFRunLoopCommonModes"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-function (cf-run-loop-get-type-id
                              "CFRunLoopGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-get-current
                              "CFRunLoopGetCurrent"
                              :source)
                             ()
                             :result-type
                             cf-run-loop-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-copy-current-mode
                              "CFRunLoopCopyCurrentMode"
                              :source)
                             ((rl cf-run-loop-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-copy-all-modes
                              "CFRunLoopCopyAllModes"
                              :source)
                             ((rl cf-run-loop-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-add-common-mode
                              "CFRunLoopAddCommonMode"
                              :source)
                             ((rl cf-run-loop-ref) (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-get-next-timer-fire-date
                              "CFRunLoopGetNextTimerFireDate"
                              :source)
                             ((rl cf-run-loop-ref) (mode cf-string-ref))
                             :result-type
                             cf-absolute-time
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-run "CFRunLoopRun" :source)
                             ()
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-run-in-mode
                              "CFRunLoopRunInMode"
                              :source)
                             ((mode cf-string-ref)
                              (seconds cf-time-interval)
                              (return-after-source-handled :boolean))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-is-waiting
                              "CFRunLoopIsWaiting"
                              :source)
                             ((rl cf-run-loop-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-wake-up
                              "CFRunLoopWakeUp"
                              :source)
                             ((rl cf-run-loop-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-stop "CFRunLoopStop" :source)
                             ((rl cf-run-loop-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-contains-source
                              "CFRunLoopContainsSource"
                              :source)
                             ((rl cf-run-loop-ref)
                              (source cf-run-loop-source-ref)
                              (mode cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-add-source
                              "CFRunLoopAddSource"
                              :source)
                             ((rl cf-run-loop-ref)
                              (source cf-run-loop-source-ref)
                              (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-remove-source
                              "CFRunLoopRemoveSource"
                              :source)
                             ((rl cf-run-loop-ref)
                              (source cf-run-loop-source-ref)
                              (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-contains-observer
                              "CFRunLoopContainsObserver"
                              :source)
                             ((rl cf-run-loop-ref)
                              (observer cf-run-loop-observer-ref)
                              (mode cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-add-observer
                              "CFRunLoopAddObserver"
                              :source)
                             ((rl cf-run-loop-ref)
                              (observer cf-run-loop-observer-ref)
                              (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-remove-observer
                              "CFRunLoopRemoveObserver"
                              :source)
                             ((rl cf-run-loop-ref)
                              (observer cf-run-loop-observer-ref)
                              (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-contains-timer
                              "CFRunLoopContainsTimer"
                              :source)
                             ((rl cf-run-loop-ref)
                              (timer cf-run-loop-timer-ref)
                              (mode cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-add-timer
                              "CFRunLoopAddTimer"
                              :source)
                             ((rl cf-run-loop-ref)
                              (timer cf-run-loop-timer-ref)
                              (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-remove-timer
                              "CFRunLoopRemoveTimer"
                              :source)
                             ((rl cf-run-loop-ref)
                              (timer cf-run-loop-timer-ref)
                              (mode cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-run-loop-source-context
                       (:foreign-name "CFRunLoopSourceContext"))
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
                          cf-string-ref)))
                       (equal (:pointer
                               (:function
                                ((:pointer (:const :void))
                                 (:pointer (:const :void)))
                                :boolean)))
                       (hash
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          cf-hash-code)))
                       (schedule
                        (:pointer
                         (:function
                          ((:pointer :void)
                           cf-run-loop-ref
                           cf-string-ref)
                          :void)))
                       (cancel
                        (:pointer
                         (:function
                          ((:pointer :void)
                           cf-run-loop-ref
                           cf-string-ref)
                          :void)))
                       (perform
                        (:pointer
                         (:function ((:pointer :void)) :void)))))
(fli:define-c-typedef (cf-run-loop-source-context1
                       (:foreign-name "CFRunLoopSourceContext1"))
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
                          cf-string-ref)))
                       (equal (:pointer
                               (:function
                                ((:pointer (:const :void))
                                 (:pointer (:const :void)))
                                :boolean)))
                       (hash
                        (:pointer
                         (:function
                          ((:pointer (:const :void)))
                          cf-hash-code)))
                       (get-port
                        (:pointer
                         (:function ((:pointer :void)) mach-port-t)))
                       (perform
                        (:pointer
                         (:function
                          ((:pointer :void)
                           cf-index
                           cf-allocator-ref
                           (:pointer :void))
                          (:pointer :void))))))
(fli:define-foreign-function (cf-run-loop-source-get-type-id
                              "CFRunLoopSourceGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-source-create
                              "CFRunLoopSourceCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (order cf-index)
                              (context
                               (:pointer cf-run-loop-source-context)))
                             :result-type
                             cf-run-loop-source-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-source-get-order
                              "CFRunLoopSourceGetOrder"
                              :source)
                             ((source cf-run-loop-source-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-source-invalidate
                              "CFRunLoopSourceInvalidate"
                              :source)
                             ((source cf-run-loop-source-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-source-is-valid
                              "CFRunLoopSourceIsValid"
                              :source)
                             ((source cf-run-loop-source-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-source-get-context
                              "CFRunLoopSourceGetContext"
                              :source)
                             ((source cf-run-loop-source-ref)
                              (context
                               (:pointer cf-run-loop-source-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-source-signal
                              "CFRunLoopSourceSignal"
                              :source)
                             ((source cf-run-loop-source-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-run-loop-observer-context
                       (:foreign-name "CFRunLoopObserverContext"))
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
(fli:define-c-typedef (cf-run-loop-observer-call-back
                       (:foreign-name "CFRunLoopObserverCallBack"))
                      (:pointer
                       (:function
                        (cf-run-loop-observer-ref
                         cf-run-loop-activity
                         (:pointer :void))
                        :void)))
(fli:define-foreign-function (cf-run-loop-observer-get-type-id
                              "CFRunLoopObserverGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-create
                              "CFRunLoopObserverCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (activities cf-option-flags)
                              (repeats :boolean)
                              (order cf-index)
                              (callout cf-run-loop-observer-call-back)
                              (context
                               (:pointer cf-run-loop-observer-context)))
                             :result-type
                             cf-run-loop-observer-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-get-activities
                              "CFRunLoopObserverGetActivities"
                              :source)
                             ((observer cf-run-loop-observer-ref))
                             :result-type
                             cf-option-flags
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-does-repeat
                              "CFRunLoopObserverDoesRepeat"
                              :source)
                             ((observer cf-run-loop-observer-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-get-order
                              "CFRunLoopObserverGetOrder"
                              :source)
                             ((observer cf-run-loop-observer-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-invalidate
                              "CFRunLoopObserverInvalidate"
                              :source)
                             ((observer cf-run-loop-observer-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-is-valid
                              "CFRunLoopObserverIsValid"
                              :source)
                             ((observer cf-run-loop-observer-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-observer-get-context
                              "CFRunLoopObserverGetContext"
                              :source)
                             ((observer cf-run-loop-observer-ref)
                              (context
                               (:pointer cf-run-loop-observer-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-run-loop-timer-context
                       (:foreign-name "CFRunLoopTimerContext"))
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
(fli:define-c-typedef (cf-run-loop-timer-call-back
                       (:foreign-name "CFRunLoopTimerCallBack"))
                      (:pointer
                       (:function
                        (cf-run-loop-timer-ref (:pointer :void))
                        :void)))
(fli:define-foreign-function (cf-run-loop-timer-get-type-id
                              "CFRunLoopTimerGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-create
                              "CFRunLoopTimerCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fire-date cf-absolute-time)
                              (interval cf-time-interval)
                              (flags cf-option-flags)
                              (order cf-index)
                              (callout cf-run-loop-timer-call-back)
                              (context
                               (:pointer cf-run-loop-timer-context)))
                             :result-type
                             cf-run-loop-timer-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-get-next-fire-date
                              "CFRunLoopTimerGetNextFireDate"
                              :source)
                             ((timer cf-run-loop-timer-ref))
                             :result-type
                             cf-absolute-time
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-set-next-fire-date
                              "CFRunLoopTimerSetNextFireDate"
                              :source)
                             ((timer cf-run-loop-timer-ref)
                              (fire-date cf-absolute-time))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-get-interval
                              "CFRunLoopTimerGetInterval"
                              :source)
                             ((timer cf-run-loop-timer-ref))
                             :result-type
                             cf-time-interval
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-does-repeat
                              "CFRunLoopTimerDoesRepeat"
                              :source)
                             ((timer cf-run-loop-timer-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-get-order
                              "CFRunLoopTimerGetOrder"
                              :source)
                             ((timer cf-run-loop-timer-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-invalidate
                              "CFRunLoopTimerInvalidate"
                              :source)
                             ((timer cf-run-loop-timer-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-is-valid
                              "CFRunLoopTimerIsValid"
                              :source)
                             ((timer cf-run-loop-timer-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-run-loop-timer-get-context
                              "CFRunLoopTimerGetContext"
                              :source)
                             ((timer cf-run-loop-timer-ref)
                              (context
                               (:pointer cf-run-loop-timer-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
