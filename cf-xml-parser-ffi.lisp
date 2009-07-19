;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-xml-parser-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-xml-parser-ffi.lisp $
;;; $Id: cf-xml-parser-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFXMLParser.h"

(fli:define-c-struct (__cf-xmlparser
                      (:foreign-name "__CFXMLParser")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-xml-parser-ref
                       (:foreign-name "CFXMLParserRef"))
                      (:pointer (:struct __cf-xmlparser)))
(fli:define-c-typedef (cf-xml-parser-options
                       (:foreign-name "CFXMLParserOptions"))
                      (:enum
                       (k-cf-xml-parser-validate-document 1)
                       (k-cf-xml-parser-skip-meta-data 2)
                       (k-cf-xml-parser-replace-physical-entities 4)
                       (k-cf-xml-parser-skip-whitespace 8)
                       (k-cf-xml-parser-resolve-external-entities 16)
                       (k-cf-xml-parser-add-implied-attributes 32)
                       (k-cf-xml-parser-all-options 16777215)
                       (k-cf-xml-parser-no-options 0)))
(fli:define-c-typedef (cf-xml-parser-status-code
                       (:foreign-name "CFXMLParserStatusCode"))
                      (:enum
                       (k-cf-xml-status-parse-not-begun -2)
                       (k-cf-xml-status-parse-in-progress -1)
                       (k-cf-xml-status-parse-successful 0)
                       (k-cf-xml-error-unexpected-eof 1)
                       (k-cf-xml-error-unknown-encoding 2)
                       (k-cf-xml-error-encoding-conversion-failure 3)
                       (k-cf-xml-error-malformed-processing-instruction
                        4)
                       (k-cf-xml-error-malformed-dtd 5)
                       (k-cf-xml-error-malformed-name 6)
                       (k-cf-xml-error-malformed-cdsect 7)
                       (k-cf-xml-error-malformed-close-tag 8)
                       (k-cf-xml-error-malformed-start-tag 9)
                       (k-cf-xml-error-malformed-document 10)
                       (k-cf-xml-error-elementless-document 11)
                       (k-cf-xml-error-malformed-comment 12)
                       (k-cf-xml-error-malformed-character-reference 13)
                       (k-cf-xml-error-malformed-parsed-character-data
                        14)
                       (k-cf-xml-error-no-data 15)))
(fli:define-c-typedef (cf-xml-parser-create-xmlstructure-call-back
                       (:foreign-name
                        "CFXMLParserCreateXMLStructureCallBack"))
                      (:pointer
                       (:function
                        (cf-xml-parser-ref
                         cf-xml-node-ref
                         (:pointer :void))
                        (:pointer :void))))
(fli:define-c-typedef (cf-xml-parser-add-child-call-back
                       (:foreign-name "CFXMLParserAddChildCallBack"))
                      (:pointer
                       (:function
                        (cf-xml-parser-ref
                         (:pointer :void)
                         (:pointer :void)
                         (:pointer :void))
                        :void)))
(fli:define-c-typedef (cf-xml-parser-end-xmlstructure-call-back
                       (:foreign-name
                        "CFXMLParserEndXMLStructureCallBack"))
                      (:pointer
                       (:function
                        (cf-xml-parser-ref
                         (:pointer :void)
                         (:pointer :void))
                        :void)))
(fli:define-c-typedef (cf-xml-parser-resolve-external-entity-call-back
                       (:foreign-name
                        "CFXMLParserResolveExternalEntityCallBack"))
                      (:pointer
                       (:function
                        (cf-xml-parser-ref
                         (:pointer cf-xml-external-id)
                         (:pointer :void))
                        cf-data-ref)))
(fli:define-c-typedef (cf-xml-parser-handle-error-call-back
                       (:foreign-name
                        "CFXMLParserHandleErrorCallBack"))
                      (:pointer
                       (:function
                        (cf-xml-parser-ref
                         cf-xml-parser-status-code
                         (:pointer :void))
                        :boolean)))
(fli:define-c-typedef (cf-xml-parser-call-backs
                       (:foreign-name "CFXMLParserCallBacks"))
                      (:struct
                       (version cf-index)
                       (create-xmlstructure
                        cf-xml-parser-create-xmlstructure-call-back)
                       (add-child cf-xml-parser-add-child-call-back)
                       (end-xmlstructure
                        cf-xml-parser-end-xmlstructure-call-back)
                       (resolve-external-entity
                        cf-xml-parser-resolve-external-entity-call-back)
                       (handle-error
                        cf-xml-parser-handle-error-call-back)))
