Return-Path: <linux-leds+bounces-4070-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F321FA42D3E
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2025 20:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7BEE17A407
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2025 19:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98264242902;
	Mon, 24 Feb 2025 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="P7XtfcyT"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2251324290D
	for <linux-leds@vger.kernel.org>; Mon, 24 Feb 2025 19:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740427157; cv=none; b=EoDBbIWKhiU/ZsX2bDdObNLaofjiWzmK2aH5VDucczXL6IuVg28TopTVmnS7BH3DP+wW0e1nZxE2WLKYqCrId5WnraOSeyqPOJ/pCibzzmAJUnwDWRF8IA4AzdNVhSD41WCscUt6dJIwrM0MKOIIvBRqLDAZAcwgHJQXZ3vDKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740427157; c=relaxed/simple;
	bh=T29Q1xIO2NrF/j4ESi+UksxbNYDjtrRfcUqGvaBvtLc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QT2VRfVkSFJxSjOUk/bDaDpeKyqWNKBb6Oig+/ufPQ2F2vBpcq+bf2cdyOD33vOO+/mlWv5cMw9AWCWAYWRSBbFuYjaiP3i7AtgBD9r3ZzEBBFbgwLLTORFq/zzUTv7n2lbd+E+bct8I3ucAOM2Lkp2CWEtiZPRcHNrwl3aWjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=P7XtfcyT; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 951532C0358;
	Tue, 25 Feb 2025 08:59:12 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740427152;
	bh=T29Q1xIO2NrF/j4ESi+UksxbNYDjtrRfcUqGvaBvtLc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=P7XtfcyT700wn5XehekbFzLflxCkMsdaoTXms+McHOb5BWCevbWY+NjOU1raZ6tme
	 KSHEsP+1unDWsy5KzR3sv7PyPFEIqxK2QZZjiuLhss6LP7EPl+8QNcCxDqapRilbKE
	 zNkVeHq5ZVBa8JAeLQVnOGMs54nXlTl5HrSGN6HrzrAJvIVcC9hqFOrT5nk3XFPitr
	 yq+FMbYqOQbvTd3L2uHAGxLUAtYk9YDQh/7pZEpniK1/C4DF03rbEHq5qGcmUC3Spm
	 FYzTDRhqfwGEdcX6UgwUEatISgn5g+dZVARslWsL4RYMC/QlfRKWYcXj1Rdy80gmDb
	 wAQoR3WYhjXVg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67bccf900000>; Tue, 25 Feb 2025 08:59:12 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 08:59:12 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Tue, 25 Feb 2025 08:59:12 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tony O'Brien
	<Tony.OBrien@alliedtelesis.co.nz>
CC: "pavel@kernel.org" <pavel@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Ben Hoelker
	<Ben.Hoelker@alliedtelesis.co.nz>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings:leds: Add function define for POE
Thread-Topic: [PATCH] dt-bindings:leds: Add function define for POE
Thread-Index: AQHbfbJsYgR4pybhekSIhRE+6tZISrNEHtqAgAWB6YCAAMJBgIAKMguAgAC86gCAAMXYgA==
Date: Mon, 24 Feb 2025 19:59:12 +0000
Message-ID: <03d234ea-aca2-49e5-bed7-1ea4375d8ab7@alliedtelesis.co.nz>
References: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
 <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>
 <20250213-successful-pronghorn-of-dignity-83facb@krzk-bin>
 <31bc5340976761dbf3653ed2802a8988e07b18d5.camel@alliedtelesis.co.nz>
 <7462bb47-01ff-45d7-9cbc-24b8da7f7a1d@kernel.org>
 <7a6c287c-45f6-4193-a29a-6c6a29eee3e4@alliedtelesis.co.nz>
 <94e9c990-e37f-4980-86c3-35f390e11395@kernel.org>
