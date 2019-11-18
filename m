Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554621002A4
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 11:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRKib (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 05:38:31 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:50812 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRKib (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 05:38:31 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-33-5dd274a5829f
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 93.B6.08102.5A472DD5; Mon, 18 Nov 2019 11:38:29 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 18 Nov 2019 11:38:17 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "info@metux.net" <info@metux.net>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 0/5] leds: Add DT node finding and parsing to core
Thread-Topic: [RFC PATCH 0/5] leds: Add DT node finding and parsing to core
Thread-Index: AQHVjlbfnKGQ2A80TEuw50r1eox3kqeQtb4AgAAVbAA=
Date:   Mon, 18 Nov 2019 10:38:16 +0000
Message-ID: <946f091e79242b9e71d5ce8ad12c899feefa22cd.camel@fi.rohmeurope.com>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
         <ed000cda-3138-3172-1b4c-586b5bfd8d72@metux.net>
In-Reply-To: <ed000cda-3138-3172-1b4c-586b5bfd8d72@metux.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B15809EE67717246A3283AB86CCE6A6D@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUgUYRjmm5nd/TwmPqet/VrLaiLCJLfCH0OnP5JWA8ssgmizMSdnSXdl
        dg0ria2QUhczqLStLNJNs9ssjzJisxu2wy6JRewClwrpwEqy5msq/TXPPMf7vPC9kOYO6c3Q
        7nBLikPM4/WRzPWGwQsz/O7Htpn1ZxKFo51BnVB+v1kndG+/QgkvL51nhK72w3rh0vuzQPA/
        f0QJh/13GCF076ZeKOnoNCRHWk/XnAbWNl/IYG1qLNVbK/s/6K23X7RQ1oZTAwbr56a4ZYbV
        UfOyRfemTHuuw7JgXZQculZDFVSPKxos2WHwgE5cBiIgRkm4y/OTLgORkENPAW5s22XQfu4A
        fCywnSoDEOrRPFzWbSABI1qLPRe/6YiHRtU0/ljV/kcYjdJwaaiC1kxLcPuPyzTJGtEcXOOV
        Cc2gqbi0sV5HMIvScd25Zzpi4VARrqg3EToCzccnaob0BAM0AZd6PlIE08iEm94N6LSdEa67
        +oDW8Bjc93roL8/jju+9DBlJo3h8rt2iRZPx131BoOHJeF95r0HbIAbfPfiGqQRjfSMafMNp
        34i0b0TaNyJ9DOgaAc4X7Xm5olualahIhYmKU85XP+ud+U1Ae+wvreBXIDUAKAgCYByk+DHs
        xIWPbNyobGfOZll0yVlKYZ7kCgAMad7Ipr96aOPYHHHzFklx/pNiIcOb2Gm9e20cIl0bJalA
        Uv6p4yHkMbtTeWzjYhQpVyraYM9zD8sUjCDDI81Gl+TIkRSx0C1nkevIcqnnQaRotZdzqXHW
        VSDmq6wWvQcSYGXfkeM07DziP05zjMPpkMwmNjletSJilQsd/4vCwAQBP5p9QvaIVi/+/5yw
        WkGpFQmtQVLhFoclswekb9tRm2Jdlfos9CTotS3flhTd9T4c7umJjVtztMSfs9+WKBenNadW
        hrbqlkYvsfTuStotZOy9tcd4dor37Qd3ZpUlyK9cE14x+Wsglh1I+RYzCClzw+I9tzfaJ32K
        z0iImD83bMlqqz6QbmpuKS/uWBS388bJlrTi2VVeb39teAvPuGRx1nRacYm/AVkuD5auAwAA
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGVsbG8gRW5yaWNvICYgQWxsLA0KDQpGaXJzdCBvZiBhbGwgLSB0aGFua3MgZm9yIHNob3dpbmcg
dGhlIGludGVyZXN0IDpdIEkgYW0gaGFwcHkga25vd2luZw0Kc29tZW9uZSBhY3R1YWxseSB3YXMg
aW50ZXJlc3RlZCBhYm91dCB0aGUgUkZDIDopDQoNCk9uIE1vbiwgMjAxOS0xMS0xOCBhdCAxMDoy
MSArMDEwMCwgRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQNCndyb3RlOg0KPiBIaSwN
Cj4gDQo+IA0KPiA+IFRoZSB0aGluZyBpcyB0aGF0DQo+ID4gdGhpcyBhcHByb2FjaCByZXF1aXJl
cyB0aGUgTEVEIGNvbnRyb2xsZXIgYmluZGluZyB0byBkaWN0YXRlDQo+ID4gYWxsb3dlZA0KPiA+
IExFRCBub2RlIG5hbWVzIC0gd2hpY2ggbWF5IG9yIG1heSBub3QgYmUgZG9hYmxlLiBJIG5lZWQg
eW91ciBoZWxwDQo+ID4gdG8NCj4gPiBldmFsdWF0ZSB0aGlzIGFuZCBzdWdnZXN0IGJldHRlciBv
cHRpb25zIDopDQo+IA0KPiBldmVuIHRob3VnaCBJIGxpa2UgdGhlIGlkZWEgb2YgY29udmVudGlv
bi1vdmVyLWNvZGUsIGJ1dCBpZiB0aGF0J3MNCj4gY2hhbmdpbmcgYWxsb3dlZCBMRUQgbmFtZXMg
dGhhdCB3b3VsZCByaXNrIGJyZWFraW5nIHRoaW5ncywgZWc6DQo+IA0KPiBhKSBleGlzdGluZyBE
VCdzIChpbiB0aGUgZmllbGQpIGJlY29tZSBpbmNvbXBhdGlibGUgd2l0aCBuZXdlcg0KPiAgICBr
ZXJuZWwgdmVyc2lvbnMNCg0KVGhpcyB3YXMgbXkgbWFpbiBjb25jZXJuLiBUaGlzIG9mIGNvdXJz
ZSB3b3VsZCBub3QgbWVhbiB0aGF0IHdlIGNvdWxkDQpub3QgdGFrZSB0aGlzIGFwcHJvYWNoIGZv
ciBuZXcgTEVEIGNvbnRyb2xsZXIgZHJpdmVycyAtIGJ1dCB0aGF0IHdvdWxkDQoocHJvYmFibHkp
IGxlYWQgdG8gZHVhbCBsZWQgcmVnaXN0cmF0aW9uIGludGVyZmFjZSAtIG9uZSBmb3IgY3VycmVu
dA0KYXBwcm9hY2ggd2hlcmUgTEVEIGRyaXZlcnMgZG8gYWxsIHRoZSBkaXJ0eSB3b3JrIHRoZW1z
ZWxmIC0gYW5kIHBhcnNlDQp0aGUgRFQgLSBvbmUgZm9yIG5ldyBkcml2ZXJzIHdoaWNoIGNvdWxk
IGxlYXZlIERUIHBhcnNpbmcgdG8gTEVEIGNvcmUuDQoNCj4gYikgZXhpc3RpbmcgdXNlcmxhbmRz
IHRoYXQgcmVseSBvbiBzcGVpY2lmaWMgTEVEIG5hbWVzIGJlY29tZQ0KPiAgICBpbmNvbWF0aWJs
ZSB3aXRoIG5ld2VyIGtlcm5lbCB2ZXJzaW9ucy4NCg0KSSBkaWRuJ3QgZXZlbiB0aGluayB0aGlz
IGZhciwgYnV0IHllcywgSSBzZWUuLi4gTEVEIG5vZGUgbmFtZSBtaWdodCBiZQ0KcmVmbGVjdGVk
IGluIHVzZXItc3BhY2UgTEVEIG5hbWUuIEkgd29uJ3Qgc3RhcnQgYXJndWluZyBpZiB0aGlzIGlz
IHNhbmUNCm9yIG5vdCAtIHRoaXMgaXMgd2hhdCB3ZSBzZWVtIHRvIGJlIGxpdmluZyB3aXRoIHRv
ZGF5IDopDQoNCkFueXdheXMsIEkgZGlkIHNlbmQgb3V0IGEgTEVEIGNvcmUgY2hhbmdlIHBhdGNo
IHdoaWNoIGFsbG93cyBvbmUgdG8gYWRkDQplaXRoZXIgdGhlIG5vZGUtbmFtZSwgb3IgYSBwcm9w
ZXJ0eS12YWx1ZSBwYWlyIGluIGluaXRfZGF0YS4gTEVEIGNvcmUNCmNhbiB0aGVuIHVzZSBlaXRo
ZXIgb2YgdGhlc2UgdG8gZG8gTEVEIG5vZGUgbG9va3VwLiBJZiBub25lIG9mIHRoZXNlIGlzDQpn
aXZlbiwgdGhlbiB3ZSBjYW4gZmFsbC1iYWNrIHRvIGV4aXN0aW5nIGxvZ2ljLiBUaGF0IHdheSB3
ZSB3b24ndA0KY2hhbmdlIGV4aXN0aW5nIHN0dWZmLg0KSGVyZToNCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjU4YjVjOTkzNGUyYjMxYTVmNDMzYTdkYmI5MDhkZmU1ZGEzZDMwYy4xNTc0
MDU5NjI1LmdpdC5tYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20vVC8jdQ0KDQoNCkkg
ZGlkbid0IGludmVzdCB0b28gbXVjaCBvZiB0aW1lIG9uIHRoaXMgeWV0IC0gYnV0IGF0IGZpcnN0
IGdsaW1wc2UgaXQNCnNlZW1lZCB0aGF0IGF0IGxlYXN0IHNvbWUgb2YgdGhlIGRyaXZlcnMgZGlk
IHVzZSByZWcgLSBwcm9wZXJ0eSB3aXRoDQpmaXhlZCB2YWx1ZSB0byBkbyB0aGUgbWF0Y2hpbmcu
IFRob3NlIGNvdWxkIHNldCB0aGUgcHJvcGVydHkgbmFtZSB0bw0KJ3JlZycgYW5kIHZhbHVlIHRv
ICdYJyBhbmQgbGVhdmUgdGhlIERUIG5vZGUgbG9va3VwIGFuZCBjb21tb24gcHJvcGVydHkNCnBh
cnNpbmcgdG8gdGhlIExFRCBjb3JlLiBJZiBteSBwYXRjaCB3b24ndCBnZXQgdG9vIGJpZyBvYmpl
Y3Rpb24gKGFuZA0KaWYgbm8gZmF0YWwgZmxhd3MgYXJlIGZvdW5kIGZyb20gdGhlIGlkZWEpIC0g
dGhlbiBJIG1pZ2h0IHRyeSBhbmQgZmluZA0KdGhlIHRpbWUgdG8gZG8gc29tZSBmb2xsb3ctdXAg
cGF0Y2hlcyBzaW1wbGlmeWluZyBleGlzdGluZyBMRUQNCmRyaXZlcnMuLi4NCg0KPiANCj4gDQo+
IA0KPiAtLW10eA0KPiANCg0K
