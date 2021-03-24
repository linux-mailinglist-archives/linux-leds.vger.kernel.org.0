Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7B5347157
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 07:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhCXGET (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 02:04:19 -0400
Received: from smtp1.axis.com ([195.60.68.17]:7259 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230057AbhCXGED (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 02:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616565843;
  x=1648101843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sk06+HZ6Blr7iUQ4aFmbDlbxhVZxlHgzlIAHEdW4tT4=;
  b=bIDUvjPl13vgn9k1JJD/czscd52YXbjosXItkdbXKYIE9p7CAxzE1TW9
   zm8PJk/C760xfIrXThSiwR0kBp6FnVDxpVm7ArT0LucmWvL7penYHeRb6
   jewGAzA6rhExakJqYomKw3dn9zoqks0214Dv2trjBU7wNdCzU3rm4OVnm
   5M+qtBHu0WATW9zP8aP/our2V4TqbvTCMrZobw5l4J0dUjIUmD/6yUuwc
   q5jDdgdUETPYOZWho1lmfk5SDCUVP89vpzIWSkDIxGgqRkO1Jz36tFT8s
   8CIpFWRNYpYxPujEBhk3coM+EK9C9e5i0MZLZ+d84vpW3J1GJt6s3UVi1
   g==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Alexander Dahl <ada@thorsis.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>
CC:     kernel <kernel@axis.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] dt-binding: leds: Document leds-multi-gpio bindings
Thread-Topic: [PATCH v3] dt-binding: leds: Document leds-multi-gpio bindings
Thread-Index: AQHXIFhJRIZ9H+Su6ESnlhvrRvIo5aqSk++AgAARZqA=
Date:   Wed, 24 Mar 2021 06:04:01 +0000
Message-ID: <cce4da5a92d9414e87b6ac6d1d167fac@XBOX01.axis.com>
References: <20210324024844.15796-1-chenhui.zhang@axis.com>
 <558944059.12080.1616565502073@seven.thorsis.com>
In-Reply-To: <558944059.12080.1616565502073@seven.thorsis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

PiA+DQo+ID4gTm90ZXM6DQo+ID4gICAgIEFkZCBtYXhJdGVtcw0KPiANCj4gV2hhdCBhYm91dCB0
aGUgb3RoZXIgcGFydCBvZiB0aGUgc2VyaWVzPyBJIHRoaW5rIHlvdSBzaG91bGQgc2VuZCBib3Ro
DQo+IHBhdGNoZXMgdG9nZXRoZXIgd2l0aCBhbiBpbnRyb2R1Y3Rpb24gbWVzc2FnZSBvbiBib3Ro
LiBJZiB5b3Ugb25seSBjaGFuZ2UNCj4gb25lIHBhdGNoIGZvciBhIG5ldyB2ZXJzaW9uIHNwaW4g
b2YgdGhlIHNlcmllcywganVzdCBzZW5kIHRoZSBvdGhlciBvbmUNCj4gdW5jaGFuZ2VkLg0KPiAN
Cj4gKEl0IG1ha2VzIG5vIHNlbnNlIHRvIG1lcmdlIHRoZSBiaW5kaW5nIGFzIGxvbmcgYXMgdGhl
IGRyaXZlciBpcyBub3QgbWVyZ2VkLA0KPiBvdGhlcndpc2UgeW91IHdvdWxkIGVuZCB1cCB3aXRo
IGEgYmluZGluZyB3aXRob3V0IGRyaXZlci4gU28ga2VlcGluZyB0aGVtDQo+IHRvZ2V0aGVyIHNo
b3VsZCBoZWxwIHJldmlld2VycyBhbmQgbWFpbnRhaW5lcnMuKQ0KPiANCg0KSGkgQWxleGFuZGVy
LA0KDQpUaGUgb3RoZXIgcGFydCBpcyBoZXJlOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvMTM5OTg3NS8sIHNvIGRvIHlvdSBtZWFuIEkgbmVlZCB0byBjb21iaW5lIHRo
ZXNlIHR3byBhcyBvbmUgY29tbWl0PyBPciBpcyB0aGVyZSBhbnl3YXkgdG8gbGluayB0aGVtIHRv
Z2V0aGVyPyBUaGFua3MuDQoNCkknbSBmaXJzdCB0aW1lIHRvIGNvbW1pdCBhIG5ldyBkcml2ZXIs
IHNvcnJ5IGZvciB0aGF0Lg0KDQpCZXN0IFJlZ2FyZHMsDQpIZXJtZXMNCg==
