Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E706322B2
	for <lists+linux-leds@lfdr.de>; Mon, 21 Nov 2022 13:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiKUMpE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Nov 2022 07:45:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiKUMo5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Nov 2022 07:44:57 -0500
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42744BF829;
        Mon, 21 Nov 2022 04:44:45 -0800 (PST)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id E54535FD02;
        Mon, 21 Nov 2022 15:44:43 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1669034683;
        bh=JoEeITcvT6bBKILJbvfI16dX6Bk/j/AyXr+X7jCQoGM=;
        h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
        b=UjTBQJywenOvNOxBkd5/7jLMFQMDoUo+IdCTv+yrh1Gdudy1usROu1da5wMaJ38qX
         2y2vYmRB8dDPypBG1+f+R0RBS+S26Fb0/AMAPK5gHnzD6qzz3m/wLHvKn5c/X7zUvi
         nOvY7qgAKYR3nWaAa8xTK8KhKuZE7v0guOffTbWCz2yHnBr6wWs6eBktZ6gyK4sAvE
         WhNBoEByplIrXDBr3r4D6UaKAEGOD4OlOl75WIMD52Fr3epLrtbGFS4FMTS2Yqu7ef
         GfH/Q9F2Rv4ux9X1roBZAeHs78hyCSDZClAQFzc57OnuDh4dekHmPYiflQGVHc+LrP
         RHEKCerTxoi4g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Mon, 21 Nov 2022 15:44:43 +0300 (MSK)
From:   Martin Kurbanov <MMKurbanov@sberdevices.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        kernel <kernel@sberdevices.ru>, Pavel Machek <pavel@ucw.cz>,
        Raphael Teysseyre <rteysseyre@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: trigger: pattern: notify usespace if pattern
 finished
Thread-Topic: [PATCH v2 2/2] leds: trigger: pattern: notify usespace if
 pattern finished
Thread-Index: AQHY/aZNDR7OUPj3B0ewAxCZsMlgea5JIHSA
Date:   Mon, 21 Nov 2022 12:44:43 +0000
Message-ID: <e61c6d8d-90d1-8cde-03c8-00d8f7e62160@sberdevices.ru>
References: <20221121123833.164614-1-mmkurbanov@sberdevices.ru>
 <20221121123833.164614-3-mmkurbanov@sberdevices.ru>
In-Reply-To: <20221121123833.164614-3-mmkurbanov@sberdevices.ru>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.12]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8ABDBDBE0D6A5D4A98B4215D6306DD0F@sberdevices.ru>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/11/21 03:43:00 #20593185
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