(fli:define-c-typedef (cf-xml-parser-retain-call-back
                       (:foreign-name "CFXMLParserRetainCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-xml-parser-release-call-back
                       (:foreign-name "CFXMLParserReleaseCallBack"))
                      (:pointer
                       (:function ((:pointer (:const :void))) :void)))
(fli:define-c-typedef (cf-xml-parser-copy-description-call-back
                       (:foreign-name
                        "CFXMLParserCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-xml-parser-context
                       (:foreign-name "CFXMLParserContext"))
                      (:struct
                       (version cf-index)
                       (info (:pointer :void))
                       (retain cf-xml-parser-retain-call-back)
                       (release cf-xml-parser-release-call-back)
                       (copy-description
                        cf-xml-parser-copy-description-call-back)))
(fli:define-foreign-function (cf-xml-parser-get-type-id
                              "CFXMLParserGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-create
                              "CFXMLParserCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (xml-data cf-data-ref)
                              (data-source cf-url-ref)
                              (parse-options cf-option-flags)
                              (version-of-nodes cf-index)
                              (call-backs
                               (:pointer cf-xml-parser-call-backs))
                              (context (:pointer cf-xml-parser-context)))
                             :result-type
                             cf-xml-parser-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-create-with-data-from-url
                              "CFXMLParserCreateWithDataFromURL"
                              :source)
                             ((allocator cf-allocator-ref)
                              (data-source cf-url-ref)
                              (parse-options cf-option-flags)
                              (version-of-nodes cf-index)
                              (call-backs
                               (:pointer cf-xml-parser-call-backs))
                              (context (:pointer cf-xml-parser-context)))
                             :result-type
                             cf-xml-parser-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-context
                              "CFXMLParserGetContext"
                              :source)
                             ((parser cf-xml-parser-ref)
                              (context (:pointer cf-xml-parser-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-call-backs
                              "CFXMLParserGetCallBacks"
                              :source)
                             ((parser cf-xml-parser-ref)
                              (call-backs
                               (:pointer cf-xml-parser-call-backs)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-source-url
                              "CFXMLParserGetSourceURL"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-location
                              "CFXMLParserGetLocation"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-line-number
                              "CFXMLParserGetLineNumber"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-document
                              "CFXMLParserGetDocument"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-get-status-code
                              "CFXMLParserGetStatusCode"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             cf-xml-parser-status-code
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-copy-error-description
                              "CFXMLParserCopyErrorDescription"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-abort
                              "CFXMLParserAbort"
                              :source)
                             ((parser cf-xml-parser-ref)
                              (error-code cf-xml-parser-status-code)
                              (error-description cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-parser-parse
                              "CFXMLParserParse"
                              :source)
                             ((parser cf-xml-parser-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-tree-create-from-data
                              "CFXMLTreeCreateFromData"
                              :source)
                             ((allocator cf-allocator-ref)
                              (xml-data cf-data-ref)
                              (data-source cf-url-ref)
                              (parse-options cf-option-flags)
                              (version-of-nodes cf-index))
                             :result-type
                             cf-xml-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-tree-create-from-data-with-error
                              "CFXMLTreeCreateFromDataWithError"
                              :source)
                             ((allocator cf-allocator-ref)
                              (xml-data cf-data-ref)
                              (data-source cf-url-ref)
                              (parse-options cf-option-flags)
                              (version-of-nodes cf-index)
                              (error-dict (:pointer cf-dictionary-ref)))
                             :result-type
                             cf-xml-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-tree-create-with-data-from-url
                              "CFXMLTreeCreateWithDataFromURL"
                              :source)
                             ((allocator cf-allocator-ref)
                              (data-source cf-url-ref)
                              (parse-options cf-option-flags)
                              (version-of-nodes cf-index))
                             :result-type
                             cf-xml-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-tree-create-xmldata
                              "CFXMLTreeCreateXMLData"
                              :source)
                             ((allocator cf-allocator-ref)
                              (xml-tree cf-xml-tree-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-create-string-by-escaping-entities
                              "CFXMLCreateStringByEscapingEntities"
                              :source)
                             ((allocator cf-allocator-ref)
                              (string cf-string-ref)
                              (entities-dictionary cf-dictionary-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-create-string-by-unescaping-entities
                              "CFXMLCreateStringByUnescapingEntities"
                              :source)
                             ((allocator cf-allocator-ref)
                              (string cf-string-ref)
                              (entities-dictionary cf-dictionary-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-variable (k-cf-xml-tree-error-description
                              "kCFXMLTreeErrorDescription"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-xml-tree-error-line-number
                              "kCFXMLTreeErrorLineNumber"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-xml-tree-error-location
                              "kCFXMLTreeErrorLocation"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-xml-tree-error-status-code
                              "kCFXMLTreeErrorStatusCode"
                              :source)
                             :type
                             (:const cf-string-ref))
