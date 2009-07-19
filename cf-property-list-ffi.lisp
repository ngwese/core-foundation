;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-property-list-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-property-list-ffi.lisp $
;;; $Id: cf-property-list-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFPropertyList.h"

(fli:define-c-typedef (cf-property-list-mutability-options
                       (:foreign-name
                        "CFPropertyListMutabilityOptions"))
                      (:enum
                       (k-cf-property-list-immutable 0)
                       (k-cf-property-list-mutable-containers 1)
                       (k-cf-property-list-mutable-containers-and-leaves
                        2)))
(fli:define-foreign-function (cf-property-list-create-from-xmldata
                              "CFPropertyListCreateFromXMLData"
                              :source)
                             ((allocator cf-allocator-ref)
                              (xml-data cf-data-ref)
                              (mutability-option cf-option-flags)
                              (error-string (:pointer cf-string-ref)))
                             :result-type
                             cf-property-list-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-property-list-create-xmldata
                              "CFPropertyListCreateXMLData"
                              :source)
                             ((allocator cf-allocator-ref)
                              (property-list cf-property-list-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-property-list-create-deep-copy
                              "CFPropertyListCreateDeepCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (property-list cf-property-list-ref)
                              (mutability-option cf-option-flags))
                             :result-type
                             cf-property-list-ref
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-property-list-format
                       (:foreign-name "CFPropertyListFormat"))
                      (:enum
                       (k-cf-property-list-open-step-format 1)
                       (k-cf-property-list-xmlformat-v1-0 100)
                       (k-cf-property-list-binary-format-v1-0 200)))
(fli:define-foreign-function (cf-property-list-is-valid
                              "CFPropertyListIsValid"
                              :source)
                             ((plist cf-property-list-ref)
                              (format cf-property-list-format))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-property-list-write-to-stream
                              "CFPropertyListWriteToStream"
                              :source)
                             ((property-list cf-property-list-ref)
                              (stream cf-write-stream-ref)
                              (format cf-property-list-format)
                              (error-string (:pointer cf-string-ref)))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-property-list-create-from-stream
                              "CFPropertyListCreateFromStream"
                              :source)
                             ((allocator cf-allocator-ref)
                              (stream cf-read-stream-ref)
                              (stream-length cf-index)
                              (mutability-option cf-option-flags)
                              (format (:pointer
                                       cf-property-list-format))
                              (error-string (:pointer cf-string-ref)))
                             :result-type
                             cf-property-list-ref
                             :language
                             :ansi-c)
