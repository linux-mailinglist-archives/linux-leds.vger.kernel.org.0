Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F11C3C69A2
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jul 2021 07:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbhGMFG7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Jul 2021 01:06:59 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:15533 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230477AbhGMFG5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 13 Jul 2021 01:06:57 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Jul 2021 01:06:57 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1626152648; x=1657688648;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bLlo+CFvO3SZcAxUg22LZW83GVKOvd67T5GdflhPz/8=;
  b=mpi27ZxED1aCGIiA1cVDEXD1fun4EQroBIm6fEZ6X08T1ayTGJ7dgw8o
   edekV2hmcuyNxbtXyUSJCp/AdDlyP2CmKsYaMuyNKHQ+abJ38IbXm/iAJ
   IcxdVCodjcIf8l/2rqX+6TCq2Saj2xscIug+vB4FlsZzYiC/gWNCOS1Ot
   sfd0Bm5gtqvEqc2nna/wUYa/eyRF7JJgn+bT075qsuiHAk+xEtoBvCbmB
   Ds6oVcEJxIcoJgSQtt0f7FWNUxTxh3rYVbeY0GLnaYi6r6x6Sr2MqKdLK
   TGYsbw1wOeOCJkbkMagqcw6YhyYa1qf9iDwUkh+Q98ctD3Ngq1Rv3H6Sg
   w==;
IronPort-HdrOrdr: A9a23:fbad56/6mz5ju5yJ3m1uk+Gwdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVcqKQ4dcL+7Sc29qB/nhPlICKgqTM2ftWrdyRCVxeNZnPPfKlTbckWTmY4ttt
 YDAs1D5cXLbGSS5fyKnjVQeOxQpuVvnprY/Ns2+00dPD2CJpsQpzuQXmygfHFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29GOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6c031voqqg9jJ/Pr3BtiFVEESgtu+QXvUqZ1RWhkF7nAmtgGxa5+
 Uk7S1QfPib0EmhDV1dlyGdrzUI4Axem0MK9mXo80cL2faJOA7SK/Ax876xISGponbJgrlHod
 d2NiSixtFq5Gj77VnA2+Q=
X-IronPort-AV: E=Sophos;i="5.84,235,1620684000"; 
   d="scan'208";a="12283072"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "denis.osterland.heim@gmail.com" <denis.osterland.heim@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v8 0/2] leds: pwm: add support for default-state device
Thread-Topic: [PATCH v8 0/2] leds: pwm: add support for default-state device
Thread-Index: AQHXXDCSqhNnKvwrZkaRj2EjMB6ajqtAbRkA
Date:   Tue, 13 Jul 2021 04:56:56 +0000
Message-ID: <41d9a940334d3682d5a90796ea6a5af7d4732d92.camel@diehl.com>
References: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
In-Reply-To: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
x-disclaimerprocessed: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DC2A90528E4C2479D3944059A71AA2B@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-GBS-PROC: 5x5xXKsZ7k4sJw6jWwvS4hszs22Nz32/i3QUigkTVV6eKK0tnzEyXJ1e2qupTxgK
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