T24gMjEuMTEuMjAyMiAxNTozOCwgTWFydGluIEt1cmJhbm92IHdyb3RlOg0KPiBJbiB0aGUgY3Vy
cmVudCBtb21lbnQsIHVzZXJzcGFjZSBjYWxsZXIgY2FuIHNjaGVkdWxlIExFRCBwYXR0ZXJuIHdp
dGgNCj4gYXBwcm9wcmlhdGUgcGFyYW1ldGVycywgYnV0IGl0IGRvZXNuJ3QgaGF2ZSBhYmlsaXR5
IHRvIGxpc3RlbiB0byBhbnkNCj4gZXZlbnRzIGluZGljYXRlZCBwYXR0ZXJuIGZpbmlzaGVkLiBU
aGlzIHBhdGNoIGltcGxlbWVudHMgc3VjaCBhbiBldmVudA0KPiB1c2luZyBzeXNmcyBub2RlIGFu
ZCBzeXNmc19ub3RpZnlfZGlyZW50KCkgY2FsbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBLdXJiYW5vdiA8bW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydT4NCj4gLS0tDQo+ICAuLi4vdGVz
dGluZy9zeXNmcy1jbGFzcy1sZWQtdHJpZ2dlci1wYXR0ZXJuICAgfCAxMSArKysrDQo+ICBkcml2
ZXJzL2xlZHMvdHJpZ2dlci9sZWR0cmlnLXBhdHRlcm4uYyAgICAgICAgfCA2MyArKysrKysrKysr
KysrKysrKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2Zz
LWNsYXNzLWxlZC10cmlnZ2VyLXBhdHRlcm4gYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5
c2ZzLWNsYXNzLWxlZC10cmlnZ2VyLXBhdHRlcm4NCj4gaW5kZXggOGM1N2QyNzgwNTU0Li5iMjU2
NDEyM2I1NGIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
Y2xhc3MtbGVkLXRyaWdnZXItcGF0dGVybg0KPiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0
aW5nL3N5c2ZzLWNsYXNzLWxlZC10cmlnZ2VyLXBhdHRlcm4NCj4gQEAgLTM4LDMgKzM4LDE0IEBA
IERlc2NyaXB0aW9uOg0KPiAgDQo+ICAJCUl0IHNob3VsZCBiZSBub3RpY2VkIHRoYXQgc29tZSBs
ZWRzLCBsaWtlIEVMMTUyMDMwMDAgbWF5DQo+ICAJCW9ubHkgc3VwcG9ydCBpbmRlZmluaXRlbHkg
cGF0dGVybnMsIHNvIHRoZXkgYWx3YXlzIHN0b3JlIC0xLg0KPiArDQo+ICtXaGF0OgkJL3N5cy9j
bGFzcy9sZWRzLzxsZWQ+L2lzX3J1bm5pbmcNCj4gK0RhdGU6CQlPY3RvYmVyIDIwMjINCj4gK0tl
cm5lbFZlcnNpb246CTYuMQ0KPiArRGVzY3JpcHRpb246DQo+ICsJCUluZGljYXRlcyBydW5uaW5n
IG9mIGEgc29mdHdhcmUgcGF0dGVybiBmb3IgdGhlIExFRC4NCj4gKw0KPiArCQlUaGlzIGZpbGUg
aXMgcmVhZCBvbmx5IGFuZCBzdXBwb3J0cyBwb2xsKCkgdG8gZGV0ZWN0IHdoZW4gdGhlDQo+ICsJ
CXNvZnR3YXJlIHBhdHRlcm4gZW5kZWQuDQo+ICsNCj4gKwkJMSBtZWFucyBwYXR0ZXJuIGlzIHJ1
bm5pbmcgYW5kIG51bWJlciAwIGFyZSBmaW5pc2ggb3Igbm90IHJ1bi4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWctcGF0dGVybi5jIGIvZHJpdmVycy9sZWRzL3Ry
aWdnZXIvbGVkdHJpZy1wYXR0ZXJuLmMNCj4gaW5kZXggMzU0MzA0YjQwNGFhLi4xOWE2YjVkY2Q3
YWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWctcGF0dGVybi5j
DQo+ICsrKyBiL2RyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWctcGF0dGVybi5jDQo+IEBAIC0z
Myw3ICszMyw5IEBAIHN0cnVjdCBwYXR0ZXJuX3RyaWdfZGF0YSB7DQo+ICAJaW50IGRlbHRhX3Q7
DQo+ICAJYm9vbCBpc19pbmRlZmluaXRlOw0KPiAgCWJvb2wgaXNfaHdfcGF0dGVybjsNCj4gKwli
b29sIGlzX3J1bm5pbmc7DQo+ICAJc3RydWN0IHRpbWVyX2xpc3QgdGltZXI7DQo+ICsJc3RydWN0
IGtlcm5mc19ub2RlICppc19ydW5uaW5nX2tuOw0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIHZvaWQg
cGF0dGVybl90cmlnX3VwZGF0ZV9wYXR0ZXJucyhzdHJ1Y3QgcGF0dGVybl90cmlnX2RhdGEgKmRh
dGEpDQo+IEBAIC03Niw4ICs3OCwxNCBAQCBzdGF0aWMgdm9pZCBwYXR0ZXJuX3RyaWdfdGltZXJf
ZnVuY3Rpb24oc3RydWN0IHRpbWVyX2xpc3QgKnQpDQo+ICAJc3RydWN0IHBhdHRlcm5fdHJpZ19k
YXRhICpkYXRhID0gZnJvbV90aW1lcihkYXRhLCB0LCB0aW1lcik7DQo+ICANCj4gIAlmb3IgKDs7
KSB7DQo+IC0JCWlmICghZGF0YS0+aXNfaW5kZWZpbml0ZSAmJiAhZGF0YS0+cmVwZWF0KQ0KPiAr
CQlpZiAoIWRhdGEtPmlzX2luZGVmaW5pdGUgJiYgIWRhdGEtPnJlcGVhdCkgew0KPiArCQkJZGF0
YS0+aXNfcnVubmluZyA9IGZhbHNlOw0KPiArDQo+ICsJCQlpZiAoZGF0YS0+aXNfcnVubmluZ19r
bikNCj4gKwkJCQlzeXNmc19ub3RpZnlfZGlyZW50KGRhdGEtPmlzX3J1bm5pbmdfa24pOw0KPiAr
DQo+ICAJCQlicmVhazsNCj4gKwkJfQ0KPiAgDQo+ICAJCWlmIChkYXRhLT5jdXJyLT5icmlnaHRu
ZXNzID09IGRhdGEtPm5leHQtPmJyaWdodG5lc3MpIHsNCj4gIAkJCS8qIFN0ZXAgY2hhbmdlIG9m
IGJyaWdodG5lc3MgKi8NCj4gQEAgLTEzNyw2ICsxNDUsNyBAQCBzdGF0aWMgaW50IHBhdHRlcm5f
dHJpZ19zdGFydF9wYXR0ZXJuKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQ0KPiAgCWRh
dGEtPmN1cnIgPSBkYXRhLT5wYXR0ZXJuczsNCj4gIAlkYXRhLT5uZXh0ID0gZGF0YS0+cGF0dGVy
bnMgKyAxOw0KPiAgCWRhdGEtPnRpbWVyLmV4cGlyZXMgPSBqaWZmaWVzOw0KPiArCWRhdGEtPmlz
X3J1bm5pbmcgPSB0cnVlOw0KPiAgCWFkZF90aW1lcigmZGF0YS0+dGltZXIpOw0KPiAgDQo+ICAJ
cmV0dXJuIDA7DQo+IEBAIC0xNzYsNiArMTg1LDcgQEAgc3RhdGljIHNzaXplX3QgcmVwZWF0X3N0
b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+
ICAJbXV0ZXhfbG9jaygmZGF0YS0+bG9jayk7DQo+ICANCj4gIAlkZWxfdGltZXJfc3luYygmZGF0
YS0+dGltZXIpOw0KPiArCWRhdGEtPmlzX3J1bm5pbmcgPSBmYWxzZTsNCj4gIA0KPiAgCWlmIChk
YXRhLT5pc19od19wYXR0ZXJuKQ0KPiAgCQlsZWRfY2Rldi0+cGF0dGVybl9jbGVhcihsZWRfY2Rl
dik7DQo+IEBAIC0yNjcsNiArMjc3LDcgQEAgc3RhdGljIHNzaXplX3QgcGF0dGVybl90cmlnX3N0
b3JlX3BhdHRlcm5zKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2LA0KPiAgCW11dGV4X2xv
Y2soJmRhdGEtPmxvY2spOw0KPiAgDQo+ICAJZGVsX3RpbWVyX3N5bmMoJmRhdGEtPnRpbWVyKTsN
Cj4gKwlkYXRhLT5pc19ydW5uaW5nID0gZmFsc2U7DQo+ICANCj4gIAlpZiAoZGF0YS0+aXNfaHdf
cGF0dGVybikNCj4gIAkJbGVkX2NkZXYtPnBhdHRlcm5fY2xlYXIobGVkX2NkZXYpOw0KPiBAQCAt
MzI3LDYgKzMzOCwxNiBAQCBzdGF0aWMgc3NpemVfdCBod19wYXR0ZXJuX3N0b3JlKHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4gIH0NCj4gIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhod19wYXR0ZXJuKTsN
Cj4gIA0KPiArc3RhdGljIHNzaXplX3QgaXNfcnVubmluZ19zaG93KHN0cnVjdCBkZXZpY2UgKmRl
diwNCj4gKwkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVm
KQ0KPiArew0KPiArCXN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2ID0gZGV2X2dldF9kcnZk
YXRhKGRldik7DQo+ICsJc3RydWN0IHBhdHRlcm5fdHJpZ19kYXRhICpkYXRhID0gbGVkX2dldF90
cmlnZ2VyX2RhdGEobGVkX2NkZXYpOw0KPiArDQo+ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAi
JWRcbiIsIGRhdGEtPmlzX3J1bm5pbmcpOw0KPiArfQ0KPiArc3RhdGljIERFVklDRV9BVFRSX1JP
KGlzX3J1bm5pbmcpOw0KPiArDQo+ICBzdGF0aWMgdW1vZGVfdCBwYXR0ZXJuX3RyaWdfYXR0cnNf
bW9kZShzdHJ1Y3Qga29iamVjdCAqa29iaiwNCj4gIAkJCQkgICAgICAgc3RydWN0IGF0dHJpYnV0
ZSAqYXR0ciwgaW50IGluZGV4KQ0KPiAgew0KPiBAQCAtMzgyLDkgKzQwMyw0MSBAQCBzdGF0aWMg
dm9pZCBwYXR0ZXJuX2luaXQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpDQo+ICAJa2Zy
ZWUocGF0dGVybik7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgcGF0dGVybl90cmlnX2FkZF9p
c19ydW5uaW5nKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQ0KPiArew0KPiArCXN0cnVj
dCBwYXR0ZXJuX3RyaWdfZGF0YSAqZGF0YSA9IGxlZF9nZXRfdHJpZ2dlcl9kYXRhKGxlZF9jZGV2
KTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBsZWRfY2Rldi0+ZGV2Ow0KPiArCWludCByZXQ7
DQo+ICsNCj4gKwlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfaXNfcnVu
bmluZyk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGRldiwNCj4gKwkJCSJFcnJvciBj
cmVhdGluZyBpc19ydW5uaW5nICglcGUpXG4iLCBFUlJfUFRSKHJldCkpOw0KPiArCQlyZXR1cm4g
cmV0Ow0KPiArCX0NCj4gKw0KPiArCWRhdGEtPmlzX3J1bm5pbmdfa24gPSBzeXNmc19nZXRfZGly
ZW50KGRldi0+a29iai5zZCwgImlzX3J1bm5pbmciKTsNCj4gKwlpZiAoIWRhdGEtPmlzX3J1bm5p
bmdfa24pIHsNCj4gKwkJZGV2X2VycihkZXYsICJFcnJvciBnZXR0aW5nIGlzX3J1bm5pbmcga2Vy
bmVsZnNcbiIpOw0KPiArCQlkZXZpY2VfcmVtb3ZlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfaXNfcnVu
bmluZyk7DQo+ICsJCXJldHVybiAtRU5YSU87DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHBhdHRlcm5fdHJpZ19yZW1vdmVfaXNfcnVubmluZyhz
dHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2RldikNCj4gK3sNCj4gKwlzdHJ1Y3QgcGF0dGVybl90
cmlnX2RhdGEgKmRhdGEgPSBsZWRfZ2V0X3RyaWdnZXJfZGF0YShsZWRfY2Rldik7DQo+ICsNCj4g
KwlzeXNmc19wdXQoZGF0YS0+aXNfcnVubmluZ19rbik7DQo+ICsJZGV2aWNlX3JlbW92ZV9maWxl
KGxlZF9jZGV2LT5kZXYsICZkZXZfYXR0cl9pc19ydW5uaW5nKTsNCj4gK30NCj4gKw0KPiAgc3Rh
dGljIGludCBwYXR0ZXJuX3RyaWdfYWN0aXZhdGUoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2Nk
ZXYpDQo+ICB7DQo+ICAJc3RydWN0IHBhdHRlcm5fdHJpZ19kYXRhICpkYXRhOw0KPiArCWludCBl
cnI7DQo+ICANCj4gIAlkYXRhID0ga3phbGxvYyhzaXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsN
Cj4gIAlpZiAoIWRhdGEpDQo+IEBAIC00MDMsNiArNDU2LDEzIEBAIHN0YXRpYyBpbnQgcGF0dGVy
bl90cmlnX2FjdGl2YXRlKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQ0KPiAgCWRhdGEt
PmxlZF9jZGV2ID0gbGVkX2NkZXY7DQo+ICAJbGVkX3NldF90cmlnZ2VyX2RhdGEobGVkX2NkZXYs
IGRhdGEpOw0KPiAgCXRpbWVyX3NldHVwKCZkYXRhLT50aW1lciwgcGF0dGVybl90cmlnX3RpbWVy
X2Z1bmN0aW9uLCAwKTsNCj4gKw0KPiArCWVyciA9IHBhdHRlcm5fdHJpZ19hZGRfaXNfcnVubmlu
ZyhsZWRfY2Rldik7DQo+ICsJaWYgKGVycikNCj4gKwkJZGV2X3dhcm4obGVkX2NkZXYtPmRldiwN
Cj4gKwkJCSAicGF0dGVybiBlbmRlZCBub3RpZmljYXRpb25zIGRpc2FibGVkICglcGUpXG4iLA0K
PiArCQkJIEVSUl9QVFIoZXJyKSk7DQo+ICsNCj4gIAlsZWRfY2Rldi0+YWN0aXZhdGVkID0gdHJ1
ZTsNCj4gIA0KPiAgCWlmIChsZWRfY2Rldi0+ZmxhZ3MgJiBMRURfSU5JVF9ERUZBVUxUX1RSSUdH
RVIpIHsNCj4gQEAgLTQyOCw2ICs0ODgsNyBAQCBzdGF0aWMgdm9pZCBwYXR0ZXJuX3RyaWdfZGVh
Y3RpdmF0ZShzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2RldikNCj4gIAkJbGVkX2NkZXYtPnBh
dHRlcm5fY2xlYXIobGVkX2NkZXYpOw0KPiAgDQo+ICAJZGVsX3RpbWVyX3N5bmMoJmRhdGEtPnRp
bWVyKTsNCj4gKwlwYXR0ZXJuX3RyaWdfcmVtb3ZlX2lzX3J1bm5pbmcobGVkX2NkZXYpOw0KPiAg
DQo+ICAJbGVkX3NldF9icmlnaHRuZXNzKGxlZF9jZGV2LCBMRURfT0ZGKTsNCj4gIAlrZnJlZShk
YXRhKTsNCg0KSGVsbG8gQW5keSwNCg0KSW4gdGhlIHByZXZpb3VzIHBhdGNoIHNlcmllcyBmZWVk
YmFjayB5b3UgbWVudGlvbmVkIHR3byBtYWluIHByb2JsZW1zOg0Kc3lzZnMgbm9kZSBjcmVhdGlv
biB0aW1lIGFuZCBsaWZlIGN5Y2xlLCBhbmQgc3lzZnMgbm9kZSBjcmVhdGlvbiBtZXRob2QuDQpM
ZXQgbWUgZXhwbGFpbiB3aHkgSSBkaWRuJ3QgZml4IHRoZSBhYm92ZSBpdGVtcy4NCg0KMSkgQWJv
dXQgc3lzZnMgbm9kZSBjcmVhdGlvbiB0aW1lIGFuZCBpdHMgbGlmZSBjeWNsZS4gSW4gbXkgb3Bp
bmlvbiwNCnN5c2ZzIG5vZGUgc2hvdWxkIGV4aXN0IG9ubHkgd2hlbiB1c2VyIGhhcyBhY3RpdmF0
ZWQgcGF0dGVybiBleHBsaWNpdGx5Ow0Kb3RoZXJ3aXNlLCBpdCB3aWxsIG1pc2xlYWQgcG90ZW50
aWFsIHVzZXIgaW4gdGhlIGNhc2Ugd2hlbiBwYXR0ZXJuIGlzDQpub3QgYWN0aXZhdGVkLCBidXQg
c3lzZnMgbm9kZSBleGlzdGVkLg0KMikgQWJvdXQgcGF0dGVybl90cmlnX2F0dHJzLiBXZSBuZWVk
IHRvIHVzZSBzeXNmc19ub3RpZnlfZGlyZW50KCkNCmluc3RlYWQgb2Ygc3lzZnNfbm90aWZ5KCks
IGNhdXNlIHN5c2ZzX25vdGlmeSgpIGNhbiBzbGVlcCBvbiB0aGUgbG9jaywNCmJ1dCBpdCdzIG5v
dCBhY2NlcHRhYmxlIGZvciB0aGUgcGF0dGVybiBjb2RlIGluIHRoZSB0aW1lciBjb250ZXh0Lg0K
Q29uc2lkZXJpbmcgdGhpcywgd2UgaGF2ZSB0byBjcmVhdGUgc3lzZnMgbm9kZSBpbiB0aGUNCnBh
dHRlcm5fdHJpZ19hY3RpdmF0ZSgpIGRpcmVjdGx5IGFuZCByZXRyaWV2ZSBrZXJuZnNfbm9kZSBm
b3IgcmVxdWlyZWQNCnN5c2ZzX25vdGlmeV9kaXJlbnQoKSByb3V0aW5lLg0K
