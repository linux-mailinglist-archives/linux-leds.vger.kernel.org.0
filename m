Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C8D17011C
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgBZOZl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:25:41 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49774 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbgBZOZk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:25:40 -0500
X-AuditID: c0a8fbf4-489ff70000004419-27-5e567fe12715
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 64.76.17433.1EF765E5; Wed, 26 Feb 2020 15:25:38 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0487.000; Wed, 26 Feb 2020 15:25:31 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Thread-Topic: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Thread-Index: AQHVzRi5yTX4egnFhE+K8HvJn6t48qfuly8AgAAFDwCAPw3agIAADCWA
Date:   Wed, 26 Feb 2020 14:25:31 +0000
Message-ID: <b13161db0589951f86f241d5af8e8daa899be80d.camel@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <20200117103000.GG15507@dell>
         <9785531484b32da487a6016f5c32bf2e9bc45985.camel@fi.rohmeurope.com>
         <20200226134203.GD4080@duo.ucw.cz>
In-Reply-To: <20200226134203.GD4080@duo.ucw.cz>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <72136CBC761BB14EA0F28BD150670CB3@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsVyYMXvjbqP6sPiDJ7OZrL4MvcUi8X8I+dY
        LbpPb2G1uL11A4vF/a9HGS2m/FnOZHF51xw2i61v1jFazFl6gsXi7qmjbBate4+wO3B7vL/R
        yu6xc9Zddo9NqzrZPO5c28PmcfzGdiaPFau/s3t83iQXwB7FbZOUWFIWnJmep2+XwJ2xtE2l
        4IBWxcyOdsYGxi2aXYycHBICJhJN/2aydDFycQgJXGWUOHLzOJRzglFizZO3TF2MHBxsAjYS
        XTfZQRpEBBQlNvd0soHYzALLWCT+7woEsYUFLCSWrb7GBlFjKfG48RIjhO0m8enNd7A4i4Cq
        xJ5Tx1hARvIK+El8+GADseoio8SsG7dYQWo4BfQlLnyYzQRiMwrISnQ2vGOC2CUusenZd1aI
        owUkluw5zwxhi0q8fPwPKq4ksffnQ7D5zAKaEut36UO0OkjsvPUO6mRFiSndD8Fe4RUQlDg5
        8wnLBEaxWUg2zELonoWkexaS7llIuhcwsq5ilMhNzMxJTyxJNdQrSi3VK8rPyAVSyfm5mxgh
        Mf5lB+P/Q56HGJk4GA8xSnIwKYnyqpiHxQnxJeWnVGYkFmfEF5XmpBYfYpTgYFYS4d34NTRO
        iDclsbIqtSgfJiXNwaIkzqv+cGKskADIruzU1ILUIpisDAeHkgQvTx3QUMGi1PTUirTMnBKE
        NBMHJ8hwLimR4tS8lNSixNKSjHhQ6ogvBiYPkBQP0F6LGqB23uKCxFygKETrKUZDjgkv5y5i
        5rj5fgmQPDJ36SJmIZa8/LxUKXHeV0ZADQIgDRmleXDrXjGKczAqCfPeqgXK8gATP9y0V0CL
        mIAWrf4TDLKoJBEhJdXAqFDIaujcG3Hzzr637fpnUxuiRSM5G/K/s0ULBKTMkw+ST14vVZZx
        p2CPxRZWpyXtp65XMn++bc8453vo1JOzTfcqHJmcrGg5RbovRmTBL8XolAXq4XsYov3X3pwR
        ryunqcfGyvyj7G/LhVJmqXdbj+m8DL+1y7+m47utrM3Tm1VZ8zTKD05TYinOSDTUYi4qTgQA
        xWXANrkDAAA=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGVsbG8gUGF2ZWwsDQoNCkkgZHJvcHBlZCBzb21lIG9mIHRoZSByZWNpcGllbnRzIGFzIEkgZG9u
