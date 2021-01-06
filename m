Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4202E2EBEA6
	for <lists+linux-leds@lfdr.de>; Wed,  6 Jan 2021 14:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbhAFN3w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Jan 2021 08:29:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2940 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFN3w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Jan 2021 08:29:52 -0500
Received: from dggeme761-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4D9qtY57SJz5DtP;
        Wed,  6 Jan 2021 21:28:05 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme761-chm.china.huawei.com (10.3.19.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 6 Jan 2021 21:29:00 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.1913.007;
 Wed, 6 Jan 2021 21:29:00 +0800
From:   zhengyongjun <zhengyongjun3@huawei.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSBsZWRzOiB1c2UgcmVzb3VyY2Vfc2l6ZQ==?=
Thread-Topic: [PATCH -next] leds: use resource_size
Thread-Index: AQHW5C6LbmM7OfydzUavCdmmaUI+p6oalxTg
Date:   Wed, 6 Jan 2021 13:29:00 +0000
Message-ID: <00170346a4824f3a9e159ed5686d0742@huawei.com>
References: <20210106131956.968-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210106131956.968-1-zhengyongjun3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.249]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

U29ycnksIHRoaXMgaXMgbXkgZmF1bHQsIHRoaXMgcGF0Y2ggY29tbWl0IG1zZyBpcyB3cm9uZywg
SSB3aWxsIHNlbmQgcGF0Y2ggdjIsIHBsZWFzZSBpZ25vcmUgaXQuDQoNCi0tLS0t08q8/tStvP4t
LS0tLQ0Kt6K8/sjLOiB6aGVuZ3lvbmdqdW4gDQq3osvNyrG85DogMjAyMcTqMdTCNsjVIDIxOjIw
DQrK1bz+yMs6IHBhdmVsQHVjdy5jejsgbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCrOty806IGRtdXJwaHlAdGkuY29tOyB6aGVuZ3lvbmdq
dW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4NCtb3zOI6IFtQQVRDSCAtbmV4dF0gbGVkczog
dXNlIHJlc291cmNlX3NpemUNCg0KVXNlIHJlc291cmNlX3NpemUgcmF0aGVyIHRoYW4gYSB2ZXJi
b3NlIGNvbXB1dGF0aW9uIG9uIHRoZSBlbmQgYW5kIHN0YXJ0IGZpZWxkcy4NCg0KU2lnbmVkLW9m
Zi1ieTogWmhlbmcgWW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0KLS0tDQogZHJp
dmVycy9sZWRzL2xlZHMtbG0zNjQyLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xl
ZHMtbG0zNjQyLmMgYi9kcml2ZXJzL2xlZHMvbGVkcy1sbTM2NDIuYyBpbmRleCA2MmMxNDg3MmNh
ZjcuLjIyMDM1YTM4MGM0YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbGVkcy9sZWRzLWxtMzY0Mi5j
DQorKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1sbTM2NDIuYw0KQEAgLTMzOSw3ICszMzksNyBAQCBz
dGF0aWMgaW50IGxtMzY0Ml9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KIAljaGlw
LT5jZGV2X2ZsYXNoLm1heF9icmlnaHRuZXNzID0gMTY7DQogCWNoaXAtPmNkZXZfZmxhc2guYnJp
Z2h0bmVzc19zZXRfYmxvY2tpbmcgPSBsbTM2NDJfc3Ryb2JlX2JyaWdodG5lc3Nfc2V0Ow0KIAlj
aGlwLT5jZGV2X2ZsYXNoLmRlZmF1bHRfdHJpZ2dlciA9ICJmbGFzaCI7DQotCWNoaXAtPmNkZXZf
Zmxhc2guZ3JvdXBzID0gbG0zNjQyX2ZsYXNoX2dyb3VwcywNCisJY2hpcC0+Y2Rldl9mbGFzaC5n
cm91cHMgPSBsbTM2NDJfZmxhc2hfZ3JvdXBzOw0KIAllcnIgPSBsZWRfY2xhc3NkZXZfcmVnaXN0
ZXIoJmNsaWVudC0+ZGV2LCAmY2hpcC0+Y2Rldl9mbGFzaCk7DQogCWlmIChlcnIgPCAwKSB7DQog
CQlkZXZfZXJyKGNoaXAtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBmbGFzaFxuIik7IEBAIC0z
NTEsNyArMzUxLDcgQEAgc3RhdGljIGludCBsbTM2NDJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCwNCiAJY2hpcC0+Y2Rldl90b3JjaC5tYXhfYnJpZ2h0bmVzcyA9IDg7DQogCWNoaXAt
PmNkZXZfdG9yY2guYnJpZ2h0bmVzc19zZXRfYmxvY2tpbmcgPSBsbTM2NDJfdG9yY2hfYnJpZ2h0
bmVzc19zZXQ7DQogCWNoaXAtPmNkZXZfdG9yY2guZGVmYXVsdF90cmlnZ2VyID0gInRvcmNoIjsN
Ci0JY2hpcC0+Y2Rldl90b3JjaC5ncm91cHMgPSBsbTM2NDJfdG9yY2hfZ3JvdXBzLA0KKwljaGlw
LT5jZGV2X3RvcmNoLmdyb3VwcyA9IGxtMzY0Ml90b3JjaF9ncm91cHM7DQogCWVyciA9IGxlZF9j
bGFzc2Rldl9yZWdpc3RlcigmY2xpZW50LT5kZXYsICZjaGlwLT5jZGV2X3RvcmNoKTsNCiAJaWYg
KGVyciA8IDApIHsNCiAJCWRldl9lcnIoY2hpcC0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIHRv
cmNoXG4iKTsNCi0tDQoyLjIyLjANCg0K
