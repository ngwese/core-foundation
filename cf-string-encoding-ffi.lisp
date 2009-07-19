;;; -*- Mode: Lisp; Package: CORE-FOUNDATION; -*-
;;;
;;; ___ cf-string-encoding-ffi.lisp __________________________________
;;;
;;; $URL: https://mm1.local/svn/private/trunk/lib/lisp/core-foundation/cf-string-encoding-ffi.lisp $
;;; $Id: cf-string-encoding-ffi.lisp 210 2009-07-19 22:58:54Z greg $
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

;;; Derived from file : "/System/Library/Frameworks/CoreFoundation.framework/Headers/CFStringEncodingExt.h"

(fli:define-c-typedef (cf-string-encodings
                       (:foreign-name "CFStringEncodings"))
                      (:enum
                       (k-cf-string-encoding-mac-japanese 1)
                       (k-cf-string-encoding-mac-chinese-trad 2)
                       (k-cf-string-encoding-mac-korean 3)
                       (k-cf-string-encoding-mac-arabic 4)
                       (k-cf-string-encoding-mac-hebrew 5)
                       (k-cf-string-encoding-mac-greek 6)
                       (k-cf-string-encoding-mac-cyrillic 7)
                       (k-cf-string-encoding-mac-devanagari 9)
                       (k-cf-string-encoding-mac-gurmukhi 10)
                       (k-cf-string-encoding-mac-gujarati 11)
                       (k-cf-string-encoding-mac-oriya 12)
                       (k-cf-string-encoding-mac-bengali 13)
                       (k-cf-string-encoding-mac-tamil 14)
                       (k-cf-string-encoding-mac-telugu 15)
                       (k-cf-string-encoding-mac-kannada 16)
                       (k-cf-string-encoding-mac-malayalam 17)
                       (k-cf-string-encoding-mac-sinhalese 18)
                       (k-cf-string-encoding-mac-burmese 19)
                       (k-cf-string-encoding-mac-khmer 20)
                       (k-cf-string-encoding-mac-thai 21)
                       (k-cf-string-encoding-mac-laotian 22)
                       (k-cf-string-encoding-mac-georgian 23)
                       (k-cf-string-encoding-mac-armenian 24)
                       (k-cf-string-encoding-mac-chinese-simp 25)
                       (k-cf-string-encoding-mac-tibetan 26)
                       (k-cf-string-encoding-mac-mongolian 27)
                       (k-cf-string-encoding-mac-ethiopic 28)
                       (k-cf-string-encoding-mac-central-eur-roman 29)
                       (k-cf-string-encoding-mac-vietnamese 30)
                       (k-cf-string-encoding-mac-ext-arabic 31)
                       (k-cf-string-encoding-mac-symbol 33)
                       (k-cf-string-encoding-mac-dingbats 34)
                       (k-cf-string-encoding-mac-turkish 35)
                       (k-cf-string-encoding-mac-croatian 36)
                       (k-cf-string-encoding-mac-icelandic 37)
                       (k-cf-string-encoding-mac-romanian 38)
                       (k-cf-string-encoding-mac-celtic 39)
                       (k-cf-string-encoding-mac-gaelic 40)
                       (k-cf-string-encoding-mac-farsi 140)
                       (k-cf-string-encoding-mac-ukrainian 152)
                       (k-cf-string-encoding-mac-inuit 236)
                       (k-cf-string-encoding-mac-vt100 252)
                       (k-cf-string-encoding-mac-hfs 255)
                       (k-cf-string-encoding-isolatin2 514)
                       (k-cf-string-encoding-isolatin3 515)
                       (k-cf-string-encoding-isolatin4 516)
                       (k-cf-string-encoding-isolatin-cyrillic 517)
                       (k-cf-string-encoding-isolatin-arabic 518)
                       (k-cf-string-encoding-isolatin-greek 519)
                       (k-cf-string-encoding-isolatin-hebrew 520)
                       (k-cf-string-encoding-isolatin5 521)
                       (k-cf-string-encoding-isolatin6 522)
                       (k-cf-string-encoding-isolatin-thai 523)
                       (k-cf-string-encoding-isolatin7 525)
                       (k-cf-string-encoding-isolatin8 526)
                       (k-cf-string-encoding-isolatin9 527)
                       (k-cf-string-encoding-doslatin-us 1024)
                       (k-cf-string-encoding-dosgreek 1029)
                       (k-cf-string-encoding-dosbaltic-rim 1030)
                       (k-cf-string-encoding-doslatin1 1040)
                       (k-cf-string-encoding-dosgreek1 1041)
                       (k-cf-string-encoding-doslatin2 1042)
                       (k-cf-string-encoding-doscyrillic 1043)
                       (k-cf-string-encoding-dosturkish 1044)
                       (k-cf-string-encoding-dosportuguese 1045)
                       (k-cf-string-encoding-dosicelandic 1046)
                       (k-cf-string-encoding-doshebrew 1047)
                       (k-cf-string-encoding-doscanadian-french 1048)
                       (k-cf-string-encoding-dosarabic 1049)
                       (k-cf-string-encoding-dosnordic 1050)
                       (k-cf-string-encoding-dosrussian 1051)
                       (k-cf-string-encoding-dosgreek2 1052)
                       (k-cf-string-encoding-dosthai 1053)
                       (k-cf-string-encoding-dosjapanese 1056)
                       (k-cf-string-encoding-doschinese-simplif 1057)
                       (k-cf-string-encoding-doskorean 1058)
                       (k-cf-string-encoding-doschinese-trad 1059)
                       (k-cf-string-encoding-windows-latin2 1281)
                       (k-cf-string-encoding-windows-cyrillic 1282)
                       (k-cf-string-encoding-windows-greek 1283)
                       (k-cf-string-encoding-windows-latin5 1284)
                       (k-cf-string-encoding-windows-hebrew 1285)
                       (k-cf-string-encoding-windows-arabic 1286)
                       (k-cf-string-encoding-windows-baltic-rim 1287)
                       (k-cf-string-encoding-windows-korean-johab 1296)
                       (k-cf-string-encoding-windows-vietnamese 1288)
                       (k-cf-string-encoding-jis-x0201-76 1568)
                       (k-cf-string-encoding-jis-x0208-83 1569)
                       (k-cf-string-encoding-jis-x0208-90 1570)
                       (k-cf-string-encoding-jis-x0212-90 1571)
                       (k-cf-string-encoding-jis-c6226-78 1572)
                       (k-cf-string-encoding-shift-jis-x0213-00 1576)
                       (k-cf-string-encoding-gb-2312-80 1584)
                       (k-cf-string-encoding-gbk-95 1585)
                       (k-cf-string-encoding-gb-18030-2000 1586)
                       (k-cf-string-encoding-ksc-5601-87 1600)
                       (k-cf-string-encoding-ksc-5601-92-johab 1601)
                       (k-cf-string-encoding-cns-11643-92-p1 1617)
                       (k-cf-string-encoding-cns-11643-92-p2 1618)
                       (k-cf-string-encoding-cns-11643-92-p3 1619)
                       (k-cf-string-encoding-iso-2022-jp 2080)
                       (k-cf-string-encoding-iso-2022-jp-2 2081)
                       (k-cf-string-encoding-iso-2022-jp-1 2082)
                       (k-cf-string-encoding-iso-2022-jp-3 2083)
                       (k-cf-string-encoding-iso-2022-cn 2096)
                       (k-cf-string-encoding-iso-2022-cn-ext 2097)
                       (k-cf-string-encoding-iso-2022-kr 2112)
                       (k-cf-string-encoding-euc-jp 2336)
                       (k-cf-string-encoding-euc-cn 2352)
                       (k-cf-string-encoding-euc-tw 2353)
                       (k-cf-string-encoding-euc-kr 2368)
                       (k-cf-string-encoding-shift-jis 2561)
                       (k-cf-string-encoding-koi8-r 2562)
                       (k-cf-string-encoding-big5 2563)
                       (k-cf-string-encoding-mac-roman-latin1 2564)
                       (k-cf-string-encoding-hz-gb-2312 2565)
                       (k-cf-string-encoding-big5-hkscs-1999 2566)
                       (k-cf-string-encoding-ebcdic-us 3073)
                       (k-cf-string-encoding-ebcdic-cp037 3074)))