In-Reply-To: <94e9c990-e37f-4980-86c3-35f390e11395@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF8EBF03D351944EBC1075CF61280876@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67bccf90 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=5Mus7gy6-xJ113ht0jEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXN6dG9mLA0KDQpPbiAyNC8wMi8yMDI1IDIxOjExLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBPbiAyMy8wMi8yMDI1IDIxOjU0LCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4g
SGkgS3J6eXN6dG9mLA0KPj4NCj4+IE9uIDE3LzAyLzIwMjUgMjI6MTMsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6DQo+Pj4gT24gMTYvMDIvMjAyNSAyMjozNywgVG9ueSBPJ0JyaWVuIHdyb3Rl
Og0KPj4+PiBIaSBLcnp5c3p0b2YgLQ0KPj4+Pg0KPj4+Pj4gV2hlcmUgZGlkIHRoZXNlIHR3byBy
ZXZpZXdzIGhhcHBlbj8NCj4+Pj4gVGhleSB3ZXJlIGluLWhvdXNlIHJldmlld3MuICBQbGVhc2Ug
ZmVlbCBmcmVlIHRvIHJlbW92ZSB0aGVtIGZyb20gdGhlDQo+Pj4+IHBhdGNoLg0KPj4+Pg0KPj4+
Pj4gV2hlcmUgaXMgYW55IHVzZXIgb2YgdGhpcz8NCj4+Pj4gV2UgYXJlIGFkZGluZyBLZXJuZWwg
Y29udHJvbCBvZiBQb0UgTEVEcyBhbmQgdGhvdWdodCB0aGlzIG1pZ2h0IGJlDQo+Pj4+IHVzZWZ1
bCB0byBvdGhlcnMsIG1heWJlIHRob3NlIHdvcmtpbmcgb24gbmV0ZGV2LCBvciBhbnlvbmUgaW1w
bGVtZW50aW5nDQo+Pj4+IFBvRSBvbiB0aGVpciBkZXZpY2VzLiAgQWxzbywgdGhlIEtlcm5lbCA+
PiBEb2NzID4+IExFRHMgcGFnZSBzdGF0ZXM6DQo+Pj4+ICJJZiByZXF1aXJlZCBjb2xvciBvciBm
dW5jdGlvbiBpcyBtaXNzaW5nLCBwbGVhc2Ugc3VibWl0IGEgcGF0Y2ggdG8NCj4+Pj4gbGludXgt
bGVkc0B2Z2VyLmtlcm5lbC5vcmciLCB3aGljaCBpcyBpbmNsdWRlZCBoZXJlLg0KPj4+IFlvdSBk
aWQgbm90IGFuc3dlcjogd2hlcmUgaXMgdGhlIHVzZXI/IEJ5ICJ3ZSBhcmUgYWRkaW5nIiB5b3Ug
bWVhbg0KPj4+IGRvd25zdHJlYW0/DQo+PiBJdCdzIGRvd25zdHJlYW0uIE9uZSBvZiBvdXIgUG9F
IHN3aXRjaGVzIGluIGRldmVsb3BtZW50IHdoaWNoIHVzZXMgYQ0KPg0KPiBTbyBmb3IgbWUgdGhh
dCdzIGEgbm8uIFdlIGRvbid0IGNhcmUgYWJvdXQgZG93bnN0cmVhbS4gT3RoZXJ3aXNlIHdlDQo+
IHdvdWxkIG5lZWQgdG8gYWNjZXB0IHdoYXRldmVyIGVsc2UgcGVvcGxlIGludmVudGVkIGFuZCBu
ZXZlciBib3RoZXJlZA0KPiB3aXRoIHVwc3RyZWFtaW5nLg0KPg0KPj4gcGNhOTU1MiBMRUQgY29u
dHJvbGxlci4gSSBzdWdnZXN0ZWQgdG8gVG9ueSB0aGF0IHdlIGdldCB0aGlzIHVwc3RyZWFtIGFz
DQo+PiBJIGtub3cgdGhlcmUgaXMgc29tZSB3b3JrIGdvaW5nIG9uIHRvIHN1cHBvcnQgUG9FIFBT
RXMgaW4gbmV0ZGV2LiBJIGRpZA0KPj4gd29uZGVyIGlmIHdlIHdhbnRlZCB0byBtYWtlIHRoaXMg
bW9yZSBzcGVjaWZpYyBpLmUuIGhhdmUgInBzZSIgYW5kICJwZCINCj4+IGFzIGRpZmZlcmVudCBm
dW5jdGlvbnMgYnV0IHNvbWV0aGluZyBsaWtlICJwb2UiIHNlZW1lZCBmaW5lIGFzIHlvdSdyZQ0K
Pj4gbm90IGdvaW5nIHRvIGhhdmUgc29tZXRoaW5nIHRoYXQgaXMgYm90aCBhIFBTRSBhbmQgYSBQ
RCBvbiB0aGUgc2FtZSBwb3J0Lg0KPiBUbyBtZSwgdGhpcyBpcyBub3QgYSBjYXRhbG9nIG9mIGFs
bCBwb3NzaWJsZSBMRUQgZnVuY3Rpb25zLiBDb21lIHdpdGgNCj4gYW55IHNvcnQgb2YgdXNlciAt
IGVpdGhlciBkcml2ZXIgb3IgRFRTIChhbmQgSSBzdGlsbCByZW1lbWJlciBkaXNjdXNzaW9uDQo+
IHdpdGggSGFucyBkZSBHb2VkZSBhYm91dCB0YWtpbmcgc3VjaCBwYXRjaGVzIHdpdGhvdXQgRFRT
IHVzZXIsIGJ1dCB0aGF0DQo+IHdhcyB1bmRlciBjb25kaXRpb24gdGhlcmUgaXMgZHJpdmVyIHVz
ZXIpLg0KDQpPSyBmYWlyIGVub3VnaC4NCg0KSSBkbyBwbGFuIG9uIGdldHRpbmcgbW9yZSBvZiBv
dXIgYm9hcmRzIGxhbmRlZCB1cHN0cmVhbS4gVGhlcmUncyBhIGZldyANCkNOOTEzMCBiYXNlZCBv
bmVzIHRoYXQgc2hvdWxkIGJlIHRyaXZpYWwgdG8gZG8gKG9uZSBvZiB3aGljaCBpcyB0aGUgdXNl
ciANCm9mIHRoaXMgTEVEIGZ1bmN0aW9uKS4gVW50aWwgdGhlbiB3ZSBjYW4gY2FycnkgYSBsb2Nh
bCBkZWZpbml0aW9uIG9mIA0KdGhhdCBmdW5jdGlvbi4NCg==

