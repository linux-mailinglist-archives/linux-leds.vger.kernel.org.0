Return-Path: <linux-leds+bounces-5080-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 628A8B07B4D
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jul 2025 18:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A11831C23D16
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jul 2025 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9012F4A1E;
	Wed, 16 Jul 2025 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GX4Y4wKN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A9B433AC;
	Wed, 16 Jul 2025 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752683883; cv=none; b=WJGnKA3MSAyLwOIpRC3z0gLkccKIQi7CRlPt4U76tmhA3grtC/kdu7q1pFadrt81jSOVgRaWmTuVl1Y3MewvhNdnF3FJgr0bpGtQTlAqDXi2RLWg2zMmI+X6CNv5UEstaHStnt6JBgU/0bk+qpE7KxTJh11HRoOZWn4lyLeseNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752683883; c=relaxed/simple;
	bh=zFmtA21AaEV1+kxfnsDnysiKefMlwlfiKdpeTCGGCyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdnk60WBZUMdil5e/39iJPueiD2HbmZskAw+kX05T+jMSrkhKEFa4XSDLXiwCZ7Yghj9wQLOBC+j4LTciZSOGrTUsScqcqqnbjI0QO3xXv1PpdMcAhCcup9Rct6QWQ/2ktJ8kxUtHw8Fe9aer8fATmJp7K0M5zaDGoSW2I1I8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GX4Y4wKN; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1752683854; x=1753288654; i=w_armin@gmx.de;
	bh=zFmtA21AaEV1+kxfnsDnysiKefMlwlfiKdpeTCGGCyk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GX4Y4wKNu128WgMJ8lxHjftmSrSg5DGfmwzUBmUmJ9dckeBq0oGJ3Uly8aPs0qzc
	 /sDnCYpqqHNQb8rmPuc4Ktz2tMhtlUActsLWJ684skYiFQpGOQ1paNmqypf9qa1a8
	 xt4dys9ALbx1HS7l7CIQF/orjbg0btSEnqu60LX8Fjgmx2b/h/rVeJHVEigG0PPbn
	 AeKnPefuxew6M9T2vTCejXCtU5J6uCNmjyuE0Yh2Enb4eaXHrz6nnud9RBI9JTIpX
	 lBO7x1QUGjydxt742rv2riSuxLK8ds16N4QmXu7s/ZSESNkkh2d0TEce8/vTTG+o+
	 8wgkrCyWyQlpLK6VXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1ukA6Z2Pli-00vbSy; Wed, 16
 Jul 2025 18:37:33 +0200
Message-ID: <b0ac5ea8-e18c-4460-8366-efef4f6e9cc6@gmx.de>
Date: Wed, 16 Jul 2025 18:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 linux-leds@vger.kernel.org, lee@kernel.org, pobrn@protonmail.com
References: <20250712112310.19964-1-W_Armin@gmx.de>
 <20250712112310.19964-2-W_Armin@gmx.de>
 <2cc8f650-e917-4bed-80f0-e74b37a426f5@oracle.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2cc8f650-e917-4bed-80f0-e74b37a426f5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:IIPBYNdS1rgS4+iSJyOtw8Yjfx7X1mylxTIVnWb2bfJdthNEabN
 NQXd8t37MWppKy8Zsz4jxRULKQk9dyan9vCr3XkSTE7rMImJG9uApiqSldEHRQgA2XTijMv
 XjAHLvFsa9rUhV7cJTxel/GnXC3DTd6Tf6IGmI/SD0I/BWAhp0+cGM6O+mulZjeMhrMAELd
 BYqNkjKLkIHijprWagR2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nrN5zB//Kyg=;TJgbUBqtiypFW+cUjVwghzoskK0
 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