J3QgdGhpbmsgdGhpcyBpcyBpbnRlcmVzdGluZw0KZm9yIGV2ZXJ5Ym9keSA6KQ0KDQpPbiBXZWQs
IDIwMjAtMDItMjYgYXQgMTQ6NDIgKzAxMDAsIFBhdmVsIE1hY2hlayB3cm90ZToNCj4gSGkhDQo+
IA0KPiA+ID4gPiBDaGFuZ2Vsb2cgdjEwOg0KPiA+ID4gPiAgIC0gU3BsaXQgUlRDIHBhdGNoIHRv
IGEgQkQ3MDUyOCBmaXggKHdoaWNoIGhvcGVmdWxseSBnb2VzIHRvDQo+ID4gPiA+IDUuNCkNCj4g
PiA+ID4gYW5kIHRvDQo+ID4gPiA+ICAgICBCRDcxODI4IHN1cHBvcnQNCj4gPiA+IA0KPiA+ID4g
U3RpbGwgbWlzc2luZyBMRUQgQWNrcy4NCj4gPiA+IA0KPiA+IA0KPiA+IFllcC4gSSBrbm93LiBJ
IGhhdmVuJ3QgaGVhcmQgZnJvbSBQYXZlbCByZWNlbnRseSBhbmQgdGhlIHBhdGNoIDEyDQo+ID4g
ZGVmaW5pdGVseSByZXF1aXJlcyBoaXMgYWNrLiBDYW4geW91IHRha2UgdGhlIG90aGVyIHBhdGNo
ZXMgaW4gYW5kDQo+ID4gbGVhdmUgMTIgYW5kIDEzIG91dCBmb3Igbm93PyBJIGNhbiBjb250aW51
ZSB3b3JrIG9uIExFRHMgd2l0aCBQYXZlbA0KPiA+IGJ1dA0KPiA+IEkgd291bGQgcmVhbGx5IGxp
a2UgdG8gaGF2ZSB0aGUgcmVndWxhdG9ycyB3b3JraW5nIGFuZCBCRDcwNTI4IFJUQw0KPiA+IGZp
eGVkIGluIG5leHQgcmVsZWFzZS4uLg0KPiANCj4gR29pbmcgdGhyb3VnaCBteSBiYWNrbG9ncyBu
b3cuIFlvdSB0YWtpbmcgcGF0Y2hlcyB1cC10byAxMSBzbw0KPiB0aGF0IHdlIGhhdmUgdHdvIGxl
ZnQgc291bmRzIGdvb2QgOi0pLg0KDQpOaWNlIHRvIGhlYXIgeW91J3JlIGJhY2sgaW4gdGhlIGJ1
c2luZXNzIDopDQpUaGlzIHNlcmllcyAoZXhjZXB0IHBhdGNoZXMgMTIgYW5kIDEzKSB3YXMgbWVy
Z2VkIHRvIGxpbnV4IDUuNi1yYzEuDQoNCkkgaGF2ZSBub3QgY29udGludWVkIHdvcmsgd2l0aCB0
aGUgcGF0Y2ggMTIgYXMgSSBhbSBub3QgZW50aXJlbHkgaGFwcHkNCndpdGggdGhhdCBhcHByb2Fj
aCBldmVuIG15c2VsZi4NCg0KSSBzdGlsbCB0aGluayB0aGUgbGVkIGNvcmUgc2hvdWxkIHBhcnNl
IGNvbW1vbiBsZWQgYmluZGluZ3MuDQoNCldoYXQgSSBhbSB3b25kZXJpbmcgaXMgaWYgTEVEIGNv
cmUgc2hvdWxkIHByb3ZpZGUgaW50ZXJmYWNlIHdoaWNoIGNvdWxkDQpyZWdpc3RlciBhbiBhcnJh
eSBvZiBMRURzIGF0IG9uZSBnbyAtIGJ5IHRha2luZyBhbiBhcnJheSBvZiBMRUQgZGVzY3MNCmZy
b20gdGhlIGRyaXZlciBhbmQgYnkgc2Nhbm5pbmcgdGhyb3VnaCB0aGUgY2hpbGQgbm9kZXMgaW4g
Z2l2ZW4gTEVEDQpjb250cm9sbGVyJ3Mgcm9vdCBub2RlLiBPciBpZiB3ZSBzaG91bGQgc3RpY2sg
dG8gdGhlIGFwcHJvYWNoDQppbnRyb2R1Y2VkIGluIHRoZSBwYXRjaCAxMiAtIHdoaWNoIHJlcXVp
cmVzIG93biAncmVnaXN0ZXIgY2FsbCcgcGVyDQpMRUQuDQoNClByb2JsZW0gd2l0aCBsYXR0ZXIg
YXBwcm9hY2ggaXMgdGhhdCBpdCByZXF1aXJlcyB0aGUgTEVEIGRyaXZlciB0byBrbm93DQpob3cg
bWFueSBMRURzIHRoZXJlIGlzIGF0dGFjaGVkIC0gb3IgdGhlbiB0byBpZ25vcmUgdGhlIGVycm9y
cyBmcm9tDQpyZWdpc3RlciBmdW5jdGlvbiBhc3N1bWluZyBlcnJvciBpcyBjYXVzZWQgYnkgbWlz
c2luZyBMRUQuIFNvIGN1cnJlbnRseQ0KKGFmdGVyIEkgbG9va2VkIHRocm91Z2ggbW9yZSBvZiB0
aGUgZXhpc3RpbmcgZHJpdmVycykgaXQgc2VlbXMgdG8gbWUNCnRoZSBpbmRpdmlkdWFsIGRyaXZl
cnMgbmVlZCB0byBlaXRoZXIgaGFyZC1jb2RlIG51bWJlciBvZiBMRURzICh3aGljaA0KbWlnaHQg
bm90IGJlIGEgcmVhbCBwcm9ibGVtIHRob3VnaCkgb3IgYW55d2F5cyBjaGVjayB0aGUgRFQgZm9y
IExFRA0Kbm9kZXMgYW5kIGNhbGwgdGhlIHJlZ2lzdHJhdGlvbiBmb3IgZWFjaCBMRUQgYmFzZWQg
b24gdGhlIERUIG5vZGVzLg0KDQpJZGVhbGx5IEkgd291bGQgbGlrZSB0byBzZWUgYXBwcm9hY2gg
d2hlcmUgdGhlIExFRCBjb250cm9sbGVyIGRyaXZlcg0Kd291bGQgb25seSBmaWxsIExFRCBkZXNj
cmlwdG9ycyBmb3IgcG9zc2libGUgTEVEIGNvbm5lY3Rpb25zIC0gYW5kIGdpdmUNCnRoYXQgdG8g
YSByZWdpc3RyYXRpb24gQVBJLiBUaGUgcmVnaXN0cmF0aW9uIEFQSSB3b3VsZCBzZWUgdGhlDQpk
ZXNjcmlwdG9ycyBhbmQgY2hlY2sgd2hpY2ggb2YgdGhlIGRlc2NzIG1hdGNoIHRvIGEgTEVEIGdp
dmVuIGluIERUICYmDQpyZWdpc3RlciB0aG9zZSBMRUQgZGV2aWNlcy4gVGhhdCB3b3VsZCBoZWxw
IExFRCBkcml2ZXJzIHdpdGggbm8gc3BlY2lhbA0KRFQgcHJvcGVydGllcyB0byB0cnVseSBnZXQg
cmlkIG9mIERUIHBhcnNpbmcuDQoNCkVnLCBhcyBhIHF1aWNrbHkgd3JpdHRlbiBwc2V1ZG8gY29k
ZSB0byBleHBsYWluIHRoZSBpZGVhOg0KZHJpdmVyIHdvdWxkIGZpbGwgc29tZSBhcnJheSBsaWtl
Og0KDQpzdHJ1Y3QgY29uc3QgbGVkX2Rlc2NyaXB0b3JzIG15X2xlZHNbXSA9IHsNCgl7DQoJCS5p
ZCA9IE1ZX0xFRDEsDQoJCS5vcHMgPSBsZWRfY29udHJvbF9mdW5jdGlvbnMsDQoJCS5tYXRjaF9k
YXRhID0gJmR0X21hdGNoX2RhdGEsDQoJCS5pc19vcHRpb25hbCA9IHRydWUsDQoJCS5vZl9tYXRj
aF9jYiA9IG15X2NvbnRyb2xsZXJfc3BlY2lmaWNfZHRfcGFyc2VyLA0KCX0sDQoJew0KCQkuaWQg
PSBNWV9MRUQyLA0KCQkub3BzID0gbGVkX2NvbnRyb2xfZnVuY3Rpb25zLA0KCQkubWF0Y2hfDQpk
YXRhID0gJmR0X21hdGNoX2RhdGEsDQoJCS5pc19vcHRpb25hbCA9IHRydWUsDQoJCS5vZl9tYXRj
aF9jYiA9DQpteV9jb250cm9sbGVyX3NwZWNpZmljX2R0X3BhcnNlciwNCgl9LA0KfTsNCg0Kd2hl
cmU6DQogLSBsZWRfY29udHJvbF9mdW5jdGlvbnMgd291bGQgYmUgZnVuY3Rpb24gcG9pbnRlcnMg
dG8gc2V0IHRoZSBMRUQNCnN0YXRlcyBldGMuDQogLSBpZCB3b3VsZCBiZSBhIExFRCBJRCB3aGlj
aCB0aGUgbGVkIGNvbnRyb2wgZnVuY3Rpb25zIGNvdWxkIHVzZSB0bw0KaWRlMW50aWZ5IExFRCBp
biBjb250cm9sbGVyDQogLSBtYXRjaF9kYXRhIHdvdWxkIGNvbnRhaW4gRFQgbm9kZSBtYXRjaCBp
bmZvcm1hdGlvbiB0aGUgTEVEIGNvcmUNCmNvdWxkIHVzZSB3aGVuIHNlYXJjaGluZyB0aGUgTEVE
IGZyb20gRFQNCiAtIGlzX29wdGlvbmFsIHdvdWxkIHRlbGwgd2hldGhlciB0aGUgY29yZSBzaG91
bGQgdHJlYXQgbWlzc2luZyBMRUQgRFQNCm5vZGUgYXMgZXJyb3INCiAtIG9mX21hdGNoX2NiIHdv
dWxkIGJlIGEgY2FsbGJhY2sgdG8gY2FsbCB3aGVuIGNvcmUgaGFzIHBhcnNlZCBjb21tb24NCkRU
IHByb3BlcnRpZXMgc28gdGhhdCB0aGUgZHJpdmVyIGNhbiBwYXJzZSBhbnkgZHJpdmVyIHNwZWNp
ZmljIGR0DQpzdHVmZi4NCg0KYW5kIHRoZSBkcml2ZXIgY291bGQgcGFzcyB0aGlzIGFuZCB0aGUg
TEVEIGNvbnRyb2xsZXIgRFQgbm9kZSB0bw0KcmVnaXN0cmF0aW9uIEFQSSB3aGljaCB3b3VsZCAi
bWFzcyByZWdpc3RlciIgYWxsIGZvdW5kIExFRHMuDQoNCkkgdGhpbmsgaXQgd291bGQgbm90IGJl
IGEgaHVnZSB0aGluZyB0byBpbXBsZW1lbnQgLSBidXQgaXQgZGVmaW5pdGVseQ0KaXMgc29tZSB3
b3JrLiBBbmQgaWYgdGhpcyBpZGVhIGlzIHN0cm9uZ2x5IG9iamVjdGVkIC0gdGhlbiBJIG1heSBu
b3QNCmhhdmUgdGhlIGVuZXJneSB0byBwdXNoIGl0IHRocm91Z2guLi4gU28uLiBJIHdvdWxkIGxp
a2UgdG8ga25vdyB3aGF0DQpwZW9wbGUgdGhpbmsgb2YgaXQ/IElzIGl0IHJlYWxseSB3b3J0aCBv
ZiB0cnlpbmc/IE9yIHNob3VsZCBJIHN0aWNrDQp3aXRoIHRoZSBhcHByb2FjaCBwcmVzZW50ZWQg
aW4gdGhpcyBzZXJpZXM/IE9yIHNob3VsZCBJIGp1c3QgZm9yZ2V0IGl0DQphbmQgYWRkIHlldCBv
bmUgbW9yZSBMRUQgZHJpdmVycyBpbXBsZW1lbnRpbmcgdGhlIHNhbWUgRFQgcGFyc2luZyBsb29w
cw0KYXMgb3RoZXJzPw0KDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpDQo=
