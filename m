Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E66A19F013
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 07:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDFFTj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 01:19:39 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:42583 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgDFFTj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 01:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1586150378; x=1617686378;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DZu4cjZn+8Zz6z5If3lrUwPovHIHamxcUqKZeREXRwM=;
  b=lHCymliHQOg+nwiYDjJpZydqR9Hg9rKmYQI8Da49xxrCCnuKJY0QZ/oG
   i+UsAK+vG6Ijk6fE2nbiSwplw4DB4+NSnNT8hCbOzB1wuxxJONV/BGMj0
   ne3S63sagB+dlS4a2KSglOcqxZWlkJh3RlTD7GeQ1Anb8II/Fq7ieHhq7
   Ikw2bEm+j1cNucYKEquFUF4ds0F2d95XtxfyX9eCGpsmVJptLNEkzPdXr
   va1kpxsXBZzuHQulsyXzJKptMXAbyZGbD3jZ3djKiZJ7xRi1C5PBqO/07
   JxUQBr+en7Mds+7XAhXxfhU29uPMoAp2DalOCQhgohPY0JerAuVU4FFW/
   A==;
IronPort-SDR: KtI6YbbtUtUqF6X+L0tlr878LuLjTSWNxI52Fm1d/LIB5fQkPmcriXJ81JbUIDjVAjTty7/aMg
 RlCzk+JmPOwQ==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Topic: [PATCH v4] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Index: AQHWAPNprlb/rYMY0E2oDLJ9oUB47qhrgnwA
