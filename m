Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9DC3456BF
	for <lists+linux-leds@lfdr.de>; Tue, 23 Mar 2021 05:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCWE2W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 00:28:22 -0400
Received: from smtp2.axis.com ([195.60.68.18]:9581 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhCWE2E (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Mar 2021 00:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616473685;
  x=1648009685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DoZBedXlsVXxp9TK78nJgsu4jYFzEXmWx4rX2mAkAxk=;
  b=KLBhp4eC+TjuzGVwmoiWKklgg9HxuAJybNoqCjGnXcuwCZw4IKkIMxj4
   VHrciekr66YmersEFHbQXakQqGP0XQ+Boqy36jc6zyhAQQ4uJFLQtPgQ4
   b02Zqd5nQ7QHtyM+yXuqOSwOVGpLWpNW6fbbeU357CgJk1d6QXMBtssK2
   1ajDWsAyLb8wRm9voR29Iygb3Qe6BQ+5x8AxNRj8JBOY4mh9hPlVVyTVo
   0cuodEQU8x/iJkTj1RKp9QOIZgAjHkmQLhdX2QjfvkOM5L9o/zCD/SqDp
   86VIV1XiXT9A2zUD9F6b+PEBhBkYkIJH8m+d1+xykvY8XS+ZL0b7gL3GQ
   w==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Rob Herring <robh@kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH v2] dt-binding: leds: Document leds-multi-gpio bindings
Thread-Topic: [PATCH v2] dt-binding: leds: Document leds-multi-gpio bindings
Thread-Index: AQHXHvxgm+r+aZrBek+AmH3Nb8cHlKqQNY0AgAC2GSA=
Date:   Tue, 23 Mar 2021 04:27:57 +0000
Message-ID: <424d3de97a154c6a9580f27347882413@XBOX01.axis.com>
References: <20210322091819.29119-1-chenhui.zhang@axis.com>
 <1616434698.344402.2887754.nullmailer@robh.at.kernel.org>
In-Reply-To: <1616434698.344402.2887754.nullmailer@robh.at.kernel.org>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPg0KPiBTZW50OiAyMDIxxOoz1MIyM8jVIDE6MzgNCj4gTXkgYm90IGZvdW5kIGVy
cm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6DQo+IA0K
PiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3Mv
ZXJyb3JzOg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtDQo+IHJldmlldy9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW11bHRpLQ0KPiBncGlvLmV4YW1w
bGUuZHQueWFtbDogZ3Bpb3MtbGVkOiBsZWQtc3RhdGVzOiAnb25lT2YnIGNvbmRpdGlvbmFsIGZh
aWxlZCwgb25lDQo+IG11c3QgYmUgZml4ZWQ6DQo+IAlbWzAsIDEsIDIsIDNdXSBpcyB0b28gc2hv
cnQNCj4gCVswLCAxLCAyLCAzXSBpcyB0b28gbG9uZw0KPiAJRnJvbSBzY2hlbWE6IC9idWlsZHMv
cm9iaGVycmluZy9saW51eC1kdC0NCj4gcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2xlZHMtbXVsdGktZ3Bpby55YW1sDQo+IA0KDQpIaSBSb2IsDQoNClRoYW5r
cy4gWWVzLCBub3cgSSBjYW4gc2VlIHRoZSB3YXJuaW5nLCBidXQgSSBjb3VsZCBub3QgdW5kZXJz
dGFuZCB3aGF0IHdhcyB3cm9uZz8gQ291bGQgeW91IGdpdmUgc29tZSBoaW50PyANCg0KQmVzdCBS
ZWdhcmRzLA0KSGVybWVzDQo=
