Return-Path: <linux-leds+bounces-920-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6186097D
	for <lists+linux-leds@lfdr.de>; Fri, 23 Feb 2024 04:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C040E284BAE
	for <lists+linux-leds@lfdr.de>; Fri, 23 Feb 2024 03:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EB0BE68;
	Fri, 23 Feb 2024 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="t1Uc0QMn"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE979CA73
	for <linux-leds@vger.kernel.org>; Fri, 23 Feb 2024 03:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708659980; cv=none; b=d4XQbP7m+RQwiAknG3fCjwan2Er9T+d3/lQnM5U+bJvVar+bEjwK6Evmf35LyfW6xQjbw/x2fo0YsdaDiCOcVArOgCMNYMSB46njOySqb3LYJpNQ7flJ9xymT/X+CR1oRkJThI1qXMe/gcR1JqVg2Dqq71xFtU5U9QGgVOTK9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708659980; c=relaxed/simple;
	bh=JeUMcuY6OS4o6R38cZxtMwI/98jBmcn8NXw3zVTkR/8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GQkFc6OoYjiB8eSXfqIOnQJmfnfwzGjavFLXB7oBR9RwU6jjN/Oil+6nQVPBByyrmy1tnkrcKf4mZah+nwZEX5N4TRTDoOjh9EVR1rVuc8z3PW+/oxXdUyKZzihcLM+lb2zXDs0I7HuuVl94Zs1Fh2DEU1fpzF/KupRQ/V8b1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=t1Uc0QMn; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7E91A2C06C7;
	Fri, 23 Feb 2024 16:46:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1708659975;
	bh=JeUMcuY6OS4o6R38cZxtMwI/98jBmcn8NXw3zVTkR/8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=t1Uc0QMnKo3+qEdJQ/HtxUiO0xC7Albkj3SBPbhn1sknd9EcnCAbDWSBD/hlQtqxy
	 STXQcDufjSaa/Wt1kY40VOBJEprGNFCGNilmByhcaoa+8fw3/tRuX0xvi8gd2vnG8/
	 28esr1p0erw51WfIK/PK08XZ4ivexTog9HdrAaEmSjr2Y/TBnLN3JVofIs5nPUFDY2
	 sLPlpfDETx79wSijmIvb7lA5aVWOi8k8nfkRPWny7ULkmcch4kOv5UzKf8Af9Pkzjm
	 4hvfq2ENEhK40/EnH7xy3lsxtFeGtBQIUZD+ZXiAs1Pv503kIHI3uOy1suKuYCIBEH
	 qXyNhJ2jt1iLQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65d815070001>; Fri, 23 Feb 2024 16:46:15 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 23 Feb 2024 16:46:15 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Fri, 23 Feb 2024 16:46:15 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pavel Machek <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: Linux support for a 7 segment LED display
Thread-Topic: Linux support for a 7 segment LED display
Thread-Index: AQHaXStZfYl8Vw6dm0yz1EAjpP4fVbEWGZeAgAAFVoCAAAGlAIAAAoWAgAABdICAAFziAA==
Date: Fri, 23 Feb 2024 03:46:15 +0000
Message-ID: <2a8d19ee-b18b-4b7c-869f-7d601cea30b6@alliedtelesis.co.nz>
References: <1f598a72-dd9f-4c6c-af7f-29751f84bd23@alliedtelesis.co.nz>
 <Zde966nsJ76QOuzm@surfacebook.localdomain>
 <f5e74774-226a-4678-a6f9-b4f17250ad91@alliedtelesis.co.nz>
 <CAHp75Vfq3Pc+Eo3Z5mhORZwwuKF+Y7_47dTO8qARcfba4nmj2w@mail.gmail.com>
 <9d00e1b1-120b-4c2b-89c5-0ac736bf6441@alliedtelesis.co.nz>
 <CAHp75VdnXtVwrLrcGjnYMfNx7roBvQm9DMr6_ndjZeAbRDbs_Q@mail.gmail.com>
