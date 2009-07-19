;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-character-set-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-character-set-ffi.lisp $
;;; $Id: cf-character-set-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFCharacterSet.h"

(fli:define-c-struct (__cf-character-set
                      (:foreign-name "__CFCharacterSet")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-character-set-ref
                       (:foreign-name "CFCharacterSetRef"))
                      (:pointer (:const (:struct __cf-character-set))))
(fli:define-c-typedef (cf-mutable-character-set-ref
                       (:foreign-name "CFMutableCharacterSetRef"))
                      (:pointer (:struct __cf-character-set)))
(fli:define-c-typedef (cf-character-set-predefined-set
                       (:foreign-name "CFCharacterSetPredefinedSet"))
                      (:enum
                       (k-cf-character-set-control 1)
                       (k-cf-character-set-whitespace 2)
                       (k-cf-character-set-whitespace-and-newline 3)
                       (k-cf-character-set-decimal-digit 4)
                       (k-cf-character-set-letter 5)
                       (k-cf-character-set-lowercase-letter 6)
                       (k-cf-character-set-uppercase-letter 7)
                       (k-cf-character-set-non-base 8)
                       (k-cf-character-set-decomposable 9)
                       (k-cf-character-set-alpha-numeric 10)
                       (k-cf-character-set-punctuation 11)
                       (k-cf-character-set-illegal 12)
                       (k-cf-character-set-capitalized-letter 13)
                       (k-cf-character-set-symbol 14)))
(fli:define-foreign-function (cf-character-set-get-type-id
                              "CFCharacterSetGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-get-predefined
                              "CFCharacterSetGetPredefined"
                              :source)
                             ((the-set-identifier
                               cf-character-set-predefined-set))
                             :result-type
                             cf-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-with-characters-in-range
                              "CFCharacterSetCreateWithCharactersInRange"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-range cf-range))
                             :result-type
                             cf-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-with-characters-in-string
                              "CFCharacterSetCreateWithCharactersInString"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-string cf-string-ref))
                             :result-type
                             cf-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-with-bitmap-representation
                              "CFCharacterSetCreateWithBitmapRepresentation"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-data cf-data-ref))
                             :result-type
                             cf-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-inverted-set
                              "CFCharacterSetCreateInvertedSet"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-set cf-character-set-ref))
                             :result-type
                             cf-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-is-superset-of-set
                              "CFCharacterSetIsSupersetOfSet"
                              :source)
                             ((the-set cf-character-set-ref)
                              (the-otherset cf-character-set-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-has-member-in-plane
                              "CFCharacterSetHasMemberInPlane"
                              :source)
                             ((the-set cf-character-set-ref)
                              (the-plane cf-index))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-mutable
                              "CFCharacterSetCreateMutable"
                              :source)
                             ((alloc cf-allocator-ref))
                             :result-type
                             cf-mutable-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-copy
                              "CFCharacterSetCreateCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-set cf-character-set-ref))
                             :result-type
                             cf-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-mutable-copy
                              "CFCharacterSetCreateMutableCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-set cf-character-set-ref))
                             :result-type
                             cf-mutable-character-set-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-is-character-member
                              "CFCharacterSetIsCharacterMember"
                              :source)
                             ((the-set cf-character-set-ref)
                              (the-char uni-char))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-is-long-character-member
                              "CFCharacterSetIsLongCharacterMember"
                              :source)
                             ((the-set cf-character-set-ref)
                              (the-char utf32-char))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-create-bitmap-representation
                              "CFCharacterSetCreateBitmapRepresentation"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-set cf-character-set-ref))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-add-characters-in-range
                              "CFCharacterSetAddCharactersInRange"
                              :source)
                             ((the-set cf-mutable-character-set-ref)
                              (the-range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-remove-characters-in-range
                              "CFCharacterSetRemoveCharactersInRange"
                              :source)
                             ((the-set cf-mutable-character-set-ref)
                              (the-range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-add-characters-in-string
                              "CFCharacterSetAddCharactersInString"
                              :source)
                             ((the-set cf-mutable-character-set-ref)
                              (the-string cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-remove-characters-in-string
                              "CFCharacterSetRemoveCharactersInString"
                              :source)
                             ((the-set cf-mutable-character-set-ref)
                              (the-string cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-union
                              "CFCharacterSetUnion"
                              :source)
                             ((the-set cf-mutable-character-set-ref)
                              (the-other-set cf-character-set-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-intersect
                              "CFCharacterSetIntersect"
                              :source)
                             ((the-set cf-mutable-character-set-ref)
                              (the-other-set cf-character-set-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-character-set-invert
                              "CFCharacterSetInvert"
                              :source)
                             ((the-set cf-mutable-character-set-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)

