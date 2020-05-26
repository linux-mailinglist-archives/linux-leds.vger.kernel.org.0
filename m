Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285351E1E79
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 11:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731622AbgEZJ0D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 05:26:03 -0400
Received: from smtp.asem.it ([151.1.184.197]:54018 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728767AbgEZJ0D (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 26 May 2020 05:26:03 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000280371.MSG 
        for <linux-leds@vger.kernel.org>; Tue, 26 May 2020 11:26:00 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Tue, 26
 May 2020 11:25:58 +0200
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1261.035; Tue, 26 May 2020 11:25:58 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: leds: fix macro names for pca955x
Thread-Topic: [PATCH] dt-bindings: leds: fix macro names for pca955x
Thread-Index: AQHWMz70EMXZwJlm5E6wAi2dJ6VX7ai59m4AgAAhzHA=
Date:   Tue, 26 May 2020 09:25:58 +0000
Message-ID: <b58a76bed46141a1a7952303ec466f66@asem.it>
References: <20200526092052.24172-1-f.suligoi@asem.it>
 <20200526092250.GB12838@amd>
In-Reply-To: <20200526092250.GB12838@amd>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090211.5ECCE0A7.0017,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbGVkczogZml4IG1hY3JvIG5hbWVz
IGZvciBwY2E5NTV4DQo+IA0KPiBPbiBUdWUgMjAyMC0wNS0yNiAxMToyMDo1MiwgRmxhdmlvIFN1
bGlnb2kgd3JvdGU6DQo+ID4gVGhlIGRvY3VtZW50YXRpb24gcmVwb3J0cyB0aGUgd3JvbmcgbWFj
cm8gbmFtZXMNCj4gPiByZWxhdGVkIHRvIHRoZSBwY2E5NTMyIGluc3RlYWQgb2YgdGhlIHBjYTk1
NXgNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZsYXZpbyBTdWxpZ29pIDxmLnN1bGlnb2lAYXNl
bS5pdD4NCj4gDQo+IE5vdGhpbmcgb2J2aW91c2x5IHdyb25nLCBidXQgd2h5IGRpZCB5b3Ugc2Vu
ZCBpdCB0d2ljZSB3aXRoaW4gaGFsZiBhbg0KPiBob3VyPw0KPiAJCQkJCQkJCVBhdmVsDQoNClNv
cnJ5IFBhdmVsLCB3aXRoIHRoZSBmaXJzdCBlbWFpbCBJIGZvcmdvdCB0byBzdWJzY3JpYmUNCnRv
IHRoZSBsaW51eC1sZWRzIG1haWxpbmcgbGlzdCEg8J+Yig0KDQpGbGF2aW8NCg0K
