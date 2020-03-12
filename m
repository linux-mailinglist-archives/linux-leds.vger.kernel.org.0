Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB471829AC
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2020 08:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388027AbgCLHZO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Mar 2020 03:25:14 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:5068 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387869AbgCLHZO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Mar 2020 03:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1583997912; x=1615533912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J4B2ajPGzNPBzhJPoWpe3dg4EPRxooVyV7W7B1Paxso=;
  b=SzeoIq58qEB1SNEgXqeYpYQpC9oSrvdM9AKhtcY653//AD537Zd+audH
   t3vuaAHg2YLhLImp4IZ5JHnZTI9lpdQQuw6s2DOdbdgYJeHPXZWtrKIhe
   wAR6nPtsKsanaLxt7M8FXH8mBS7n7FiqnU0UbWm4Tt7OTTK1nVMvPAGTp
   UUkcbpqGpjXeTRoXL90bK55036ziNtujVt6ZHLpHMWU7X+cjzyR02AO2G
   3U1oRQLolu4hulZFgNu1J8hC/toF3UgCUcT2aOLtIvWJ8LZWzCZoj9UXP
   lgxB0yc1n09PPjKJZWYZgvgsCiLiET3JRTSFNBfSPORZKTJrT9adn0Dt2
   w==;
IronPort-SDR: WKUCkgsNy2vrW7l5Xdu0w7vORGPy3zJzGlI7j1N+5BWVgYQKa2kYWvuqLvHo1pR4JbCs87Kjso
 EhJpMj33JQvw==
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
Thread-Index: AQHV9tn/0ZJlTn83ZkK/QE6qVZtMD6hB4AuAgABjeACAAJ9TgIABCOIAgACUhoA=
Date:   Thu, 12 Mar 2020 07:25:08 +0000
Message-ID: <7f267c4298a0108a562846bcef7012188c743118.camel@diehl.com>
References: <20200310123126.4709-1-Denis.Osterland@diehl.com>
         <4c16da22994de29c2fbb23c877d55685bcbf8993.camel@diehl.com>
         <ccb718b2-d0e5-20d8-f30a-95f8f31a10ef@gmail.com>
         <9e4bd43d14d00266bab4695dd37019bb1a103dd2.camel@diehl.com>
         <c8c23a9b-b468-b88b-17b2-4726de1f6ae3@gmail.com>
