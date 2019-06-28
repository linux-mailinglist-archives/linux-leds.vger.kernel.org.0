Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAFD59CF3
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jun 2019 15:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfF1Nai (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jun 2019 09:30:38 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:23031 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726566AbfF1Nai (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Jun 2019 09:30:38 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-19-F5JmhSpNN6W7HG1xDN_l_A-1; Fri, 28 Jun 2019 14:30:31 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 28 Jun 2019 14:30:30 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 28 Jun 2019 14:30:30 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Linus Walleij' <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dtor@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Murphy <dmurphy@ti.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: RE: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
Thread-Topic: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
Thread-Index: AQHVLY38Qac3tLDSDEaPU1xemGxruKaw8U2g
Date:   Fri, 28 Jun 2019 13:30:30 +0000
Message-ID: <643e3b10fe9d45b59ed063ffc6d578ff@AcuMS.aculab.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
 <CACRpkdYdqKZVKSaQB0THi=iZcRT04EKX2-85__Hw1f53o8vsuw@mail.gmail.com>
In-Reply-To: <CACRpkdYdqKZVKSaQB0THi=iZcRT04EKX2-85__Hw1f53o8vsuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: F5JmhSpNN6W7HG1xDN_l_A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

RnJvbTogTGludXMgV2FsbGVpag0KPiBTZW50OiAyOCBKdW5lIDIwMTkgMDk6NDYNCi4uLg0KPiBB
IHByb2JsZW0gd2l0aCBMRURzIGlzIHRoYXQgaXQgaW52aXRlcyBiaWtlc2hlZGRpbmcgYmVjYXVz
ZSBpdCBpcyB0b28NCj4gcmVsYXRlYWJsZS4NCg0KQmlrZXNoZWRkaW5nIGxlZHMgOi0pDQoNCkl0
IGFsc28gaXNuJ3QgYXQgYWxsIGNsZWFyIGhvdyB0byBoYW5kbGUgYmktY29sb3VyIGFuZCB0cmkt
Y29sb3VyIGxlZHMuDQpJU1RSIHRoZSB1c3VhbCBpbnRlcmZhY2UgbGV0cyB5b3Ugc2V0IHRoZSBi
cmlnaHRuZXNzLCBidXQgbW9yZSBvZnRlbg0KbGVkcyBhcmUgc2luZ2xlIGJyaWdodG5lc3MgYnV0
IG11bHRpLWNvbG91ci4NCkVnIHRoZSBldGhlcm5ldCAnc3BlZWQnIGxlZCB3aGljaCBpcyAodXN1
YWxseSkgb2ZmL29yYW5nZS9ncmVlbi4NCg0KQ2hhbmdpbmcgdGhlIGJyaWdodG5lc3MgZWl0aGVy
IG1lYW5zIGNoYW5naW5nIHRoZSBjdXJyZW50IG9yIHVzaW5nIFBXTS4NCkJvdGggcmVhbGx5IHJl
cXVpcmUgbW9yZSBoYXJkd2FyZSBzdXBwb3J0IHRoYW4gY2hhbmdpbmcgY29sb3Vycy4NCg0KSSd2
ZSBkb25lIHNvbWUgbGVkIGRyaXZpbmcgKGZvciBhIGZyb250IHBhbmVsKSBmcm9tIGEgUExEIChz
bWFsbCBGUEdBKS4NCkFzIHdlbGwgYXMgdGhlIG9idmlvdXMgdGhpbmdzIEkgZGlkOg0KLSBkaW06
IDEvOHRoIG9uIGF0IDgwSHouDQotIGZsYXNoOiAxLzh0aCBvbiBhdCA0SHouDQotIG9yYW5nZTog
NTAtNTAgcmVkLWdyZWVuIGF0IDgwSHogb24gYW4gUkdCIGxlZC4NCg0KVGhlcmUgd2FzIGFsc28g
dGhlICdldGhlcm5ldCBhY3Rpdml0eScgbGVkIHdoaWNoIGNvdWxkIGVpdGhlciBiZSBkcml2ZW4N
CmJ5IHRoZSBoYXJkd2FyZSwgb3IgZm9yY2VkIG9uL29mZi9mbGFzaCBieSB0aGUgZHJpdmVyLg0K
SWYgZHJpdmVuIGJ5IHRoZSBoYXJkd2FyZSwgdGhlIHNvZnR3YXJlIGNvdWxkIHJlYWQgdGhlIGN1
cnJlbnQgc3RhdGUuDQoNCk5vbmUgb2YgdGhpcyByZWFsbHkgZml0dGVkIHRoZSBMaW51eCBsZWRz
IGludGVyZmFjZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwg
QnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVn
aXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

