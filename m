Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E501873F6
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2020 21:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732529AbgCPUZL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Mar 2020 16:25:11 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:31743 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732505AbgCPUZL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Mar 2020 16:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584390309; x=1615926309;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oEuZ697fpN3VMiiWha7d/Dl3C5sMFsmwp8ShroavJmw=;
  b=NHilyZgvlF3Wn55rWsGajrL9Qz7VDm2J57lXvsjsO4c+JVz1cBmowP6p
   KJi46H3kz53u1PmE/ceoU3JcDrzzoAngzK0qWJ4Z3LY1We+W7blfoP1S5
   qREYsYfqqqK0Xo2LI9B0cWk7l4yosIwS4TbpDLa8DWzYG63WlXKj4/g6P
   vd1f/YcOLcmJhVCCRdYc6sLu+Shna/WNzG71sj+BdAr4yuYhEFW6CeWog
   NY4/ISzIVNI36Q7Uv0TXuZ4HpW7Pek9+HH2kPy+Tu7ltOgCLCUzXL7niP
   mbP3zXIPlaa9jVL1MUPlLFJ9wt66xZo3oXcvdkRXl0Z+y7ApVAKPl7P7p
   w==;
IronPort-SDR: yBwmUqifiKg6kNQNTp+cKxWFKvqwKQHMEx/aUrgwCJ/Moc08X36jPPRJ+ai0g66+KevvbKZ6JX
 rNgpUqz0JUDA==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
Thread-Topic: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
Thread-Index: AQHV+5H21uxgWjW9wEe6B/TzHpI386hLe6EAgAAeVQA=
Date:   Mon, 16 Mar 2020 20:24:48 +0000
Message-ID: <e2835f58aead3ca85ad47e9769b393addcd19f2a.camel@diehl.com>
References: <20200316124851.6303-1-Denis.Osterland@diehl.com>
         <20200316124851.6303-3-Denis.Osterland@diehl.com>
         <bee4d31f-1f00-c621-f93c-f49207e406d6@gmail.com>
