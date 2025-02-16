Return-Path: <linux-leds+bounces-3989-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D94A377D5
	for <lists+linux-leds@lfdr.de>; Sun, 16 Feb 2025 22:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 682B63AD86E
	for <lists+linux-leds@lfdr.de>; Sun, 16 Feb 2025 21:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79CE1A5B8E;
	Sun, 16 Feb 2025 21:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="cK9NLujJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9F51A3155
	for <linux-leds@vger.kernel.org>; Sun, 16 Feb 2025 21:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739741887; cv=none; b=A5ARqmb0Vvp0M/GfhrFXSUuM6xNM+5ZfSPOfk5xHqXD+XXJBFH6E/qAlAzIRFx4ipsngjVRihdCGMNQyDpQqX1uaQXAabeWogV5s57a2G5f8sZFDjpgIDzHJAY0FEXlsRea74mxWO6tSNyGYMu19LmunnHOweP2NmuHbS/lPGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739741887; c=relaxed/simple;
	bh=og2mtC207ZGWxPyV8PuZWDABbeHGD9YF42XsoDmRfZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sG+8vC3yyV5qeZKJ5+9l1U+uAZ15R1S0bKPsRlToA/WVQZABGQr11V4r9Lqqa0qQ+bb5TZQSV5Sj8VeAHnSR9ywBp8G8/ZBsHC0x1qLrJtrmlNo4N5PCiLZyXPsEA/vRjHXMF06HtlGn68bKUDBlHe/+izdwL9a6ZzLAkv9SXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=cK9NLujJ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 567BB2C0276;
	Mon, 17 Feb 2025 10:37:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739741877;
	bh=og2mtC207ZGWxPyV8PuZWDABbeHGD9YF42XsoDmRfZc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cK9NLujJqhlFD7Nd4Pk4McXM4dxjzfec8zOq53eZ8geyncpnvv/UneyqbX6ORCtI2
	 qvqpRubE3JcOAwPgQ8uOb1y7HBvaNklttVSyFc2CGvhFhBb+h7zAeBsx3/W3MKxMI/
	 PXJII0aAGvFC0Qx3aGo4Yyg/vp95VI9TKLL9qLkzFXInFeJIF8z4GjL6iWEMIlf3pp
	 fDlxzLoihuuI1Lv96r1AQpWl69u7Qz4R6TlfZl5WzzOAVwub+EjZvFTN9/3GKKqQx5
	 7pCDriyEKpFtWM/NZW2TytN7G/JmH8yb4vLT3bB0NzeHsYzUqf64oMTz/Rt+dfXefy
	 KkHA/Lqe0eCiA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67b25ab50000>; Mon, 17 Feb 2025 10:37:57 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 10:37:57 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 17 Feb 2025 10:37:57 +1300
From: Tony O'Brien <Tony.OBrien@alliedtelesis.co.nz>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "pavel@kernel.org" <pavel@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Ben Hoelker
	<Ben.Hoelker@alliedtelesis.co.nz>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] dt-bindings:leds: Add function define for POE
Thread-Topic: [PATCH] dt-bindings:leds: Add function define for POE
Thread-Index: AQHbffocic3Nn7P/gEqFn6lcAUmgubNJoDIA
Date: Sun, 16 Feb 2025 21:37:57 +0000
Message-ID: <31bc5340976761dbf3653ed2802a8988e07b18d5.camel@alliedtelesis.co.nz>
References: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
	 <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>
	 <20250213-successful-pronghorn-of-dignity-83facb@krzk-bin>
