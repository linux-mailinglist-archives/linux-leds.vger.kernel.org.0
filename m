Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683001F12F3
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 08:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgFHGja (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 02:39:30 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:58930 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726929AbgFHGja (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 02:39:30 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Jun 2020 02:39:28 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1591598369; x=1623134369;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=U5aWbGgfeLqvVdcOkQcSA+UTkQNRY5DfGB4faJBfE4Y=;
  b=pnsh1c1H03eMJPN7kyWzywdsf8agw/zqZ3o6X0+stXhi290Trb0vw4RE
   R9N0JFUI7EgiqbxEnMYktc6NzXDQcCPeJSwk+MpHIlKiHIQVGF9qFtzDd
   jWbrPCz8/QSxQu3dpXEe+hbiVMsrT6Qz9tvWl8KX3doymc86lztb9/nEV
   TGNS4MmKhp0ZckLFgh8FLkMOIQQW2jK9Iu8pmfRjrIIOXk3Rl6SxE0zxa
   wJ+r2clPpie0DuSY8mnRlr2THtcZNOf+hIgarVabDN3QBkMtaa634yVOx
   WY+ubZ0I0TBbecNSzzMN/hfyET/NSPFEHrFuCDuSsmLW1b0Px+JH+S1zL
   w==;
IronPort-SDR: zLZG1io8aNx3EVCTdX7Dgsr//Wk1KtXN2Dd8zpm1nBDtSjtk45PWiYP9wdkqNpSb5hM5FN+/99
 M3Wlod9c9r3Q==
X-IronPort-AV: E=Sophos;i="5.73,487,1583190000"; 
   d="scan'208";a="37682390"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
Thread-Topic: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
Thread-Index: AQHV+5H21uxgWjW9wEe6B/TzHpI386hLe6EAgAAeVQCAAZexgICBcsYA
Date:   Mon, 8 Jun 2020 06:32:14 +0000
Message-ID: <278a6d81562d4642631fa003c59c4e4876050f54.camel@diehl.com>
References: <20200316124851.6303-1-Denis.Osterland@diehl.com>
         <20200316124851.6303-3-Denis.Osterland@diehl.com>
         <bee4d31f-1f00-c621-f93c-f49207e406d6@gmail.com>
         <e2835f58aead3ca85ad47e9769b393addcd19f2a.camel@diehl.com>
         <13d593fb-053e-c6de-3237-ec3b6d1c82c5@gmail.com>
In-Reply-To: <13d593fb-053e-c6de-3237-ec3b6d1c82c5@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <C81CD59B97894247A79E3BF08DCD8F04@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc0t/f4F++sVEcJNEqmL6fJTpDG/iNVDZbUM0X2Br5ZWu
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgSmFjZWssDQoNCmlzIHlvdXIgYWNrIHN0aWxsIHZhbGlkIGZvciB0aGUgbmV3IHZlcnNp
b25zIG9mIHRoZSBwYXRjaC1zZXQ/DQpEdWUgdG8gdGhlIGNoYW5nZXMgSSBtYWRlLCBJIGFt
IG5vdCBzdXJlLg0KDQpSZWdhcmRzLCBEZW5pcw0KDQpBbSBEaWVuc3RhZywgZGVuIDE3LjAz
LjIwMjAsIDIxOjQzICswMTAwIHNjaHJpZWIgSmFjZWsgQW5hc3pld3NraToNCj4gSGkgRGVu
aXMsDQo+IA0KPiBPbiAzLzE2LzIwIDk6MjQgUE0sIERlbmlzIE9zdGVybGFuZC1IZWltIHdy
b3RlOg0KPiA+IEhpIEphY2VrLA0KPiA+IA0KPiA+IEFtIE1vbnRhZywgZGVuIDE2LjAzLjIw
MjAsIDE5OjM2ICswMTAwIHNjaHJpZWIgSmFjZWsgQW5hc3pld3NraToNCj4gPiA+IEhpIERl
bmlzLA0KPiA+ID4gDQo+ID4gPiBPbiAzLzE2LzIwIDE6NTMgUE0sIERlbmlzIE9zdGVybGFu
ZC1IZWltIHdyb3RlOg0KPiA+IA0KPiA+IC4uLg0KPiA+ID4gPiAgDQo+ID4gPiA+IEBAIC05
MiwxMyArOTYsMjcgQEAgc3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXYsDQo+ID4gPiA+ICANCj4gPiA+ID4gIAlw
d21faW5pdF9zdGF0ZShsZWRfZGF0YS0+cHdtLCAmbGVkX2RhdGEtPnB3bXN0YXRlKTsNCj4g
PiA+ID4gIA0KPiA+ID4gPiArCWlmIChsZWQtPmRlZmF1bHRfc3RhdGUgPT0gTEVEU19QV01f
REVGU1RBVEVfT04pDQo+ID4gPiA+ICsJCWxlZF9kYXRhLT5jZGV2LmJyaWdodG5lc3MgPSBs
ZWQtPm1heF9icmlnaHRuZXNzOw0KPiA+ID4gPiArCWVsc2UgaWYgKGxlZC0+ZGVmYXVsdF9z
dGF0ZSA9PSBMRURTX1BXTV9ERUZTVEFURV9LRUVQKSB7DQo+ID4gPiA+ICsJCXVpbnQ2NF90
IGJyaWdodG5lc3M7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJcHdtX2dldF9zdGF0ZShsZWRf
ZGF0YS0+cHdtLCAmbGVkX2RhdGEtPnB3bXN0YXRlKTsNCj4gPiA+IA0KPiA+ID4gVGhpcyBz
ZWVtcyB0byBub3QgYmUgcmVhZGluZyB0aGUgZGV2aWNlIHN0YXRlLCBpLmUuIHdoYXQgeW91
IHRyaWVkDQo+ID4gPiB0byBhZGRyZXNzIGJ5IGRpcmVjdCBjYWxsIHRvIHB3bS0+Y2hpcC0+
b3BzLT5nZXRfc3RhdGUoKSBiZWZvcmUuDQo+ID4gPiANCj4gPiA+IEFtIEkgbWlzc2luZyBz
b21ldGhpbmc/DQo+ID4gPiANCj4gPiANCj4gPiB3ZWxsLCBub3QgeW91LCBidXQgSSBtaXNz
ZWQgY2ZjNGMxODliYzcwYjFhY2MxN2U2ZjFhYmYxZGMxYzBhZTg5MGJkOC4NCj4gPiBTaW5j
ZSB0aGlzIGNvbW1pdCBwd21fZ2V0X3N0YXRlKCkgaXMgc3VmZmljaWVudC4NCj4gDQo+IEkg
YXNzdW1lIHlvdSB0ZXN0ZWQgaXQ/DQo+IA0KPiBXaXRoIHRoYXQsIGZvciB0aGUgd2hvbGUg
c2V0Og0KPiANCj4gQWNrZWQtYnk6IEphY2VrIEFuYXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdz
a2lAZ21haWwuY29tPg0KPiANCg0KDQpEaWVobCBDb25uZWN0aXZpdHkgU29sdXRpb25zIEdt
YkgNCkdlc2Now6RmdHNmw7xocnVuZzogSG9yc3QgTGVvbmJlcmdlcg0KU2l0eiBkZXIgR2Vz
ZWxsc2NoYWZ0OiBOw7xybmJlcmcgLSBSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0DQpO
w7xybmJlcmc6IEhSQiAzMjMxNQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQoNCkRlciBJbmhhbHQgZGVyIHZvcnN0ZWhlbmRlbiBFLU1haWwgaXN0
IG5pY2h0IHJlY2h0bGljaCBiaW5kZW5kLiBEaWVzZSBFLU1haWwgZW50aGFlbHQgdmVydHJh
dWxpY2hlIHVuZC9vZGVyIHJlY2h0bGljaCBnZXNjaHVldHp0ZSBJbmZvcm1hdGlvbmVuLg0K
SW5mb3JtaWVyZW4gU2llIHVucyBiaXR0ZSwgd2VubiBTaWUgZGllc2UgRS1NYWlsIGZhZWxz
Y2hsaWNoZXJ3ZWlzZSBlcmhhbHRlbiBoYWJlbi4gQml0dGUgbG9lc2NoZW4gU2llIGluIGRp
ZXNlbSBGYWxsIGRpZSBOYWNocmljaHQuDQpKZWRlIHVuZXJsYXVidGUgRm9ybSBkZXIgUmVw
cm9kdWt0aW9uLCBCZWthbm50Z2FiZSwgQWVuZGVydW5nLCBWZXJ0ZWlsdW5nIHVuZC9vZGVy
IFB1Ymxpa2F0aW9uIGRpZXNlciBFLU1haWwgaXN0IHN0cmVuZ3N0ZW5zIHVudGVyc2FndC4N
Ci0gSW5mb3JtYXRpb25lbiB6dW0gRGF0ZW5zY2h1dHosIGluc2Jlc29uZGVyZSB6dSBJaHJl
biBSZWNodGVuLCBlcmhhbHRlbiBTaWUgdW50ZXIgaHR0cHM6Ly93d3cuZGllaGwuY29tL2dy
b3VwL2RlL3RyYW5zcGFyZW56LXVuZC1pbmZvcm1hdGlvbnNwZmxpY2h0ZW4vDQoNClRoZSBj
b250ZW50cyBvZiB0aGUgYWJvdmUgbWVudGlvbmVkIGUtbWFpbCBpcyBub3QgbGVnYWxseSBi
aW5kaW5nLiBUaGlzIGUtbWFpbCBjb250YWlucyBjb25maWRlbnRpYWwgYW5kL29yIGxlZ2Fs
bHkgcHJvdGVjdGVkIGluZm9ybWF0aW9uLiBQbGVhc2UgaW5mb3JtIHVzIGlmIHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGJ5DQptaXN0YWtlIGFuZCBkZWxldGUgaXQgaW4gc3Vj
aCBhIGNhc2UuIEVhY2ggdW5hdXRob3JpemVkIHJlcHJvZHVjdGlvbiwgZGlzY2xvc3VyZSwg
YWx0ZXJhdGlvbiwgZGlzdHJpYnV0aW9uIGFuZC9vciBwdWJsaWNhdGlvbiBvZiB0aGlzIGUt
bWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiANCi0gRm9yIGdlbmVyYWwgaW5mb3JtYXRp
b24gb24gZGF0YSBwcm90ZWN0aW9uIGFuZCB5b3VyIHJlc3BlY3RpdmUgcmlnaHRzIHBsZWFz
ZSB2aXNpdCBodHRwczovL3d3dy5kaWVobC5jb20vZ3JvdXAvZW4vdHJhbnNwYXJlbmN5LWFu
ZC1pbmZvcm1hdGlvbi1vYmxpZ2F0aW9ucy8NCg==