In-Reply-To: <bee4d31f-1f00-c621-f93c-f49207e406d6@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <91C99D695C10214E93AE3AE8B7A09929@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: byQFdw3ukCM+zy1/poiPcwvMiO0gPpQfBgEl6CP/J6HYOXhaUBXefvRQ1Zrwlkv4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgSmFjZWssDQoNCkFtIE1vbnRhZywgZGVuIDE2LjAzLjIwMjAsIDE5OjM2ICswMTAwIHNj
aHJpZWIgSmFjZWsgQW5hc3pld3NraToNCj4gSGkgRGVuaXMsDQo+IA0KPiBPbiAzLzE2LzIw
IDE6NTMgUE0sIERlbmlzIE9zdGVybGFuZC1IZWltIHdyb3RlOg0KLi4uDQo+ID4gIA0KPiA+
IEBAIC05MiwxMyArOTYsMjcgQEAgc3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXYsDQo+ID4gIA0KPiA+ICAJcHdt
X2luaXRfc3RhdGUobGVkX2RhdGEtPnB3bSwgJmxlZF9kYXRhLT5wd21zdGF0ZSk7DQo+ID4g
IA0KPiA+ICsJaWYgKGxlZC0+ZGVmYXVsdF9zdGF0ZSA9PSBMRURTX1BXTV9ERUZTVEFURV9P
TikNCj4gPiArCQlsZWRfZGF0YS0+Y2Rldi5icmlnaHRuZXNzID0gbGVkLT5tYXhfYnJpZ2h0
bmVzczsNCj4gPiArCWVsc2UgaWYgKGxlZC0+ZGVmYXVsdF9zdGF0ZSA9PSBMRURTX1BXTV9E
RUZTVEFURV9LRUVQKSB7DQo+ID4gKwkJdWludDY0X3QgYnJpZ2h0bmVzczsNCj4gPiArDQo+
ID4gKwkJcHdtX2dldF9zdGF0ZShsZWRfZGF0YS0+cHdtLCAmbGVkX2RhdGEtPnB3bXN0YXRl
KTsNCj4gDQo+IFRoaXMgc2VlbXMgdG8gbm90IGJlIHJlYWRpbmcgdGhlIGRldmljZSBzdGF0
ZSwgaS5lLiB3aGF0IHlvdSB0cmllZA0KPiB0byBhZGRyZXNzIGJ5IGRpcmVjdCBjYWxsIHRv
IHB3bS0+Y2hpcC0+b3BzLT5nZXRfc3RhdGUoKSBiZWZvcmUuDQo+IA0KPiBBbSBJIG1pc3Np
bmcgc29tZXRoaW5nPw0KPiANCg0Kd2VsbCwgbm90IHlvdSwgYnV0IEkgbWlzc2VkIGNmYzRj
MTg5YmM3MGIxYWNjMTdlNmYxYWJmMWRjMWMwYWU4OTBiZDguDQpTaW5jZSB0aGlzIGNvbW1p
dCBwd21fZ2V0X3N0YXRlKCkgaXMgc3VmZmljaWVudC4NCg0KUmVnYXJkcyBEZW5pcw0KDQoN
Cg0KRGllaGwgQ29ubmVjdGl2aXR5IFNvbHV0aW9ucyBHbWJIDQpHZXNjaMOkZnRzZsO8aHJ1
bmc6IEhvcnN0IExlb25iZXJnZXINClNpdHogZGVyIEdlc2VsbHNjaGFmdDogTsO8cm5iZXJn
IC0gUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodA0KTsO8cm5iZXJnOiBIUkIgMzIzMTUN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQpEZXIg
SW5oYWx0IGRlciB2b3JzdGVoZW5kZW4gRS1NYWlsIGlzdCBuaWNodCByZWNodGxpY2ggYmlu
ZGVuZC4gRGllc2UgRS1NYWlsIGVudGhhZWx0IHZlcnRyYXVsaWNoZSB1bmQvb2RlciByZWNo
dGxpY2ggZ2VzY2h1ZXR6dGUgSW5mb3JtYXRpb25lbi4NCkluZm9ybWllcmVuIFNpZSB1bnMg
Yml0dGUsIHdlbm4gU2llIGRpZXNlIEUtTWFpbCBmYWVsc2NobGljaGVyd2Vpc2UgZXJoYWx0
ZW4gaGFiZW4uIEJpdHRlIGxvZXNjaGVuIFNpZSBpbiBkaWVzZW0gRmFsbCBkaWUgTmFjaHJp
Y2h0Lg0KSmVkZSB1bmVybGF1YnRlIEZvcm0gZGVyIFJlcHJvZHVrdGlvbiwgQmVrYW5udGdh
YmUsIEFlbmRlcnVuZywgVmVydGVpbHVuZyB1bmQvb2RlciBQdWJsaWthdGlvbiBkaWVzZXIg
RS1NYWlsIGlzdCBzdHJlbmdzdGVucyB1bnRlcnNhZ3QuDQotIEluZm9ybWF0aW9uZW4genVt
IERhdGVuc2NodXR6LCBpbnNiZXNvbmRlcmUgenUgSWhyZW4gUmVjaHRlbiwgZXJoYWx0ZW4g
U2llIHVudGVyIGh0dHBzOi8vd3d3LmRpZWhsLmNvbS9ncm91cC9kZS90cmFuc3BhcmVuei11
bmQtaW5mb3JtYXRpb25zcGZsaWNodGVuLw0KDQpUaGUgY29udGVudHMgb2YgdGhlIGFib3Zl
IG1lbnRpb25lZCBlLW1haWwgaXMgbm90IGxlZ2FsbHkgYmluZGluZy4gVGhpcyBlLW1haWwg
Y29udGFpbnMgY29uZmlkZW50aWFsIGFuZC9vciBsZWdhbGx5IHByb3RlY3RlZCBpbmZvcm1h
dGlvbi4gUGxlYXNlIGluZm9ybSB1cyBpZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBieQ0KbWlzdGFrZSBhbmQgZGVsZXRlIGl0IGluIHN1Y2ggYSBjYXNlLiBFYWNoIHVuYXV0
aG9yaXplZCByZXByb2R1Y3Rpb24sIGRpc2Nsb3N1cmUsIGFsdGVyYXRpb24sIGRpc3RyaWJ1
dGlvbiBhbmQvb3IgcHVibGljYXRpb24gb2YgdGhpcyBlLW1haWwgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZC4gDQotIEZvciBnZW5lcmFsIGluZm9ybWF0aW9uIG9uIGRhdGEgcHJvdGVjdGlv
biBhbmQgeW91ciByZXNwZWN0aXZlIHJpZ2h0cyBwbGVhc2UgdmlzaXQgaHR0cHM6Ly93d3cu
ZGllaGwuY29tL2dyb3VwL2VuL3RyYW5zcGFyZW5jeS1hbmQtaW5mb3JtYXRpb24tb2JsaWdh
dGlvbnMvDQo=
