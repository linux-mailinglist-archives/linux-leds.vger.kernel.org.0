Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5CD18E761
	for <lists+linux-leds@lfdr.de>; Sun, 22 Mar 2020 08:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgCVHvr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Mar 2020 03:51:47 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:20314 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725785AbgCVHvq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 22 Mar 2020 03:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584863504; x=1616399504;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=G9fPeJ2Lqaw9tn5k1jmfo2v9WVWFEaR38LGVcXvNiu8=;
  b=ZE/ngnEK2yOfuMA6dd8I6lzcfMq/e/CvU96WuUmGnge36ML6U02+IocH
   s3ZQB/jMNzDLF+pcyKIDhLF9GGNI3aBd3a9spUyjQ1dfHZx5EYdIPwVPR
   eJAzy44dOozuUeOi97m+2NNnqaIT73sgyVGL214vr/59R/iXfPDxXArgc
   C680iSdzQR6tZdAxqmlVB8ScE+NrzSQq7VUMBi50wm6hH5PzqWtHlCPYx
   Pe+LffBYQ48RnD8Ttzltu/Ma7j+VNAQORDVF7FbNJ5yEu9uCEezM8IdcP
   f/03IMlIpkcjqQOzRJ6kaA8R2hfLTePdtsPM267BgpnCxyctLhnBr4i3H
   w==;
IronPort-SDR: HyCBZnQ22O9yrMfkr+VoRSHN7lBxg+sXPvpdlWacskhaX3pkrTiY7PkZSLSgApEYAHexp0wqvN
 biB849/yN0vw==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>
Subject: Re: [PATCH v4 3/5] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Topic: [PATCH v4 3/5] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Index: AQHV/1jvS39qjeoyFEyBmW+H8QD2bqhTGRaAgAAfaQCAAPVwAA==
Date:   Sun, 22 Mar 2020 07:51:31 +0000
Message-ID: <a8d4d9001288512dbb86169a09bd66c4bd818210.camel@diehl.com>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
         <20200321081321.15614-4-Denis.Osterland@diehl.com>
         <20200321152037.GB8386@duo.ucw.cz>
         <ca0008dcfe0a453fe0bfed3f7aea1206aeb2a93b.camel@diehl.com>
