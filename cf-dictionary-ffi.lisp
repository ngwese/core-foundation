;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-dictionary-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-dictionary-ffi.lisp $
;;; $Id: cf-dictionary-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFDictionary.h"

(fli:define-c-typedef (cf-dictionary-retain-call-back
                       (:foreign-name "CFDictionaryRetainCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        (:pointer (:const :void)))))
(fli:define-c-typedef (cf-dictionary-release-call-back
                       (:foreign-name "CFDictionaryReleaseCallBack"))
                      (:pointer
                       (:function
                        (cf-allocator-ref (:pointer (:const :void)))
                        :void)))
(fli:define-c-typedef (cf-dictionary-copy-description-call-back
                       (:foreign-name
                        "CFDictionaryCopyDescriptionCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-string-ref)))
(fli:define-c-typedef (cf-dictionary-equal-call-back
                       (:foreign-name "CFDictionaryEqualCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void))
                         (:pointer (:const :void)))
                        :boolean)))
(fli:define-c-typedef (cf-dictionary-hash-call-back
                       (:foreign-name "CFDictionaryHashCallBack"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void)))
                        cf-hash-code)))
(fli:define-c-typedef (cf-dictionary-key-call-backs
                       (:foreign-name "CFDictionaryKeyCallBacks"))
                      (:struct
                       (version cf-index)
                       (retain cf-dictionary-retain-call-back)
                       (release cf-dictionary-release-call-back)
                       (copy-description
                        cf-dictionary-copy-description-call-back)
                       (equal cf-dictionary-equal-call-back)
                       (hash cf-dictionary-hash-call-back)))
(fli:define-foreign-variable (k-cf-type-dictionary-key-call-backs
                              "kCFTypeDictionaryKeyCallBacks"
                              :source)
                             :type
                             (:const cf-dictionary-key-call-backs))
(fli:define-foreign-variable (k-cf-copy-string-dictionary-key-call-backs
                              "kCFCopyStringDictionaryKeyCallBacks"
                              :source)
                             :type
                             (:const cf-dictionary-key-call-backs))
(fli:define-c-typedef (cf-dictionary-value-call-backs
                       (:foreign-name "CFDictionaryValueCallBacks"))
                      (:struct
                       (version cf-index)
                       (retain cf-dictionary-retain-call-back)
                       (release cf-dictionary-release-call-back)
                       (copy-description
                        cf-dictionary-copy-description-call-back)
                       (equal cf-dictionary-equal-call-back)))
(fli:define-foreign-variable (k-cf-type-dictionary-value-call-backs
                              "kCFTypeDictionaryValueCallBacks"
                              :source)
                             :type
                             (:const cf-dictionary-value-call-backs))
(fli:define-c-typedef (cf-dictionary-applier-function
                       (:foreign-name "CFDictionaryApplierFunction"))
                      (:pointer
                       (:function
                        ((:pointer (:const :void))
                         (:pointer (:const :void))
                         (:pointer :void))
                        :void)))
(fli:define-c-struct (__cf-dictionary
                      (:foreign-name "__CFDictionary")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-dictionary-ref
                       (:foreign-name "CFDictionaryRef"))
                      (:pointer (:const (:struct __cf-dictionary))))
(fli:define-c-typedef (cf-mutable-dictionary-ref
                       (:foreign-name "CFMutableDictionaryRef"))
                      (:pointer (:struct __cf-dictionary)))
(fli:define-foreign-function (cf-dictionary-get-type-id
                              "CFDictionaryGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-create
                              "CFDictionaryCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (keys
                               (:pointer (:pointer (:const :void))))
                              (values (:pointer
                                       (:pointer (:const :void))))
                              (num-values cf-index)
                              (key-call-backs
                               (:pointer
                                (:const cf-dictionary-key-call-backs)))
                              (value-call-backs
                               (:pointer
                                (:const
                                 cf-dictionary-value-call-backs))))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-create-copy
                              "CFDictionaryCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (the-dict cf-dictionary-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-create-mutable
                              "CFDictionaryCreateMutable"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (key-call-backs
                               (:pointer
                                (:const cf-dictionary-key-call-backs)))
                              (value-call-backs
                               (:pointer
                                (:const
                                 cf-dictionary-value-call-backs))))
                             :result-type
                             cf-mutable-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-create-mutable-copy
                              "CFDictionaryCreateMutableCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (the-dict cf-dictionary-ref))
                             :result-type
                             cf-mutable-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-get-count
                              "CFDictionaryGetCount"
                              :source)
                             ((the-dict cf-dictionary-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-get-count-of-key
                              "CFDictionaryGetCountOfKey"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (key (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-get-count-of-value
                              "CFDictionaryGetCountOfValue"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-contains-key
                              "CFDictionaryContainsKey"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (key (:pointer (:const :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-contains-value
                              "CFDictionaryContainsValue"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (value (:pointer (:const :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-get-value
                              "CFDictionaryGetValue"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (key (:pointer (:const :void))))
                             :result-type
                             (:pointer (:const :void))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-get-value-if-present
                              "CFDictionaryGetValueIfPresent"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (key (:pointer (:const :void)))
                              (value
                               (:pointer (:pointer (:const :void)))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-get-keys-and-values
                              "CFDictionaryGetKeysAndValues"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (keys
                               (:pointer (:pointer (:const :void))))
                              (values (:pointer
                                       (:pointer (:const :void)))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-apply-function
                              "CFDictionaryApplyFunction"
                              :source)
                             ((the-dict cf-dictionary-ref)
                              (applier cf-dictionary-applier-function)
                              (context (:pointer :void)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-add-value
                              "CFDictionaryAddValue"
                              :source)
                             ((the-dict cf-mutable-dictionary-ref)
                              (key (:pointer (:const :void)))
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-set-value
                              "CFDictionarySetValue"
                              :source)
                             ((the-dict cf-mutable-dictionary-ref)
                              (key (:pointer (:const :void)))
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-replace-value
                              "CFDictionaryReplaceValue"
                              :source)
                             ((the-dict cf-mutable-dictionary-ref)
                              (key (:pointer (:const :void)))
                              (value (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-remove-value
                              "CFDictionaryRemoveValue"
                              :source)
                             ((the-dict cf-mutable-dictionary-ref)
                              (key (:pointer (:const :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-dictionary-remove-all-values
                              "CFDictionaryRemoveAllValues"
                              :source)
                             ((the-dict cf-mutable-dictionary-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