cGluZw0KDQpBbSBEaWVuc3RhZywgZGVuIDA4LjA2LjIwMjEsIDA4OjM1ICswMjAwIHNjaHJpZWIg
RGVuaXMgT3N0ZXJsYW5kLUhlaW06DQo+IHY3IC0+IHY4Og0KPiAgLSBhcHBseSBhbmQgdGVzdCBv
biBuZXdlc3Qga2VybmVsDQo+ICAtIGRyb3AgZG9jdSBwYXRjaCwgYmVjYXVzZSBpdCBpcyBhbHJl
YWR5IGRvY3VtZW50ZWQNCj4NCj4gRGVuaXMgT3N0ZXJsYW5kLUhlaW0gKDIpOg0KPiAgICAgICBs
ZWRzOiBtb3ZlIGRlZmF1bHRfc3RhdGUgcmVhZCBmcm9tIGZ3bm9kZSB0byBjb3JlDQo+ICAgICAg
IGxlZHM6IHB3bTogYWRkIHN1cHBvcnQgZm9yIGRlZmF1bHQtc3RhdGUgZGV2aWNlIHByb3BlcnR5
DQo+DQo+ICBkcml2ZXJzL2xlZHMvbGVkLWNvcmUuYyAgfCAxNSArKysrKysrKysrKysrKysNCj4g
IGRyaXZlcnMvbGVkcy9sZWRzLWdwaW8uYyB8IDEyICsrLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9s
ZWRzL2xlZHMuaCAgICAgIHwgIDEgKw0KPiAgaW5jbHVkZS9saW51eC9sZWRzLmggICAgIHwgMTIg
KysrKysrKysrLS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQ0KPg0KPiBNZXNzYWdlLUlkOiA8MjAyMDA3MzExNjQ5NDUuMTk1MTUtMS1EZW5p
cy5Pc3RlcmxhbmRAZGllaGwuY29tPg0KPiBiYXNlLWNvbW1pdDogZTkwYWJiOTViYzcxNTY2ZTIw
MTY5NjRlOTgxODE1NTc5MjlmNTVmNQ0KPg0KRGllaGwgQ29ubmVjdGl2aXR5IFNvbHV0aW9ucyBH
bWJIDQpHZXNjaMOkZnRzZsO8aHJ1bmc6IEhvcnN0IExlb25iZXJnZXINClNpdHogZGVyIEdlc2Vs
bHNjaGFmdDogTsO8cm5iZXJnIC0gUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodA0KTsO8cm5i
ZXJnOiBIUkIgMzIzMTUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KRGVy
IEluaGFsdCBkZXIgdm9yc3RlaGVuZGVuIEUtTWFpbCBpc3QgbmljaHQgcmVjaHRsaWNoIGJpbmRl
bmQuIERpZXNlIEUtTWFpbCBlbnRoYWVsdCB2ZXJ0cmF1bGljaGUgdW5kL29kZXIgcmVjaHRsaWNo
IGdlc2NodWV0enRlIEluZm9ybWF0aW9uZW4uDQpJbmZvcm1pZXJlbiBTaWUgdW5zIGJpdHRlLCB3
ZW5uIFNpZSBkaWVzZSBFLU1haWwgZmFlbHNjaGxpY2hlcndlaXNlIGVyaGFsdGVuIGhhYmVuLiBC
aXR0ZSBsb2VzY2hlbiBTaWUgaW4gZGllc2VtIEZhbGwgZGllIE5hY2hyaWNodC4NCkplZGUgdW5l
cmxhdWJ0ZSBGb3JtIGRlciBSZXByb2R1a3Rpb24sIEJla2FubnRnYWJlLCBBZW5kZXJ1bmcsIFZl
cnRlaWx1bmcgdW5kL29kZXIgUHVibGlrYXRpb24gZGllc2VyIEUtTWFpbCBpc3Qgc3RyZW5nc3Rl
bnMgdW50ZXJzYWd0Lg0KDQotIEluZm9ybWF0aW9uZW4genVtIERhdGVuc2NodXR6LCBpbnNiZXNv
bmRlcmUgenUgSWhyZW4gUmVjaHRlbiwgZXJoYWx0ZW4gU2llIHVudGVyOg0KDQpodHRwczovL3d3
dy5kaWVobC5jb20vZ3JvdXAvZGUvdHJhbnNwYXJlbnotdW5kLWluZm9ybWF0aW9uc3BmbGljaHRl
bi8NCg0KVGhlIGNvbnRlbnRzIG9mIHRoZSBhYm92ZSBtZW50aW9uZWQgZS1tYWlsIGlzIG5vdCBs
ZWdhbGx5IGJpbmRpbmcuIFRoaXMgZS1tYWlsIGNvbnRhaW5zIGNvbmZpZGVudGlhbCBhbmQvb3Ig
bGVnYWxseSBwcm90ZWN0ZWQgaW5mb3JtYXRpb24uIFBsZWFzZSBpbmZvcm0gdXMgaWYgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgYnkNCm1pc3Rha2UgYW5kIGRlbGV0ZSBpdCBpbiBzdWNo
IGEgY2FzZS4gRWFjaCB1bmF1dGhvcml6ZWQgcmVwcm9kdWN0aW9uLCBkaXNjbG9zdXJlLCBhbHRl
cmF0aW9uLCBkaXN0cmlidXRpb24gYW5kL29yIHB1YmxpY2F0aW9uIG9mIHRoaXMgZS1tYWlsIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuDQoNCi0gRm9yIGdlbmVyYWwgaW5mb3JtYXRpb24gb24gZGF0
YSBwcm90ZWN0aW9uIGFuZCB5b3VyIHJlc3BlY3RpdmUgcmlnaHRzIHBsZWFzZSB2aXNpdDoNCg0K
aHR0cHM6Ly93d3cuZGllaGwuY29tL2dyb3VwL2VuL3RyYW5zcGFyZW5jeS1hbmQtaW5mb3JtYXRp
b24tb2JsaWdhdGlvbnMvDQoNCg0K
