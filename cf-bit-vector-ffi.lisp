;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-bit-vector-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-bit-vector-ffi.lisp $
;;; $Id: cf-bit-vector-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBitVector.h"

(fli:define-c-typedef (cf-bit (:foreign-name "CFBit")) uint32)
(fli:define-c-struct (__cf-bit-vector
                      (:foreign-name "__CFBitVector")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-bit-vector-ref
                       (:foreign-name "CFBitVectorRef"))
                      (:pointer (:const (:struct __cf-bit-vector))))
(fli:define-c-typedef (cf-mutable-bit-vector-ref
                       (:foreign-name "CFMutableBitVectorRef"))
                      (:pointer (:struct __cf-bit-vector)))
(fli:define-foreign-function (cf-bit-vector-get-type-id
                              "CFBitVectorGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-create
                              "CFBitVectorCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (bytes (:pointer (:const uint8)))
                              (num-bits cf-index))
                             :result-type
                             cf-bit-vector-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-create-copy
                              "CFBitVectorCreateCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (bv cf-bit-vector-ref))
                             :result-type
                             cf-bit-vector-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-create-mutable
                              "CFBitVectorCreateMutable"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index))
                             :result-type
                             cf-mutable-bit-vector-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-create-mutable-copy
                              "CFBitVectorCreateMutableCopy"
                              :source)
                             ((allocator cf-allocator-ref)
                              (capacity cf-index)
                              (bv cf-bit-vector-ref))
                             :result-type
                             cf-mutable-bit-vector-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-get-count
                              "CFBitVectorGetCount"
                              :source)
                             ((bv cf-bit-vector-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-get-count-of-bit
                              "CFBitVectorGetCountOfBit"
                              :source)
                             ((bv cf-bit-vector-ref)
                              (range cf-range)
                              (value cf-bit))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-contains-bit
                              "CFBitVectorContainsBit"
                              :source)
                             ((bv cf-bit-vector-ref)
                              (range cf-range)
                              (value cf-bit))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-get-bit-at-index
                              "CFBitVectorGetBitAtIndex"
                              :source)
                             ((bv cf-bit-vector-ref) (idx cf-index))
                             :result-type
                             cf-bit
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-get-bits
                              "CFBitVectorGetBits"
                              :source)
                             ((bv cf-bit-vector-ref)
                              (range cf-range)
                              (bytes (:pointer uint8)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-get-first-index-of-bit
                              "CFBitVectorGetFirstIndexOfBit"
                              :source)
                             ((bv cf-bit-vector-ref)
                              (range cf-range)
                              (value cf-bit))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-get-last-index-of-bit
                              "CFBitVectorGetLastIndexOfBit"
                              :source)
                             ((bv cf-bit-vector-ref)
                              (range cf-range)
                              (value cf-bit))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-set-count
                              "CFBitVectorSetCount"
                              :source)
                             ((bv cf-mutable-bit-vector-ref)
                              (cnt cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-flip-bit-at-index
                              "CFBitVectorFlipBitAtIndex"
                              :source)
                             ((bv cf-mutable-bit-vector-ref)
                              (idx cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-flip-bits
                              "CFBitVectorFlipBits"
                              :source)
                             ((bv cf-mutable-bit-vector-ref)
                              (range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-set-bit-at-index
                              "CFBitVectorSetBitAtIndex"
                              :source)
                             ((bv cf-mutable-bit-vector-ref)
                              (idx cf-index)
                              (value cf-bit))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-set-bits
                              "CFBitVectorSetBits"
                              :source)
                             ((bv cf-mutable-bit-vector-ref)
                              (range cf-range)
                              (value cf-bit))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bit-vector-set-all-bits
                              "CFBitVectorSetAllBits"
                              :source)
                             ((bv cf-mutable-bit-vector-ref)
                              (value cf-bit))
                             :result-type
                             :void
                             :language
                             :ansi-c)
