Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7A2103541
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2019 08:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbfKTHht (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Nov 2019 02:37:49 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:61632 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKTHht (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Nov 2019 02:37:49 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-c1-5dd4ed4b11e5
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 8A.E2.08102.B4DE4DD5; Wed, 20 Nov 2019 08:37:47 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 20 Nov 2019 08:37:43 +0100
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
Thread-Index: AQHVjlbfnKGQ2A80TEuw50r1eox3kqeQtb4AgAAVbACAAi0GAIAAxR6A
Date:   Wed, 20 Nov 2019 07:37:42 +0000
Message-ID: <e29bb49931542c55c867f52c82f11421454c0f64.camel@fi.rohmeurope.com>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
         <ed000cda-3138-3172-1b4c-586b5bfd8d72@metux.net>
         <946f091e79242b9e71d5ce8ad12c899feefa22cd.camel@fi.rohmeurope.com>
         <56d3a81e-f675-fd5e-06a7-8039bf02468e@metux.net>
In-Reply-To: <56d3a81e-f675-fd5e-06a7-8039bf02468e@metux.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F49E42CE7B9CC8489F29364710CCF8AA@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0gUURTGuTOzu6M5dV21ve1W0ERoRZkYNYZKD6gpQYIgSFIbc3Il3bXZ
        NcpeZvaHWqEZZYtW+AAx3XJ9r5oi9rbER9lSBkspaqVioaahzTil/nUP5zvf+X1wD4mr85Ra
        MtZg5gUDF0crXYnm4unyTSE/usO3OLM8mfutbxVMxutKBeO4XI8xH6seE0yXPVfJVH23Aqao
        pwNjcoteEEzvq6dK5mpjq2qnK1t6rxSwdZZeFWsrSVOymaM/lOzzDzUYW/xwQsX+tK0+qApb
        EhjFmU8fio0x+AYfW6K/njNIJAzozlRkdGHJ4JouHbiQCG5FKdYBPB24kmr4DqDK2+9VkqCG
        LwDKyo1JBySphIEo3THX9oQRKLliUiHN4zAHR8N37HOCBzyA0npv4PJQCLJPVf+r96LqpjJM
        qgm4DjVNdgGppmAo+jxixWTwGECFU4NKSXCBQaiwVjYDuAqlJQ/PmXGoQbb+CYWcGqLChnZc
        rr3Q4JeZf30aNf52ElJoHK5Hj+y+snUncnTKOXG4Bt3KcKrkDO7o5d2vRCZYbllEsCy4LYvc
        lkVuyyL3A6AoASiei42L4cy832aBT9wsGPXx4nPcGG8D8nf/qgWzLftbAEaCFrCCxGgv6kh3
        d7h6aZQx+qyeM+kjhcQ43tQCEInTnlRDj6hR0dzZJF4w/pd0JEFrKG9nVrgaSqyTPJ/AC//V
        lSRJI+rwgGh0F/gY/syJ2DjzgoyRLtJyV62niTdE8wKXaNZHSvcRaRIPRJLcRK7jm8Q1JXDx
        Yle2vgIbyczBvHycbM0rysfVhMFo4LUaKm2ZOAqlUX2iYR40BDQkoD2ofdIiN/Hm5/cMiQhM
        RJSXdUoIM7cgaZMB6+icprfVeFdRbwpO++cGdO5p9x+3tadW3fSqZIJKL3XvZp/UB3zyGfO5
        4pw40HdUXXD4uTblwqn+P03WZ9Pjs9l29zLdVPPIxrCtoTN+X3a0HQpJjQg535Y1mj08qduj
        2W4s9nv/kC6uyc4P7Dty/FyS79Lgjpy6fd7WtSVTF3dF0YRJz/ltwAUT9xe5uuxPsAMAAA==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTEtMTkgYXQgMjA6NTIgKzAxMDAsIEVucmljbyBXZWlnZWx0LCBtZXR1
eCBJVCBjb25zdWx0DQp3cm90ZToNCj4gT24gMTguMTEuMTkgMTE6MzgsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+ID4gPiBhKSBleGlzdGluZyBEVCdzIChpbiB0aGUg
ZmllbGQpIGJlY29tZSBpbmNvbXBhdGlibGUgd2l0aCBuZXdlcg0KPiA+ID4gICAga2VybmVsIHZl
cnNpb25zDQo+ID4gDQo+ID4gVGhpcyB3YXMgbXkgbWFpbiBjb25jZXJuLiBUaGlzIG9mIGNvdXJz
ZSB3b3VsZCBub3QgbWVhbiB0aGF0IHdlDQo+ID4gY291bGQNCj4gPiBub3QgdGFrZSB0aGlzIGFw
cHJvYWNoIGZvciBuZXcgTEVEIGNvbnRyb2xsZXIgZHJpdmVycyAtIGJ1dCB0aGF0DQo+ID4gd291
bGQNCj4gPiAocHJvYmFibHkpIGxlYWQgdG8gZHVhbCBsZWQgcmVnaXN0cmF0aW9uIGludGVyZmFj
ZSANCj4gDQo+IE1heWJlIGp1c3QgYSBmbGFnIGZvciB0aGF0ID8gUGVyaGFwcyB0aGUgZHJpdmVy
IGNvdWxkIGFsc28gc3BlY2lmeSBhDQo+IGxpc3Qgb2Ygbm9kZSBuYW1lcyBmb3IgdGhlIExFRHMs
IHNvIGxlZC1jb3JlIGNhbiBkbyB0aGUgbG9va3VwIGZvcg0KPiB0aGVtLg0KDQpUaGlzIGlzIGFj
dHVhbGx5IGNsb3NlIHRvIHdoYXQgSSBzdWdnZXN0ZWQgaW4gbXkgb3RoZXIgZW1haWwgdG8gSmFj
ZWsuDQoNCj4gPiA+IGIpIGV4aXN0aW5nIHVzZXJsYW5kcyB0aGF0IHJlbHkgb24gc3BlaWNpZmlj
IExFRCBuYW1lcyBiZWNvbWUNCj4gPiA+ICAgIGluY29tYXRpYmxlIHdpdGggbmV3ZXIga2VybmVs
IHZlcnNpb25zLg0KPiA+IA0KPiA+IEkgZGlkbid0IGV2ZW4gdGhpbmsgdGhpcyBmYXIsIGJ1dCB5
ZXMsIEkgc2VlLi4uIExFRCBub2RlIG5hbWUgbWlnaHQNCj4gPiBiZQ0KPiA+IHJlZmxlY3RlZCBp
biB1c2VyLXNwYWNlIExFRCBuYW1lLiBJIHdvbid0IHN0YXJ0IGFyZ3VpbmcgaWYgdGhpcyBpcw0K
PiA+IHNhbmUNCj4gPiBvciBub3QgLSB0aGlzIGlzIHdoYXQgd2Ugc2VlbSB0byBiZSBsaXZpbmcg
d2l0aCB0b2RheSA6KQ0KPiANCj4gRXNwZWNpYWxseSBpbiBlbWJlZGRlZCB3b3JsZCwgdGhpcyBj
YW4gcmVhbGx5IG1ha2Ugc2Vuc2U6DQo+IGFwcGxpY2F0aW9ucw0KPiBqdXN0IHVzZSBhIGRlZmlu
ZWQgTEVEIG5hbWUsIG5vIG1hdHRlciB3aGljaCBib2FyZCBpdCdzIHJ1bm5pbmcgb24uDQo+IENv
bnZlbnRpb24gb3ZlciBjb25maWd1cmF0aW9uLg0KDQpEZWZpbml0ZWx5LiBJIGFtIGFsbCBmb3Ig
Z2VuZXJhdGluZyB0aGUgbmFtZSBiYXNlZCBvbiBMRUQgX2Z1bmN0aW9uXyAtDQpubyBtYXR0ZXIg
d2hhdCB0aGUgYm9hcmQgaXMuIEkgbGlrZSB0aGUgTEVEIG5hbWUgZ2VuZXJhdGlvbiBiYXNlIG9u
DQonZnVuY3Rpb24nIERUIHByb3BlcnR5LiBCdXQgbm9kZSBuYW1lcyB0ZW5kIHRvIGJlIHNvbWV3
aGF0IGdlbmVyaWMgLSBvcg0KYm9hcmQgc3BlY2lmaWMgKHRvIGF2b2lkIGNvbGxpc2lvbnMpLiBT
byB1c2luZyBub2RlIG5hbWUgZGlyZWN0bHkgaXMNCm5vdCAoYXMgZmFyIGFzIG15IHVuZGVyc3Rh
bmRpbmcgZ29lcyAtIHdoaWNoIGlzIGxpbWl0ZWQgb24gdGhpcyB0b3BpYykNCm9wdGltYWwgZm9y
IGd1YXJhbnRlZWluZyBjb2hlcmVudCB2aWV3IChhY3Jvc3MgdGhlIGJvYXJkcykgZm9yIHVzZXIt
DQpzcGFjZS4gV293LCB3aGF0IGEgbmljZSBzZW50ZW5jZSBmb3Igbm9uIG5hdGl2ZSBFbmdsaXNo
IHNwZWFrZXIgbGlrZSBtZQ0KeEQNCg0KPiBQZXJzb25hbGx5LCBJIGFsc28gbGlrZSB0byB1c2Ug
TEVEIHN1YnN5c3RlbSBhcyBmcm9udGVuZCBmb3IgdGhpbmdzDQo+IGxpa2UNCj4gZ3Bpby1kcml2
ZW4gcmVsYWlzLCBldGMsIGFuZCBhc3NpZ24gc2VtYW50aWNhbGx5IGZpdHRpbmcgbmFtZXMNCj4g
aW5zdGVhZA0KPiBvZiAidGVjaG5pY2FsIiBvbmVzLA0KDQpUaGlzIGlzIG91dHNpZGUgb2YgbXkg
ZXhwZXJpZW5jZSBzbyBJIGp1c3QgYmVsaWV2ZSB3aGF0IHlvdSBzYXkgOikNCg0KPiANCj4gPiBJ
IGRpZG4ndCBpbnZlc3QgdG9vIG11Y2ggb2YgdGltZSBvbiB0aGlzIHlldCAtIGJ1dCBhdCBmaXJz
dCBnbGltcHNlDQo+ID4gaXQNCj4gPiBzZWVtZWQgdGhhdCBhdCBsZWFzdCBzb21lIG9mIHRoZSBk
cml2ZXJzIGRpZCB1c2UgcmVnIC0gcHJvcGVydHkNCj4gPiB3aXRoDQo+ID4gZml4ZWQgdmFsdWUg
dG8gZG8gdGhlIG1hdGNoaW5nLiBUaG9zZSBjb3VsZCBzZXQgdGhlIHByb3BlcnR5IG5hbWUNCj4g
PiB0bw0KPiA+ICdyZWcnIGFuZCB2YWx1ZSB0byAnWCcgYW5kIGxlYXZlIHRoZSBEVCBub2RlIGxv
b2t1cCBhbmQgY29tbW9uDQo+ID4gcHJvcGVydHkNCj4gPiBwYXJzaW5nIHRvIHRoZSBMRUQgY29y
ZS4gSWYgbXkgcGF0Y2ggd29uJ3QgZ2V0IHRvbyBiaWcgb2JqZWN0aW9uDQo+ID4gKGFuZA0KPiA+
IGlmIG5vIGZhdGFsIGZsYXdzIGFyZSBmb3VuZCBmcm9tIHRoZSBpZGVhKSAtIHRoZW4gSSBtaWdo
dCB0cnkgYW5kDQo+ID4gZmluZA0KPiA+IHRoZSB0aW1lIHRvIGRvIHNvbWUgZm9sbG93LXVwIHBh
dGNoZXMgc2ltcGxpZnlpbmcgZXhpc3RpbmcgTEVEDQo+ID4gZHJpdmVycy4uLg0KPiANCj4gU291
bmRzIGdvb2QgOikNCj4gDQo+IA0KPiAtLW10eA0KPiANCg0K
