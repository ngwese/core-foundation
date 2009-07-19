;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-data-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-data-ffi.lisp $
;;; $Id: cf-data-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFData.h"

(fli:define-c-struct (__cf-data
                      (:foreign-name "__CFData")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-data-ref (:foreign-name "CFDataRef"))
                      (:pointer (:const (:struct __cf-data))))
(fli:define-c-typedef (cf-mutable-data-ref
                       (:foreign-name "CFMutableDataRef"))
                      (:pointer (:struct __cf-data)))
(fli:define-foreign-function (cf-data-get-type-id
                              "CFDataGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-create "CFDataCreate" :source)
                             ((allocator cf-allocator-ref)
                              (bytes (:pointer (:const uint8)))
                              (length cf-index))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-create-with-bytes-no-copy
                              "CFDataCreateWithBytesNoCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (bytes (:pointer (:const uint8)))
                              (length cf-index)
                              (bytes-deallocator cf-allocator-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-create-copy
                              "CFDataCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (the-data cf-data-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-create-mutable
                              "CFDataCreateMutable"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index))
                             :result-type
                             cf-mutable-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-create-mutable-copy
                              "CFDataCreateMutableCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (the-data cf-data-ref))
                             :result-type
                             cf-mutable-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-get-length
                              "CFDataGetLength"
                              :source)
                             ((the-data cf-data-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-get-byte-ptr
                              "CFDataGetBytePtr"
                              :source)
                             ((the-data cf-data-ref))
                             :result-type
                             (:pointer (:const uint8))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-get-mutable-byte-ptr
                              "CFDataGetMutableBytePtr"
                              :source)
                             ((the-data cf-mutable-data-ref))
                             :result-type
                             (:pointer uint8)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-get-bytes
                              "CFDataGetBytes"
                              :source)
                             ((the-data cf-data-ref)
                              (range cf-range)
                              (buffer (:pointer uint8)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-set-length
                              "CFDataSetLength"
                              :source)
                             ((the-data cf-mutable-data-ref)
                              (length cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-increase-length
                              "CFDataIncreaseLength"
                              :source)
                             ((the-data cf-mutable-data-ref)
                              (extra-length cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-append-bytes
                              "CFDataAppendBytes"
                              :source)
                             ((the-data cf-mutable-data-ref)
                              (bytes (:pointer (:const uint8)))
                              (length cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-replace-bytes
                              "CFDataReplaceBytes"
                              :source)
                             ((the-data cf-mutable-data-ref)
                              (range cf-range)
                              (new-bytes (:pointer (:const uint8)))
                              (new-length cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-data-delete-bytes
                              "CFDataDeleteBytes"
                              :source)
                             ((the-data cf-mutable-data-ref)
                              (range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)
