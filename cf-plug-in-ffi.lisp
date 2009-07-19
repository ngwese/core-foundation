;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-plug-in-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-plug-in-ffi.lisp $
;;; $Id: cf-plug-in-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFPlugIn.h"

(fli:define-foreign-variable (k-cf-plug-in-dynamic-registration-key
                              "kCFPlugInDynamicRegistrationKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-plug-in-dynamic-register-function-key
                              "kCFPlugInDynamicRegisterFunctionKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-plug-in-unload-function-key
                              "kCFPlugInUnloadFunctionKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-plug-in-factories-key
                              "kCFPlugInFactoriesKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-plug-in-types-key
                              "kCFPlugInTypesKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-c-typedef (cf-plug-in-dynamic-register-function
                       (:foreign-name
                        "CFPlugInDynamicRegisterFunction"))
                      (:pointer (:function (cf-plug-in-ref) :void)))
(fli:define-c-typedef (cf-plug-in-unload-function
                       (:foreign-name "CFPlugInUnloadFunction"))
                      (:pointer (:function (cf-plug-in-ref) :void)))
(fli:define-c-typedef (cf-plug-in-factory-function
                       (:foreign-name "CFPlugInFactoryFunction"))
                      (:pointer
                       (:function
                        (cf-allocator-ref cf-uuid-ref)
                        (:pointer :void))))
(fli:define-foreign-function (cf-plug-in-get-type-id
                              "CFPlugInGetTypeID"
                              :source)
                             ()
                             :result-type
                             uint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-create
                              "CFPlugInCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (plug-in-url cf-url-ref))
                             :result-type
                             cf-plug-in-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-get-bundle
                              "CFPlugInGetBundle"
                              :source)
                             ((plug-in cf-plug-in-ref))
                             :result-type
                             cf-bundle-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-set-load-on-demand
                              "CFPlugInSetLoadOnDemand"
                              :source)
                             ((plug-in cf-plug-in-ref) (flag :boolean))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-is-load-on-demand
                              "CFPlugInIsLoadOnDemand"
                              :source)
                             ((plug-in cf-plug-in-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-find-factories-for-plug-in-type
                              "CFPlugInFindFactoriesForPlugInType"
                              :source)
                             ((type-uuid cf-uuid-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-find-factories-for-plug-in-type-in-plug-in
                              "CFPlugInFindFactoriesForPlugInTypeInPlugIn"
                              :source)
                             ((type-uuid cf-uuid-ref)
                              (plug-in cf-plug-in-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-instance-create
                              "CFPlugInInstanceCreate"
                              :source)
                             ((allocator cf-allocator-ref)
                              (factory-uuid cf-uuid-ref)
                              (type-uuid cf-uuid-ref))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-register-factory-function
                              "CFPlugInRegisterFactoryFunction"
                              :source)
                             ((factory-uuid cf-uuid-ref)
                              (func cf-plug-in-factory-function))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-register-factory-function-by-name
                              "CFPlugInRegisterFactoryFunctionByName"
                              :source)
                             ((factory-uuid cf-uuid-ref)
                              (plug-in cf-plug-in-ref)
                              (function-name cf-string-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-unregister-factory
                              "CFPlugInUnregisterFactory"
                              :source)
                             ((factory-uuid cf-uuid-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-register-plug-in-type
                              "CFPlugInRegisterPlugInType"
                              :source)
                             ((factory-uuid cf-uuid-ref)
                              (type-uuid cf-uuid-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-unregister-plug-in-type
                              "CFPlugInUnregisterPlugInType"
                              :source)
                             ((factory-uuid cf-uuid-ref)
                              (type-uuid cf-uuid-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-add-instance-for-factory
                              "CFPlugInAddInstanceForFactory"
                              :source)
                             ((factory-id cf-uuid-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-remove-instance-for-factory
                              "CFPlugInRemoveInstanceForFactory"
                              :source)
                             ((factory-id cf-uuid-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-c-struct (__cf-plug-in-instance
                      (:foreign-name "__CFPlugInInstance")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-plug-in-instance-ref
                       (:foreign-name "CFPlugInInstanceRef"))
                      (:pointer (:struct __cf-plug-in-instance)))
(fli:define-c-typedef (cf-plug-in-instance-get-interface-function
                       (:foreign-name
                        "CFPlugInInstanceGetInterfaceFunction"))
                      (:pointer
                       (:function
                        (cf-plug-in-instance-ref
                         cf-string-ref
                         (:pointer (:pointer :void)))
                        :boolean)))
(fli:define-c-typedef (cf-plug-in-instance-deallocate-instance-data-function
                       (:foreign-name
                        "CFPlugInInstanceDeallocateInstanceDataFunction"))
                      (:pointer (:function ((:pointer :void)) :void)))
(fli:define-foreign-function (cf-plug-in-instance-get-interface-function-table
                              "CFPlugInInstanceGetInterfaceFunctionTable"
                              :source)
                             ((instance cf-plug-in-instance-ref)
                              (interface-name cf-string-ref)
                              (ftbl (:pointer (:pointer :void))))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-instance-get-factory-name
                              "CFPlugInInstanceGetFactoryName"
                              :source)
                             ((instance cf-plug-in-instance-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-instance-get-instance-data
                              "CFPlugInInstanceGetInstanceData"
                              :source)
                             ((instance cf-plug-in-instance-ref))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-instance-get-type-id
                              "CFPlugInInstanceGetTypeID"
                              :source)
                             ()
                             :result-type
                             uint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-plug-in-instance-create-with-instance-data-size
                              "CFPlugInInstanceCreateWithInstanceDataSize"
                              :source)
                             ((allocator cf-allocator-ref)
                              (instance-data-size cf-index)
                              (deallocate-instance-function
                               cf-plug-in-instance-deallocate-instance-data-function)
                              (factory-name cf-string-ref)
                              (get-interface-function
                               cf-plug-in-instance-get-interface-function))
                             :result-type
                             cf-plug-in-instance-ref
                             :language
                             :ansi-c)

