Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC36218F890
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 16:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgCWP2U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 11:28:20 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:10654 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727105AbgCWP2U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 23 Mar 2020 11:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584977299; x=1616513299;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=79ymEayEp2gQQw0zEOKdH7KJ1bsGU0lvzPdso8hXutw=;
  b=LMyDYmnEY57+D5DyzygPNcnQO+IJ/478gaEQfHA8qLyBaWeLrhsy6Rp0
   v1pKd7162yzn4imTpNL+4yp+i7Kbuk/P6hHOadRMbp7fLRs2HwB3Oo1zY
   Z3e5RzQpwtTHAcQK866GNHS2wBHQqYA41N5ceE8W0RLPRKJ++Aq7wzD4Z
   Gd1k/UMBeikIbpubmofxuNh2KVDZrgEYs1/K6j0KiMbLwBc2tFFGOvm2z
   OkRbBKZmgKDrgG243+Rn47EZo6Qal8a4zZETeQYn+xWTqwGdIZLpkuWK8
   FHy51IDr0Meg555xy3oWW/eFqITGEGbjM92lqJY8eCCMW8ChuK+KX7nlJ
   g==;
IronPort-SDR: qCLHzU+3Pg6ZrXsYFRxf1zKWeHip1iGvQO+Aohs2uxs6K9R8VwQCYaNMDIomtI7YltdNHH8QYA
 OYC0gYzyvOBw==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: [PATCH v4] leds: pwm: check result of led_pwm_set() in led_pwm_add()
Thread-Topic: [PATCH v4] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Index: AQHWASedLNVUQJejAkmePWBrqbOpdg==
Date:   Mon, 23 Mar 2020 15:27:50 +0000
Message-ID: <20200323152716.25449-1-Denis.Osterland@diehl.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <B762DC22F35A984C9101F24AB489D6D7@diehl.internal>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: 415AWy8o668fDtCxszluz3iFeMqdBQji4a8qx6De20ERVm9ZjsmklqyJZWPG1o6w
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