oCAvKiBSZXBvcnRlZCB3aGVuIHRoZSB1c2VyIGxvY2tzL3VubG9ja3MgdGhlIHN1cGVyIGtleSAq
Lw0KPj4gK8KgwqDCoCB7IEtFX0lHTk9SRSzCoMKgwqAgVU5JV0lMTF9PU0RfU1VQRVJfS0VZX0xP
Q0tfRU5BQkxFLMKgwqDCoCB7IA0KPj4gS0VZX1VOS05PV04gfX0sDQo+PiArwqDCoMKgIHsgS0Vf
SUdOT1JFLMKgwqDCoCBVTklXSUxMX09TRF9TVVBFUl9LRVlfTE9DS19ESVNBQkxFLMKgwqDCoCB7
IA0KPj4gS0VZX1VOS05PV04gfX0sDQo+PiArDQo+PiArwqDCoMKgIC8qIFJlcG9ydGVkIGluIG1h
bnVhbCBtb2RlIHdoZW4gdG9nZ2xpbmcgdGhlIGFpcnBsYW5lIG1vZGUgDQo+PiBzdGF0dXMgKi8N
Cj4+ICvCoMKgwqAgeyBLRV9LRVkswqDCoMKgIFVOSVdJTExfT1NEX1JGS0lMTCzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHsgS0VZX1JGS0lMTCB9fSwNCj4+ICsNCj4+ICvCoMKgwqAgLyogUmVwb3J0
ZWQgd2hlbiB1c2VyIHdhbnRzIHRvIGN5Y2xlIHRoZSBwbGF0Zm9ybSBwcm9maWxlICovDQo+PiAr
wqDCoMKgIHsgS0VfSUdOT1JFLMKgwqDCoCBVTklXSUxMX09TRF9QRVJGT1JNQU5DRV9NT0RFX1RP
R0dMRSzCoMKgwqAgeyANCj4+IEtFWV9VTktOT1dOIH19LA0KPj4gKw0KPj4gK8KgwqDCoCAvKiBS
ZXBvcnRlZCB3aGVuIHRoZSB1c2VyIHdhbnRzIHRvIGFkanVzdCB0aGUgYnJpZ2h0bmVzcyBvZiB0
aGUgDQo+PiBrZXlib2FyZMKgICovDQo+DQo+IHJlbW92ZSBleHRyYSAiICIgYWZ0ZXIga2V5Ym9h
cmQNCg0KV2lsbCBkby4NCg0KVGhhbmtzLA0KQXJtaW4gV29sZg0KDQo+DQo+PiArwqDCoMKgIHsg
S0VfS0VZLCBVTklXSUxMX09TRF9LQkRJTExVTURPV04swqDCoMKgwqDCoMKgwqAgeyBLRVlfS0JE
SUxMVU1ET1dOIH19LA0KPj4gK8KgwqDCoCB7IEtFX0tFWSzCoMKgwqAgVU5JV0lMTF9PU0RfS0JE
SUxMVU1VUCzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsgS0VZX0tCRElMTFVNVVAgDQo+PiB9fSwN
Cj4+ICsNCj4+ICvCoMKgwqAgLyogUmVwb3J0ZWQgd2hlbiB0aGUgdXNlciB3YW50cyB0byB0b2dn
bGUgdGhlIG1pY3JvcGhvbmUgbXV0ZSANCj4+IHN0YXR1cyAqLw0KPj4gK8KgwqDCoCB7IEtFX0tF
WSzCoMKgwqAgVU5JV0lMTF9PU0RfTUlDX01VVEUswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7IEtF
WV9NSUNNVVRFIH19LA0KPj4gKw0KPj4gK8KgwqDCoCAvKiBSZXBvcnRlZCB3aGVuIHRoZSB1c2Vy
IGxvY2tzL3VubG9ja3MgdGhlIEZuIGtleSAqLw0KPj4gK8KgwqDCoCB7IEtFX0lHTk9SRSzCoMKg
wqAgVU5JV0lMTF9PU0RfRk5fTE9DSyzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsgS0VZX0ZOX0VT
QyB9fSwNCj4+ICsNCj4+ICvCoMKgwqAgLyogUmVwb3J0ZWQgd2hlbiB0aGUgdXNlciB3YW50cyB0
byB0b2dnbGUgdGhlIGJyaWdodG5lc3Mgb2YgdGhlIA0KPj4ga2V5Ym9hcmQgKi8NCj4NCj4NCj4g
VGhhbmtzLA0KPiBBbG9rDQo+DQo=

