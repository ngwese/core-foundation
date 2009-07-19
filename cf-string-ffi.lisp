;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-string-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-string-ffi.lisp $
;;; $Id: cf-string-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFString.h"

(fli:define-c-typedef (cf-string-encoding
                       (:foreign-name "CFStringEncoding"))
                      uint32)
(fli:define-c-typedef (cf-string-built-in-encodings
                       (:foreign-name "CFStringBuiltInEncodings"))
                      (:enum
                       (k-cf-string-encoding-mac-roman 0)
                       (k-cf-string-encoding-windows-latin1 1280)
                       (k-cf-string-encoding-isolatin1 513)
                       (k-cf-string-encoding-next-step-latin 2817)
                       (k-cf-string-encoding-ascii 1536)
                       (k-cf-string-encoding-unicode 256)
                       (k-cf-string-encoding-utf8 134217984)
                       (k-cf-string-encoding-non-lossy-ascii 3071)))
(fli:define-foreign-function (cf-string-get-type-id
                              "CFStringGetTypeID"
                              :source)
                             ()
                             :result-type
                             cf-type-id
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-pascal-string
                              "CFStringCreateWithPascalString"
                              :source)
                             ((alloc cf-allocator-ref)
                              (p-str const-str255-param)
                              (encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-cstring
                              "CFStringCreateWithCString"
                              :source)
                             ((alloc cf-allocator-ref)
                              (c-str (:pointer (:const :char)))
                              (encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-characters
                              "CFStringCreateWithCharacters"
                              :source)
                             ((alloc cf-allocator-ref)
                              (chars (:pointer (:const uni-char)))
                              (num-chars cf-index))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-pascal-string-no-copy
                              "CFStringCreateWithPascalStringNoCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (p-str const-str255-param)
                              (encoding cf-string-encoding)
                              (contents-deallocator cf-allocator-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-cstring-no-copy
                              "CFStringCreateWithCStringNoCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (c-str (:pointer (:const :char)))
                              (encoding cf-string-encoding)
                              (contents-deallocator cf-allocator-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-characters-no-copy
                              "CFStringCreateWithCharactersNoCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (chars (:pointer (:const uni-char)))
                              (num-chars cf-index)
                              (contents-deallocator cf-allocator-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-substring
                              "CFStringCreateWithSubstring"
                              :source)
                             ((alloc cf-allocator-ref)
                              (str cf-string-ref)
                              (range cf-range))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-copy
                              "CFStringCreateCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-string cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-format
                              "CFStringCreateWithFormat"
                              :source)
                             ((alloc cf-allocator-ref)
                              (format-options cf-dictionary-ref)
                              (format cf-string-ref)
                              (arg-4 :int))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-mutable
                              "CFStringCreateMutable"
                              :source)
                             ((alloc cf-allocator-ref)
                              (max-length cf-index))
                             :result-type
                             cf-mutable-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-mutable-copy
                              "CFStringCreateMutableCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (max-length cf-index)
                              (the-string cf-string-ref))
                             :result-type
                             cf-mutable-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-mutable-with-external-characters-no-copy
                              "CFStringCreateMutableWithExternalCharactersNoCopy"
                              :source)
                             ((alloc cf-allocator-ref)
                              (chars (:pointer uni-char))
                              (num-chars cf-index)
                              (capacity cf-index)
                              (external-characters-allocator
                               cf-allocator-ref))
                             :result-type
                             cf-mutable-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-length
                              "CFStringGetLength"
                              :source)
                             ((the-string cf-string-ref))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-character-at-index
                              "CFStringGetCharacterAtIndex"
                              :source)
                             ((the-string cf-string-ref) (idx cf-index))
                             :result-type
                             uni-char
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-characters
                              "CFStringGetCharacters"
                              :source)
                             ((the-string cf-string-ref)
                              (range cf-range)
                              (buffer (:pointer uni-char)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-pascal-string
                              "CFStringGetPascalString"
                              :source)
                             ((the-string cf-string-ref)
                              (buffer string-ptr)
                              (buffer-size cf-index)
                              (encoding cf-string-encoding))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-cstring
                              "CFStringGetCString"
                              :source)
                             ((the-string cf-string-ref)
                              (buffer (:pointer :char))
                              (buffer-size cf-index)
                              (encoding cf-string-encoding))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-pascal-string-ptr
                              "CFStringGetPascalStringPtr"
                              :source)
                             ((the-string cf-string-ref)
                              (encoding cf-string-encoding))
                             :result-type
                             const-string-ptr
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-cstring-ptr
                              "CFStringGetCStringPtr"
                              :source)
                             ((the-string cf-string-ref)
                              (encoding cf-string-encoding))
                             :result-type
                             (:pointer (:const :char))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-characters-ptr
                              "CFStringGetCharactersPtr"
                              :source)
                             ((the-string cf-string-ref))
                             :result-type
                             (:pointer (:const uni-char))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-bytes
                              "CFStringGetBytes"
                              :source)
                             ((the-string cf-string-ref)
                              (range cf-range)
                              (encoding cf-string-encoding)
                              (loss-byte uint8)
                              (is-external-representation :boolean)
                              (buffer (:pointer uint8))
                              (max-buf-len cf-index)
                              (used-buf-len (:pointer cf-index)))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-with-bytes
                              "CFStringCreateWithBytes"
                              :source)
                             ((alloc cf-allocator-ref)
                              (bytes (:pointer (:const uint8)))
                              (num-bytes cf-index)
                              (encoding cf-string-encoding)
                              (is-external-representation :boolean))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-from-external-representation
                              "CFStringCreateFromExternalRepresentation"
                              :source)
                             ((alloc cf-allocator-ref)
                              (data cf-data-ref)
                              (encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-external-representation
                              "CFStringCreateExternalRepresentation"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-string cf-string-ref)
                              (encoding cf-string-encoding)
                              (loss-byte uint8))
                             :result-type
                             cf-data-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-smallest-encoding
                              "CFStringGetSmallestEncoding"
                              :source)
                             ((the-string cf-string-ref))
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-fastest-encoding
                              "CFStringGetFastestEncoding"
                              :source)
                             ((the-string cf-string-ref))
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-system-encoding
                              "CFStringGetSystemEncoding"
                              :source)
                             ()
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-maximum-size-for-encoding
                              "CFStringGetMaximumSizeForEncoding"
                              :source)
                             ((length cf-index)
                              (encoding cf-string-encoding))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-string-compare-flags
                       (:foreign-name "CFStringCompareFlags"))
                      (:enum
                       (k-cf-compare-case-insensitive 1)
                       (k-cf-compare-backwards 4)
                       (k-cf-compare-anchored 8)
                       (k-cf-compare-nonliteral 16)
                       (k-cf-compare-localized 32)
                       (k-cf-compare-numerically 64)))
