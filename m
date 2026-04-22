Return-Path: <linux-leds+bounces-7805-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO1HE+zS6GklQQIAu9opvQ
	(envelope-from <linux-leds+bounces-7805-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 15:53:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D9446F70
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 15:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB220306A82B
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 13:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD9039E184;
	Wed, 22 Apr 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="AQxeUZCg"
X-Original-To: linux-leds@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2005d-snip4-11.eps.apple.com [57.103.86.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E936DA08
	for <linux-leds@vger.kernel.org>; Wed, 22 Apr 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865801; cv=none; b=MyKeFWqU/zrdMBjgswLz2zx0CnBq+BSjguAGmnIob0Gzkkwjh9cI8UDZPbz3ez1ABsZ+XE91ACJL/LPLgXOuEobNRocJ4urr5/r3K4G+sa4Wkv4gLg3d69xjO+Jcu5Pwy8LzLokKBDMUEL8mMw2igyHZmZml26PgB7+43UTwKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865801; c=relaxed/simple;
	bh=EK6R/ppVQCbJp84Dc4nejfzdRb4ywHL1WEEgEYIH74A=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GMOCPUmWklQdQv69XThH0xDLcKM6XVDps2qeyQxbO3F8Ke5ArtyLwbrJg/tSw51oNbmOHs3155iWsg0sf95rRFpP6YBB1T2IYix3PDOFjU1Fhei2jA+W6RZiKPeWF4XLjDLsc1dR2YaAyn+H5jFyBkcGt/0PRBNNg0va7S4zyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=AQxeUZCg; arc=none smtp.client-ip=57.103.86.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPS id AF3EF18154DF;
	Wed, 22 Apr 2026 13:49:51 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1NF14CdwpeGVgLWgNQRVwVTVhBDgpYAFBRHV8CCgRHBFsXRgNTRUMDFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxFVEVIeXgVVXlcdR01aAlZNBUoDXwFbBkILVgFfA1MGRxdKAl8CXANHCEkCXg5TB0kMSQtYGQ1HGlAMUi1VDldOGQxKHVJWUQVKDFwAaA9dHVgRXQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1776865796; x=1779457796; bh=EK6R/ppVQCbJp84Dc4nejfzdRb4ywHL1WEEgEYIH74A=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=AQxeUZCgNP4MoxRAeFrkOHD94e8IrPEp0U2GRRLUMSgFwcoK2oUmzajYGxSlNx0zOxW+bDZYiZZbUbEIF062SExb/jS9jxmwFx6/T/IVjf/SktjHEEPyjoceizD913oticwgkO+6m9G+J63zxxHTgBIUvC58MYV4dhwKvzbgZ2bmu1FXkhFBvIM1rKjcNnFgydH5gw4D1p7/DglNncCvo2MvXYiAUCDxY2txGRcRHHHxM97lW+ZXpUbgwIvciLhoCXUrywh0zf9NicpBVXoMoiZUATcwdEI8RiDwkTr4h6aD1UmVfg6r7NPtkJxuWhXPplHWEsM5VxYUX6WeAEJ2xw==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPSA id CF1BB18154D9;
	Wed, 22 Apr 2026 13:49:45 +0000 (UTC)
Date: Wed, 22 Apr 2026 22:48:47 +0900 (JST)
Message-Id: <20260422.224847.2125717111398595185.fujita@bee>
To: miguel.ojeda.sandonis@gmail.com
Cc: markus.probst@posteo.de, a.hindborg@kernel.org, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
 bryan.odonoghue@linaro.org, lee@kernel.org, pavel@kernel.org,
 ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <CANiq72k=8fmi0fJnNV=GgR5_HO_COWGynKDF-xzoX1nDAdxdrw@mail.gmail.com>
References: <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com>
	<1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
	<CANiq72k=8fmi0fJnNV=GgR5_HO_COWGynKDF-xzoX1nDAdxdrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Authority-Info-Out: v=2.4 cv=IqQTsb/g c=1 sm=1 tr=0 ts=69e8d202
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=quj8a31CzFAiuebbDgUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Qm1pbyuctvrbTi3ps4QEHVGq62ptDXKM
X-Proofpoint-ORIG-GUID: Qm1pbyuctvrbTi3ps4QEHVGq62ptDXKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzNCBTYWx0ZWRfX/EGxVhedDk8X
 shVORPt36bM4bXQ18VZy/5kczIDlLQXZuvGmA9H1lURgkuUbc6z4EIPDNiBuF8/nAsAVdYpknti
 djBVLZGxBTPHg0dhMpyroUYMpvpHNJDen6lmX8T6NIglgUuKRhgJkcOxcBCcWbIc4gVSTeHgA8l
 WrB8L4mmhNGZc4QyxdGLQBkcDemRCsr6QaT4ajWm1OeNtmwpK0Y0Xk4x5TBsq803I837ANbDken
 zxzhmt7cQInQjrTCoIwQTjQWPmviUD3vEfuSqpQ41w9jpAd4gmLzgPNRuiGqYN2xpj7gwbgkaDe
 p4h3pjBnB8udgib+IorfJlUWwQaIcP868pN1EjqVtHUnY7GIO+RaBCbnmnjOCU=
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[aliasing.net,quarantine];
	MV_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[aliasing.net:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7805-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,gmail.com,redhat.com,linutronix.de,google.com,linux.intel.com,linaro.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomo@aliasing.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[aliasing.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_TWELVE(0.00)[32];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,aliasing.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 944D9446F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCAyMSBBcHIgMjAyNiAyMDo0Njo1OSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUdWUsIEFwciAyMSwgMjAy
NiBhdCA4OjIx4oCvUE0gTWFya3VzIFByb2JzdCA8bWFya3VzLnByb2JzdEBwb3N0ZW8uZGU+IHdy
b3RlOg0KPj4NCj4+IERlbHRhIHN0b3JlcyBpdCBpbiBuYW5vIHNlY29uZHMsIHNvIGl0IHdpbGwg
cmVxdWlyZSBhbiBhZGRpdGlvbmFsDQo+PiBgLmFzX21pbGxpcygpYCBjYWxsIG9uIHVzZS4gSSBh
c3N1bWUgcnVzdCB3aWxsIG9wdGltaXplIHRoYXQgb3V0LCBzbyBpdA0KPj4gd2lsbCBiZSBmaW5l
LiBJIHdpbGwgdXNlIHRoZSBgRGVsdGFgIHR5cGUgbGlrZSBNaWd1ZWwgc3VnZ2VzdGVkIGluIHRo
ZQ0KPj4gbmV4dCByZXZpc2lvbi4NCj4gDQo+IEkgdGhpbmsgaXQgc2hvdWxkIChhdCBsZWFzdCBp
biB0aGUgNjQtYml0IGNhc2UgLS0gd2UgZG8gaGF2ZSBhDQo+IGBiaW5kaW5nczo6YCBDIGNhbGwg
aW4gdGhlIDMyLWJpdCBjYXNlLCBzbyBsaWtlbHkgbm90IGluIHRoYXQgY2FzZSksDQo+IGJ1dCBw
bGVhc2UgZG91YmxlLWNoZWNrIHRoZSBjb2RlZ2VuLg0KPiANCj4gSW4gYW55IGNhc2UsIG15IHN1
Z2dlc3Rpb24gd2Fzbid0IG5lY2Vzc2FyaWx5IGFib3V0IHVzaW5nIGBEZWx0YWAsDQo+IHdoaWNo
IGlzIGRlZmluaXRlbHkgYW4gb3B0aW9uIHRvIGNvbnNpZGVyLCBidXQgcmF0aGVyIG1vcmUgZ2Vu
ZXJhbGx5DQo+IGFib3V0IHVzaW5nIG5ld3R5cGVzLCBlLmcuIGl0IG1heSBiZSB0aGF0IHdlIHdh
bnQgdG8gaGF2ZSBhIGZldyBzaW1wbGUNCj4gdGltZSB1bml0IHR5cGVzIChwcm9iYWJseSB3aXRo
IHN1cHBvcnQgZm9yIGBjb25zdGApIGZvciBjYXNlcyBsaWtlDQo+IHRoZXNlIGlmIHBlb3BsZSBh
cmUgZ29pbmcgdG8gdXNlIHByaW1pdGl2ZXMgZXZlcnl3aGVyZSB0byBkZWZpbmUgdGhlaXINCj4g
YGNvbnN0YHMgLS0gQ2MnaW5nIHRoZSB0aW1la2VlcGluZyBSdXN0IGZvbGtzLg0KDQpDdXJyZW50
bHksIE1zZWNzIGlzIGEgdHlwZSBhbGlhcywgc28gaXQgcHJvdmlkZXMgbm8gdHlwZSBzYWZldHks
IGFuZA0KaXQgaGFzIG5vIHVzZXJzIGluIHRoZSBrZXJuZWwuIEkgdGhpbmsgd2Ugc2hvdWxkIHJl
bW92ZSBpdC4NCg0KSSB0aGluayB0aGF0IERlbHRhIHdvcmtzIGZpbmUgZm9yIEJMSU5LX0RFTEFZ
LiBPbiAzMi1iaXQgdGhlcmUgaXMgYQ0Kc21hbGwgb3ZlcmhlYWQgaW4gYXNfbWlsbGlzKCksIGJ1
dCBJIGRvbid0IHRoaW5rIHRoYXQgd2lsbCBiZSBhDQpwcm9ibGVtIHNpZ25pZmljYW50IGVub3Vn
aCB0byBqdXN0aWZ5IGludHJvZHVjaW5nIG5ldyB0eXBlcy4NCg0K

