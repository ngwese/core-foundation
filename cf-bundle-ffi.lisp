;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-bundle-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-bundle-ffi.lisp $
;;; $Id: cf-bundle-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBundle.h"

(fli:define-c-struct (__cf-bundle
                      (:foreign-name "__CFBundle")
                      (:forward-reference t)))
(fli:define-c-typedef (cf-bundle-ref (:foreign-name "CFBundleRef"))
                      (:pointer (:struct __cf-bundle)))
(fli:define-c-typedef (cf-plug-in-ref (:foreign-name "CFPlugInRef"))
                      (:pointer (:struct __cf-bundle)))
(fli:define-foreign-variable (k-cf-bundle-info-dictionary-version-key
                              "kCFBundleInfoDictionaryVersionKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-bundle-executable-key
                              "kCFBundleExecutableKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-bundle-identifier-key
                              "kCFBundleIdentifierKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-bundle-version-key
                              "kCFBundleVersionKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-bundle-development-region-key
                              "kCFBundleDevelopmentRegionKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-bundle-name-key
                              "kCFBundleNameKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-variable (k-cf-bundle-localizations-key
                              "kCFBundleLocalizationsKey"
                              :source)
                             :type
                             (:const cf-string-ref))
(fli:define-foreign-function (cf-bundle-get-main-bundle
                              "CFBundleGetMainBundle"
                              :source)
                             ()
                             :result-type
                             cf-bundle-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-bundle-with-identifier
                              "CFBundleGetBundleWithIdentifier"
                              :source)
                             ((bundle-id cf-string-ref))
                             :result-type
                             cf-bundle-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-all-bundles
                              "CFBundleGetAllBundles"
                              :source)
                             ()
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-type-id
                              "CFBundleGetTypeID"
                              :source)
                             ()
                             :result-type
                             uint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-create "CFBundleCreate" :source)
                             ((allocator cf-allocator-ref)
                              (bundle-url cf-url-ref))
                             :result-type
                             cf-bundle-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-create-bundles-from-directory
                              "CFBundleCreateBundlesFromDirectory"
                              :source)
                             ((allocator cf-allocator-ref)
                              (directory-url cf-url-ref)
                              (bundle-type cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-bundle-url
                              "CFBundleCopyBundleURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-value-for-info-dictionary-key
                              "CFBundleGetValueForInfoDictionaryKey"
                              :source)
                             ((bundle cf-bundle-ref) (key cf-string-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-info-dictionary
                              "CFBundleGetInfoDictionary"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-local-info-dictionary
                              "CFBundleGetLocalInfoDictionary"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-package-info
                              "CFBundleGetPackageInfo"
                              :source)
                             ((bundle cf-bundle-ref)
                              (package-type (:pointer uint32))
                              (package-creator (:pointer uint32)))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-identifier
                              "CFBundleGetIdentifier"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-version-number
                              "CFBundleGetVersionNumber"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             uint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-development-region
                              "CFBundleGetDevelopmentRegion"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-support-files-directory-url
                              "CFBundleCopySupportFilesDirectoryURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resources-directory-url
                              "CFBundleCopyResourcesDirectoryURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-private-frameworks-url
                              "CFBundleCopyPrivateFrameworksURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-shared-frameworks-url
                              "CFBundleCopySharedFrameworksURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-shared-support-url
                              "CFBundleCopySharedSupportURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-built-in-plug-ins-url
                              "CFBundleCopyBuiltInPlugInsURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-info-dictionary-in-directory
                              "CFBundleCopyInfoDictionaryInDirectory"
                              :source)
                             ((bundle-url cf-url-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-package-info-in-directory
                              "CFBundleGetPackageInfoInDirectory"
                              :source)
                             ((url cf-url-ref)
                              (package-type (:pointer uint32))
                              (package-creator (:pointer uint32)))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resource-url
                              "CFBundleCopyResourceURL"
                              :source)
                             ((bundle cf-bundle-ref)
                              (resource-name cf-string-ref)
                              (resource-type cf-string-ref)
                              (sub-dir-name cf-string-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resource-urls-of-type
                              "CFBundleCopyResourceURLsOfType"
                              :source)
                             ((bundle cf-bundle-ref)
                              (resource-type cf-string-ref)
                              (sub-dir-name cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-localized-string
                              "CFBundleCopyLocalizedString"
                              :source)
                             ((bundle cf-bundle-ref)
                              (key cf-string-ref)
                              (value cf-string-ref)
                              (table-name cf-string-ref))
                             :result-type
                             cf-string-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resource-urlin-directory
                              "CFBundleCopyResourceURLInDirectory"
                              :source)
                             ((bundle-url cf-url-ref)
                              (resource-name cf-string-ref)
                              (resource-type cf-string-ref)
                              (sub-dir-name cf-string-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resource-urls-of-type-in-directory
                              "CFBundleCopyResourceURLsOfTypeInDirectory"
                              :source)
                             ((bundle-url cf-url-ref)
                              (resource-type cf-string-ref)
                              (sub-dir-name cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-bundle-localizations
                              "CFBundleCopyBundleLocalizations"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-preferred-localizations-from-array
                              "CFBundleCopyPreferredLocalizationsFromArray"
                              :source)
                             ((loc-array cf-array-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-localizations-for-preferences
                              "CFBundleCopyLocalizationsForPreferences"
                              :source)
                             ((loc-array cf-array-ref)
                              (pref-array cf-array-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resource-urlfor-localization
                              "CFBundleCopyResourceURLForLocalization"
                              :source)
                             ((bundle cf-bundle-ref)
                              (resource-name cf-string-ref)
                              (resource-type cf-string-ref)
                              (sub-dir-name cf-string-ref)
                              (localization-name cf-string-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-resource-urls-of-type-for-localization
                              "CFBundleCopyResourceURLsOfTypeForLocalization"
                              :source)
                             ((bundle cf-bundle-ref)
                              (resource-type cf-string-ref)
                              (sub-dir-name cf-string-ref)
                              (localization-name cf-string-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-info-dictionary-for-url
                              "CFBundleCopyInfoDictionaryForURL"
                              :source)
                             ((url cf-url-ref))
                             :result-type
                             cf-dictionary-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-localizations-for-url
                              "CFBundleCopyLocalizationsForURL"
                              :source)
                             ((url cf-url-ref))
                             :result-type
                             cf-array-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-executable-url
                              "CFBundleCopyExecutableURL"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-is-executable-loaded
                              "CFBundleIsExecutableLoaded"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-load-executable
                              "CFBundleLoadExecutable"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             :boolean
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-unload-executable
                              "CFBundleUnloadExecutable"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-function-pointer-for-name
                              "CFBundleGetFunctionPointerForName"
                              :source)
                             ((bundle cf-bundle-ref)
                              (function-name cf-string-ref))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-function-pointers-for-names
                              "CFBundleGetFunctionPointersForNames"
                              :source)
                             ((bundle cf-bundle-ref)
                              (function-names cf-array-ref)
                              (ftbl (:c-array (:pointer :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-data-pointer-for-name
                              "CFBundleGetDataPointerForName"
                              :source)
                             ((bundle cf-bundle-ref)
                              (symbol-name cf-string-ref))
                             :result-type
                             (:pointer :void)
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-data-pointers-for-names
                              "CFBundleGetDataPointersForNames"
                              :source)
                             ((bundle cf-bundle-ref)
                              (symbol-names cf-array-ref)
                              (stbl (:c-array (:pointer :void))))
                             :result-type
                             :void
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-copy-auxiliary-executable-url
                              "CFBundleCopyAuxiliaryExecutableURL"
                              :source)
                             ((bundle cf-bundle-ref)
                              (executable-name cf-string-ref))
                             :result-type
                             cf-url-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-get-plug-in
                              "CFBundleGetPlugIn"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             cf-plug-in-ref
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-open-bundle-resource-map
                              "CFBundleOpenBundleResourceMap"
                              :source)
                             ((bundle cf-bundle-ref))
                             :result-type
                             :short
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-open-bundle-resource-files
                              "CFBundleOpenBundleResourceFiles"
                              :source)
                             ((bundle cf-bundle-ref)
                              (ref-num (:pointer :short))
                              (localized-ref-num (:pointer :short)))
                             :result-type
                             sint32
                             :language
                             :ansi-c)
(fli:define-foreign-function (cf-bundle-close-bundle-resource-map
                              "CFBundleCloseBundleResourceMap"
                              :source)
                             ((bundle cf-bundle-ref) (ref-num :short))
                             :result-type
                             :void
                             :language
                             :ansi-c)
