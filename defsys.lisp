;;; -*- Mode: Lisp; -*-
;;;
;;; ___ defsys.lis __________________________________
;;;
;;; LispWorks system definition for the CoreFoundation FFI
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/defsys.lisp $
;;; $Id: defsys.lisp 210 2009-07-19 22:58:54Z greg $
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

(lw:defsystem core-foundation
  ()
  :members (("mac-types" :type :system)
            "core-foundation-package"
	    "cf-base-ffi"
	    "cf-array-ffi"
	    "cf-bag-ffi"
	    "cf-data-ffi"
	    "cf-character-set-ffi"
	    "cf-date-ffi"
	    "cf-dictionary-ffi"
	    "cf-number-ffi"
	    "cf-locale-ffi"
	    "cf-string-ffi"
	    "cf-url-ffi"
	    "cf-run-loop-ffi"
	    "cf-socket-ffi"
	    "cf-stream-ffi"
	    "cf-property-list-ffi"
	    "cf-set-ffi"
	    "cf-time-zone-ffi"
	    "cf-tree-ffi"
	    "cf-xml-node-ffi"
	    "cf-xml-parser-ffi"
	    "cf-binary-heap-ffi"
	    "cf-bit-vector-ffi"
	    "cf-bundle-ffi"
	    "cf-byte-order-ffi"
	    "cf-uuid-ffi"
	    "cf-plug-in-ffi"
	    "cf-url-access-ffi"
	    "cf-date-formatter-ffi"
	    "cf-number-formatter-ffi"
	    "cf-user-notification-ffi"
	    "cf-mach-port-ffi"
	    "cf-message-port-ffi"
	    "cf-notification-center-ffi"
	    "cf-preferences-ffi"
	    "cf-string-encoding-ffi"
	    "core-foundation-utils")
  :rules ((:in-order-to :compile :all
           (:requires
            (:load "mac-types")
            (:load "core-foundation-package")
            (:load "cf-base-ffi")))
          (:in-order-to :compile "cf-xml-node-ffi"
           (:requires
            (:load "cf-tree-ffi")))
          (:in-order-to :compile "cf-xml-parser-ffi"
           (:requires
            (:load "cf-data-ffi")
            (:load "cf-xml-node-ffi")
            (:load "cf-dictionary-ffi")
            (:load "cf-url-ffi")))
          (:in-order-to :compile "cf-bundle-ffi"
           (:requires
            (:load "cf-array-ffi")))
          (:in-order-to :compile "core-foundation-utils"
           (:requires 
            (:load "cf-string-ffi")))
          (:in-order-to :compile "cf-date-formatter-ffi"
           (:requires
            (:load "cf-locale-ffi")
            (:load "cf-date-ffi")))
          (:in-order-to :compile "cf-number-formatter-ffi"
           (:requires
            (:load "cf-number-ffi")))
          (:in-order-to :compile "cf-user-notification-ffi"
           (:requires
            (:load "cf-run-loop-ffi")))))