In-Reply-To: <CAHp75VdnXtVwrLrcGjnYMfNx7roBvQm9DMr6_ndjZeAbRDbs_Q@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB52996EED63AC46A2ACE8145E6C7297@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65d81507 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=pGLkceISAAAA:8 a=TBtA2B8CxjsteUArTA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyMy8wMi8yNCAxMToxMywgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiBPbiBGcmksIEZl
YiAyMywgMjAyNCBhdCAxMjowOOKAr0FNIENocmlzIFBhY2toYW0NCj4gPENocmlzLlBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+PiBPbiAyMy8wMi8yNCAxMDo1OSwgQW5keSBT
aGV2Y2hlbmtvIHdyb3RlOg0KPj4+IE9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDExOjUz4oCvUE0g
Q2hyaXMgUGFja2hhbQ0KPj4+IDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdy
b3RlOg0KPj4+PiBPbiAyMy8wMi8yNCAxMDozNCwgYW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbSB3
cm90ZToNCj4+Pj4+IFN1biwgRmViIDExLCAyMDI0IGF0IDA4OjQ2OjEyUE0gKzAwMDAsIENocmlz
IFBhY2toYW0ga2lyam9pdHRpOg0KPj4+Pj4+IEhpIEJsaW5rZW5saWdodCBlbnRodXNpYXN0cywN
Cj4+Pj4+Pg0KPj4+Pj4+IEknbSBsb29raW5nIGZvciBzb21ldGhpbmcgdGhhdCBJIGZpZ3VyZWQg
bXVzdCBleGlzdHMgYnV0IG1heWJlIGl0J3Mgc28NCj4+Pj4+PiBuaWNoZSB0aGF0IG5vLW9uZSBo
YXMgYm90aGVyZWQgdG8gdXBzdHJlYW0gYSBkcml2ZXIgZm9yIGl0Lg0KPj4+Pj4+DQo+Pj4+Pj4g
SSBoYXZlIGEgcmVxdWlyZW1lbnQgdG8gc3VwcG9ydCBhIDctc2VnbWVudCBMRUQgZGlzcGxheVsx
XSAob25lIHRoYXQgY2FuDQo+Pj4+Pj4gZGlzcGxheSBhIHNpbmdsZSBkaWdpdCBmcm9tIDAtOSku
IEhhcmR3YXJlIHdpc2UgaXQncyBqdXN0IGEgYnVuY2ggb2YNCj4+Pj4+PiBpbmRpdmlkdWFsIEdQ
SU9zIGNvbm5lY3RlZCB0byBlYWNoIHNlZ21lbnQgKHBsdXMgYW4gZXh0cmEgb25lIGZvciBhDQo+
Pj4+Pj4gZG90KS4gSSBjYW4ndCBzZWUgYW55dGhpbmcgb2J2aW91cyBpbiBkcml2ZXJzL2xlZHMg
YnV0IG1heWJlIEknbSBsb29raW5nDQo+Pj4+Pj4gaW4gdGhlIHdyb25nIHBsYWNlLiBPciBtYXli
ZSBpdCdzIHRoZSBraW5kIG9mIHRoaW5nIG9uIFBDIGhhcmR3YXJlIHRoYXQNCj4+Pj4+PiBpcyBq
dXN0IGRyaXZlbiBieSB0aGUgQklPUyB3aXRob3V0IHRoZSBvcGVyYXRpbmcgc3lzdGVtIGtub3dp
bmcgYWJvdXQgaXQuDQo+Pj4+Pj4NCj4+Pj4+PiBJcyB0aGVyZSBhbiBleGlzdGluZyBpbi1rZXJu
ZWwgZHJpdmVyIGZvciBzdWNoIGEgdGhpbmc/DQo+Pj4+PiBObywgYW5kIGNhbid0IGJlLiBIZXJl
IGlzIGp1c3QgYSBtYXBwaW5nIHRhYmxlIGFuZCBvdGhlciBkcml2ZXJzIHRoYXQgdXNlDQo+Pj4+
PiA3LXNlZ21lbnQgTEVEIGRpc3BsYXlzIHRvIGJlIGNvbm5lY3RlZCB0by4NCj4+Pj4+DQo+Pj4+
PiBXaGF0IHlvdSBuZWVkIGlzIHNvbWV0aGluZyBlbHNlLCBpLmUuIHNwZWNpYWwgY2FzZSBvZiBs
ZWRzLWdwaW8gKHdoaWNoIHNob3VsZA0KPj4+Pj4gYmUgc29tZXdoZXJlIGVsc2UpIHRoYXQgZG9l
cyBzb21ldGhpbmcgbGlrZSB0aGlzLiBUbyBtZSBpdCBzb3VuZHMgbGlrZSBhDQo+Pj4+PiBtaXh0
dXJlIGJldHdlZW4gbGluZS1kaXNwbGF5LmggKGZyb20gYXV4ZGlzcGxheSkgYW5kIGdwaW8tYWdn
cmVnYXRvci4NCj4+Pj4+DQo+Pj4+PiBIb3cgbWFueSBkaWdpdHMgZG8geW91IHdhbnQgdG8gY29u
bmVjdD8gSG93IGFyZSB0aGV5IGdvaW5nIHRvIGJlIGNvbm5lY3RlZA0KPj4+Pj4gKHN0YXRpYyBk
aXNwbGF5LCBvciBkeW5hbWljIHdoZW4geW91IG5lZWQgdG8gcmVmcmVzaCBpbiBjZXJ0YWluIHBl
cmlvZHMgb2YNCj4+Pj4+IHRpbWUpPyBEZXBlbmRpbmcgb24gdGhlIGFuc3dlciBpdCBtaWdodCB0
YWtlIG9uZSBvciBhbm90aGVyIGFwcHJvYWNoLg0KPj4+PiBJdCBzb3VuZHMgbGlrZSBhIGF1eGRp
c3BsYXkgZHJpdmVyIG1pZ2h0IGJlIHRoZSB3YXkgdG8gZ28uIE15IGhhcmR3YXJlDQo+Pj4+IGhh
cHBlbnMgdG8gaGF2ZSBhIHNpbmdsZSA3c2VnIGJsb2NrIGJ1dCB0aGVyZSdzIG5vIHJlYXNvbiB0
aGUgZHJpdmVyDQo+Pj4+IG5lZWRzIHRvIGJlIHJlc3RyaWN0ZWQgdG8gdGhhdC4gQXQgc29tZSBw
b2ludCBpdCBvYnZpb3VzbHkgYmVjb21lcw0KPj4+PiBiZXR0ZXIgdG8gZml0IHNvbWV0aGluZyBs
aWtlIHRoZSBodDE2azMzIHRvIG9mZmxvYWQgdGhlIGNoYXJhY3Rlcg0KPj4+PiBkaXNwbGF5IGJ1
dCBmb3Igb25lIG9yIDIgZGlnaXRzIGEgUENBOTUzeCBwbHVzIHRoZSBMRUQgYmxvY2sgd291bGQg
ZG8NCj4+Pj4ganVzdCBmaW5lLg0KPj4+IEkgaGF2ZSBoYzU5NSAoU1BJIEdQSU8pIGNvbm5lY3Rl
ZCB0byBhIHNpbmdsZSBkaWdpdCA3LXNlZ21lbnQgTEVELg0KPj4+IFNpbmNlIGl0IGNhbiBiZSBh
bHNvIHNlcmlhbGl6ZWQsIGxpbmUgZGlzcGxheSBBUElzIHNlZW0gcGxhdXNpYmxlIHRvDQo+Pj4g
Zml0LiBXaGF0IHdlIG5lZWQgaXMgYSBwcm94eSBiZXR3ZWVuIHRoZSB0d28uIEFuZCBJIHRoaW5r
DQo+Pj4gZ3Bpby1hZ2dyZWdhdG9yIGlzIHRoZSBiZXN0IGZvciB0aGF0LiBJdCBuZWVkcyBhbiBh
ZGRpdGlvbmFsDQo+Pj4gY29tcGF0aWJsZSBzdHJpbmcgYW5kIHRoZSByZWdpc3RyYXRpb24gZm9y
IGxpbmUgZGlzcGxheSAob3ZlcmFsbA0KPj4+IHNvbWV0aGluZyBsaWtlIDUwIExvQ3MpLiBXZSBj
YW4gZXZlbiBjYWxsIHRoYXQgaGFyZHdhcmUgY29tcGF0aWJsZSBhcw0KPj4+IGxpbmUtZGlzcGxh
eS1ncGlvIChvciBzbykuDQo+Pj4NCj4+PiBDYzogR2VlcnQgYW5kIEtyenlzenRvZiAoZm9yIHRo
ZSBjb21tZW50cyBvbiB0aGUgaWRlYSBhYm92ZSkuDQo+PiBXb3VsZCB0aGUgZ3Bpby1hZ2dyZWdh
dG9yIGJlIG5lY2Vzc2FyeT8NCj4gUHJvYmFibHkgbm90LiB3ZSBqdXN0IG5lZWQgdG8gY29uc3Vt
ZSBHUElPcywgbm8gbmVlZCB0byBwcm92aWRlLi4uDQo+DQo+PiBJIHdhcyB0aGlua2luZyBzb21l
dGhpbmcgbGlrZQ0KPj4gdGhpcyBpbiB0aGUgZGV2aWNldHJlZQ0KPj4NCj4+IFx7DQo+PiAgICAg
ICBsZWQtN3NlZyB7DQo+PiAgICAgICAgICAgY29tcGF0aWJsZSA9ICJraW5nYnJpZ2h0LHNhMzYi
Ow0KPj4gICAgICAgICAgIHNlZy1ncGlvcyA9IDwmZ3Bpb04gMCBHUElPX0FDVElWRV9ISUdIPiwN
Cj4+ICAgICAgICAgICAgICAgPCZncGlvTiAxIEdQSU9fQUNUSVZFX0hJR0g+LA0KPj4gICAgICAg
ICAgICAgICA8JmdwaW9OIDIgR1BJT19BQ1RJVkVfSElHSD4sDQo+PiAgICAgICAgICAgICAgIDwm
Z3Bpb04gMyBHUElPX0FDVElWRV9ISUdIPiwNCj4+ICAgICAgICAgICAgICAgPCZncGlvTiA0IEdQ
SU9fQUNUSVZFX0hJR0g+LA0KPj4gICAgICAgICAgICAgICA8JmdwaW9OIDUgR1BJT19BQ1RJVkVf
SElHSD4sDQo+PiAgICAgICAgICAgICAgIDwmZ3Bpb04gNiBHUElPX0FDVElWRV9ISUdIPjsNCj4+
ICAgICAgIH07DQo+PiB9Ow0KPiBSaWdodCwgYnV0IGFsc28gd2l0aCBzb21lIGFkZGl0aW9uYWwg
cHJvcGVydGllcywgbGlrZQ0KPiAtIHR5cGUgb2YgdGhlIGluZGljYXRvciAoNywgMTQsIGV0YyBz
ZWdtZW50cywgZm9yIG5vdyB3ZSBoYXZlIG9ubHkNCj4gdGhlc2UgdHdvIHN1cHBvcnRlZCkNCj4g
LSB1c2UtZG90ICgrMSBsZWQgcGVyIGVhY2ggZGlnaXQpDQo+IC0gY2hhcmFjdGVycyAoaG93IG1h
bnkgZGlnaXRzIHdlIGhhdmUsIHNvIHdlIG5lZWQgcmVzcGVjdGl2ZSBhbW91bnQgb2YgR1BJT3Mp
DQo+DQo+IFdpdGggdGhpcyBpdCdzIGluZGVlZCBiZWxvbmdzIGRpcmVjdGx5IHRvIGF1eGRpc3Bs
YXkgYXMgd2UgaGF2ZSBhbG1vc3QNCj4gZXZlcnl0aGluZyBpcyBkb25lIGFscmVhZHkgdGhlcmUu
DQoNCkkndmUgYmVlbiBwbGF5aW5nIGFib3V0IHdpdGggdGhpcy4gSSd2ZSBnb3QgYW4gYXV4ZGlz
cGxheSBkcml2ZXIgdGhhdCdzIA0KYmFzaWNhbGx5IHdvcmtpbmcgKEkgd29uJ3QgYm90aGVyIHNw
YW1taW5nIGxpc3Qgd2l0aCBpdCB5ZXQpLiBCdXQgSSdtIA0Kd29uZGVyaW5nIGhvdyBJJ2QgcmVw
cmVzZW50IG11bHRpcGxlIGNoYXJhY3RlcnMuIEkga2luZCBvZiBmZWVsIHRoZSANCm5hdHVyYWwg
cmVwcmVzZW50YXRpb24gd291bGQgYmUgc29tZXRoaW5nIGxpa2UuDQoNCiDCoMKgwqDCoMKgwqDC
oCBsZWQtN3NlZyB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUg
PSAiZ2VuZXJpYyw3LXNlZ21lbnQtb24tZ3BpbyI7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNoYXItMCB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBz
ZWdtZW50LWdwaW9zID0gPCZncGlvIDAgR1BJT19BQ1RJVkVfTE9XDQogwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoCDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZn
cGlvIDEgR1BJT19BQ1RJVkVfTE9XDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCDCoMKgIMKgIMKgwqDCoMKgwqDCoMKgICZncGlvIDIgR1BJT19BQ1RJVkVf
TE9XDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIMKgwqAgwqAgwqDCoMKgICZncGlvIDMgR1BJT19BQ1RJVkVfTE9XDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoCDC
oCAmZ3BpbyA0IEdQSU9fQUNUSVZFX0xPVw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgICZncGlvIDUgR1BJT19B
Q1RJVkVfTE9XDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgwqDCoCDCoCAmZ3BpbyA2IEdQSU9fQUNUSVZFX0xPVz47DQogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNoYXItMSB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBz
ZWdtZW50LWdwaW9zID0gPCZncGlvIDggR1BJT19BQ1RJVkVfTE9XDQogwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoCDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZn
cGlvIDkgR1BJT19BQ1RJVkVfTE9XDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCDCoMKgIMKgIMKgwqDCoMKgwqDCoMKgICZncGlvIDEwIEdQSU9fQUNUSVZF
X0xPVw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCDCoMKgIMKgIMKgwqDCoCAmZ3BpbyAxMSBHUElPX0FDVElWRV9MT1cNCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKg
IMKgICZncGlvIDEyIEdQSU9fQUNUSVZFX0xPVw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgICZncGlvIDEzIEdQ
SU9fQUNUSVZFX0xPVw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqAgwqAgJmdwaW8gMTQgR1BJT19BQ1RJVkVfTE9XPjsN
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsNCiDCoMKgwqDCoMKgwqDCoCB9Ow0K
DQpCdXQgaGF2aW5nIHRob3NlIHN1Yi1ub2RlcyBtZWFucyBJIGNhbid0IGp1c3QgdXNlIGRldm1f
Z3Bpb2RfZ2V0X2FycmF5KCkgDQppbnN0ZWFkIEknZCBoYXZlIHRvIHVzZSBkZXZpY2VfZm9yX2Vh
Y2hfY2hpbGRfbm9kZSgpIGFuZCANCmRldm1fZndub2RlX2dwaW9kX2dldF9pbmRleCgpLiBBbSBJ
IG1pc3Npbmcgc29tZXRoaW5nPyBJIGNvdWxkIGRvIGF3YXkgDQp3aXRoIHRoZSBzdWItbm9kZXMg
YW5kIGhhdmUgcHJvcGVydGllcyBsaWtlICJzZWdtZW50LTAtZ3Bpb3MiLCANCiJzZWdtZW50LTEt
Z3Bpb3MiIGJ1dCB0aGF0IGZlZWxzIGF3a3dhcmQuDQoNCj4NCj4+Pj4gVGhlIGluZm9ybWF0aW9u
IHdlIHdhbnQgdG8gZGlzcGxheSBpcyBtb3N0bHkgc3RhdGljIChiYXNpY2FsbHkgYSBudW1lcmlj
DQo+Pj4+IHVuaXQgaWRlbnRpZmllcikgYnV0IHRoZXJlIGFyZSBjYXNlcyB3aGVyZSB3ZSBtYXkg
d2FudCB0byBhbHRlcm5hdGUNCj4+Pj4gYmV0d2VlbiB0aGlzIGFuZCAiRiIgdG8gaW5kaWNhdGUg
c29tZSBmYXVsdCBjb25kaXRpb24=

