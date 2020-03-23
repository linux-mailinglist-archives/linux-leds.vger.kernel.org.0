Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F6918F172
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 10:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgCWJJE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 05:09:04 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:42440 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727477AbgCWJJE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 23 Mar 2020 05:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584954543; x=1616490543;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kWoC1leUNK9JRF/0QALqY23saxkCofgIQaeLbyoc78E=;
  b=Psk+1MVWc4bhVJYr78VLwkOPpOjfcvRaDhXwTCAmWuMduvP3OWpsZCU0
   Vari6V227REyHM06x2L0J1JAULHEUEobbZkKXji15Fq4nm6jhvlko5Sw6
   maYaqzQNjp/BbiSOQ9hzFlNYhdE4Y4NbT50iF0+QtGmSsXDMuPXNFBjDX
   +/83G7iLt7vNJKQiiFHxS/TBS2QUJ71/BeO4NDedEmqwwbR62QGl2DFIP
   NHvPIY3aWtZ0ve21FuITLUApNYbD3rVG/QtgK9ybdMvnaSwBszIFMl9TB
   lxQ4+TvJrdKOUa8jxuHCtHiAAy7C0VFjH86oXPMC6MwxPuZaipgOWM51Q
   A==;
IronPort-SDR: yvh7WG9BtynCxvXyJEWoDsNkNGwDh9LL7TV9C7CgjOIuHx1YlyltGqABG6pQOtMsdIiKaZsTcp
 Vt26TofAdnPQ==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Topic: [PATCH v4 3/5] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Index: AQHV/1jvS39qjeoyFEyBmW+H8QD2bqhTGRaAgAGLqoCAAP7igIAAMkiA
Date:   Mon, 23 Mar 2020 09:08:59 +0000
Message-ID: <a23386dcb217d1385cb3cd5d7aacc964f33b11d2.camel@diehl.com>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
         <20200321081321.15614-4-Denis.Osterland@diehl.com>
         <20200321152037.GB8386@duo.ucw.cz>
         <566ac991-2e38-6c70-4b07-c8dd78d47a06@gmail.com>
         <ca8f7ca4226de19c910440fde0c6f1e34a807fc6.camel@diehl.com>