(fli:define-foreign-function (cf-string-compare-with-options
                              "CFStringCompareWithOptions"
                              :source)
                             ((the-string1 cf-string-ref)
                              (the-string2 cf-string-ref)
                              (range-to-compare cf-range)
                              (compare-options cf-option-flags))
                             :result-type
                             cf-comparison-result
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-compare
                              "CFStringCompare"
                              :source)
                             ((the-string1 cf-string-ref)
                              (the-string2 cf-string-ref)
                              (compare-options cf-option-flags))
                             :result-type
                             cf-comparison-result
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-find-with-options
                              "CFStringFindWithOptions"
                              :source)
                             ((the-string cf-string-ref)
                              (string-to-find cf-string-ref)
                              (range-to-search cf-range)
                              (search-options cf-option-flags)
                              (result (:pointer cf-range)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-array-with-find-results
                              "CFStringCreateArrayWithFindResults"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-string cf-string-ref)
                              (string-to-find cf-string-ref)
                              (range-to-search cf-range)
                              (compare-options cf-option-flags))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-find "CFStringFind" :source)
                             ((the-string cf-string-ref)
                              (string-to-find cf-string-ref)
                              (compare-options cf-option-flags))
                             :result-type
                             cf-range
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-has-prefix
                              "CFStringHasPrefix"
                              :source)
                             ((the-string cf-string-ref)
                              (prefix cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-has-suffix
                              "CFStringHasSuffix"
                              :source)
                             ((the-string cf-string-ref)
                              (suffix cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-range-of-composed-characters-at-index
                              "CFStringGetRangeOfComposedCharactersAtIndex"
                              :source)
                             ((the-string cf-string-ref)
                              (the-index cf-index))
                             :result-type
                             cf-range
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-find-character-from-set
                              "CFStringFindCharacterFromSet"
                              :source)
                             ((the-string cf-string-ref)
                              (the-set cf-character-set-ref)
                              (range-to-search cf-range)
                              (search-options cf-option-flags)
                              (result (:pointer cf-range)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-line-bounds
                              "CFStringGetLineBounds"
                              :source)
                             ((the-string cf-string-ref)
                              (range cf-range)
                              (line-begin-index (:pointer cf-index))
                              (line-end-index (:pointer cf-index))
                              (contents-end-index (:pointer cf-index)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-by-combining-strings
                              "CFStringCreateByCombiningStrings"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-array cf-array-ref)
                              (separator-string cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-create-array-by-separating-strings
                              "CFStringCreateArrayBySeparatingStrings"
                              :source)
                             ((alloc cf-allocator-ref)
                              (the-string cf-string-ref)
                              (separator-string cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-int-value
                              "CFStringGetIntValue"
                              :source)
                             ((str cf-string-ref))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-double-value
                              "CFStringGetDoubleValue"
                              :source)
                             ((str cf-string-ref))
                             :result-type
                             :double
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-append "CFStringAppend" :source)
                             ((the-string cf-mutable-string-ref)
                              (appended-string cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-append-characters
                              "CFStringAppendCharacters"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (chars (:pointer (:const uni-char)))
                              (num-chars cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-append-pascal-string
                              "CFStringAppendPascalString"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (p-str const-str255-param)
                              (encoding cf-string-encoding))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-append-cstring
                              "CFStringAppendCString"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (c-str (:pointer (:const :char)))
                              (encoding cf-string-encoding))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-append-format
                              "CFStringAppendFormat"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (format-options cf-dictionary-ref)
                              (format cf-string-ref)
                              (arg-4 :int))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-insert "CFStringInsert" :source)
                             ((str cf-mutable-string-ref)
                              (idx cf-index)
                              (inserted-str cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-delete "CFStringDelete" :source)
                             ((the-string cf-mutable-string-ref)
                              (range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-replace
                              "CFStringReplace"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (range cf-range)
                              (replacement cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-replace-all
                              "CFStringReplaceAll"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (replacement cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-find-and-replace
                              "CFStringFindAndReplace"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (string-to-find cf-string-ref)
                              (replacement-string cf-string-ref)
                              (range-to-search cf-range)
                              (compare-options cf-option-flags))
                             :result-type
                             cf-index
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-set-external-characters-no-copy
                              "CFStringSetExternalCharactersNoCopy"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (chars (:pointer uni-char))
                              (length cf-index)
                              (capacity cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-pad "CFStringPad" :source)
                             ((the-string cf-mutable-string-ref)
                              (pad-string cf-string-ref)
                              (length cf-index)
                              (index-into-pad cf-index))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-trim "CFStringTrim" :source)
                             ((the-string cf-mutable-string-ref)
                              (trim-string cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-trim-whitespace
                              "CFStringTrimWhitespace"
                              :source)
                             ((the-string cf-mutable-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-lowercase
                              "CFStringLowercase"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (locale cf-locale-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-uppercase
                              "CFStringUppercase"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (locale cf-locale-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-capitalize
                              "CFStringCapitalize"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (locale cf-locale-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-string-normalization-form
                       (:foreign-name "CFStringNormalizationForm"))
                      (:enum
                       (k-cf-string-normalization-form-d 0)
                       (k-cf-string-normalization-form-kd 1)
                       (k-cf-string-normalization-form-c 2)
                       (k-cf-string-normalization-form-kc 3)))
(fli:define-foreign-function (cf-string-normalize
                              "CFStringNormalize"
                              :source)
                             ((the-string cf-mutable-string-ref)
                              (the-form cf-string-normalization-form))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-is-encoding-available
                              "CFStringIsEncodingAvailable"
                              :source)
                             ((encoding cf-string-encoding))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-list-of-available-encodings
                              "CFStringGetListOfAvailableEncodings"
                              :source)
                             ()
                             :result-type
                             (:pointer (:const cf-string-encoding))
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-name-of-encoding
                              "CFStringGetNameOfEncoding"
                              :source)
                             ((encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-convert-encoding-to-nsstring-encoding
                              "CFStringConvertEncodingToNSStringEncoding"
                              :source)
                             ((encoding cf-string-encoding))
                             :result-type
                             uint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-convert-nsstring-encoding-to-encoding
                              "CFStringConvertNSStringEncodingToEncoding"
                              :source)
                             ((encoding uint32))
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-convert-encoding-to-windows-codepage
                              "CFStringConvertEncodingToWindowsCodepage"
                              :source)
                             ((encoding cf-string-encoding))
                             :result-type
                             uint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-convert-windows-codepage-to-encoding
                              "CFStringConvertWindowsCodepageToEncoding"
                              :source)
                             ((codepage uint32))
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-convert-ianachar-set-name-to-encoding
                              "CFStringConvertIANACharSetNameToEncoding"
                              :source)
                             ((the-string cf-string-ref))
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-convert-encoding-to-ianachar-set-name
                              "CFStringConvertEncodingToIANACharSetName"
                              :source)
                             ((encoding cf-string-encoding))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-most-compatible-mac-string-encoding
                              "CFStringGetMostCompatibleMacStringEncoding"
                              :source)
                             ((encoding cf-string-encoding))
                             :result-type
                             cf-string-encoding
                             :language
                             :ansi-c)
(fli:define-c-typedef (cf-string-inline-buffer
                       (:foreign-name "CFStringInlineBuffer"))
                      (:struct
                       (buffer (:c-array uni-char 64))
                       (the-string cf-string-ref)
                       (direct-buffer (:pointer (:const uni-char)))
                       (range-to-buffer cf-range)
                       (buffered-range-start cf-index)
                       (buffered-range-end cf-index)))
(fli:define-foreign-function (cf-string-init-inline-buffer
                              "CFStringInitInlineBuffer"
                              :source)
                             ((str cf-string-ref)
                              (buf (:pointer cf-string-inline-buffer))
                              (range cf-range))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-string-get-character-from-inline-buffer
                              "CFStringGetCharacterFromInlineBuffer"
                              :source)
                             ((buf (:pointer cf-string-inline-buffer))
                              (idx cf-index))
                             :result-type
                             uni-char
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-show-imp "CFShow" :source)
                             ((obj cf-type-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-show-str "CFShowStr" :source)
                             ((str cf-string-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (__cf-string-make-constant-string
                              "__CFStringMakeConstantString"
                              :source)
                             ((c-str (:pointer (:const :char))))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