Date:   Mon, 6 Apr 2020 05:19:35 +0000
Message-ID: <26714bffa300e3250f9428a5527b73c0ce510b78.camel@diehl.com>
References: <20200323091243.23140-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200323091243.23140-1-Denis.Osterland@diehl.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <933A5F708F93A149B3F24129FCE5671E@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: 415AWy8o668fDtCxszluz8eIfbDwhudhnoEqTJbjbfAEQO8jvcuOs56McsvXTIAh
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgUGF2ZWwsDQoNCmFyZSB5b3Ugd2lsbGluZyB0byBnaXZlIHRoaXMgcGF0Y2ggYSB0cnkg
aW4gZmF2b3Igb2YgMy81Pw0KT3Igc2hhbGwgSSByZXNlbnQgdGhlIGZpeGVkIHNlcmllcz8N
Cg0KUmVnYXJkcyBEZW5pcw0KDQpBbSBNb250YWcsIGRlbiAyMy4wMy4yMDIwLCAxMDoxNCAr
MDEwMCBzY2hyaWViIERlbmlzIE9zdGVybGFuZC1IZWltOg0KPiBsZWRfcHdtX3NldCgpIG5v
dyByZXR1cm5zIGFuIGVycm9yIHdoZW4gc2V0dGluZyB0aGUgUFdNIGZhaWxzLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogRGVuaXMgT3N0ZXJsYW5kLUhlaW0gPERlbmlzLk9zdGVybGFuZEBk
aWVobC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMgfCAxNiArKysr
KysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20u
YyBiL2RyaXZlcnMvbGVkcy9sZWRzLXB3bS5jDQo+IGluZGV4IDZjYWY4YmVhOGNkNS4uMDdl
YWIyZDhiN2M3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KPiAr
KysgYi9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KPiBAQCAtOTEsMTUgKzkxLDIxIEBAIHN0
YXRpYyBpbnQgbGVkX3B3bV9hZGQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbGVkX3B3
bV9wcml2ICpwcml2LA0KPiAgCXB3bV9pbml0X3N0YXRlKGxlZF9kYXRhLT5wd20sICZsZWRf
ZGF0YS0+cHdtc3RhdGUpOw0KPiAgDQo+ICAJcmV0ID0gZGV2bV9sZWRfY2xhc3NkZXZfcmVn
aXN0ZXIoZGV2LCAmbGVkX2RhdGEtPmNkZXYpOw0KPiAtCWlmIChyZXQgPT0gMCkgew0KPiAt
CQlwcml2LT5udW1fbGVkcysrOw0KPiAtCQlsZWRfcHdtX3NldCgmbGVkX2RhdGEtPmNkZXYs
IGxlZF9kYXRhLT5jZGV2LmJyaWdodG5lc3MpOw0KPiAtCX0gZWxzZSB7DQo+ICsJaWYgKHJl
dCkgew0KPiAgCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBQV00gbGVkIGZv
ciAlczogJWRcbiIsDQo+ICAJCQlsZWQtPm5hbWUsIHJldCk7DQo+ICsJCXJldHVybiByZXQ7
DQo+ICAJfQ0KPiAgDQo+IC0JcmV0dXJuIHJldDsNCj4gKwlyZXQgPSBsZWRfcHdtX3NldCgm
bGVkX2RhdGEtPmNkZXYsIGxlZF9kYXRhLT5jZGV2LmJyaWdodG5lc3MpOw0KPiArCWlmIChy
ZXQpIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gc2V0IGxlZCBQV00gdmFsdWUg
Zm9yICVzOiAlZCIsDQo+ICsJCQlsZWQtPm5hbWUsIHJldCk7DQo+ICsJCXJldHVybiByZXQ7
DQo+ICsJfQ0KPiArDQo+ICsJcHJpdi0+bnVtX2xlZHMrKzsNCj4gKwlyZXR1cm4gMDsNCj4g
IH0NCj4gIA0KPiAgc3RhdGljIGludCBsZWRfcHdtX2NyZWF0ZV9md25vZGUoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgbGVkX3B3bV9wcml2ICpwcml2KQ0KDQoNCkRpZWhsIENvbm5l
Y3Rpdml0eSBTb2x1dGlvbnMgR21iSA0KR2VzY2jDpGZ0c2bDvGhydW5nOiBIb3JzdCBMZW9u
YmVyZ2VyDQpTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IE7DvHJuYmVyZyAtIFJlZ2lzdGVyZ2Vy
aWNodDogQW10c2dlcmljaHQNCk7DvHJuYmVyZzogSFJCIDMyMzE1DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KRGVyIEluaGFsdCBkZXIgdm9y
c3RlaGVuZGVuIEUtTWFpbCBpc3QgbmljaHQgcmVjaHRsaWNoIGJpbmRlbmQuIERpZXNlIEUt
TWFpbCBlbnRoYWVsdCB2ZXJ0cmF1bGljaGUgdW5kL29kZXIgcmVjaHRsaWNoIGdlc2NodWV0
enRlIEluZm9ybWF0aW9uZW4uDQpJbmZvcm1pZXJlbiBTaWUgdW5zIGJpdHRlLCB3ZW5uIFNp
ZSBkaWVzZSBFLU1haWwgZmFlbHNjaGxpY2hlcndlaXNlIGVyaGFsdGVuIGhhYmVuLiBCaXR0
ZSBsb2VzY2hlbiBTaWUgaW4gZGllc2VtIEZhbGwgZGllIE5hY2hyaWNodC4NCkplZGUgdW5l
cmxhdWJ0ZSBGb3JtIGRlciBSZXByb2R1a3Rpb24sIEJla2FubnRnYWJlLCBBZW5kZXJ1bmcs
IFZlcnRlaWx1bmcgdW5kL29kZXIgUHVibGlrYXRpb24gZGllc2VyIEUtTWFpbCBpc3Qgc3Ry
ZW5nc3RlbnMgdW50ZXJzYWd0Lg0KLSBJbmZvcm1hdGlvbmVuIHp1bSBEYXRlbnNjaHV0eiwg
aW5zYmVzb25kZXJlIHp1IElocmVuIFJlY2h0ZW4sIGVyaGFsdGVuIFNpZSB1bnRlciBodHRw
czovL3d3dy5kaWVobC5jb20vZ3JvdXAvZGUvdHJhbnNwYXJlbnotdW5kLWluZm9ybWF0aW9u
c3BmbGljaHRlbi8NCg0KVGhlIGNvbnRlbnRzIG9mIHRoZSBhYm92ZSBtZW50aW9uZWQgZS1t
YWlsIGlzIG5vdCBsZWdhbGx5IGJpbmRpbmcuIFRoaXMgZS1tYWlsIGNvbnRhaW5zIGNvbmZp
ZGVudGlhbCBhbmQvb3IgbGVnYWxseSBwcm90ZWN0ZWQgaW5mb3JtYXRpb24uIFBsZWFzZSBp
bmZvcm0gdXMgaWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgYnkNCm1pc3Rha2Ug
YW5kIGRlbGV0ZSBpdCBpbiBzdWNoIGEgY2FzZS4gRWFjaCB1bmF1dGhvcml6ZWQgcmVwcm9k
dWN0aW9uLCBkaXNjbG9zdXJlLCBhbHRlcmF0aW9uLCBkaXN0cmlidXRpb24gYW5kL29yIHB1
YmxpY2F0aW9uIG9mIHRoaXMgZS1tYWlsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIA0KLSBG
b3IgZ2VuZXJhbCBpbmZvcm1hdGlvbiBvbiBkYXRhIHByb3RlY3Rpb24gYW5kIHlvdXIgcmVz
cGVjdGl2ZSByaWdodHMgcGxlYXNlIHZpc2l0IGh0dHBzOi8vd3d3LmRpZWhsLmNvbS9ncm91
cC9lbi90cmFuc3BhcmVuY3ktYW5kLWluZm9ybWF0aW9uLW9ibGlnYXRpb25zLw0K
