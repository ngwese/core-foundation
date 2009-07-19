;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-tree-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-tree-ffi.lisp $
;;; $Id: cf-tree-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFTree.h"

(fli:define-c-typedef (cf-tree-retain-call-back
                       (:foreign-name "CFTreeRetainCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-tree-release-call-back
                       (:foreign-name "CFTreeReleaseCallBack"))
                      (:pointer
                       (:function ((:pointer (:const :void))) :void)))
(fli:define-c-typedef (cf-tree-copy-description-call-back
                       (:foreign-name "CFTreeCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-tree-context (:foreign-name "CFTreeContext"))
                      (:struct
                       (version cf-index)
                       (info (:pointer :void))
                       (retain cf-tree-retain-call-back)
                       (release cf-tree-release-call-back)
                       (copy-description
                        cf-tree-copy-description-call-back)))
(fli:define-c-typedef (cf-tree-applier-function
                       (:foreign-name "CFTreeApplierFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)) (:pointer :void))
                        :void)))
(fli:define-c-struct (__cf-tree
                      (:foreign-name "__CFTree")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-tree-ref (:foreign-name "CFTreeRef"))
                      (:pointer (:struct __cf-tree)))
(fli:define-foreign-function (cf-tree-get-type-id
                              "CFTreeGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-create "CFTreeCreate" :source)
                             ((allocator cf-allocator-ref)
                              (context
                               (:pointer (:const cf-tree-context))))
                             :result-type
                             cf-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-parent
                              "CFTreeGetParent"
                              :source)
                             ((tree cf-tree-ref))
                             :result-type
                             cf-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-next-sibling
                              "CFTreeGetNextSibling"
                              :source)
                             ((tree cf-tree-ref))
                             :result-type
                             cf-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-first-child
                              "CFTreeGetFirstChild"
                              :source)
                             ((tree cf-tree-ref))
                             :result-type
                             cf-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-context
                              "CFTreeGetContext"
                              :source)
                             ((tree cf-tree-ref)
                              (context (:pointer cf-tree-context)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-child-count
                              "CFTreeGetChildCount"
                              :source)
                             ((tree cf-tree-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-child-at-index
                              "CFTreeGetChildAtIndex"
                              :source)
                             ((tree cf-tree-ref) (idx cf-index))
                             :result-type
                             cf-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-get-children
                              "CFTreeGetChildren"
                              :source)
                             ((tree cf-tree-ref)
                              (children (:pointer cf-tree-ref)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-apply-function-to-children
                              "CFTreeApplyFunctionToChildren"
                              :source)
                             ((tree cf-tree-ref)
                              (applier cf-tree-applier-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-find-root
                              "CFTreeFindRoot"
                              :source)
                             ((tree cf-tree-ref))
                             :result-type
                             cf-tree-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-set-context
                              "CFTreeSetContext"
                              :source)
                             ((tree cf-tree-ref)
                              (context
                               (:pointer (:const cf-tree-context))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-prepend-child
                              "CFTreePrependChild"
                              :source)
                             ((tree cf-tree-ref) (new-child cf-tree-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-append-child
                              "CFTreeAppendChild"
                              :source)
                             ((tree cf-tree-ref) (new-child cf-tree-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-insert-sibling
                              "CFTreeInsertSibling"
                              :source)
                             ((tree cf-tree-ref)
                              (new-sibling cf-tree-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-remove "CFTreeRemove" :source)
                             ((tree cf-tree-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-remove-all-children
                              "CFTreeRemoveAllChildren"
                              :source)
                             ((tree cf-tree-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-tree-sort-children
                              "CFTreeSortChildren"
                              :source)
                             ((tree cf-tree-ref)
                              (comparator cf-comparator-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)

