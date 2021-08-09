Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236DE3E3FF9
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 08:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhHIG3m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 02:29:42 -0400
Received: from smtp1.axis.com ([195.60.68.17]:13135 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233263AbhHIG3k (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Aug 2021 02:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1628490560;
  x=1660026560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J1LLnZoEZ4KpyReFWrEMVL4SnYNOOoX4DhDLRTmpSHM=;
  b=GR9jhROT85GTUJpfQkbn8D3O0zJXNC4MnvzlmJ3leEuRd4zl2ei5HBX3
   I8kgqoAwD9ucF1E4onHF+HyUyK0c7jW/Ax3cnDfNL+xg2wuciRYzLViIp
   hcOx2RmEeyrUkrDXgcZYU0/IpA0b70Nqou7mNbvo8+qxeN4/K74QUe3Jd
   BnnBTMb02AIuEPLVMdcJFPeadJB2xrUAVuPgDvR/EnqIAxkhqZARLYLsS
   pgGnazz7xBB+LrURzyVCaXjgLIXFDgQHayfx+7Gbe74ein2wWpQwkvVtm
   IXPu0J51M6ZEj2GGuqaqA4fRJPxLIAx2fdWp/9ans8tWWuJRWW3I/j/3c
   w==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>, kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH v3] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Thread-Topic: [PATCH v3] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Thread-Index: AQHXJGCsIcnYe8/O3Ei7dpx0xCno/6tkJyOAgAdfVPA=
Date:   Mon, 9 Aug 2021 06:29:18 +0000
Message-ID: <69ae0b3fd44c4a5796d125a5b97b9d78@XBOX01.axis.com>
References: <20210329055847.13293-1-chenhui.zhang@axis.com>
 <20210804155221.GB25072@amd>
In-Reply-To: <20210804155221.GB25072@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF2ZWwgTWFjaGVr
IDxwYXZlbEB1Y3cuY3o+DQo+IFNlbnQ6IDIwMjHE6jjUwjTI1SAyMzo1Mg0KPiBUbzogSGVybWVz
IFpoYW5nIDxIZXJtZXMuWmhhbmdAYXhpcy5jb20+DQo+IENjOiBEYW4gTXVycGh5IDxkbXVycGh5
QHRpLmNvbT47IGtlcm5lbCA8a2VybmVsQGF4aXMuY29tPjsgSGVybWVzDQo+IFpoYW5nIDxIZXJt
ZXMuWmhhbmdAYXhpcy5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4gbGVkc0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gbGVkczog
bGVkcy1tdWx0aS1ncGlvOiBBZGQgbXVsdGlwbGUgR1BJT3MgTEVEIGRyaXZlcg0KPiANCj4gSGkh
DQo+IA0KPiA+IEZyb206IEhlcm1lcyBaaGFuZyA8Y2hlbmh1aXpAYXhpcy5jb20+DQo+ID4NCj4g
PiBJbnRyb2R1Y2UgYSBuZXcgbXVsdGlwbGUgR1BJT3MgTEVEIGRyaXZlci4gVGhpcyBMRUQgd2ls
bCBtYWRlIG9mDQo+ID4gbXVsdGlwbGUgR1BJT3MgKHVwIHRvIDgpIGFuZCB3aWxsIG1hcCBkaWZm
ZXJlbnQgYnJpZ2h0bmVzcyB0bw0KPiA+IGRpZmZlcmVudCBHUElPcyBzdGF0ZXMgd2hpY2ggZGVm
aW5lZCBpbiBkdHMgZmlsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhlcm1lcyBaaGFuZyA8
Y2hlbmh1aXpAYXhpcy5jb20+DQo+IA0KPiBUaGFuayB5b3UsIGl0IGxvb2tzIHNpbXBsZSBhbmQg
bW9zdGx5IG9rLg0KPiANCj4gQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pg0K
PiANCj4gQnV0IGl0IHJlYWxseSBuZWVkcyB0byBnbyBpbiB3aXRoIGRldmljZXRyZWUgZG9jdW1l
bnRhdGlvbiBjaGFuZ2VzLCBhbmQgdGhleQ0KPiBuZWVkIHRvIGJlIGFja2VkIGJ5IGRldmljZXRy
ZWUgbWFpbnRhaW5lcnMuIElmIHlvdSBoYXZlIHRoYXQsIHBsZWFzZSBzZW5kIGl0DQo+IGluIHNl
cmllcy4NCj4gDQoNCkRvIHlvdSBtZWFuIHRoaXMgb25lOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9wYXRjaHdvcmsvcGF0Y2gvMTQwMjQ3MS8sIGl0J3MgYWxyZWFkeSBpbiBzZXJpZXMuIA0KDQpC
ZXN0IFJlZ2FyZHMsDQpIZXJtZXMNCg==
