Return-Path: <linux-leds+bounces-2768-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D497CFE8
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 04:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEFAD1C2202E
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 02:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF372B676;
	Fri, 20 Sep 2024 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nblTc9WX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230BF4ED;
	Fri, 20 Sep 2024 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726799563; cv=none; b=qGvEgocnBnvCjk3b79BBaevRDb+GG8UVvtGFpj5u9i409H6EaigoU1DMuPaPncn8gVXN72RZ2mIzI4NvO97d0QQIB1rnmhqo9IdF7rxC40VCgMyxOlVaUUwaBY5FC35JnFAXwWhqWTNr7nGKDwdFvbR3+YpWPGFDZX3KK51XmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726799563; c=relaxed/simple;
	bh=2kyAqX0UmcnVQ2r2WsVJruwXGGrYUL0M/kI4rXDSr9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Usr5CFUqcuqXmBxRh7bqKkU2XoM4cpN6rXvASptoM6YCydzRwVGIKpuGScMqA6NtaHwY0ETwdkMOSJCiZDi/HEq/B5hhuq9y3t99rDh//Sf57hDYAqpT/WiBYnPFSj8/UnKF/W+s034FCRn10NEZS8na4mlaVyNhb6tPTyQacYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nblTc9WX; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726799531;
	bh=2kyAqX0UmcnVQ2r2WsVJruwXGGrYUL0M/kI4rXDSr9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=nblTc9WXlIJZu+91reg6GY0YOUHF+DF2kqIxNRtv7giuWl0yNyKxHqXIc+LXY/fpT
	 zIFdVrCczsq00E8G1yUmda9cIRY6g8xS+Z4Q0+jzjPc5Y45Rq3Fw2jE3aSjhwgktPu
	 f20nyAlSUxbv93bk9ZQGYb3eZCAEqnQDKgdqyHlo=
X-QQ-mid: bizesmtp91t1726799522tmx5q8zr
X-QQ-Originating-IP: ffXfo76nqqY9lfia2Nzg/UbJJ73MBdFP5f3xCSUe0Dw=
Received: from [10.20.53.22] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Sep 2024 10:31:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13317544603402082152
Message-ID: <2573492DD1A88727+468e98e3-ead1-4232-9bc4-6eeef19d143d@uniontech.com>
Date: Fri, 20 Sep 2024 10:31:59 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
 <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lf4Jms0gKlolG25Z0id6kYg1"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lf4Jms0gKlolG25Z0id6kYg1
Content-Type: multipart/mixed; boundary="------------L1QVVc1ADqeZ4LsnZ9tF0ciV";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
Message-ID: <468e98e3-ead1-4232-9bc4-6eeef19d143d@uniontech.com>
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
 <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
In-Reply-To: <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>

--------------L1QVVc1ADqeZ4LsnZ9tF0ciV
Content-Type: multipart/mixed; boundary="------------yEsJV508YGyTPoNrV5tBjLo2"

--------------yEsJV508YGyTPoNrV5tBjLo2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

5ZyoIDIwMjQvOS8yMCAwMzowMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCg0KPg0KPg0K
PiBBbSAxOS4wOS4yNCB1bSAyMDoyOCBzY2hyaWViIFdhbmdZdWxpOg0KPj4gVGhlcmUgYXJl
IHNvbWUgc3BlbGxpbmcgbWlzdGFrZXMgb2YgJ2FjY2Nlc3MnIGluIGNvbW1lbnRzIHdoaWNo
DQo+PiBzaG91bGQgYmUgaW5zdGVhZCBvZiAnYWNjZXNzJy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBXYW5nWXVsaSA8d2FuZ3l1bGlAdW5pb250ZWNoLmNvbT4NCj4+IC0tLQ0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMV8wLmPCoMKgIHwgMiArLQ0KPj4g
wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jwqAgfCAyICstDQo+
PiDCoCBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtZ3JvdXAtbXVsdGljb2xvci5jIHwgMiArLQ0K
Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTFfMC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYw0K
Pj4gaW5kZXggZDNlOGJlODJhMTcyLi5mODQ3YTlmYzYxZTEgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYw0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMV8wLmMNCj4+IEBAIC0xODk0LDcgKzE4OTQs
NyBAQCBzdGF0aWMgdm9pZCBnZnhfdjExXzBfaW5pdF9jb21wdXRlX3ZtaWQoc3RydWN0IA0K
Pj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4+IMKgwqDCoMKgwqAgbXV0ZXhfdW5sb2NrKCZh
ZGV2LT5zcmJtX211dGV4KTsNCj4+IMKgIMKgwqDCoMKgwqAgLyogSW5pdGlhbGl6ZSBhbGwg
Y29tcHV0ZSBWTUlEcyB0byBoYXZlIG5vIEdEUywgR1dTLCBvciBPQQ0KPj4gLcKgwqDCoMKg
wqDCoCBhY2NjZXNzLiBUaGVzZSBzaG91bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0
IFZNSURzLiAqLw0KPj4gK8KgwqDCoMKgwqDCoCBhY2Nlc3MuIFRoZXNlIHNob3VsZCBiZSBl
bmFibGVkIGJ5IEZXIGZvciB0YXJnZXQgVk1JRHMuICovDQo+DQo+IFdoaWxlIGF0IGl0IGNv
dWxkIHlvdSBmaXggdGhlIGNvbW1lbnQgc3R5bGUgaGVyZT8gRS5nLiB1c2UNCj4NCj4gLyoN
Cj4gwqAqIFRleHQNCj4gwqAqIFRleHQNCj4gwqAqLw0KPg0KT0suDQoNCkxpbms6IA0KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0YyNUExMzk3ODlFODdDM0UrMjAyNDA5MjAwMjI3
NTUuMTE2MjQ5NS0xLXdhbmd5dWxpQHVuaW9udGVjaC5jb20vDQoNCldpdGggVGhvbWFzIFpp
bW1lcm1hbm4ncyBBY2tlZC1ieS4NCg0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4NCj4NCj4N
ClRoYW5rcywNCi0tIA0KV2FuZ1l1bGkNCg==
--------------yEsJV508YGyTPoNrV5tBjLo2
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------yEsJV508YGyTPoNrV5tBjLo2--

--------------L1QVVc1ADqeZ4LsnZ9tF0ciV--

--------------lf4Jms0gKlolG25Z0id6kYg1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZuzenwUDAAAAAAAKCRDF2h8wRvQL7pDd
AP98YmH2GuZSl7gSJJZM5828IoxW3uwXszr1jM3hyLEJeQEAjvQBiWBW1zciyNuTaRetGXNvZNCZ
tkYIZHG6DDS/cAc=
=PnZn
-----END PGP SIGNATURE-----

--------------lf4Jms0gKlolG25Z0id6kYg1--

