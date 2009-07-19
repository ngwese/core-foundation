;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ core-foundation-utils.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/core-foundation-utils.lisp $
;;; $Id: core-foundation-utils.lisp 121 2006-11-04 19:09:49Z greg $
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

(defun string->cf-string (string
			  &optional (allocator (k-cf-allocator-system-default)))
;  (cond ((simple-string-p string)
  (let ((encoding (fli:enum-symbol-value 'cf-string-built-in-encodings
                                         'k-cf-string-encoding-utf8)))
    (fli:with-foreign-string (ptr len bytes :external-format :utf-8) string
      (declare (ignore len bytes))
      (fli:with-coerced-pointer (const-ptr :type '(:const :char)) ptr
        ;; kCFStringEncodingUTF8 = #x08000100
        (cf-string-create-with-cstring allocator const-ptr encoding)))))
;))

(defvar *cf-string-reader-cache* (make-hash-table :test #'equal))
(defvar *previous-readtables* nil)

(defun |#@-reader| (stream subchar arg)
  (declare (ignore subchar arg))
  (let ((string (read stream)))
    (if (stringp string)
      (let ((result (gethash string *cf-string-reader-cache* nil)))
        (when (null result)
          (setf result (string->cf-string string))
          (setf (gethash string *cf-string-reader-cache*) result))
        result))))
  
(defun %enable-cf-string-reader ()
  (push *readtable*
        *previous-readtables*)
  (setq *readtable* (copy-readtable))
  (set-dispatch-macro-character #\# #\@ #'|#@-reader|)
  (values))

(defun %disable-cf-string-reader ()
  (if *previous-readtables*
    (setq *readtable* (pop *previous-readtables*))
    (setq *readtable* (copy-readtable nil)))
  (values))

(defmacro enable-cf-string-reader ()
  `(eval-when (:compile-toplevel :load-toplevel :execute)
    (%enable-cf-string-reader)))

(defmacro disable-cf-string-reader ()
  `(eval-when (:compile-toplevel :load-toplevel :execute)
    (%disable-cf-string-reader)))

(defun cf-string->string (cf-string-ref)
  (if (not (fli:null-pointer-p cf-string-ref))
      (case (cf-string-get-fastest-encoding cf-string-ref)
	;; kCFStringEncodingMacRoman
	(0 (fli:convert-from-foreign-string (cf-string-get-cstring-ptr cf-string-ref 0))))))


(defmacro def-cf-type-function (name)
  (let ((imp-name (find-symbol (concatenate 'string (symbol-name name) "-IMP"))))
    `(defun ,name (obj)
       (declare (inline))
       (fli:with-coerced-pointer (ref :pointer-type 'cf-type-ref) obj
	 (,imp-name ref)))))

(def-cf-type-function cf-show)
(def-cf-type-function cf-release)
(def-cf-type-function cf-retain)
(def-cf-type-function cf-get-type-id)
(def-cf-type-function cf-copy-type-id-description)
(def-cf-type-function cf-get-retain-count)
(def-cf-type-function cf-hash)
(def-cf-type-function cf-copy-description)
(def-cf-type-function cf-get-allocator)

(defun cf-equal (obj1 obj2)
  (declare (inline))
  (fli:with-coerced-pointer (ref1 :pointer-type 'cf-type-ref) obj1
    (fli:with-coerced-pointer (ref2 :pointer-type 'cf-type-ref) obj2
      (cf-equal-imp ref1 ref2))))

(defun string->cf-url (string
		       &optional (allocator (k-cf-allocator-system-default)))
  (if (simple-string-p string)
      (let ((encoding (fli:enum-symbol-value 'cf-string-built-in-encodings
					     'k-cf-string-encoding-utf8)))
	(fli:with-foreign-string (ptr len bytes :external-format :utf-8) string
	  (declare (ignore bytes))
	  (cf-url-create-with-bytes allocator ptr (1- len) encoding nil)))))
			       
(defun pathname->cf-url (path
			 &optional (allocator (k-cf-allocator-system-default)))
  (let ((physical-path (namestring (translate-logical-pathname path)))
	(directory-p nil))
    (fli:with-foreign-string (ptr len bytes :external-format :utf-8) physical-path
      (declare (ignore bytes))
      (cf-url-create-from-file-system-representation allocator
						     ptr
						     (1- len)
						     directory-p))))

(defun number->cf-number (object
			  &optional (allocator (k-cf-allocator-system-default)))
  (cond ((integerp object)
         (fli:with-dynamic-foreign-objects ((number :long))
           (setf (fli:dereference number) object)
           (cf:cf-number-create allocator 'k-cf-number-long-type number)))
        ((typep object 'single-float)
         (fli:with-dynamic-foreign-objects ((number :float))
           (setf (fli:dereference number) object)
           (cf:cf-number-create allocator 'k-cf-number-float-type number)))
        ((typep object 'double-float)
         (fli:with-dynamic-foreign-objects ((number :double))
           (setf (fli:dereference number) object)
           (cf:cf-number-create allocator 'k-cf-number-double-type number)))))

(defun cf-number->number (object)
  (let ((type (cf:cf-number-get-type object)))
    (case type
      (cf:k-cf-number-sint8-type
       (fli:with-dynamic-foreign-objects ((number (:signed :char)))
         (cf:cf-number-get-value object type number)
         (fli:dereference number)))
      (cf:k-cf-number-sint16-type
        (fli:with-dynamic-foreign-objects ((number (:signed :short)))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
      (cf:k-cf-number-sint32-type
        (fli:with-dynamic-foreign-objects ((number (:signed :int)))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
      (cf:k-cf-number-float32-type
       (fli:with-dynamic-foreign-objects ((number :float))
         (cf:cf-number-get-value object type number)
         (fli:dereference number)))
      (cf:k-cf-number-float64-type
       (fli:with-dynamic-foreign-objects ((number :double))
         (cf:cf-number-get-value object type number)
         (fli:dereference number)))
       (cf:k-cf-number-char-type
        (fli:with-dynamic-foreign-objects ((number :char))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
       (cf:k-cf-number-short-type
        (fli:with-dynamic-foreign-objects ((number :short))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
       (cf:k-cf-number-int-type
        (fli:with-dynamic-foreign-objects ((number :int))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
       (cf:k-cf-number-long-type
        (fli:with-dynamic-foreign-objects ((number :long))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
       (cf:k-cf-number-float-type
        (fli:with-dynamic-foreign-objects ((number :float))
          (cf:cf-number-get-value object type number)
          (fli:dereference number)))
       (cf:k-cf-number-double-type
        (fli:with-dynamic-foreign-objects ((number :double))
          (cf:cf-number-get-value object type number)
          (fli:dereference number))))))

(defun cf-type-ref->lisp (object)
  (let ((cf-obj-type (cf:cf-get-type-id object)))
    (cond ((= cf-obj-type (cf:cf-string-get-type-id))
           (fli:with-coerced-pointer (str :pointer-type 'cf-string-ref) object
             (values (cf:cf-string->string str) t)))
          ((= cf-obj-type (cf:cf-number-get-type-id))
           (fli:with-coerced-pointer (num :pointer-type 'cf-number-ref) object
             (values (cf:cf-number->number num) t)))
          (t
           (values object nil)))))
