Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDC27B281C
	for <lists+linux-leds@lfdr.de>; Fri, 29 Sep 2023 00:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjI1WKj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 28 Sep 2023 18:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjI1WKi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Sep 2023 18:10:38 -0400
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de [80.67.18.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B76419E;
        Thu, 28 Sep 2023 15:10:35 -0700 (PDT)
Received: from [92.206.139.21] (helo=note-book.lan)
        by smtprelay01.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1qlzDL-0002MS-M5; Fri, 29 Sep 2023 00:10:31 +0200
Message-ID: <72bf11c67219b214b173651f7213f535c5d5f6b0.camel@apitzsch.eu>
Subject: Re: [PATCH v4 2/2] leds: add ktd202x driver
From:   =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Fri, 29 Sep 2023 00:10:30 +0200
In-Reply-To: <20230928144230.GL9999@google.com>
References: <20230923-ktd202x-v4-0-14f724f6d43b@apitzsch.eu>
         <20230923-ktd202x-v4-2-14f724f6d43b@apitzsch.eu>
         <20230928144230.GL9999@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGkgTGVlIEpvbmVzLAoKQW0gRG9ubmVyc3RhZywgZGVtIDI4LjA5LjIwMjMgdW0gMTU6NDIgKzAx
MDAgc2NocmllYiBMZWUgSm9uZXM6Cj4gT24gU2F0LCAyMyBTZXAgMjAyMywgQW5kcsOpIEFwaXR6
c2NoIHdyb3RlOgo+IAo+ID4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciBLaW5ldGljIEtU
RDIwMjYvNyBSR0IvV2hpdGUgTEVECj4gPiBkcml2ZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IEFuZHLDqSBBcGl0enNjaCA8Z2l0QGFwaXR6c2NoLmV1Pgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMv
bGVkcy9yZ2IvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgIHzCoCAxMyArCj4gPiDCoGRyaXZlcnMvbGVk
cy9yZ2IvTWFrZWZpbGXCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gPiDCoGRyaXZlcnMvbGVkcy9y
Z2IvbGVkcy1rdGQyMDJ4LmMgfCA2MjUKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA2MzkgaW5zZXJ0aW9ucygrKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL3JnYi9LY29uZmlnIGIvZHJpdmVycy9sZWRz
L3JnYi9LY29uZmlnCj4gPiBpbmRleCAxODNiY2NjMDZjZjMuLmE2YTIxZjU2NDY3MyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbGVkcy9yZ2IvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9sZWRz
L3JnYi9LY29uZmlnCj4gPiBAQCAtMTQsNiArMTQsMTkgQEAgY29uZmlnIExFRFNfR1JPVVBfTVVM
VElDT0xPUgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMg
YSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZQo+ID4gbW9kdWxlCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqAgd2lsbCBiZSBjYWxsZWQgbGVkcy1ncm91cC1tdWx0aWNvbG9yLgo+ID4gwqAKPiA+ICtj
b25maWcgTEVEU19LVEQyMDJYCj4gPiArwqDCoMKgwqDCoMKgwqB0cmlzdGF0ZSAiTEVEIHN1cHBv
cnQgZm9yIEtURDIwMnggQ2hpcHMiCj4gPiArwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIEkyQwo+
ID4gK8KgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBPRgo+ID4gK8KgwqDCoMKgwqDCoMKgc2VsZWN0
IFJFR01BUF9JMkMKPiA+ICvCoMKgwqDCoMKgwqDCoGhlbHAKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
IFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIEtpbmV0aWMKPiA+IEtURDIwMjYv
S1REMjAyNwo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgUkdCL1doaXRlIExFRCBkcml2ZXIgZm91bmQg
aW4gZGlmZmVyZW50IEJRIG1vYmlsZSBwaG9uZXMuCj4gPiArwqDCoMKgwqDCoMKgwqDCoCBJdCBp
cyBhIDMgb3IgNCBjaGFubmVsIExFRCBkcml2ZXIgcHJvZ3JhbW1lZCB2aWEgYW4gSTJDCj4gPiBp
bnRlcmZhY2UuCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoCBUbyBjb21waWxlIHRoaXMgZHJp
dmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUKPiA+IG1vZHVsZQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqAgd2lsbCBiZSBjYWxsZWQgbGVkcy1rdGQyMDJ4Lgo+ID4gKwo+ID4gwqBjb25m
aWcgTEVEU19QV01fTVVMVElDT0xPUgo+ID4gwqDCoMKgwqDCoMKgwqDCoHRyaXN0YXRlICJQV00g
ZHJpdmVuIG11bHRpLWNvbG9yIExFRCBTdXBwb3J0Igo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlcGVu
ZHMgb24gUFdNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL3JnYi9NYWtlZmlsZSBiL2Ry
aXZlcnMvbGVkcy9yZ2IvTWFrZWZpbGUKPiA+IGluZGV4IGMxMWNjNTYzODRlNy4uMjQzZjMxZTRk
NzBkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9sZWRzL3JnYi9NYWtlZmlsZQo+ID4gKysrIGIv
ZHJpdmVycy9sZWRzL3JnYi9NYWtlZmlsZQo+ID4gQEAgLTEsNiArMSw3IEBACj4gPiDCoCMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+IMKgCj4gPiDCoG9iai0kKENPTkZJR19M
RURTX0dST1VQX01VTFRJQ09MT1IpwqDCoMKgwqArPSBsZWRzLWdyb3VwLW11bHRpY29sb3Iubwo+
ID4gK29iai0kKENPTkZJR19MRURTX0tURDIwMlgpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAr
PSBsZWRzLWt0ZDIwMngubwo+ID4gwqBvYmotJChDT05GSUdfTEVEU19QV01fTVVMVElDT0xPUinC
oMKgwqDCoMKgwqArPSBsZWRzLXB3bS1tdWx0aWNvbG9yLm8KPiA+IMKgb2JqLSQoQ09ORklHX0xF
RFNfUUNPTV9MUEcpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKz0gbGVkcy1xY29tLWxwZy5vCj4g
PiDCoG9iai0kKENPTkZJR19MRURTX01UNjM3MF9SR0IpwqDCoMKgwqDCoMKgwqDCoMKgwqArPSBs
ZWRzLW10NjM3MC1yZ2Iubwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9yZ2IvbGVkcy1r
dGQyMDJ4LmMKPiA+IGIvZHJpdmVycy9sZWRzL3JnYi9sZWRzLWt0ZDIwMnguYwo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjMyOGVjZDM0NjY0Cj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL2xlZHMvcmdiL2xlZHMta3RkMjAyeC5jCj4g
PiBAQCAtMCwwICsxLDYyNSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyCj4gPiArLyoKPiA+ICsgKiBLaW5ldGljIEtURDIwMjYvNyBSR0IvV2hpdGUg
TEVEIGRyaXZlciB3aXRoIEkyQyBpbnRlcmZhY2UKPiA+ICsgKgo+ID4gKyAqIENvcHlyaWdodCAy
MDIzIEFuZHLDqSBBcGl0enNjaCA8Z2l0QGFwaXR6c2NoLmV1Pgo+ID4gKyAqCj4gPiArICogRGF0
YXNoZWV0OiBodHRwczovL3d3dy5raW5ldC1pYy5jb20vdXBsb2Fkcy9LVEQyMDI2LTctMDRoLnBk
Zgo+ID4gKyAqLwo+ID4gKwo+ID4gWy4uXQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQga3RkMjAyeF9w
cm9iZV9kdChzdHJ1Y3Qga3RkMjAyeCAqY2hpcCkKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2X29mX25vZGUoY2hpcC0+ZGV2KSwgKmNoaWxkOwo+
ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQg
Y291bnQsIHJldDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGNoaXAtPm51bV9sZWRzID0gKGlu
dCkodW5zaWduZWQgbG9uZylvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoY2hpcC0+ZGV2KTsKPiAK
PiBUaGVyZSBhcmUgYSBidW5jaCBvZiByZWNlbnQgcGF0Y2hlcyBjb252ZXJ0aW5nIHRoZXNlIHRv
Ogo+IAo+IMKgIGkyY19nZXRfbWF0Y2hfZGF0YSgpCj4gCj4gLi4uIGlzIHRoYXQgYWxzbyBhcHBs
aWNhYmxlIGhlcmU/Cj4gCgpJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgYmVuZWZpdCBpbiB1c2lu
ZyBpdCBoZXJlLgppMmNfZ2V0X21hdGNoX2RhdGEoKSByZXF1aXJlcyBhICJzdHJ1Y3QgaTJjX2Ns
aWVudCBjbGllbnQiLCBzbyB3ZSB3b3VsZApoYXZlIHRvIHBhc3MgdGhhdCB0byBrdGQyMDJ4X3By
b2JlX2R0KCkuCk9ubHkgdG8gcmVwbGFjZQoKICBjaGlwLT5udW1fbGVkcyA9IChpbnQpKHVuc2ln
bmVkIGxvbmcpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGNoaXAtPmRldik7CgpieQoKICBjaGlw
LT5udW1fbGVkcyA9IChpbnQpKHVuc2lnbmVkIGxvbmcpaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVu
dCk7CgpCZXN0IHJlZ2FyZHMsCkFuZHLDqQoKPiA+ICvCoMKgwqDCoMKgwqDCoGNvdW50ID0gb2Zf
Z2V0X2F2YWlsYWJsZV9jaGlsZF9jb3VudChucCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIWNv
dW50IHx8IGNvdW50ID4gY2hpcC0+bnVtX2xlZHMpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBf
d3JpdGUoY2hpcC0+cmVnbWFwLCBLVEQyMDJYX1JFR19SRVNFVF9DT05UUk9MLAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEtURDIwMlhfUlNUUl9SRVNFVCk7Cj4g
PiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBBbGxvdyB0aGUgZGV2aWNlIHRvIGV4ZWN1dGUgdGhl
IGNvbXBsZXRlIHJlc2V0ICovCj4gPiArwqDCoMKgwqDCoMKgwqB1c2xlZXBfcmFuZ2UoMjAwLCAz
MDApOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaSA9IDA7Cj4gPiArwqDCoMKgwqDCoMKgwqBm
b3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpIHsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBrdGQyMDJ4X2FkZF9sZWQoY2hpcCwgY2hpbGQs
IGkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaSsrOwo+ID4gK8KgwqDCoMKgwqDCoMKg
fQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBrdGQyMDJ4X3JlZ21hcF9jb25maWcgPSB7
Cj4gPiArwqDCoMKgwqDCoMKgwqAucmVnX2JpdHMgPSA4LAo+ID4gK8KgwqDCoMKgwqDCoMKgLnZh
bF9iaXRzID0gOCwKPiA+ICvCoMKgwqDCoMKgwqDCoC5tYXhfcmVnaXN0ZXIgPSAweDA5LAo+ID4g
K8KgwqDCoMKgwqDCoMKgLmNhY2hlX3R5cGUgPSBSRUdDQUNIRV9GTEFULAo+ID4gK8KgwqDCoMKg
wqDCoMKgLnJlZ19kZWZhdWx0cyA9IGt0ZDIwMnhfcmVnX2RlZmF1bHRzLAo+ID4gK8KgwqDCoMKg
wqDCoMKgLm51bV9yZWdfZGVmYXVsdHMgPSBBUlJBWV9TSVpFKGt0ZDIwMnhfcmVnX2RlZmF1bHRz
KSwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBpbnQga3RkMjAyeF9wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZjbGllbnQtPmRldjsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBrdGQyMDJ4ICpj
aGlwOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IGNvdW50Owo+ID4gK8KgwqDCoMKgwqDCoMKgaW50
IHJldDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGNvdW50ID0gZGV2aWNlX2dldF9jaGlsZF9u
b2RlX2NvdW50KGRldik7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIWNvdW50IHx8IGNvdW50ID4g
S1REMjAyWF9NQVhfTEVEUykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiSW5jb3Jy
ZWN0IG51bWJlciBvZiBsZWRzCj4gPiAoJWQpIiwgY291bnQpOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoMKgY2hpcCA9IGRldm1fa3phbGxvYyhkZXYsIHN0cnVjdF9zaXplKGNoaXAsIGxlZHMsIGNv
dW50KSwKPiA+IEdGUF9LRVJORUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFjaGlwKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoMKgbXV0ZXhfaW5pdCgmY2hpcC0+bXV0ZXgpOwo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgY2hpcC0+ZGV2ID0gZGV2Owo+ID4gK8KgwqDCoMKgwqDCoMKgaTJjX3NldF9jbGll
bnRkYXRhKGNsaWVudCwgY2hpcCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBjaGlwLT5yZWdt
YXAgPSBkZXZtX3JlZ21hcF9pbml0X2kyYyhjbGllbnQsCj4gPiAma3RkMjAyeF9yZWdtYXBfY29u
ZmlnKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIoY2hpcC0+cmVnbWFwKSkgewo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCBQ
VFJfRVJSKGNoaXAtPnJlZ21hcCksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkZhaWxlZCB0byBhbGxvY2F0
ZSByZWdpc3Rlcgo+ID4gbWFwLlxuIik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ290byBlcnJvcjsKPiAKPiBXaGVyZSBpcyB0aGUgbXV0ZXggZmlyc3QgdXNlZD8KPiAKPiBJ
J2Qgc3VnZ2VzdCBtb3ZpbmcgbXV0ZXhfaW5pdCgpIGFzIGxhdGUgYXMgcG9zc2libGUgYW5kIG9t
aXR0aW5nIGFzCj4gbWFueQo+IG9mIHRoZXNlIGdvdG9zIGFzIHlvdSBjYW4uCj4gCj4gPiArwqDC
oMKgwqDCoMKgwqB9Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBjaGlwLT5yZWd1bGF0b3JzWzBd
LnN1cHBseSA9ICJ2aW4iOwo+ID4gK8KgwqDCoMKgwqDCoMKgY2hpcC0+cmVndWxhdG9yc1sxXS5z
dXBwbHkgPSAidmlvIjsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGRldm1fcmVndWxhdG9yX2J1
bGtfZ2V0KGRldiwgQVJSQVlfU0laRShjaGlwLQo+ID4gPnJlZ3VsYXRvcnMpLAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjaGlwLT5yZWd1bGF0b3JzKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQg
PCAwKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwgIkZhaWxlZCB0byByZXF1ZXN0Cj4gPiByZWd1bGF0b3JzLlxuIik7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJvcjsKPiA+ICvCoMKgwqDCoMKgwqDC
oH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ3VsYXRvcl9idWxrX2VuYWJsZShB
UlJBWV9TSVpFKGNoaXAtPnJlZ3VsYXRvcnMpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoaXAtPnJlZ3Vs
YXRvcnMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gZW5hYmxl
Cj4gPiByZWd1bGF0b3JzLlxuIik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBlcnJvcjsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oHJldCA9IGt0ZDIwMnhfcHJvYmVfZHQoY2hpcCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0
IDwgMCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycm9yX3JlZzsK
PiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoQVJS
QVlfU0laRShjaGlwLT5yZWd1bGF0b3JzKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoaXAtPnJlZ3Vs
YXRvcnMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gZGlzYWJs
ZQo+ID4gcmVndWxhdG9ycy5cbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGdvdG8gZXJyb3I7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqByZXR1cm4gMDsKPiA+ICsKPiA+ICtlcnJvcl9yZWc6Cj4gPiArwqDCoMKgwqDCoMKgwqByZWd1
bGF0b3JfYnVsa19kaXNhYmxlKEFSUkFZX1NJWkUoY2hpcC0+cmVndWxhdG9ycyksCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
aGlwLT5yZWd1bGF0b3JzKTsKPiA+ICsKPiA+ICtlcnJvcjoKPiA+ICvCoMKgwqDCoMKgwqDCoG11
dGV4X2Rlc3Ryb3koJmNoaXAtPm11dGV4KTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGt0ZDIwMnhfcmVtb3ZlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGt0ZDIwMngg
KmNoaXAgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoGt0ZDIwMnhfY2hpcF9kaXNhYmxlKGNoaXApOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKg
bXV0ZXhfZGVzdHJveSgmY2hpcC0+bXV0ZXgpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9p
ZCBrdGQyMDJ4X3NodXRkb3duKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gPiArewo+ID4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IGt0ZDIwMnggKmNoaXAgPSBpMmNfZ2V0X2NsaWVudGRhdGEo
Y2xpZW50KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIFJlc2V0IHJlZ2lzdGVycyB0byBt
YWtlIHN1cmUgYWxsIG9mZiBiZWZvcmUgc2h1dGRvd24gKi8KPiAKPiBHcmFtbWFyLgo+IAo+ID4g
K8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGNoaXAtPnJlZ21hcCwgS1REMjAyWF9SRUdfUkVT
RVRfQ09OVFJPTCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBL
VEQyMDJYX1JTVFJfUkVTRVQpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBrdGQyMDJ4X21hdGNoX3RhYmxlW10gPSB7Cj4gPiArwqDCoMKgwqDCoMKg
wqB7IC5jb21wYXRpYmxlID0gImtpbmV0aWMsa3RkMjAyNiIsIC5kYXRhID0gKHZvaWQKPiA+ICop
S1REMjAyNl9OVU1fTEVEUyB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgeyAuY29tcGF0aWJsZSA9ICJr
aW5ldGljLGt0ZDIwMjciLCAuZGF0YSA9ICh2b2lkCj4gPiAqKUtURDIwMjdfTlVNX0xFRFMgfSwK
PiA+ICvCoMKgwqDCoMKgwqDCoHt9LAo+ID4gK307Cj4gPiArCj4gCj4gUmVtb3ZlIHRoZXNlIGxp
bmUuCj4gCj4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwga3RkMjAyeF9tYXRjaF90YWJsZSk7
Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGt0ZDIwMnhfZHJpdmVyID0gewo+
ID4gK8KgwqDCoMKgwqDCoMKgLmRyaXZlciA9IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAubmFtZSA9ICJsZWRzLWt0ZDIwMngiLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC5vZl9tYXRjaF90YWJsZSA9IGt0ZDIwMnhfbWF0Y2hfdGFibGUsCj4gPiArwqDC
oMKgwqDCoMKgwqB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgLnByb2JlID0ga3RkMjAyeF9wcm9iZSwK
PiA+ICvCoMKgwqDCoMKgwqDCoC5yZW1vdmUgPSBrdGQyMDJ4X3JlbW92ZSwKPiA+ICvCoMKgwqDC
oMKgwqDCoC5zaHV0ZG93biA9IGt0ZDIwMnhfc2h1dGRvd24sCj4gPiArfTsKPiA+ICttb2R1bGVf
aTJjX2RyaXZlcihrdGQyMDJ4X2RyaXZlcik7Cj4gPiArCj4gPiArTU9EVUxFX0FVVEhPUigiQW5k
csOpIEFwaXR6c2NoIDxnaXRAYXBpdHpzY2guZXU+Iik7Cj4gPiArTU9EVUxFX0RFU0NSSVBUSU9O
KCJLaW5ldGljIEtURDIwMjYvNyBMRUQgZHJpdmVyIik7Cj4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQ
TCIpOwo+ID4gCj4gPiAtLSAKPiA+IDIuNDIuMAo+ID4gCj4gCgo=

