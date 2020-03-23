Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3507C18EFA7
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 07:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgCWGJH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 02:09:07 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:33477 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726059AbgCWGJH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 23 Mar 2020 02:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584943746; x=1616479746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DV4nHDiTsO9dWY3uhNYCYhJoyilaMOHIQk4sdtR6+24=;
  b=opILcj5zLobn79ZXHdQMqkTOhwakCeCyRcWmr7euAiXRF1iPXfMj3sRM
   RN64tHUqHFIE3AcsBmtSpSoZNSVKNrZPWZP53aifarsVWkMDhUGuJ5vhK
   1UiheyZJa93A8BM7xtdItuuv4b59tOWePwyc7zJnXi83JvIhDI40VZ7My
   ATOW0buoFHnB9BeNLWFzo44W7xbTdE/SFO95QaMGET06ENP5Pb9L1TSOC
   2jKosAoCRb3TznJTt5SjgW9N2C79STI/ndzlVkbHhzR6R8q1g1RuSK/oa
   832h36qqnu5xW38n7mPZ2v0sOnoM6UlOrf3xfSAVC4ma5pYnpPW3bsL7/
   Q==;
IronPort-SDR: zZhsEo+1SFDQ160x2e0cuQJ5sh1J1agpvAv/M3IST49JdxSEtIU/X6RxblVebdX+DOssLLy4fA
 g1FSZPLC9RXQ==
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
Thread-Index: AQHV/1jvS39qjeoyFEyBmW+H8QD2bqhTGRaAgAGLqoCAAP7igA==
Date:   Mon, 23 Mar 2020 06:09:02 +0000
Message-ID: <ca8f7ca4226de19c910440fde0c6f1e34a807fc6.camel@diehl.com>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
         <20200321081321.15614-4-Denis.Osterland@diehl.com>
         <20200321152037.GB8386@duo.ucw.cz>
         <566ac991-2e38-6c70-4b07-c8dd78d47a06@gmail.com>