In-Reply-To: <ca0008dcfe0a453fe0bfed3f7aea1206aeb2a93b.camel@diehl.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <D09A8765BE13E747AAD16A534695901C@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: byQFdw3ukCM+zy1/poiPczzkKjwjJ2vI2RLubozfMfcVjeQhtB15GwbEeaLReBKi
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgUGF2ZWwsDQoNCkFtIFNhbXN0YWcsIGRlbiAyMS4wMy4yMDIwLCAxODoxMyArMDEwMCBz
Y2hyaWViIERlbmlzIE9zdGVybGFuZC1IZWltOg0KPiBIaSBQYXZlbCwNCj4gDQo+IGhlcmUg
aXQgd29ya3MuDQo+IA0KPiAkIGdpdCByZXNldCAtLWhhcmQgb3JpZ2luL2Zvci1uZXh0DQo+
IEhFQUQgaXMgbm93IGF0IDAzMjQyNmZmNzczZiBsZWRzOiBsbTM1MzI6IG1ha2UgYml0Zmll
bGQgJ2VuYWJsZWQnIHVuc2lnbmVkDQo+ICQgY3VybCAtcyBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTIxMzU0OC9tYm94LyB8IGdpdCBhbQ0KPiBBcHBseWlu
ZzogbGVkczogcHdtOiBjaGVjayByZXN1bHQgb2YgbGVkX3B3bV9zZXQoKSBpbiBsZWRfcHdt
X2FkZCgpDQo+IA0KSSBoYXZlIGFwcGxpZWQgaXQgdG8gMTBhNmNjZTNjMWExNWU0MGRkN2I2
OWU2NmU0NzgwNDc2ZTU5MGY2OCB3aXRob3V0IHByb2JsZW1zIGFzIHdlbGwuDQoNCkNhbiB5
b3UgdXNlIGBnaXQgYW0gLS1zaG93LWN1cnJlbnQtcGF0Y2ggfCBwYXRjaCAtcDEgLS1tZXJn
ZWAgYW5kIHBvc3QgdGhlIGNvbmZsaWN0cz8NCg0KPiBTdHJhbmdlIGlzIHRoYXQgdGhlIEZy
b206IHRhZyBpbiA3YmJlYzZjNGI1MWQgaXMgbm90IGV2YWx1YXRlZCBhdCB5b3VyIHNpZGUu
DQo+IFdoZW4gSSBkbyBpdCwgSSBnZXQ6DQo+IA0KPiAkIGdpdCByZXNldCAtLWhhcmQgN2E2
MzAzNjc3NTk4DQo+IEhFQUQgaXMgbm93IGF0IDdhNjMwMzY3NzU5OCBsZWRzOiBsZWRzLWlz
MzFmbDMyeHg6IFJlcGxhY2UgemVyby1sZW5ndGggYXJyYXkgd2l0aCBmbGV4aWJsZS1hcnJh
eSBtZW1iZXINCj4gJCBjdXJsIC1zIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29y
ay9wYXRjaC8xMjEyNzgyL21ib3gvIHwgZ2l0IGFtDQo+IEFwcGx5aW5nOiBsZWRzOiBsZWRz
LXB3bTogUmVwbGFjZSB6ZXJvLWxlbmd0aCBhcnJheSB3aXRoIGZsZXhpYmxlLWFycmF5IG1l
bWJlcg0KPiAkIGdpdCBzaG93DQo+IGNvbW1pdCBlMjQ3YWU5ODJiNWJhMTEzY2M5NjY4YmVj
NTc4MTA1NjQ1MTM3ZmIyIChIRUFEIC0+IGZvci1uZXh0KQ0KPiBBdXRob3I6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+DQo+IERhdGU6ICAgVGh1IE1h
ciAxOSAxNjo1MTo0NiAyMDIwIC0wNTAwDQo+IA0KPiAgICAgbGVkczogbGVkcy1wd206IFJl
cGxhY2UgemVyby1sZW5ndGggYXJyYXkgd2l0aCBmbGV4aWJsZS1hcnJheSBtZW1iZXINClNv
cnJ5IGZvciB0aGF0LCB0aGlzIHdhcyBvbmUgcGF0Y2ggb2ZmLg0KMzk1M2QxOTA4YjJjYzVm
NTdhNWY5ZWJkN2Y2YjU3MzZhOGUxZmUyNSBpcyB0aGUgb25lIHdpdGggdGhlICJGcm9tOiIg
bGluZS4NCg0KPiANCj4gUmVnYXJkcyBEZW5pcw0KPiANCj4gQW0gU2Ftc3RhZywgZGVuIDIx
LjAzLjIwMjAsIDE2OjIwICswMTAwIHNjaHJpZWIgUGF2ZWwgTWFjaGVrOg0KPiA+IEhpIQ0K
PiA+IA0KLi4uDQo+ID4gPiANCj4gPiA+IFRoZSBjb250ZW50cyBvZiB0aGUgYWJvdmUgbWVu
dGlvbmVkIGUtbWFpbCBpcyBub3QgbGVnYWxseQ0KPiA+ID4gYmluZGluZy4gVGhpcyBlLW1h
aWwgY29udGFpbnMgY29uZmlkZW50aWFsIGFuZC9vciBsZWdhbGx5IHByb3RlY3RlZA0KPiA+
ID4gaW5mb3JtYXRpb24uIFBsZWFzZSBpbmZvcm0gdXMgaWYgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgYnkNCj4gPiANCj4gPiBUaGlzIGlzIGxpZS4gUGxlYXNlIGRvbid0IGRv
IHRoaXMuDQo+ID4gCQkJCQkJCQlQYXZlbA0KQ29ycG9yYXRlIEV4Y2hhbmdlIHNlcnZlciBh
dXRvbWF0aWNhbGx5IGFwcGVuZHMgaXQuDQpJIGNhbiBub3Qgc3VwcHJlc3MgaXQsIHNvcnJ5
Lg0KDQpSZWdhcmRzIERlbmlzDQoNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiA+IFox
IFNlY3VyZU1haWwgR2F0ZXdheSBQcm9jZXNzaW5nIEluZm8gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwNCj4gPiANCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiA+IC0g
VGhlIG1lc3NhZ2Ugd2FzIHNpZ25lZCBieSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwNCj4gPiA+ICAgW05vIEluZm8gYXZhaWxhYmxlXSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiA+ICAgU2lnbmF0
dXJlIG5vdCB2ZXJpZmlhYmxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCj4gPiA+ICAgLSBNZXNzYWdlIGNvbnRlbnQgbm90IHZlcmlmaWFibGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiA+ICAgLSBDZXJ0aWZpY2F0
ZSBub3QgdmVyaWZpYWJsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwNCj4gPiANCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCg0KDQpEaWVobCBDb25uZWN0aXZp
dHkgU29sdXRpb25zIEdtYkgNCkdlc2Now6RmdHNmw7xocnVuZzogSG9yc3QgTGVvbmJlcmdl
cg0KU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBOw7xybmJlcmcgLSBSZWdpc3RlcmdlcmljaHQ6
IEFtdHNnZXJpY2h0DQpOw7xybmJlcmc6IEhSQiAzMjMxNQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkRlciBJbmhhbHQgZGVyIHZvcnN0ZWhl
bmRlbiBFLU1haWwgaXN0IG5pY2h0IHJlY2h0bGljaCBiaW5kZW5kLiBEaWVzZSBFLU1haWwg
ZW50aGFlbHQgdmVydHJhdWxpY2hlIHVuZC9vZGVyIHJlY2h0bGljaCBnZXNjaHVldHp0ZSBJ
bmZvcm1hdGlvbmVuLg0KSW5mb3JtaWVyZW4gU2llIHVucyBiaXR0ZSwgd2VubiBTaWUgZGll
c2UgRS1NYWlsIGZhZWxzY2hsaWNoZXJ3ZWlzZSBlcmhhbHRlbiBoYWJlbi4gQml0dGUgbG9l
c2NoZW4gU2llIGluIGRpZXNlbSBGYWxsIGRpZSBOYWNocmljaHQuDQpKZWRlIHVuZXJsYXVi
dGUgRm9ybSBkZXIgUmVwcm9kdWt0aW9uLCBCZWthbm50Z2FiZSwgQWVuZGVydW5nLCBWZXJ0
ZWlsdW5nIHVuZC9vZGVyIFB1Ymxpa2F0aW9uIGRpZXNlciBFLU1haWwgaXN0IHN0cmVuZ3N0
ZW5zIHVudGVyc2FndC4NCi0gSW5mb3JtYXRpb25lbiB6dW0gRGF0ZW5zY2h1dHosIGluc2Jl
c29uZGVyZSB6dSBJaHJlbiBSZWNodGVuLCBlcmhhbHRlbiBTaWUgdW50ZXIgaHR0cHM6Ly93
d3cuZGllaGwuY29tL2dyb3VwL2RlL3RyYW5zcGFyZW56LXVuZC1pbmZvcm1hdGlvbnNwZmxp
Y2h0ZW4vDQoNClRoZSBjb250ZW50cyBvZiB0aGUgYWJvdmUgbWVudGlvbmVkIGUtbWFpbCBp
cyBub3QgbGVnYWxseSBiaW5kaW5nLiBUaGlzIGUtbWFpbCBjb250YWlucyBjb25maWRlbnRp
YWwgYW5kL29yIGxlZ2FsbHkgcHJvdGVjdGVkIGluZm9ybWF0aW9uLiBQbGVhc2UgaW5mb3Jt
IHVzIGlmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGJ5DQptaXN0YWtlIGFuZCBk
ZWxldGUgaXQgaW4gc3VjaCBhIGNhc2UuIEVhY2ggdW5hdXRob3JpemVkIHJlcHJvZHVjdGlv
biwgZGlzY2xvc3VyZSwgYWx0ZXJhdGlvbiwgZGlzdHJpYnV0aW9uIGFuZC9vciBwdWJsaWNh
dGlvbiBvZiB0aGlzIGUtbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiANCi0gRm9yIGdl
bmVyYWwgaW5mb3JtYXRpb24gb24gZGF0YSBwcm90ZWN0aW9uIGFuZCB5b3VyIHJlc3BlY3Rp
dmUgcmlnaHRzIHBsZWFzZSB2aXNpdCBodHRwczovL3d3dy5kaWVobC5jb20vZ3JvdXAvZW4v
dHJhbnNwYXJlbmN5LWFuZC1pbmZvcm1hdGlvbi1vYmxpZ2F0aW9ucy8NCg==