In-Reply-To: <c8c23a9b-b468-b88b-17b2-4726de1f6ae3@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <143CA685B8FA4646B453A806106960CB@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: PkB65aL1SqtESF35r/jQn8LdMDxe30TMLLBAS2IcrfJ3rMSy7PrM4+QgE2BSLTng
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgSmFjZWssDQoNCnRoYW5rcyBmb3IgdGhlIGhpbnQuDQpQZXJmZWt0ISBPbmUgdGhpbmcg
bGVzcyB0byBkbyA6RA0KDQpSZWdhcmRzIERlbmlzDQoNCkFtIE1pdHR3b2NoLCBkZW4gMTEu
MDMuMjAyMCwgMjM6MzMgKzAxMDAgc2NocmllYiBKYWNlayBBbmFzemV3c2tpOg0KPiBEZW5p
cywNCj4gDQo+IE9uIDMvMTEvMjAgNzo0NSBBTSwgRGVuaXMgT3N0ZXJsYW5kLUhlaW0gd3Jv
dGU6DQo+ID4gSGkgSmFjZWssDQo+ID4gDQo+ID4gQW0gRGllbnN0YWcsIGRlbiAxMC4wMy4y
MDIwLCAyMjoxNSArMDEwMCBzY2hyaWViIEphY2VrIEFuYXN6ZXdza2k6DQo+ID4gPiBIaSBE
ZW5pcywNCj4gPiA+IA0KPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgdXBkYXRlLiBQbGVhc2Ug
ZmluZCBteSByZW1hcmtzIGJlbG93Lg0KPiA+ID4gDQo+ID4gPiBPbiAzLzEwLzIwIDQ6MTkg
UE0sIERlbmlzIE9zdGVybGFuZC1IZWltIHdyb3RlOg0KPiA+ID4gPiBIaSwNCj4gPiA+ID4g
DQo+ID4gDQo+ID4gLi4uDQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9sZWRzL2xlZHMtcHdt
LmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KPiA+ID4gPiA+
IEBAIC03NSw3ICs3NSw4IEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9hZGQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgbGVkX3B3bV9wcml2ICpwcml2LA0KPiA+ID4gPiA+ICAJbGVkX2Rh
dGEtPmFjdGl2ZV9sb3cgPSBsZWQtPmFjdGl2ZV9sb3c7DQo+ID4gPiA+ID4gIAlsZWRfZGF0
YS0+Y2Rldi5uYW1lID0gbGVkLT5uYW1lOw0KPiA+ID4gPiA+ICAJbGVkX2RhdGEtPmNkZXYu
ZGVmYXVsdF90cmlnZ2VyID0gbGVkLT5kZWZhdWx0X3RyaWdnZXI7DQo+ID4gPiA+ID4gLQls
ZWRfZGF0YS0+Y2Rldi5icmlnaHRuZXNzID0gTEVEX09GRjsNCj4gPiA+ID4gPiArCXJldCA9
IGxlZC0+ZGVmYXVsdF9zdGF0ZSA9PSBMRURTX0dQSU9fREVGU1RBVEVfT047DQo+ID4gPiAN
Cj4gPiA+IHJldCBpcyBmb3IgcmV0dXJuIHZhbHVlIGFuZCBpdCBzaG91bGQgbm90IGJlIHVz
ZWQgZm9yIGFueXRoaW5nDQo+ID4gPiBlbHNlIGp1c3QgYmVjYXVzZSBpdCBpcyBhdCBoYW5k
LiBBbHNvIExFRFNfR1BJTyogZGVmaW5pdGlvbnMgaGF2ZQ0KPiA+ID4gbm90aGluZyB0byBk
byB3aXRoIHB3bSBsZWRzLiBUaGlzIGlzIGxlZ2FjeSBiZWNhdXNlIGRlZmF1bHQtc3RhdGUN
Cj4gPiA+IHByb3BlcnR5IHdhcyBwcmltYXJpbHkgc3BlY2lmaWMgdG8gbGVkcy1ncGlvIGJp
bmRpbmdzIGFuZCBvbmx5DQo+ID4gPiBsYXRlciB3YXMgbWFkZSBjb21tb24uDQo+ID4gPiAN
Cj4gPiA+IFBsZWFzZSBpbnRyb2R1Y2UgY29ycmVzcG9uZGluZyBMRURTX1BXTSBkZWZpbml0
aW9ucywgYnV0IGluIGxlZHMtcHdtLmMuDQo+ID4gDQo+ID4gd2lsbCBjaGFuZ2UNCj4gPiAN
Cj4gPiA+IA0KPiA+ID4gPiA+ICsJbGVkX2RhdGEtPmNkZXYuYnJpZ2h0bmVzcyA9IHJldCA/
IGxlZC0+bWF4X2JyaWdodG5lc3MgOiBMRURfT0ZGOw0KPiA+ID4gDQo+ID4gPiBJbnN0ZWFk
IG9mIGFib3ZlIHR3byBjaGFuZ2VzIEknZCBhZGQgYmVsb3c6DQo+ID4gPiANCj4gPiA+IGlm
IChsZWQtPmRlZmF1bHRfc3RhdGUgPT0gTEVEU19QV01fREVGU1RBVEVfT04pIHsNCj4gPiA+
IAlsZWRfZGF0YS0+Y2Rldi5icmlnaHRuZXNzID0gbGVkLT5tYXhfYnJpZ2h0bmVzczsNCj4g
PiA+IH0gZWxzZSBpZiAobGVkLT5kZWZhdWx0X3N0YXRlID09IExFRFNfUFdNX0RFRlNUQVRF
X0tFRVApKSB7DQo+ID4gPiAJLy8gaGVyZSBwdXQgd2hhdCB5b3UncmUgYWRkaW5nIGJlbG93
LCBidXQgcGxlYXNlIHVzZQ0KPiA+ID4gCS8vIHB3bV9nZXRfc3RhdGUoKSBpbnN0ZWFkIG9m
IGFjY2Vzc2luZyBvcHMgZGlyZWN0bHkNCj4gPiA+IH0NCj4gPiA+IA0KPiA+ID4gTEVEX09G
RiBjYXNlIGlzIGNvdmVyZWQgYnkga3phbGxvYygpIGluIGxlZF9wd21fcHJvYmUoKS4NCj4g
PiANCj4gPiBMb29rcyB2ZXJ5IGVsZWdhbnQsIEkgd2lsbCBhcHBseSB0aGlzLg0KPiA+IHB3
bV9nZXRfc3RhdGUoKSBpcyBub3Qgc3VmZmljaWVudCBoZXJlIGJlY2F1c2UgaXQgb25seSBy
ZXR1cm5zIHRoZSB2YWx1ZXMgZnJvbSBzdHJ1Y3R1cmUsDQo+ID4gd2hpY2ggd2VyZSBub3Qg
cmVhZCByZWFkIGZyb20gcmVnaXN0ZXJzIGF0IHB3bV9kZXZpY2VfcmVxdWVzdCgpLg0KPiA+
IFNvbWV0aGluZyBsaWtlIHB3bV9nZXRfc3RhdGVfdW5jYWNoZWQoKSB3b3VsZCBiZSByZXF1
aXJlZCwgd2hpY2ggSSBoYXZlIG5vdCBmb3VuZCB5ZXQuDQo+ID4gDQo+ID4gSSBsb29rZWQg
YXQgdGhlIGF0b21pYyBQV00gQVBJICg1ZWM4MDNlZGNiNzAzZmUzNzk4MzZmMTM1NjBiNzlk
ZmFjNzliMDFkKSwNCj4gPiB3aGljaCBjbGFpbXMgdG8gcHJvdmlkZSBhIHNtb290aCBoYW5k
b3ZlciBmcm9tIGJvb3Rsb2FkZXIgdG8ga2VybmVsLg0KPiA+IFNvIGl0IHNlZW1zIGl0IHdv
dWxkIGJlIGJldHRlciB0byBmaXggdGhlIEZJWE1FIGZpcnN0LCBpbiBhIGZpcnN0IHBhdGNo
Lg0KPiANCj4gSSBtaXNzZWQgdGhhdCBpdCdzIGJlZW4gcmVjZW50bHkgZG9uZS4gWW91J3Zl
IGdvdCB0byByZWJhc2Ugb250byBQYXZlbCdzDQo+IGZvci1uZXh0IGJyYW5jaCBbMF0uDQo+
IA0KPiBbMF0NCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcGF2ZWwvbGludXgtbGVkcy5naXQvbG9nLz9oPWZvci1uZXh0DQo+IA0KDQoNCkRp
ZWhsIENvbm5lY3Rpdml0eSBTb2x1dGlvbnMgR21iSA0KR2VzY2jDpGZ0c2bDvGhydW5nOiBI
b3JzdCBMZW9uYmVyZ2VyDQpTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IE7DvHJuYmVyZyAtIFJl
Z2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQNCk7DvHJuYmVyZzogSFJCIDMyMzE1DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KRGVyIEluaGFs
dCBkZXIgdm9yc3RlaGVuZGVuIEUtTWFpbCBpc3QgbmljaHQgcmVjaHRsaWNoIGJpbmRlbmQu
IERpZXNlIEUtTWFpbCBlbnRoYWVsdCB2ZXJ0cmF1bGljaGUgdW5kL29kZXIgcmVjaHRsaWNo
IGdlc2NodWV0enRlIEluZm9ybWF0aW9uZW4uDQpJbmZvcm1pZXJlbiBTaWUgdW5zIGJpdHRl
LCB3ZW5uIFNpZSBkaWVzZSBFLU1haWwgZmFlbHNjaGxpY2hlcndlaXNlIGVyaGFsdGVuIGhh
YmVuLiBCaXR0ZSBsb2VzY2hlbiBTaWUgaW4gZGllc2VtIEZhbGwgZGllIE5hY2hyaWNodC4N
CkplZGUgdW5lcmxhdWJ0ZSBGb3JtIGRlciBSZXByb2R1a3Rpb24sIEJla2FubnRnYWJlLCBB
ZW5kZXJ1bmcsIFZlcnRlaWx1bmcgdW5kL29kZXIgUHVibGlrYXRpb24gZGllc2VyIEUtTWFp
bCBpc3Qgc3RyZW5nc3RlbnMgdW50ZXJzYWd0Lg0KLSBJbmZvcm1hdGlvbmVuIHp1bSBEYXRl
bnNjaHV0eiwgaW5zYmVzb25kZXJlIHp1IElocmVuIFJlY2h0ZW4sIGVyaGFsdGVuIFNpZSB1
bnRlciBodHRwczovL3d3dy5kaWVobC5jb20vZ3JvdXAvZGUvdHJhbnNwYXJlbnotdW5kLWlu
Zm9ybWF0aW9uc3BmbGljaHRlbi8NCg0KVGhlIGNvbnRlbnRzIG9mIHRoZSBhYm92ZSBtZW50
aW9uZWQgZS1tYWlsIGlzIG5vdCBsZWdhbGx5IGJpbmRpbmcuIFRoaXMgZS1tYWlsIGNvbnRh
aW5zIGNvbmZpZGVudGlhbCBhbmQvb3IgbGVnYWxseSBwcm90ZWN0ZWQgaW5mb3JtYXRpb24u
IFBsZWFzZSBpbmZvcm0gdXMgaWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgYnkN
Cm1pc3Rha2UgYW5kIGRlbGV0ZSBpdCBpbiBzdWNoIGEgY2FzZS4gRWFjaCB1bmF1dGhvcml6
ZWQgcmVwcm9kdWN0aW9uLCBkaXNjbG9zdXJlLCBhbHRlcmF0aW9uLCBkaXN0cmlidXRpb24g
YW5kL29yIHB1YmxpY2F0aW9uIG9mIHRoaXMgZS1tYWlsIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIA0KLSBGb3IgZ2VuZXJhbCBpbmZvcm1hdGlvbiBvbiBkYXRhIHByb3RlY3Rpb24gYW5k
IHlvdXIgcmVzcGVjdGl2ZSByaWdodHMgcGxlYXNlIHZpc2l0IGh0dHBzOi8vd3d3LmRpZWhs
LmNvbS9ncm91cC9lbi90cmFuc3BhcmVuY3ktYW5kLWluZm9ybWF0aW9uLW9ibGlnYXRpb25z
Lw0K
