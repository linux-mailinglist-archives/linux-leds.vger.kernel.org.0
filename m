Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBE2346FB4
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 03:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbhCXCxE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 22:53:04 -0400
Received: from smtp1.axis.com ([195.60.68.17]:34337 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231668AbhCXCwi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Mar 2021 22:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616554358;
  x=1648090358;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Dg8oeMNDYycBgS5zf20SGi8YwA6Qx64E/aiSgxCBJzg=;
  b=QXd154vWMvFteUBTq2tc7HOGRQkkbwfXMfUjMYSgRYBS1UskhYfrvic3
   6UnkDyWq3jcgLPQhicVQkFHBsm6p65+NXV39ATIrpBfNcCi8BozDdx8wP
   yABJLAO8wWnXThlDDVmZhiBXhJHiq6L8QwEdunQ4nxWzpBVsJ0px5VXiJ
   R9cZPWxnL+LMMIdFYgfZcRYrlwlt4URvyXelOCG4igj5eF1+IJOQp7Gb6
   h/JsH4vX2dRrP0dIV16BJBf6ts2e9RmAcHVuTH3k1ob8Ujg7X3owteBjc
   MOYuti/0lKTiCx1peyXZ+UB2g3VvXkLgdFOrFVs3Z8CJn9vhRZMWwwldE
   Q==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Rob Herring <robh@kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH v2] dt-binding: leds: Document leds-multi-gpio bindings
Thread-Topic: [PATCH v2] dt-binding: leds: Document leds-multi-gpio bindings
Thread-Index: AQHXHvxgm+r+aZrBek+AmH3Nb8cHlKqQNY0AgAC2GSCAAJ9XgIAA6EZw
Date:   Wed, 24 Mar 2021 02:52:36 +0000
Message-ID: <2f711d85081d4556acc5d8a658119868@XBOX01.axis.com>
References: <20210322091819.29119-1-chenhui.zhang@axis.com>
 <1616434698.344402.2887754.nullmailer@robh.at.kernel.org>
 <424d3de97a154c6a9580f27347882413@XBOX01.axis.com>
 <CAL_JsqJYSNBHqdZbWTn76tTna+u=1rjiebTPDQjZFQQdTEkp4w@mail.gmail.com>
In-Reply-To: <CAL_JsqJYSNBHqdZbWTn76tTna+u=1rjiebTPDQjZFQQdTEkp4w@mail.gmail.com>
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

PiA+DQo+ID4gSGkgUm9iLA0KPiA+DQo+ID4gVGhhbmtzLiBZZXMsIG5vdyBJIGNhbiBzZWUgdGhl
IHdhcm5pbmcsIGJ1dCBJIGNvdWxkIG5vdCB1bmRlcnN0YW5kIHdoYXQNCj4gd2FzIHdyb25nPyBD
b3VsZCB5b3UgZ2l2ZSBzb21lIGhpbnQ/DQo+IA0KPiBJIHRoaW5rIHlvdSBuZWVkICdtYXhJdGVt
cycgaW4gYWRkaXRpb24gdG8gbWluSXRlbXMuDQoNCkV4YWN0bHkhIFRoYW5rcyBmb3IgdGhlIHN1
Z2dlc3Rpb24uDQoNCkJlc3QgUmVnYXJkcywNCkhlcm1lcw0K