In-Reply-To: <20250213-successful-pronghorn-of-dignity-83facb@krzk-bin>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <94056713911F684BAD502A0AC49E75D6@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67b25ab5 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=_uhMn-sHrSUA:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=uH8sxfnJXPhuacFOrcwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=lc6YxIADdIgEMAPwAa2T:22
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXN6dG9mIC0NCg0KPiBXaGVyZSBkaWQgdGhlc2UgdHdvIHJldmlld3MgaGFwcGVuPw0K
VGhleSB3ZXJlIGluLWhvdXNlIHJldmlld3MuICBQbGVhc2UgZmVlbCBmcmVlIHRvIHJlbW92ZSB0
aGVtIGZyb20gdGhlDQpwYXRjaC4NCg0KPiBXaGVyZSBpcyBhbnkgdXNlciBvZiB0aGlzPw0KV2Ug
YXJlIGFkZGluZyBLZXJuZWwgY29udHJvbCBvZiBQb0UgTEVEcyBhbmQgdGhvdWdodCB0aGlzIG1p
Z2h0IGJlDQp1c2VmdWwgdG8gb3RoZXJzLCBtYXliZSB0aG9zZSB3b3JraW5nIG9uIG5ldGRldiwg
b3IgYW55b25lIGltcGxlbWVudGluZw0KUG9FIG9uIHRoZWlyIGRldmljZXMuICBBbHNvLCB0aGUg
S2VybmVsID4+IERvY3MgPj4gTEVEcyBwYWdlIHN0YXRlczoNCiJJZiByZXF1aXJlZCBjb2xvciBv
ciBmdW5jdGlvbiBpcyBtaXNzaW5nLCBwbGVhc2Ugc3VibWl0IGEgcGF0Y2ggdG8NCmxpbnV4LWxl
ZHNAdmdlci5rZXJuZWwub3JnIiwgd2hpY2ggaXMgaW5jbHVkZWQgaGVyZS4NCg0KQ2hlZXJzLA0K
VG9ueSBPJ0JyaWVuDQoNCk9uIFRodSwgMjAyNS0wMi0xMyBhdCAxMDozMSArMDEwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgMDE6NTg6NDFQ
TSArMTMwMCwgVG9ueSBPJ0JyaWVuIHdyb3RlOg0KPiA+IEFkZCBhIGRlZmluZSBzbyBuZXR3b3Jr
IGRldmljZXMgd2l0aCBhIFBvRSBQU0UgZmVhdHVyZSBjYW4gcHJvdmlkZQ0KPiA+IHN0YXR1cyBp
bmRpY2F0aW9ucyBvZiBjb25uZWN0ZWQgUG9FIFBEcy4NCj4gPiANCj4gPiBSZXZpZXdlZC1ieTog
QmVuIEhvZWxrZXIgPGJlbi5ob2Vsa2VyQGFsbGllZHRlbGVzaXMuY28ubno+DQo+ID4gUmV2aWV3
ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4N
Cj4gDQo+IFdoZXJlIGRpZCB0aGVzZSB0d28gcmV2aWV3cyBoYXBwZW4/DQo+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFRvbnkgTydCcmllbiA8dG9ueS5vYnJpZW5AYWxsaWVkdGVsZXNpcy5jby5uej4N
Cj4gPiAtLS0NCj4gPiDCoGluY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaCB8IDEgKw0K
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaCBiL2luY2x1ZGUvZHQtDQo+ID4g
YmluZGluZ3MvbGVkcy9jb21tb24uaA0KPiA+IGluZGV4IDRmMDE3YmVhMDEyMy4uM2E4OTU4Yjgx
Yzg3IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaA0K
PiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaA0KPiA+IEBAIC05NCw2
ICs5NCw3IEBADQo+ID4gwqAjZGVmaW5lIExFRF9GVU5DVElPTl9NT0JJTEUgIm1vYmlsZSINCj4g
PiDCoCNkZWZpbmUgTEVEX0ZVTkNUSU9OX01URCAibXRkIg0KPiA+IMKgI2RlZmluZSBMRURfRlVO
Q1RJT05fUEFOSUMgInBhbmljIg0KPiA+ICsjZGVmaW5lIExFRF9GVU5DVElPTl9QT0UgInBvZSIN
Cj4gDQo+IFdoZXJlIGlzIGFueSB1c2VyIG9mIHRoaXM/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KPiANCg0K

