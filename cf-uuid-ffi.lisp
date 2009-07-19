;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-uuid-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-uuid-ffi.lisp $
;;; $Id: cf-uuid-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFUUID.h"

(fli:define-c-struct (__cf-uuid
                      (:foreign-name "__CFUUID")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-uuid-ref (:foreign-name "CFUUIDRef"))
                      (:pointer (:const (:struct __cf-uuid))))
(fli:define-c-typedef (cf-uuid-bytes (:foreign-name "CFUUIDBytes"))
                      (:struct
                       (byte0 uint8)
                       (byte1 uint8)
                       (byte2 uint8)
                       (byte3 uint8)
                       (byte4 uint8)
                       (byte5 uint8)
                       (byte6 uint8)
                       (byte7 uint8)
                       (byte8 uint8)
                       (byte9 uint8)
                       (byte10 uint8)
                       (byte11 uint8)
                       (byte12 uint8)
                       (byte13 uint8)
                       (byte14 uint8)
                       (byte15 uint8)))
(fli:define-foreign-function (cf-uuid-get-type-id
                              "CFUUIDGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-create "CFUUIDCreate" :source)
                             ((alloc cf-allocator-ref))
                             :result-type
                             cf-uuid-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-create-with-bytes
                              "CFUUIDCreateWithBytes"
                              :source)
                             ((alloc cf-allocator-ref)
                              (byte0 uint8)
                              (byte1 uint8)
                              (byte2 uint8)
                              (byte3 uint8)
                              (byte4 uint8)
                              (byte5 uint8)
                              (byte6 uint8)
                              (byte7 uint8)
                              (byte8 uint8)
                              (byte9 uint8)
                              (byte10 uint8)
                              (byte11 uint8)
                              (byte12 uint8)
                              (byte13 uint8)
                              (byte14 uint8)
                              (byte15 uint8))
                             :result-type
                             cf-uuid-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-create-from-string
                              "CFUUIDCreateFromString"
                              :source)
                             ((alloc cf-allocator-ref)
                              (uuid-str cf-string-ref))
                             :result-type
                             cf-uuid-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-create-string
                              "CFUUIDCreateString"
                              :source)
                             ((alloc cf-allocator-ref) (uuid cf-uuid-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-get-constant-uuidwith-bytes
                              "CFUUIDGetConstantUUIDWithBytes"
                              :source)
                             ((alloc cf-allocator-ref)
                              (byte0 uint8)
                              (byte1 uint8)
                              (byte2 uint8)
                              (byte3 uint8)
                              (byte4 uint8)
                              (byte5 uint8)
                              (byte6 uint8)
                              (byte7 uint8)
                              (byte8 uint8)
                              (byte9 uint8)
                              (byte10 uint8)
                              (byte11 uint8)
                              (byte12 uint8)
                              (byte13 uint8)
                              (byte14 uint8)
                              (byte15 uint8))
                             :result-type
                             cf-uuid-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-get-uuid-bytes
                              "CFUUIDGetUUIDBytes"
                              :source)
                             ((uuid cf-uuid-ref))
                             :result-type
                             cf-uuid-bytes
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-uuid-create-from-uuid-bytes
                              "CFUUIDCreateFromUUIDBytes"
                              :source)
                             ((alloc cf-allocator-ref)
                              (bytes cf-uuid-bytes))
                             :result-type
                             cf-uuid-ref
                             :language
                             :ansi-c)

