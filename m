Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9D13387DB
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 09:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhCLItW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Mar 2021 03:49:22 -0500
Received: from smtp2.axis.com ([195.60.68.18]:44889 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232184AbhCLIs4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 12 Mar 2021 03:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615538937;
  x=1647074937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NnrDffoFIBIEEVD+TlZrRH1xPyA/UBhxcH1DLUJ4ICE=;
  b=fUqcXzVsDFN/wRFXulBXwHSah/Uox9YqpQ/4i0KCYbzMUbPGhOlLsM44
   feeGTiIttk9ulqXLHgYIOqGlnGhF6HyLkBISIjGRDe8gCenWKNC+Rta9R
   wfs5a1VyzGkm4UW3SOQ220+dEq9kpEEbBQRxpUT6WxsWz1auCAgp8+EIj
   t1A/ck+1Cu+t6vpFpU4MhQa0za8k0c3NeQb90BrwE06dJagfRKoLMOGlM
   VUOAIkty3UrDXc3wYVy78HTcu9ER3lE0tLf0MLMIg5Zf9gXsXheCQqBlR
   vAo/N4axrysu5r6iSCRvi7/+27Cm1xg5w/gPMcWHbay9pHPK6A+1VKYE7
   A==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Alexander Dahl <ada@thorsis.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Behun <marek.behun@nic.cz>
Subject: RE: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Thread-Topic: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Thread-Index: AQHXFnc53ECqmB4gek68ETSLZV586Kp/9qIAgAAS0fA=
Date:   Fri, 12 Mar 2021 08:48:55 +0000
Message-ID: <e56946d1d85948c7b6ce94982a221981@XBOX03.axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
 <2315048.uTtSMl1LR1@ada>
In-Reply-To: <2315048.uTtSMl1LR1@ada>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgQWxleGFuZGVyLA0KDQo+IEFtIERvbm5lcnN0YWcsIDExLiBNw6RyeiAyMDIxLCAxNDowNDow
OCBDRVQgc2NocmllYiBIZXJtZXMgWmhhbmc6DQo+ID4gRnJvbTogSGVybWVzIFpoYW5nIDxjaGVu
aHVpekBheGlzLmNvbT4NCj4gPg0KPiA+IEludHJvZHVjZSBhIG5ldyBEdWFsIEdQSU8gTEVEIGRy
aXZlci4gVGhlc2UgdHdvIEdQSU9zIExFRCB3aWxsIGFjdCBhcw0KPiA+IG9uZSBMRUQgYXMgbm9y
bWFsIEdQSU8gTEVEIGJ1dCBnaXZlIHRoZSBwb3NzaWJpbGl0eSB0byBjaGFuZ2UgdGhlDQo+ID4g
aW50ZW5zaXR5IGluIGZvdXIgbGV2ZWxzOiBPRkYsIExPVywgTUlERExFIGFuZCBISUdILg0KPiAN
Cj4gSW50ZXJlc3RpbmcgdXNlIGNhc2UuIElzIHRoZXJlIGFueSByZWFsIHdvcmxkIGhhcmR3YXJl
IHdpcmVkIGxpa2UgdGhhdCB5b3UNCj4gY291bGQgcG9pbnQgdG8/DQo+IA0KDQpZZXMsIHdlIGhh
dmUgdGhlIEhXLCBpdCdzIG5vdCBhIGNoaXAgYnV0IGp1c3Qgc29tZSBjaXJjdWl0IHRvIG1hZGUg
b2YuDQogDQo+ID4gK2NvbmZpZyBMRURTX0RVQUxfR1BJTw0KPiA+ICsJdHJpc3RhdGUgIkxFRCBT
dXBwb3J0IGZvciBEdWFsIEdQSU8gY29ubmVjdGVkIExFRHMiDQo+ID4gKwlkZXBlbmRzIG9uIExF
RFNfQ0xBU1MNCj4gPiArCWRlcGVuZHMgb24gR1BJT0xJQiB8fCBDT01QSUxFX1RFU1QNCj4gPiAr
CWhlbHANCj4gPiArCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgdHdvIExF
RHMgY29ubmVjdGVkIHRvIEdQSU8NCj4gPiArCSAgb3V0cHV0cy4gVGhlc2UgdHdvIEdQSU8gTEVE
cyBhY3QgYXMgb25lIExFRCBpbiB0aGUgc3lzZnMgYW5kDQo+ID4gKwkgIHBlcmZvcm0gZGlmZmVy
ZW50IGludGVuc2l0eSBieSBlbmFibGUgZWl0aGVyIG9uZSBvZiB0aGVtIG9yIGJvdGguDQo+IA0K
PiBXZWxsLCBhbHRob3VnaCBJIG5ldmVyIGhhZCB0aW1lIHRvIGltcGxlbWVudCB0aGF0LCBJIHN1
c3BlY3QgdGhhdCBjb3VsZA0KPiBjb25mbGljdCBpZiBzb21lb25lIHdpbGwgZXZlbnR1YWxseSB3
cml0ZSBhIGRyaXZlciBmb3IgdHdvIHBpbiBkdWFsIGNvbG9yIExFRHMNCj4gY29ubmVjdGVkIHRv
IEdQSU8gcGlucy4gIFdlIGFjdHVhbGx5IGRvIHRoYXQgb24gb3VyIGhhcmR3YXJlIGFuZCBJIGtu
b3cNCj4gb3RoZXJzIGRvLCB0b28uDQo+IA0KPiBJIGFza2VkIGFib3V0IHRoYXQgYmFjayBpbiAy
MDE5LCBzZWUgdGhpcyB0aHJlYWQ6DQo+IA0KPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9saW51eC1sZWRzL21zZzExNjY1Lmh0bWwNCj4gDQo+IEF0IHRoZSB0aW1lIHRoZSBtdWx0aWNv
bG9yIGZyYW1ld29yayB3YXMgbm90IHlldCBtZXJnZWQsIHNvIHRvZGF5IEkgd291bGQNCj4gcHJv
YmFibHkgbWFrZSBzb21ldGhpbmcgd2hpY2ggZWl0aGVyIHVzZXMgdGhlIG11bHRpY29sb3IgZnJh
bWV3b3JrIG9yIGF0DQo+IGxlYXN0IGhhcyBhIHNpbWlsYXIgaW50ZXJmYWNlIHRvIHVzZXJzcGFj
ZS4gSG93ZXZlciwgaXQgcHJvYmFibHkgd29uJ3Qgc3VycHJpc2UNCj4geW91IGFsbCwgdGhpcyBp
cyBub3QgaGlnaGVzdCBwcmlvcml0eSBvbiBteSBUb0RvIGxpc3QuIDstKQ0KPiANCj4gKFdoYXQg
d2UgYWN0dWFsbHkgZG8gaXMgcHJldGVuZCB0aG9zZSBhcmUgc2VwYXJhdGUgTEVEcyBhbmQgaWdu
b3JlIHRoZQ0KPiBjb25mbGljdGluZyBjYXNlIHdoZXJlIGJvdGggR1BJT3MgYXJlIG9uIGFuZCB0
aGUgTEVEIGlzIGRhcmsgdGhlbi4pDQo+IA0KDQpZZXMsIHRoYXQgY2FzZSBzZWVtcyBjb25mbGlj
dCB3aXRoIG1pbmUsIHRoZSBwYXR0ZXJuIGZvciBtZSBpcyBsaWtlOg0KDQpQMSB8IFAyIHwgTEVE
DQotLSArIC0tICsgLS0tLS0NCiAwIHwgIDAgfCBvZmYNCiAwIHwgIDEgfCBBbnkgY29sb3INCiAx
IHwgIDAgfCBBbnkgY29sb3INCiAxIHwgIDEgfCBib3RoIG9uDQoNCk5vdyBJJ20gaW52ZXN0aWdh
dGUgYW5vdGhlciB3YXkgZnJvbSBNYXJlaydzIHN1Z2dlc3Rpb24gYnkgdXNpbmcgUkVHVUxBVE9S
X0dQSU8sIHRvIHNlZSBpZiBjb3VsZCBtZWV0IG15IHJlcXVpcmVtZW50LiBJZiB5ZXMsIHRoZW4g
SSBkbyB0aGluayBubyBuZXcgIGRyaXZlciBpcyBuZWVkZWQuDQoNCkJlc3QgUmVnYXJkcywNCkhl
cm1lcw0KDQo=
