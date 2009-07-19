;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-byte-order-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-byte-order-ffi.lisp $
;;; $Id: cf-byte-order-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFByteOrder.h"

(fli:define-c-enum (__cf-byte-order (:foreign-name "__CFByteOrder"))
                   (cf-byte-order-unknown 0)
                   (cf-byte-order-little-endian 1)
                   (cf-byte-order-big-endian 2))
(fli:define-c-typedef (cf-byte-order (:foreign-name "CFByteOrder"))
                      (:enum __cf-byte-order))
(fli:define-foreign-function (cf-byte-order-get-current
                              "CFByteOrderGetCurrent"
                              :source)
                             ()
                             :result-type
                             cf-byte-order
                             :language
                             :ansi-c)