In-Reply-To: <566ac991-2e38-6c70-4b07-c8dd78d47a06@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB3F59BDD45B1C49A1326D7A5AD88203@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: 415AWy8o668fDtCxszluz4NEbTdzvYfHwnlDueB0TshDKkqx0N2FbTxrbM/VCE05
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGksDQoNCkFtIFNvbm50YWcsIGRlbiAyMi4wMy4yMDIwLCAxNTo1NiArMDEwMCBzY2hyaWVi
IEphY2VrIEFuYXN6ZXdza2k6DQo+IE9uIDMvMjEvMjAgNDoyMCBQTSwgUGF2ZWwgTWFjaGVr
IHdyb3RlOg0KPiA+IEhpIQ0KPiA+IA0KPiA+ID4gbGVkX3B3bV9zZXQoKSBub3cgcmV0dXJu
cyBhbiBlcnJvciB3aGVuIHNldHRpbmcgdGhlIFBXTSBmYWlscy4NCj4gPiA+IA0KPiA+ID4g
Q2M6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5vcmc+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBEZW5pcyBPc3RlcmxhbmQtSGVpbSA8RGVuaXMuT3N0ZXJsYW5kQGRp
ZWhsLmNvbT4NCj4gPiANCj4gPiBJIGFwcGxpZWQgMSBhbmQgMiwgYnV0IDMgZmFpbGVkIGZv
ciBtZS4gSSdsbCBwdXNoIHVwZGF0ZWQgLW5leHQsIGNhbg0KPiA+IHlvdSBzZWUgd2hhdCBp
cyBnb2luZyBvbiB0aGVyZT8NCj4gDQo+IENoZWNrIHRoZSBjb250ZW50cyBvZiB0aGUgcGF0
Y2ggYWZ0ZXIgd3JpdGluZyBpdCBvbiBhIGRpc2suDQo+IEluIG15IGNhc2UgaXQgY29udGFp
bnMgYSBibG9jayBvZiByYW5kb20gY2hhcmFjdGVycy4NCj4gSXQgaXMgcHJvYmFibHkgZHVl
IHRvIENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IGJhc2U2NC4NCj4gDQpzdHJhbmdlLg0K
SW4gdGhlIHZlcnNpb24gSSByZWNlaXZlZCBieSBDQywgdGhlcmUgaXMgbm8gZ2FyYmFnZSwg
YnV0IGFsc28gbm8gYXV0byBhcHBlbmRlZCBmb290ZXIuDQoNCkkgd2lsbCBzZW5kIHRoZSBt
YWlsIGp1c3QgdG8gbGludXgtbGVkcyBzbyB3ZSBzaG91bGQgYWxsIHJlY2VpdmUgdGhlIHNh
bWUgbWFpbC4NCg0KSSB3b25kZXIgaWYgdGhlICfDticgaW4gS8O2bmlnIGNhdXNlcyB0aGlz
IHRyb3VibGUgaW4gbXkgc2VuZCBwYXRoLg0KDQpSZWdhcmRzIERlbmlzDQoNCg0KRGllaGwg
Q29ubmVjdGl2aXR5IFNvbHV0aW9ucyBHbWJIDQpHZXNjaMOkZnRzZsO8aHJ1bmc6IEhvcnN0
IExlb25iZXJnZXINClNpdHogZGVyIEdlc2VsbHNjaGFmdDogTsO8cm5iZXJnIC0gUmVnaXN0
ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodA0KTsO8cm5iZXJnOiBIUkIgMzIzMTUNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQpEZXIgSW5oYWx0IGRl
ciB2b3JzdGVoZW5kZW4gRS1NYWlsIGlzdCBuaWNodCByZWNodGxpY2ggYmluZGVuZC4gRGll
c2UgRS1NYWlsIGVudGhhZWx0IHZlcnRyYXVsaWNoZSB1bmQvb2RlciByZWNodGxpY2ggZ2Vz
Y2h1ZXR6dGUgSW5mb3JtYXRpb25lbi4NCkluZm9ybWllcmVuIFNpZSB1bnMgYml0dGUsIHdl
bm4gU2llIGRpZXNlIEUtTWFpbCBmYWVsc2NobGljaGVyd2Vpc2UgZXJoYWx0ZW4gaGFiZW4u
IEJpdHRlIGxvZXNjaGVuIFNpZSBpbiBkaWVzZW0gRmFsbCBkaWUgTmFjaHJpY2h0Lg0KSmVk
ZSB1bmVybGF1YnRlIEZvcm0gZGVyIFJlcHJvZHVrdGlvbiwgQmVrYW5udGdhYmUsIEFlbmRl
cnVuZywgVmVydGVpbHVuZyB1bmQvb2RlciBQdWJsaWthdGlvbiBkaWVzZXIgRS1NYWlsIGlz
dCBzdHJlbmdzdGVucyB1bnRlcnNhZ3QuDQotIEluZm9ybWF0aW9uZW4genVtIERhdGVuc2No
dXR6LCBpbnNiZXNvbmRlcmUgenUgSWhyZW4gUmVjaHRlbiwgZXJoYWx0ZW4gU2llIHVudGVy
IGh0dHBzOi8vd3d3LmRpZWhsLmNvbS9ncm91cC9kZS90cmFuc3BhcmVuei11bmQtaW5mb3Jt
YXRpb25zcGZsaWNodGVuLw0KDQpUaGUgY29udGVudHMgb2YgdGhlIGFib3ZlIG1lbnRpb25l
ZCBlLW1haWwgaXMgbm90IGxlZ2FsbHkgYmluZGluZy4gVGhpcyBlLW1haWwgY29udGFpbnMg
Y29uZmlkZW50aWFsIGFuZC9vciBsZWdhbGx5IHByb3RlY3RlZCBpbmZvcm1hdGlvbi4gUGxl
YXNlIGluZm9ybSB1cyBpZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBieQ0KbWlz
dGFrZSBhbmQgZGVsZXRlIGl0IGluIHN1Y2ggYSBjYXNlLiBFYWNoIHVuYXV0aG9yaXplZCBy
ZXByb2R1Y3Rpb24sIGRpc2Nsb3N1cmUsIGFsdGVyYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQv
b3IgcHVibGljYXRpb24gb2YgdGhpcyBlLW1haWwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4g
DQotIEZvciBnZW5lcmFsIGluZm9ybWF0aW9uIG9uIGRhdGEgcHJvdGVjdGlvbiBhbmQgeW91
ciByZXNwZWN0aXZlIHJpZ2h0cyBwbGVhc2UgdmlzaXQgaHR0cHM6Ly93d3cuZGllaGwuY29t
L2dyb3VwL2VuL3RyYW5zcGFyZW5jeS1hbmQtaW5mb3JtYXRpb24tb2JsaWdhdGlvbnMvDQo=
