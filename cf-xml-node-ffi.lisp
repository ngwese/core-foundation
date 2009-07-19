;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-xml-node-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-xml-node-ffi.lisp $
;;; $Id: cf-xml-node-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFXMLNode.h"

(fli:define-c-struct (__cf-xmlnode
                      (:foreign-name "__CFXMLNode")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-xml-node-ref (:foreign-name "CFXMLNodeRef"))
                      (:pointer (:const (:struct __cf-xmlnode))))
(fli:define-c-typedef (cf-xml-tree-ref (:foreign-name "CFXMLTreeRef"))
                      cf-tree-ref)
(fli:define-c-typedef (cf-xml-node-type-code
                       (:foreign-name "CFXMLNodeTypeCode"))
                      (:enum
                       (k-cf-xml-node-type-document 1)
                       (k-cf-xml-node-type-element 2)
                       (k-cf-xml-node-type-attribute 3)
                       (k-cf-xml-node-type-processing-instruction 4)
                       (k-cf-xml-node-type-comment 5)
                       (k-cf-xml-node-type-text 6)
                       (k-cf-xml-node-type-cdatasection 7)
                       (k-cf-xml-node-type-document-fragment 8)
                       (k-cf-xml-node-type-entity 9)
                       (k-cf-xml-node-type-entity-reference 10)
                       (k-cf-xml-node-type-document-type 11)
                       (k-cf-xml-node-type-whitespace 12)
                       (k-cf-xml-node-type-notation 13)
                       (k-cf-xml-node-type-element-type-declaration 14)
                       (k-cf-xml-node-type-attribute-list-declaration
                        15)))
(fli:define-c-typedef (cf-xml-element-info
                       (:foreign-name "CFXMLElementInfo"))
                      (:struct
                       (attributes cf-dictionary-ref)
                       (attribute-order cf-array-ref)
                       (is-empty :boolean)
                       (-reserved (:c-array :char 3))))
(fli:define-c-typedef (cf-xml-processing-instruction-info
                       (:foreign-name
                        "CFXMLProcessingInstructionInfo"))
                      (:struct (data-string cf-string-ref)))
(fli:define-c-typedef (cf-xml-document-info
                       (:foreign-name "CFXMLDocumentInfo"))
                      (:struct
                       (source-url cf-url-ref)
                       (encoding cf-string-encoding)))
(fli:define-c-typedef (cf-xml-external-id
                       (:foreign-name "CFXMLExternalID"))
                      (:struct
                       (system-id cf-url-ref)
                       (public-id cf-string-ref)))
(fli:define-c-typedef (cf-xml-document-type-info
                       (:foreign-name "CFXMLDocumentTypeInfo"))
                      (:struct (external-id cf-xml-external-id)))
(fli:define-c-typedef (cf-xml-notation-info
                       (:foreign-name "CFXMLNotationInfo"))
                      (:struct (external-id cf-xml-external-id)))
(fli:define-c-typedef (cf-xml-element-type-declaration-info
                       (:foreign-name
                        "CFXMLElementTypeDeclarationInfo"))
                      (:struct (content-description cf-string-ref)))
(fli:define-c-typedef (cf-xml-attribute-declaration-info
                       (:foreign-name "CFXMLAttributeDeclarationInfo"))
                      (:struct
                       (attribute-name cf-string-ref)
                       (type-string cf-string-ref)
                       (default-string cf-string-ref)))
(fli:define-c-typedef (cf-xml-attribute-list-declaration-info
                       (:foreign-name
                        "CFXMLAttributeListDeclarationInfo"))
                      (:struct
                       (number-of-attributes cf-index)
                       (attributes
                        (:pointer cf-xml-attribute-declaration-info))))
(fli:define-c-typedef (cf-xml-entity-type-code
                       (:foreign-name "CFXMLEntityTypeCode"))
                      (:enum
                       (k-cf-xml-entity-type-parameter 0)
                       (k-cf-xml-entity-type-parsed-internal 1)
                       (k-cf-xml-entity-type-parsed-external 2)
                       (k-cf-xml-entity-type-unparsed 3)
                       (k-cf-xml-entity-type-character 4)))
(fli:define-c-typedef (cf-xml-entity-info
                       (:foreign-name "CFXMLEntityInfo"))
                      (:struct
                       (entity-type cf-xml-entity-type-code)
                       (replacement-text cf-string-ref)
                       (entity-id cf-xml-external-id)
                       (notation-name cf-string-ref)))
(fli:define-c-typedef (cf-xml-entity-reference-info
                       (:foreign-name "CFXMLEntityReferenceInfo"))
                      (:struct (entity-type cf-xml-entity-type-code)))
(fli:define-foreign-function (cf-xml-node-get-type-id
                              "CFXMLNodeGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-node-create
                              "CFXMLNodeCreate"
                              :source)
                             ((alloc cf-allocator-ref)
                              (xml-type cf-xml-node-type-code)
                              (data-string cf-string-ref)
                              (additional-info-ptr
                               (:pointer (:const :void)))
                              (version cf-index))
                             :result-type
                             cf-xml-node-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-node-create-copy
                              "CFXMLNodeCreateCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (orig-node cf-xml-node-ref))
                             :result-type
                             cf-xml-node-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-node-get-type-code
                              "CFXMLNodeGetTypeCode"
                              :source)
                             ((node cf-xml-node-ref))
                             :result-type
                             cf-xml-node-type-code
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-node-get-string
                              "CFXMLNodeGetString"
                              :source)
                             ((node cf-xml-node-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-node-get-info-ptr
                              "CFXMLNodeGetInfoPtr"
                              :source)
                             ((node cf-xml-node-ref))
                             :result-type
                             (:pointer (:const :void))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-node-get-version
                              "CFXMLNodeGetVersion"
                              :source)
                             ((node cf-xml-node-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-tree-create-with-node
                              "CFXMLTreeCreateWithNode"
                              :source)
                             ((allocator cf-allocator-ref)
                              (node cf-xml-node-ref))
                             :result-type
                             cf-xml-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-xml-tree-get-node
                              "CFXMLTreeGetNode"
                              :source)
                             ((xml-tree cf-xml-tree-ref))
                             :result-type
                             cf-xml-node-ref
                             :language
                             :ansi-c)

