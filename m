Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7581810FF
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 07:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgCKGpe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 02:45:34 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:7714 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726160AbgCKGpd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Mar 2020 02:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1583909132; x=1615445132;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AVSxEPYhTVVwgokzOwC1Y8DPPDlYxY46v2+mPoqz3Ro=;
  b=dkaidGoUA4YE5fJiQo3qJlkQHykUqP2ewpB545c3M9R3KxJBNdehDD72
   BNXDrtlNT0iG13tr2fDNIDvsySSj6CAKA/j2k80wlCO45WJ4YhkUsWRYX
   3wzc6WNwTymi3r8EBh0PZ13159mkQVlI3lhKljZjFpcDgUNYX+NNOeqT8
   K7pdG6RCZMs1CEa6yuAXpoe8+DnvqkC9913yTWsWokAfPKJgmx0w7/ufX
   YwXbLYrAInOWsu8e/ivNWnsIMc/MtSplNyI59FcRABNuoM0rpOCfyyOX6
   9H/6YSz3Sf3Mll4g0FDEQK/TrD224WLuxf8qmO3AOUoUQUdvovKWe7pEX
   Q==;
IronPort-SDR: abGHozYKu3or4mTqZtBjvwWR274OjNZfLRCJUvY0vB+k0B0H6755hn/GldSHr6+Bxnk38t/2sZ
 fCimX2ZAzr9w==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] leds: pwm: add support for default-state device
 property
Thread-Topic: [PATCH v2] leds: pwm: add support for default-state device
 property
Thread-Index: AQHV9tn/0ZJlTn83ZkK/QE6qVZtMD6hB4AuAgABjeACAAJ9TgA==
Date:   Wed, 11 Mar 2020 06:45:30 +0000
Message-ID: <9e4bd43d14d00266bab4695dd37019bb1a103dd2.camel@diehl.com>
References: <20200310123126.4709-1-Denis.Osterland@diehl.com>
         <4c16da22994de29c2fbb23c877d55685bcbf8993.camel@diehl.com>
         <ccb718b2-d0e5-20d8-f30a-95f8f31a10ef@gmail.com>