In-Reply-To: <ca8f7ca4226de19c910440fde0c6f1e34a807fc6.camel@diehl.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <83D0B95E4698FE4CB81218B14FB80257@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc2zbCejfrbnpT48LiMMyht2MA8QFDI1cTUtJa91ZV4bq
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgYWdhaW4sDQoNCkFtIE1vbnRhZywgZGVuIDIzLjAzLjIwMjAsIDA3OjA5ICswMTAwIHNj
aHJpZWIgRGVuaXMgT3N0ZXJsYW5kLUhlaW06DQo+IEhpLA0KPiANCj4gQW0gU29ubnRhZywg
ZGVuIDIyLjAzLjIwMjAsIDE1OjU2ICswMTAwIHNjaHJpZWIgSmFjZWsgQW5hc3pld3NraToN
Cj4gPiBPbiAzLzIxLzIwIDQ6MjAgUE0sIFBhdmVsIE1hY2hlayB3cm90ZToNCj4gPiA+IEhp
IQ0KPiA+ID4gDQo+ID4gPiA+IGxlZF9wd21fc2V0KCkgbm93IHJldHVybnMgYW4gZXJyb3Ig
d2hlbiBzZXR0aW5nIHRoZSBQV00gZmFpbHMuDQo+ID4gPiA+IA0KPiA+ID4gPiBDYzogVXdl
IEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogRGVuaXMgT3N0ZXJsYW5kLUhlaW0gPERlbmlzLk9zdGVybGFuZEBkaWVobC5j
b20+DQo+ID4gPiANCj4gPiA+IEkgYXBwbGllZCAxIGFuZCAyLCBidXQgMyBmYWlsZWQgZm9y
IG1lLiBJJ2xsIHB1c2ggdXBkYXRlZCAtbmV4dCwgY2FuDQo+ID4gPiB5b3Ugc2VlIHdoYXQg
aXMgZ29pbmcgb24gdGhlcmU/DQo+ID4gDQo+ID4gQ2hlY2sgdGhlIGNvbnRlbnRzIG9mIHRo
ZSBwYXRjaCBhZnRlciB3cml0aW5nIGl0IG9uIGEgZGlzay4NCj4gPiBJbiBteSBjYXNlIGl0
IGNvbnRhaW5zIGEgYmxvY2sgb2YgcmFuZG9tIGNoYXJhY3RlcnMuDQo+ID4gSXQgaXMgcHJv
YmFibHkgZHVlIHRvIENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IGJhc2U2NC4NCj4gPiAN
Cj4gDQo+IHN0cmFuZ2UuDQo+IEluIHRoZSB2ZXJzaW9uIEkgcmVjZWl2ZWQgYnkgQ0MsIHRo
ZXJlIGlzIG5vIGdhcmJhZ2UsIGJ1dCBhbHNvIG5vIGF1dG8gYXBwZW5kZWQgZm9vdGVyLg0K
PiANCj4gSSB3aWxsIHNlbmQgdGhlIG1haWwganVzdCB0byBsaW51eC1sZWRzIHNvIHdlIHNo
b3VsZCBhbGwgcmVjZWl2ZSB0aGUgc2FtZSBtYWlsLg0KSSByZWNlaXZlZCBubyBtYWlsIDov
IGFuZCB3aGVuIEkgbG9vayBhdCBodHRwczovL3BhdGNoZXMubGluYXJvLm9yZy9wcm9qZWN0
L2xpbnV4LWxlZHMvbGlzdC8NCkkgd291bGQgZXhwZWN0IHRoYXQgeW91IHJlY2VpdmVkIG5v
dGhpbmcsIHRvby4NCg0KPiANCj4gSSB3b25kZXIgaWYgdGhlICfDticgaW4gS8O2bmlnIGNh
dXNlcyB0aGlzIHRyb3VibGUgaW4gbXkgc2VuZCBwYXRoLg0KSSB3aWxsIHNlbmQgdGhlIHBh
dGNoIHdpdGhvdXQgdGhlIENjIGxpbmUsIG1heWJlIHRoaXMgZml4ZXMgdGhlIHByb2JsZW0g
YXQgeW91ciBzaWRlLg0KDQpSZWdhcmRzIERlbmlzDQoNCj4gDQo+IFJlZ2FyZHMgRGVuaXMN
Cg0KDQpEaWVobCBDb25uZWN0aXZpdHkgU29sdXRpb25zIEdtYkgNCkdlc2Now6RmdHNmw7xo
cnVuZzogSG9yc3QgTGVvbmJlcmdlcg0KU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBOw7xybmJl
cmcgLSBSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0DQpOw7xybmJlcmc6IEhSQiAzMjMx
NQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkRl
ciBJbmhhbHQgZGVyIHZvcnN0ZWhlbmRlbiBFLU1haWwgaXN0IG5pY2h0IHJlY2h0bGljaCBi
aW5kZW5kLiBEaWVzZSBFLU1haWwgZW50aGFlbHQgdmVydHJhdWxpY2hlIHVuZC9vZGVyIHJl
Y2h0bGljaCBnZXNjaHVldHp0ZSBJbmZvcm1hdGlvbmVuLg0KSW5mb3JtaWVyZW4gU2llIHVu
cyBiaXR0ZSwgd2VubiBTaWUgZGllc2UgRS1NYWlsIGZhZWxzY2hsaWNoZXJ3ZWlzZSBlcmhh
bHRlbiBoYWJlbi4gQml0dGUgbG9lc2NoZW4gU2llIGluIGRpZXNlbSBGYWxsIGRpZSBOYWNo
cmljaHQuDQpKZWRlIHVuZXJsYXVidGUgRm9ybSBkZXIgUmVwcm9kdWt0aW9uLCBCZWthbm50
Z2FiZSwgQWVuZGVydW5nLCBWZXJ0ZWlsdW5nIHVuZC9vZGVyIFB1Ymxpa2F0aW9uIGRpZXNl
ciBFLU1haWwgaXN0IHN0cmVuZ3N0ZW5zIHVudGVyc2FndC4NCi0gSW5mb3JtYXRpb25lbiB6
dW0gRGF0ZW5zY2h1dHosIGluc2Jlc29uZGVyZSB6dSBJaHJlbiBSZWNodGVuLCBlcmhhbHRl
biBTaWUgdW50ZXIgaHR0cHM6Ly93d3cuZGllaGwuY29tL2dyb3VwL2RlL3RyYW5zcGFyZW56
LXVuZC1pbmZvcm1hdGlvbnNwZmxpY2h0ZW4vDQoNClRoZSBjb250ZW50cyBvZiB0aGUgYWJv
dmUgbWVudGlvbmVkIGUtbWFpbCBpcyBub3QgbGVnYWxseSBiaW5kaW5nLiBUaGlzIGUtbWFp
bCBjb250YWlucyBjb25maWRlbnRpYWwgYW5kL29yIGxlZ2FsbHkgcHJvdGVjdGVkIGluZm9y
bWF0aW9uLiBQbGVhc2UgaW5mb3JtIHVzIGlmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGJ5DQptaXN0YWtlIGFuZCBkZWxldGUgaXQgaW4gc3VjaCBhIGNhc2UuIEVhY2ggdW5h
dXRob3JpemVkIHJlcHJvZHVjdGlvbiwgZGlzY2xvc3VyZSwgYWx0ZXJhdGlvbiwgZGlzdHJp
YnV0aW9uIGFuZC9vciBwdWJsaWNhdGlvbiBvZiB0aGlzIGUtbWFpbCBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkLiANCi0gRm9yIGdlbmVyYWwgaW5mb3JtYXRpb24gb24gZGF0YSBwcm90ZWN0
aW9uIGFuZCB5b3VyIHJlc3BlY3RpdmUgcmlnaHRzIHBsZWFzZSB2aXNpdCBodHRwczovL3d3
dy5kaWVobC5jb20vZ3JvdXAvZW4vdHJhbnNwYXJlbmN5LWFuZC1pbmZvcm1hdGlvbi1vYmxp
Z2F0aW9ucy8NCg==
