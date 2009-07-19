;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-url-access-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-url-access-ffi.lisp $
;;; $Id: cf-url-access-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFURLAccess.h"

(fli:define-foreign-function (cf-url-create-data-and-properties-from-resource
                              "CFURLCreateDataAndPropertiesFromResource"
                              :source)
                             ((alloc cf-allocator-ref)
                              (url cf-url-ref)
                              (resource-data (:pointer cf-data-ref))
                              (properties (:pointer cf-dictionary-ref))
                              (desired-properties cf-array-ref)
                              (error-code (:pointer sint32)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-write-data-and-properties-to-resource
                              "CFURLWriteDataAndPropertiesToResource"
                              :source)
                             ((url cf-url-ref)
                              (data-to-write cf-data-ref)
                              (properties-to-write cf-dictionary-ref)
                              (error-code (:pointer sint32)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-destroy-resource
                              "CFURLDestroyResource"
                              :source)
                             ((url cf-url-ref)
                              (error-code (:pointer sint32)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-property-from-resource
                              "CFURLCreatePropertyFromResource"
                              :source)
                             ((alloc cf-allocator-ref)
                              (url cf-url-ref)
                              (property cf-string-ref)
                              (error-code (:pointer sint32)))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-url-error (:foreign-name "CFURLError"))
                      (:enum
                       (k-cf-url-unknown-error -10)
                       (k-cf-url-unknown-scheme-error -11)
                       (k-cf-url-resource-not-found-error -12)
                       (k-cf-url-resource-access-violation-error -13)
                       (k-cf-url-remote-host-unavailable-error -14)
                       (k-cf-url-improper-arguments-error -15)
                       (k-cf-url-unknown-property-key-error -16)
                       (k-cf-url-property-key-unavailable-error -17)
                       (k-cf-url-timeout-error -18)))
(fli:define-foreign-variable (k-cf-url-file-exists
                              "kCFURLFileExists"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-file-directory-contents
                              "kCFURLFileDirectoryContents"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-file-length
                              "kCFURLFileLength"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-file-last-modification-time
                              "kCFURLFileLastModificationTime"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-file-posixmode
                              "kCFURLFilePOSIXMode"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-file-owner-id
                              "kCFURLFileOwnerID"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-http-status-code
                              "kCFURLHTTPStatusCode"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-url-http-status-line
                              "kCFURLHTTPStatusLine"
                              :source)
                             :type
                             (:const cf-string-ref))

