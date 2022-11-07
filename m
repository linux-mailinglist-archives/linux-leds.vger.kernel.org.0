Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2242761EEE6
	for <lists+linux-leds@lfdr.de>; Mon,  7 Nov 2022 10:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbiKGJ00 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Nov 2022 04:26:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbiKGJZ6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Nov 2022 04:25:58 -0500
X-Greylist: delayed 603 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Nov 2022 01:25:34 PST
Received: from mx3.securetransport.de (mx3.securetransport.de [IPv6:2a01:4f8:c0c:92be::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A3D17425
        for <linux-leds@vger.kernel.org>; Mon,  7 Nov 2022 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
        s=dhelectronicscom; t=1667812517;
        bh=FKcWqN239CxM4VGBTWuMlm67O7q/hpjWaFxk61Rv33I=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DOrFK1lnPNK2kqH7akRKrALNtRhLAvN/OVoA1l0oO/iHox6GxTRpMxiQds6v7mvAm
         qD0jULGZL8xCerbTNClUsDOknalaWn57kuGlSLxe/pRXUCkLctb3xKJZHLgW741Cv0
         Jjd3qA13f6mnVxXJjr9W4Rf6oEumSVWZMtJKGZkj7ZOtVTJnWgFdglAdOv5sPjcdWy
         rPrsy158xwpPbzUay6l9nmwr53F+WYZMD6TFO2fQd/gTW0M4ntxXjird4g+L3Jyxho
         0AK2PDpdXSbrONzddV/v+qybDaq1cSuIHePtxdIYpyvhBtwc6gOWHP+OgJS3SlTAwM
         1IGywONv95hSg==
X-secureTransport-forwarded: yes
From:   Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To:     Marek Vasut <marex@denx.de>
CC:     Pavel Machek <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH] leds: gpio: Configure per-LED pin control
Thread-Topic: [PATCH] leds: gpio: Configure per-LED pin control
Thread-Index: AQHY8kBWOA11paFDdESPwvR5fgLuGa4zLdUg
Date:   Mon, 7 Nov 2022 09:15:10 +0000
Message-ID: <be1054ae26354343afa806868dd30d51@dh-electronics.com>
References: <20221107003133.377704-1-marex@denx.de>
In-Reply-To: <20221107003133.377704-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

RnJvbTogTWFyZWsgVmFzdXQgW21haWx0bzptYXJleEBkZW54LmRlXQ0KU2VudDogTW9uZGF5LCBO
b3ZlbWJlciA3LCAyMDIyIDE6MzIgQU0NCj4gRWFjaCBncGlvLWxlZHMgRFQgbm9kZSBEVCBzdWJu
b2RlIGNhbiBoYXZlIGEgcGluY3RybCBwcm9wZXJ0eSBhc3NpZ25lZA0KPiB0byBpdCwgcGFyc2Ug
dGhlIERUIHN1Ym5vZGUgcGluY3RybCBwcm9wZXJ0aWVzIGFuZCBjb25maWd1cmUgZWFjaCBwaW4N
Cj4gYWNjb3JkaW5nbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhA
ZGVueC5kZT4NCj4gLS0tDQo+IENjOiBDaHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWll
ckBkaC1lbGVjdHJvbmljcy5jb20+DQo+IENjOiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4N
Cj4gVG86IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgZHJpdmVycy9sZWRz
L2xlZHMtZ3Bpby5jIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9sZWRzLWdw
aW8uYyBiL2RyaXZlcnMvbGVkcy9sZWRzLWdwaW8uYw0KPiBpbmRleCAwOTJlYjU5YTdkMzI1Li4w
MWNhODg4NzZmMDA4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2xlZHMvbGVkcy1ncGlvLmMNCj4g
KysrIGIvZHJpdmVycy9sZWRzL2xlZHMtZ3Bpby5jDQo+IEBAIC0xMyw2ICsxMyw3IEBADQo+ICAj
aW5jbHVkZSA8bGludXgvbGVkcy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1l
ci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1ZGUg
PGxpbnV4L3Byb3BlcnR5Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiBAQCAtNzcs
NiArNzgsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ncGlvX2xlZChjb25zdCBzdHJ1Y3QgZ3Bpb19s
ZWQgKnRlbXBsYXRlLA0KPiAgICAgICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIGdw
aW9fYmxpbmtfc2V0X3QgYmxpbmtfc2V0KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBsZWRfaW5p
dF9kYXRhIGluaXRfZGF0YSA9IHt9Ow0KPiArICAgICAgIHN0cnVjdCBwaW5jdHJsICpwaW5jdHJs
Ow0KPiAgICAgICAgIGludCByZXQsIHN0YXRlOw0KPiANCj4gICAgICAgICBsZWRfZGF0LT5jZGV2
LmRlZmF1bHRfdHJpZ2dlciA9IHRlbXBsYXRlLT5kZWZhdWx0X3RyaWdnZXI7DQo+IEBAIC0xMTks
NiArMTIxLDIyIEBAIHN0YXRpYyBpbnQgY3JlYXRlX2dwaW9fbGVkKGNvbnN0IHN0cnVjdCBncGlv
X2xlZCAqdGVtcGxhdGUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmluaXRfZGF0YSk7DQo+ICAgICAgICAgfQ0KPiANCj4gKyAgICAgICBp
ZiAocmV0KQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgICAgIHBp
bmN0cmwgPSBkZXZtX3BpbmN0cmxfZ2V0X3NlbGVjdF9kZWZhdWx0KGxlZF9kYXQtPmNkZXYuZGV2
KTsNCj4gKyAgICAgICBpZiAoSVNfRVJSKHBpbmN0cmwpKSB7DQo+ICsgICAgICAgICAgICAgICBy
ZXQgPSBQVFJfRVJSKHBpbmN0cmwpOw0KPiArICAgICAgICAgICAgICAgaWYgKHJldCAhPSAtRU5P
REVWKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKGxlZF9kYXQtPmNkZXYu
ZGV2LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIHNlbGVj
dCAlcE9GIHBpbmN0cmw6ICVkXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0b19vZl9ub2RlKGZ3bm9kZSksIHJldCk7DQo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugew0K
PiArICAgICAgICAgICAgICAgICAgICAgICAvKiBwaW5jdHJsLSVkIG5vdCBwcmVzZW50LCBub3Qg
YW4gZXJyb3IgKi8NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gMDsNCj4gKyAgICAg
ICAgICAgICAgIH0NCj4gKyAgICAgICB9DQo+ICsNCj4gICAgICAgICByZXR1cm4gcmV0Ow0KPiAg
fQ0KPiANCg0KVGVzdGVkLWJ5OiBDaHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWllckBk
aC1lbGVjdHJvbmljcy5jb20+DQoNCg0KUmVnYXJkcw0KQ2hyaXN0b3BoDQo=