In-Reply-To: <ccb718b2-d0e5-20d8-f30a-95f8f31a10ef@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <B85363EF575A434B91A849FC448B70BD@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: PkB65aL1SqtESF35r/jQn7eY91D7Yk3wyBdLEDkUNY69es5NQLe8SnvlyyctNNXu
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgSmFjZWssDQoNCkFtIERpZW5zdGFnLCBkZW4gMTAuMDMuMjAyMCwgMjI6MTUgKzAxMDAg
c2NocmllYiBKYWNlayBBbmFzemV3c2tpOg0KPiBIaSBEZW5pcywNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHVwZGF0ZS4gUGxlYXNlIGZpbmQgbXkgcmVtYXJrcyBiZWxvdy4NCj4gDQo+
IE9uIDMvMTAvMjAgNDoxOSBQTSwgRGVuaXMgT3N0ZXJsYW5kLUhlaW0gd3JvdGU6DQo+ID4g
SGksDQo+ID4gDQouLi4NCj4gPiA+IC0tLSBhL2RyaXZlcnMvbGVkcy9sZWRzLXB3bS5jDQo+
ID4gPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KPiA+ID4gQEAgLTc1LDcgKzc1
LDggQEAgc3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBsZWRfcHdtX3ByaXYgKnByaXYsDQo+ID4gPiAgCWxlZF9kYXRhLT5hY3RpdmVfbG93ID0g
bGVkLT5hY3RpdmVfbG93Ow0KPiA+ID4gIAlsZWRfZGF0YS0+Y2Rldi5uYW1lID0gbGVkLT5u
YW1lOw0KPiA+ID4gIAlsZWRfZGF0YS0+Y2Rldi5kZWZhdWx0X3RyaWdnZXIgPSBsZWQtPmRl
ZmF1bHRfdHJpZ2dlcjsNCj4gPiA+IC0JbGVkX2RhdGEtPmNkZXYuYnJpZ2h0bmVzcyA9IExF
RF9PRkY7DQo+ID4gPiArCXJldCA9IGxlZC0+ZGVmYXVsdF9zdGF0ZSA9PSBMRURTX0dQSU9f
REVGU1RBVEVfT047DQo+IA0KPiByZXQgaXMgZm9yIHJldHVybiB2YWx1ZSBhbmQgaXQgc2hv
dWxkIG5vdCBiZSB1c2VkIGZvciBhbnl0aGluZw0KPiBlbHNlIGp1c3QgYmVjYXVzZSBpdCBp
cyBhdCBoYW5kLiBBbHNvIExFRFNfR1BJTyogZGVmaW5pdGlvbnMgaGF2ZQ0KPiBub3RoaW5n
IHRvIGRvIHdpdGggcHdtIGxlZHMuIFRoaXMgaXMgbGVnYWN5IGJlY2F1c2UgZGVmYXVsdC1z
dGF0ZQ0KPiBwcm9wZXJ0eSB3YXMgcHJpbWFyaWx5IHNwZWNpZmljIHRvIGxlZHMtZ3BpbyBi
aW5kaW5ncyBhbmQgb25seQ0KPiBsYXRlciB3YXMgbWFkZSBjb21tb24uDQo+IA0KPiBQbGVh
c2UgaW50cm9kdWNlIGNvcnJlc3BvbmRpbmcgTEVEU19QV00gZGVmaW5pdGlvbnMsIGJ1dCBp
biBsZWRzLXB3bS5jLg0Kd2lsbCBjaGFuZ2UNCg0KPiANCj4gPiA+ICsJbGVkX2RhdGEtPmNk
ZXYuYnJpZ2h0bmVzcyA9IHJldCA/IGxlZC0+bWF4X2JyaWdodG5lc3MgOiBMRURfT0ZGOw0K
PiANCj4gSW5zdGVhZCBvZiBhYm92ZSB0d28gY2hhbmdlcyBJJ2QgYWRkIGJlbG93Og0KPiAN
Cj4gaWYgKGxlZC0+ZGVmYXVsdF9zdGF0ZSA9PSBMRURTX1BXTV9ERUZTVEFURV9PTikgew0K
PiAJbGVkX2RhdGEtPmNkZXYuYnJpZ2h0bmVzcyA9IGxlZC0+bWF4X2JyaWdodG5lc3M7DQo+
IH0gZWxzZSBpZiAobGVkLT5kZWZhdWx0X3N0YXRlID09IExFRFNfUFdNX0RFRlNUQVRFX0tF
RVApKSB7DQo+IAkvLyBoZXJlIHB1dCB3aGF0IHlvdSdyZSBhZGRpbmcgYmVsb3csIGJ1dCBw
bGVhc2UgdXNlDQo+IAkvLyBwd21fZ2V0X3N0YXRlKCkgaW5zdGVhZCBvZiBhY2Nlc3Npbmcg
b3BzIGRpcmVjdGx5DQo+IH0NCj4gDQo+IExFRF9PRkYgY2FzZSBpcyBjb3ZlcmVkIGJ5IGt6
YWxsb2MoKSBpbiBsZWRfcHdtX3Byb2JlKCkuDQpMb29rcyB2ZXJ5IGVsZWdhbnQsIEkgd2ls
bCBhcHBseSB0aGlzLg0KcHdtX2dldF9zdGF0ZSgpIGlzIG5vdCBzdWZmaWNpZW50IGhlcmUg
YmVjYXVzZSBpdCBvbmx5IHJldHVybnMgdGhlIHZhbHVlcyBmcm9tIHN0cnVjdHVyZSwNCndo
aWNoIHdlcmUgbm90IHJlYWQgcmVhZCBmcm9tIHJlZ2lzdGVycyBhdCBwd21fZGV2aWNlX3Jl
cXVlc3QoKS4NClNvbWV0aGluZyBsaWtlIHB3bV9nZXRfc3RhdGVfdW5jYWNoZWQoKSB3b3Vs
ZCBiZSByZXF1aXJlZCwgd2hpY2ggSSBoYXZlIG5vdCBmb3VuZCB5ZXQuDQoNCkkgbG9va2Vk
IGF0IHRoZSBhdG9taWMgUFdNIEFQSSAoNWVjODAzZWRjYjcwM2ZlMzc5ODM2ZjEzNTYwYjc5
ZGZhYzc5YjAxZCksDQp3aGljaCBjbGFpbXMgdG8gcHJvdmlkZSBhIHNtb290aCBoYW5kb3Zl
ciBmcm9tIGJvb3Rsb2FkZXIgdG8ga2VybmVsLg0KU28gaXQgc2VlbXMgaXQgd291bGQgYmUg
YmV0dGVyIHRvIGZpeCB0aGUgRklYTUUgZmlyc3QsIGluIGEgZmlyc3QgcGF0Y2guDQoNClJl
Z2FyZHMgRGVuaXMNCg0KPiANCj4gPiA+ICAJbGVkX2RhdGEtPmNkZXYubWF4X2JyaWdodG5l
c3MgPSBsZWQtPm1heF9icmlnaHRuZXNzOw0KPiA+ID4gIAlsZWRfZGF0YS0+Y2Rldi5mbGFn
cyA9IExFRF9DT1JFX1NVU1BFTkRSRVNVTUU7DQo+ID4gPiAgDQouLi4NCg0KDQoNCkRpZWhs
IENvbm5lY3Rpdml0eSBTb2x1dGlvbnMgR21iSA0KR2VzY2jDpGZ0c2bDvGhydW5nOiBIb3Jz
dCBMZW9uYmVyZ2VyDQpTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IE7DvHJuYmVyZyAtIFJlZ2lz
dGVyZ2VyaWNodDogQW10c2dlcmljaHQNCk7DvHJuYmVyZzogSFJCIDMyMzE1DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KRGVyIEluaGFsdCBk
ZXIgdm9yc3RlaGVuZGVuIEUtTWFpbCBpc3QgbmljaHQgcmVjaHRsaWNoIGJpbmRlbmQuIERp
ZXNlIEUtTWFpbCBlbnRoYWVsdCB2ZXJ0cmF1bGljaGUgdW5kL29kZXIgcmVjaHRsaWNoIGdl
c2NodWV0enRlIEluZm9ybWF0aW9uZW4uDQpJbmZvcm1pZXJlbiBTaWUgdW5zIGJpdHRlLCB3
ZW5uIFNpZSBkaWVzZSBFLU1haWwgZmFlbHNjaGxpY2hlcndlaXNlIGVyaGFsdGVuIGhhYmVu
LiBCaXR0ZSBsb2VzY2hlbiBTaWUgaW4gZGllc2VtIEZhbGwgZGllIE5hY2hyaWNodC4NCkpl
ZGUgdW5lcmxhdWJ0ZSBGb3JtIGRlciBSZXByb2R1a3Rpb24sIEJla2FubnRnYWJlLCBBZW5k
ZXJ1bmcsIFZlcnRlaWx1bmcgdW5kL29kZXIgUHVibGlrYXRpb24gZGllc2VyIEUtTWFpbCBp
c3Qgc3RyZW5nc3RlbnMgdW50ZXJzYWd0Lg0KLSBJbmZvcm1hdGlvbmVuIHp1bSBEYXRlbnNj
aHV0eiwgaW5zYmVzb25kZXJlIHp1IElocmVuIFJlY2h0ZW4sIGVyaGFsdGVuIFNpZSB1bnRl
ciBodHRwczovL3d3dy5kaWVobC5jb20vZ3JvdXAvZGUvdHJhbnNwYXJlbnotdW5kLWluZm9y
bWF0aW9uc3BmbGljaHRlbi8NCg0KVGhlIGNvbnRlbnRzIG9mIHRoZSBhYm92ZSBtZW50aW9u
ZWQgZS1tYWlsIGlzIG5vdCBsZWdhbGx5IGJpbmRpbmcuIFRoaXMgZS1tYWlsIGNvbnRhaW5z
IGNvbmZpZGVudGlhbCBhbmQvb3IgbGVnYWxseSBwcm90ZWN0ZWQgaW5mb3JtYXRpb24uIFBs
ZWFzZSBpbmZvcm0gdXMgaWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgYnkNCm1p
c3Rha2UgYW5kIGRlbGV0ZSBpdCBpbiBzdWNoIGEgY2FzZS4gRWFjaCB1bmF1dGhvcml6ZWQg
cmVwcm9kdWN0aW9uLCBkaXNjbG9zdXJlLCBhbHRlcmF0aW9uLCBkaXN0cmlidXRpb24gYW5k
L29yIHB1YmxpY2F0aW9uIG9mIHRoaXMgZS1tYWlsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQu
IA0KLSBGb3IgZ2VuZXJhbCBpbmZvcm1hdGlvbiBvbiBkYXRhIHByb3RlY3Rpb24gYW5kIHlv
dXIgcmVzcGVjdGl2ZSByaWdodHMgcGxlYXNlIHZpc2l0IGh0dHBzOi8vd3d3LmRpZWhsLmNv
bS9ncm91cC9lbi90cmFuc3BhcmVuY3ktYW5kLWluZm9ybWF0aW9uLW9ibGlnYXRpb25zLw0K
