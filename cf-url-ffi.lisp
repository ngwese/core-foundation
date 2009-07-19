;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-url-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-url-ffi.lisp $
;;; $Id: cf-url-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFURL.h"

(fli:define-c-typedef (cf-url-path-style
                       (:foreign-name "CFURLPathStyle"))
                      (:enum
                       (k-cf-url-posixpath-style 0)
                       (k-cf-url-hfspath-style 1)
                       (k-cf-url-windows-path-style 2)))
(fli:define-c-struct (__cf-url
                      (:foreign-name "__CFURL")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-url-ref (:foreign-name "CFURLRef"))
                      (:pointer (:const (:struct __cf-url))))
(fli:define-foreign-function (cf-url-get-type-id
                              "CFURLGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-with-bytes
                              "CFURLCreateWithBytes"
                              :source)
                             ((allocator cf-allocator-ref)
                              (urlbytes (:pointer (:const uint8)))
                              (length cf-index)
                              (encoding cf-string-encoding)
                              (base-url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-data
                              "CFURLCreateData"
                              :source)
                             ((allocator cf-allocator-ref)
                              (url cf-url-ref)
                              (encoding cf-string-encoding)
                              (escape-whitespace :boolean))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-with-string
                              "CFURLCreateWithString"
                              :source)
                             ((allocator cf-allocator-ref)
                              (urlstring cf-string-ref)
                              (base-url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-absolute-urlwith-bytes
                              "CFURLCreateAbsoluteURLWithBytes"
                              :source)
                             ((alloc cf-allocator-ref)
                              (relative-urlbytes
                               (:pointer (:const uint8)))
                              (length cf-index)
                              (encoding cf-string-encoding)
                              (base-url cf-url-ref)
                              (use-compatibility-mode :boolean))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-with-file-system-path
                              "CFURLCreateWithFileSystemPath"
                              :source)
                             ((allocator cf-allocator-ref)
                              (file-path cf-string-ref)
                              (path-style cf-url-path-style)
                              (is-directory :boolean))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-from-file-system-representation
                              "CFURLCreateFromFileSystemRepresentation"
                              :source)
                             ((allocator cf-allocator-ref)
                              (buffer (:pointer (:const uint8)))
                              (buf-len cf-index)
                              (is-directory :boolean))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-with-file-system-path-relative-to-base
                              "CFURLCreateWithFileSystemPathRelativeToBase"
                              :source)
                             ((allocator cf-allocator-ref)
                              (file-path cf-string-ref)
                              (path-style cf-url-path-style)
                              (is-directory :boolean)
                              (base-url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-from-file-system-representation-relative-to-base
                              "CFURLCreateFromFileSystemRepresentationRelativeToBase"
                              :source)
                             ((allocator cf-allocator-ref)
                              (buffer (:pointer (:const uint8)))
                              (buf-len cf-index)
                              (is-directory :boolean)
                              (base-url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-get-file-system-representation
                              "CFURLGetFileSystemRepresentation"
                              :source)
                             ((url cf-url-ref)
                              (resolve-against-base :boolean)
                              (buffer (:pointer uint8))
                              (max-buf-len cf-index))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-absolute-url
                              "CFURLCopyAbsoluteURL"
                              :source)
                             ((relative-url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-get-string "CFURLGetString" :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-get-base-url
                              "CFURLGetBaseURL"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-can-be-decomposed
                              "CFURLCanBeDecomposed"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-scheme
                              "CFURLCopyScheme"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-net-location
                              "CFURLCopyNetLocation"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-path "CFURLCopyPath" :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-strict-path
                              "CFURLCopyStrictPath"
                              :source)
                             ((an-url cf-url-ref)
                              (is-absolute (:pointer :boolean)))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-file-system-path
                              "CFURLCopyFileSystemPath"
                              :source)
                             ((an-url cf-url-ref)
                              (path-style cf-url-path-style))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-has-directory-path
                              "CFURLHasDirectoryPath"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-resource-specifier
                              "CFURLCopyResourceSpecifier"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-host-name
                              "CFURLCopyHostName"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-get-port-number
                              "CFURLGetPortNumber"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-user-name
                              "CFURLCopyUserName"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-password
                              "CFURLCopyPassword"
                              :source)
                             ((an-url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-parameter-string
                              "CFURLCopyParameterString"
                              :source)
                             ((an-url cf-url-ref)
                              (characters-to-leave-escaped
                               cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-query-string
                              "CFURLCopyQueryString"
                              :source)
                             ((an-url cf-url-ref)
                              (characters-to-leave-escaped
                               cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-fragment
                              "CFURLCopyFragment"
                              :source)
                             ((an-url cf-url-ref)
                              (characters-to-leave-escaped
                               cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-last-path-component
                              "CFURLCopyLastPathComponent"
                              :source)
                             ((url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-copy-path-extension
                              "CFURLCopyPathExtension"
                              :source)
                             ((url cf-url-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-copy-appending-path-component
                              "CFURLCreateCopyAppendingPathComponent"
                              :source)
                             ((allocator cf-allocator-ref)
                              (url cf-url-ref)
                              (path-component cf-string-ref)
                              (is-directory :boolean))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-copy-deleting-last-path-component
                              "CFURLCreateCopyDeletingLastPathComponent"
                              :source)
                             ((allocator cf-allocator-ref)
                              (url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-copy-appending-path-extension
                              "CFURLCreateCopyAppendingPathExtension"
                              :source)
                             ((allocator cf-allocator-ref)
                              (url cf-url-ref)
                              (extension cf-string-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-copy-deleting-path-extension
                              "CFURLCreateCopyDeletingPathExtension"
                              :source)
                             ((allocator cf-allocator-ref)
                              (url cf-url-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-get-bytes "CFURLGetBytes" :source)
                             ((url cf-url-ref)
                              (buffer (:pointer uint8))
                              (buffer-length cf-index))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-url-component-type
                       (:foreign-name "CFURLComponentType"))
                      (:enum
                       (k-cf-url-component-scheme 1)
                       (k-cf-url-component-net-location 2)
                       (k-cf-url-component-path 3)
                       (k-cf-url-component-resource-specifier 4)
                       (k-cf-url-component-user 5)
                       (k-cf-url-component-password 6)
                       (k-cf-url-component-user-info 7)
                       (k-cf-url-component-host 8)
                       (k-cf-url-component-port 9)
                       (k-cf-url-component-parameter-string 10)
                       (k-cf-url-component-query 11)
                       (k-cf-url-component-fragment 12)))
(fli:define-foreign-function (cf-url-get-byte-range-for-component
                              "CFURLGetByteRangeForComponent"
                              :source)
                             ((url cf-url-ref)
                              (component cf-url-component-type)
                              (range-including-separators
                               (:pointer cf-range)))
                             :result-type
                             cf-range
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-string-by-replacing-percent-escapes
                              "CFURLCreateStringByReplacingPercentEscapes"
                              :source)
                             ((allocator cf-allocator-ref)
                              (original-string cf-string-ref)
                              (characters-to-leave-escaped
                               cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-string-by-replacing-percent-escapes-using-encoding
                              "CFURLCreateStringByReplacingPercentEscapesUsingEncoding"
                              :source)
                             ((allocator cf-allocator-ref)
                              (orig-string cf-string-ref)
                              (chars-to-leave-escaped cf-string-ref)
                              (encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-create-string-by-adding-percent-escapes
                              "CFURLCreateStringByAddingPercentEscapes"
                              :source)
                             ((allocator cf-allocator-ref)
                              (original-string cf-string-ref)
                              (characters-to-leave-unescaped
                               cf-string-ref)
                              (legal-urlcharacters-to-be-escaped
                               cf-string-ref)
                              (encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-c-struct (fsref
                      (:foreign-name "FSRef")
                      (:forward-reference t)))
(fli:define-foreign-function (cf-url-create-from-fsref
                              "CFURLCreateFromFSRef"
                              :source)
                             ((allocator cf-allocator-ref)
                              (fs-ref
                               (:pointer (:const (:struct fsref)))))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-url-get-fsref "CFURLGetFSRef" :source)
                             ((url cf-url-ref)
                              (fs-ref (:pointer (:struct fsref))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