bGVkX3B3bV9zZXQoKSBub3cgcmV0dXJucyBhbiBlcnJvciB3aGVuIHNldHRpbmcgdGhlIFBX
TSBmYWlscy4NCg0KQ2M6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5v
cmc+DQpTaWduZWQtb2ZmLWJ5OiBEZW5pcyBPc3RlcmxhbmQtSGVpbSA8RGVuaXMuT3N0ZXJs
YW5kQGRpZWhsLmNvbT4NCi0tLQ0KIGRyaXZlcnMvbGVkcy9sZWRzLXB3bS5jIHwgMTYgKysr
KysrKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMgYi9k
cml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KaW5kZXggNmNhZjhiZWE4Y2Q1Li4wN2VhYjJkOGI3
YzcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KKysrIGIvZHJpdmVy
cy9sZWRzL2xlZHMtcHdtLmMNCkBAIC05MSwxNSArOTEsMjEgQEAgc3RhdGljIGludCBsZWRf
cHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXYs
DQogCXB3bV9pbml0X3N0YXRlKGxlZF9kYXRhLT5wd20sICZsZWRfZGF0YS0+cHdtc3RhdGUp
Ow0KIA0KIAlyZXQgPSBkZXZtX2xlZF9jbGFzc2Rldl9yZWdpc3RlcihkZXYsICZsZWRfZGF0
YS0+Y2Rldik7DQotCWlmIChyZXQgPT0gMCkgew0KLQkJcHJpdi0+bnVtX2xlZHMrKzsNCi0J
CWxlZF9wd21fc2V0KCZsZWRfZGF0YS0+Y2RldiwgbGVkX2RhdGEtPmNkZXYuYnJpZ2h0bmVz
cyk7DQotCX0gZWxzZSB7DQorCWlmIChyZXQpIHsNCiAJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIHJlZ2lzdGVyIFBXTSBsZWQgZm9yICVzOiAlZFxuIiwNCiAJCQlsZWQtPm5hbWUsIHJl
dCk7DQorCQlyZXR1cm4gcmV0Ow0KIAl9DQogDQotCXJldHVybiByZXQ7DQorCXJldCA9IGxl
ZF9wd21fc2V0KCZsZWRfZGF0YS0+Y2RldiwgbGVkX2RhdGEtPmNkZXYuYnJpZ2h0bmVzcyk7
DQorCWlmIChyZXQpIHsNCisJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHNldCBsZWQgUFdN
IHZhbHVlIGZvciAlczogJWQiLA0KKwkJCWxlZC0+bmFtZSwgcmV0KTsNCisJCXJldHVybiBy
ZXQ7DQorCX0NCisNCisJcHJpdi0+bnVtX2xlZHMrKzsNCisJcmV0dXJuIDA7DQogfQ0KIA0K
IHN0YXRpYyBpbnQgbGVkX3B3bV9jcmVhdGVfZndub2RlKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdikNCi0tIA0KMi4yNS4yDQoNCg0KDQpEaWVobCBD
b25uZWN0aXZpdHkgU29sdXRpb25zIEdtYkgNCkdlc2Now6RmdHNmw7xocnVuZzogSG9yc3Qg
TGVvbmJlcmdlcg0KU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBOw7xybmJlcmcgLSBSZWdpc3Rl
cmdlcmljaHQ6IEFtdHNnZXJpY2h0DQpOw7xybmJlcmc6IEhSQiAzMjMxNQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkRlciBJbmhhbHQgZGVy
IHZvcnN0ZWhlbmRlbiBFLU1haWwgaXN0IG5pY2h0IHJlY2h0bGljaCBiaW5kZW5kLiBEaWVz
ZSBFLU1haWwgZW50aGFlbHQgdmVydHJhdWxpY2hlIHVuZC9vZGVyIHJlY2h0bGljaCBnZXNj
aHVldHp0ZSBJbmZvcm1hdGlvbmVuLg0KSW5mb3JtaWVyZW4gU2llIHVucyBiaXR0ZSwgd2Vu
biBTaWUgZGllc2UgRS1NYWlsIGZhZWxzY2hsaWNoZXJ3ZWlzZSBlcmhhbHRlbiBoYWJlbi4g
Qml0dGUgbG9lc2NoZW4gU2llIGluIGRpZXNlbSBGYWxsIGRpZSBOYWNocmljaHQuDQpKZWRl
IHVuZXJsYXVidGUgRm9ybSBkZXIgUmVwcm9kdWt0aW9uLCBCZWthbm50Z2FiZSwgQWVuZGVy
dW5nLCBWZXJ0ZWlsdW5nIHVuZC9vZGVyIFB1Ymxpa2F0aW9uIGRpZXNlciBFLU1haWwgaXN0
IHN0cmVuZ3N0ZW5zIHVudGVyc2FndC4NCi0gSW5mb3JtYXRpb25lbiB6dW0gRGF0ZW5zY2h1
dHosIGluc2Jlc29uZGVyZSB6dSBJaHJlbiBSZWNodGVuLCBlcmhhbHRlbiBTaWUgdW50ZXIg
aHR0cHM6Ly93d3cuZGllaGwuY29tL2dyb3VwL2RlL3RyYW5zcGFyZW56LXVuZC1pbmZvcm1h
dGlvbnNwZmxpY2h0ZW4vDQoNClRoZSBjb250ZW50cyBvZiB0aGUgYWJvdmUgbWVudGlvbmVk
IGUtbWFpbCBpcyBub3QgbGVnYWxseSBiaW5kaW5nLiBUaGlzIGUtbWFpbCBjb250YWlucyBj
b25maWRlbnRpYWwgYW5kL29yIGxlZ2FsbHkgcHJvdGVjdGVkIGluZm9ybWF0aW9uLiBQbGVh
c2UgaW5mb3JtIHVzIGlmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGJ5DQptaXN0
YWtlIGFuZCBkZWxldGUgaXQgaW4gc3VjaCBhIGNhc2UuIEVhY2ggdW5hdXRob3JpemVkIHJl
cHJvZHVjdGlvbiwgZGlzY2xvc3VyZSwgYWx0ZXJhdGlvbiwgZGlzdHJpYnV0aW9uIGFuZC9v
ciBwdWJsaWNhdGlvbiBvZiB0aGlzIGUtbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiAN
Ci0gRm9yIGdlbmVyYWwgaW5mb3JtYXRpb24gb24gZGF0YSBwcm90ZWN0aW9uIGFuZCB5b3Vy
IHJlc3BlY3RpdmUgcmlnaHRzIHBsZWFzZSB2aXNpdCBodHRwczovL3d3dy5kaWVobC5jb20v
Z3JvdXAvZW4vdHJhbnNwYXJlbmN5LWFuZC1pbmZvcm1hdGlvbi1vYmxpZ2F0aW9ucy8NCg==
