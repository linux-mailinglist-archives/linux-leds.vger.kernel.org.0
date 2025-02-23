Return-Path: <linux-leds+bounces-4064-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83AA411BD
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2025 21:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EEE1891B87
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2025 20:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F30923F434;
	Sun, 23 Feb 2025 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="PmrwQkAY"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20EA23F26D
	for <linux-leds@vger.kernel.org>; Sun, 23 Feb 2025 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740344106; cv=none; b=f8rb4WKgZXEVsAY7IsyvZJRm01fwUc/qPxAJQ/ZafaFZMWYZ+rXGOXA/p6OvQtDyy+OoNYWQiNfc5A5JMLVt8M03VFtxZLjASmC5AzEq7LXU8dGJRkxWK46TA27IIRok5A2b2hbl7Pf4/IbGDMcg0HmcC/1LYtHXz0MY13UWCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740344106; c=relaxed/simple;
	bh=MoZxjt4ef3Mj3OXxJKq8t0ru2Cygtk+5sJUMMXPFdxU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sHbhmPnvONHfT70r/ZwwPq2ynxg7dtfvtTLgC8kFweHpJsgbojxOZAmGBQth9UGQxbhx+EY4ZMdaMD4WAgmI52le21GcV8JFdUgKr6JDuimf0llT/NP5zHRByK7/b5vgEqMv4HNijOuBY74xBVjJrCspy5A9z7Di+/yoE027kDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=PmrwQkAY; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CEE1B2C019A;
	Mon, 24 Feb 2025 09:54:55 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740344095;
	bh=MoZxjt4ef3Mj3OXxJKq8t0ru2Cygtk+5sJUMMXPFdxU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PmrwQkAYca4y7ARWTFV0hXwsTQLP7eISGxUILlqEUpLQ/5miv5mUjcqsA/IkgGULL
	 gTHANEzB9Nhza29HHhU3MrNEmmowJt0HS/OJEHFawJQlLdThSFeDgcevDIhQmC7ftO
	 aMPqxiHsaKSuJSIA9U5dE/aSSVWpRrO3s8vjJdstEDGSExuz4RyWWJrpmsWEIIg1t/
	 yQIu6/3ivXu+qHNKVSfDAC/rw6rJZIbo3T6Q7rUwrrOw2UdWNeYZtYD5nfkKAVBv3Z
	 1mFqlh3xawe5c67MZl1ar9FtgGhMhoP5S+gJinu/mOPlA/78u5EmxLj5aSxI5OHxJw
	 foWMTrHAGN0YQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67bb8b1f0000>; Mon, 24 Feb 2025 09:54:55 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 09:54:55 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 24 Feb 2025 09:54:55 +1300
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
Thread-Index: AQHbfbJsYgR4pybhekSIhRE+6tZISrNEHtqAgAWB6YCAAMJBgIAKMguA
Date: Sun, 23 Feb 2025 20:54:55 +0000
Message-ID: <7a6c287c-45f6-4193-a29a-6c6a29eee3e4@alliedtelesis.co.nz>
References: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
 <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>
 <20250213-successful-pronghorn-of-dignity-83facb@krzk-bin>
 <31bc5340976761dbf3653ed2802a8988e07b18d5.camel@alliedtelesis.co.nz>
 <7462bb47-01ff-45d7-9cbc-24b8da7f7a1d@kernel.org>
In-Reply-To: <7462bb47-01ff-45d7-9cbc-24b8da7f7a1d@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BD283E3C9AD9343A2B709F977717A74@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67bb8b1f a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=ng1ljuFFI0ieGqgL9r8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXN6dG9mLA0KDQpPbiAxNy8wMi8yMDI1IDIyOjEzLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBPbiAxNi8wMi8yMDI1IDIyOjM3LCBUb255IE8nQnJpZW4gd3JvdGU6DQo+PiBI
aSBLcnp5c3p0b2YgLQ0KPj4NCj4+PiBXaGVyZSBkaWQgdGhlc2UgdHdvIHJldmlld3MgaGFwcGVu
Pw0KPj4gVGhleSB3ZXJlIGluLWhvdXNlIHJldmlld3MuICBQbGVhc2UgZmVlbCBmcmVlIHRvIHJl
bW92ZSB0aGVtIGZyb20gdGhlDQo+PiBwYXRjaC4NCj4+DQo+Pj4gV2hlcmUgaXMgYW55IHVzZXIg
b2YgdGhpcz8NCj4+IFdlIGFyZSBhZGRpbmcgS2VybmVsIGNvbnRyb2wgb2YgUG9FIExFRHMgYW5k
IHRob3VnaHQgdGhpcyBtaWdodCBiZQ0KPj4gdXNlZnVsIHRvIG90aGVycywgbWF5YmUgdGhvc2Ug
d29ya2luZyBvbiBuZXRkZXYsIG9yIGFueW9uZSBpbXBsZW1lbnRpbmcNCj4+IFBvRSBvbiB0aGVp
ciBkZXZpY2VzLiAgQWxzbywgdGhlIEtlcm5lbCA+PiBEb2NzID4+IExFRHMgcGFnZSBzdGF0ZXM6
DQo+PiAiSWYgcmVxdWlyZWQgY29sb3Igb3IgZnVuY3Rpb24gaXMgbWlzc2luZywgcGxlYXNlIHN1
Ym1pdCBhIHBhdGNoIHRvDQo+PiBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsIHdoaWNoIGlz
IGluY2x1ZGVkIGhlcmUuDQo+IFlvdSBkaWQgbm90IGFuc3dlcjogd2hlcmUgaXMgdGhlIHVzZXI/
IEJ5ICJ3ZSBhcmUgYWRkaW5nIiB5b3UgbWVhbg0KPiBkb3duc3RyZWFtPw0KDQpJdCdzIGRvd25z
dHJlYW0uIE9uZSBvZiBvdXIgUG9FIHN3aXRjaGVzIGluIGRldmVsb3BtZW50IHdoaWNoIHVzZXMg
YSANCnBjYTk1NTIgTEVEIGNvbnRyb2xsZXIuIEkgc3VnZ2VzdGVkIHRvIFRvbnkgdGhhdCB3ZSBn
ZXQgdGhpcyB1cHN0cmVhbSBhcyANCkkga25vdyB0aGVyZSBpcyBzb21lIHdvcmsgZ29pbmcgb24g
dG8gc3VwcG9ydCBQb0UgUFNFcyBpbiBuZXRkZXYuIEkgZGlkIA0Kd29uZGVyIGlmIHdlIHdhbnRl
ZCB0byBtYWtlIHRoaXMgbW9yZSBzcGVjaWZpYyBpLmUuIGhhdmUgInBzZSIgYW5kICJwZCIgDQph
cyBkaWZmZXJlbnQgZnVuY3Rpb25zIGJ1dCBzb21ldGhpbmcgbGlrZSAicG9lIiBzZWVtZWQgZmlu
ZSBhcyB5b3UncmUgDQpub3QgZ29pbmcgdG8gaGF2ZSBzb21ldGhpbmcgdGhhdCBpcyBib3RoIGEg
UFNFIGFuZCBhIFBEIG9uIHRoZSBzYW1lIHBvcnQuDQoNCg==

