Return-Path: <linux-leds+bounces-2757-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5372397C244
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2024 02:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D31A41F216FA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2024 00:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962611859;
	Thu, 19 Sep 2024 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="cECo40Gu"
X-Original-To: linux-leds@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2089.outbound.protection.outlook.com [40.92.19.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA4A50
	for <linux-leds@vger.kernel.org>; Thu, 19 Sep 2024 00:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726704386; cv=fail; b=If3uWdpt9hhJmnai/qUxomvMKHNw/ZXuQQagfcxFJlYZYkiUxapv7CeqUC1snT1gS+CQgs0+DSJ24G994P68TYHHfa5ASvJpmBpM21qcGz1B3YMjhfqjtfcIsJ0SNyS06lM235nOh4ez8fqpAn6O82YULJJmyIatbwwKJFWUzT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726704386; c=relaxed/simple;
	bh=UM5qGicJEIXP25jjXWL96QOF/FU7S2NpXi2oMMs/QZI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eX8F0QPLhoDrFjRegP6IiMuhlVX+n7Ohs6C8NR2lYoCNhoDHlEIKqpq06szf0aY7UvjrM0tUIlpEkvXv4d8D+7S0aRfeJaazPV7vJkq6GJGYIJhe1SrHw2Hx5BqCNZ5y5XzkjHV2SrPk3baolYjo+v0rGfdn/YZJBT/d5k/ii7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=cECo40Gu; arc=fail smtp.client-ip=40.92.19.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j05AJ02AWolIpb8o2Qyh8ZhV0CGl2qFCmePEM1orJe2wXKgXqSEndrA3o3ZZAM3RJtnnFGwQJREv9j+SkjWLP0Fyb70Kt+pssnTh1ILj/6NgdENIuX+IlPpVC3+1nDKRlC+uZ3DrSXAgyUCzX3DActJLpLp6Fhhvzlj+EvpTK5e1p8oWpG4nXAcqJS7LceBf2COorBytyopN10/R4pVR6nQTXPfSzmlaYhlg7pA1LucuiaQ/2+x87JQ+eKk2tJ0L7WGMeeocIfQ+yKZK5eXrEzklBeTCJrOnUprAw1Uc97T/QIW/MoiIjKWuNLMsZ+qih7yYSOIarRrhw2S7mWcTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM5qGicJEIXP25jjXWL96QOF/FU7S2NpXi2oMMs/QZI=;
 b=pwjh6vcSPjUmL7EkNHI6qlzojCw++zmTjvcxtqvP1g1YaEFe4zBMcB/E/Og7Pu08VB0H0JCm2/PfaiDTHimU77jYz/v65slBUeWrCa/GUzQOnElBgl+g7LcH6QCrtYy2+4DzrZITkrcdzq14P0VAiEwfVcLhJW1ygHKk7c6oStfwCEuL73VomQf3FrIWiTzhOcARpfVvCH8KYvplj+rdxygcYupSACJexRj789jmuC9tHtT1haDdH5c4b56A6sygTr+yrzPagzeZOlC03ktzJbEo6/o0kOBMJQhtn5U7RGYcnvTPc+3gQH6G/kBY9HAx6j5QKxBZ81fuXy9OE2UbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM5qGicJEIXP25jjXWL96QOF/FU7S2NpXi2oMMs/QZI=;
 b=cECo40GufLcm/VUzRePoklTvXVuJvZOHUqx/3r3l4mbVwtr6enonvEpBj/vY2AG1D3nUhoQhedsek8lm4zyD+qz4D5ai3AXjHx5mEk5wNQ2s0T2WAAyKNCItrxD1sVLG1oANm92b1VAEIZrKjaxtqyE9FwTu/syMZJNqGe0tnjQv/9jAPCdcBVCh2/hwZ64H3d3q0Ivgxg1BwGjabhoxLjCt30MdN3k9NovZuOXZyH/+KsOK5d1xjqz03M9Os0int+qZn4tWugclC8zLuLAyUDH8r+RSLQw/0yMOREegbSDjBOnLwSi40ynEACggFUrCIyKk99T1BIIK2ykqGvgJ+Q==
Received: from SN7PR10MB6473.namprd10.prod.outlook.com (2603:10b6:806:2a0::18)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Thu, 19 Sep 2024 00:06:22 +0000
Received: from SN7PR10MB6473.namprd10.prod.outlook.com
 ([fe80::8094:a407:5894:ee32]) by SN7PR10MB6473.namprd10.prod.outlook.com
 ([fe80::8094:a407:5894:ee32%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 00:06:22 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: multicolor virtual color LED driver.
Thread-Topic: multicolor virtual color LED driver.
Thread-Index: AdsKJNy1xjTgMBvgSDuXnNhjoeFx4gAAsW0g
Date: Thu, 19 Sep 2024 00:06:22 +0000
Message-ID:
 <SN7PR10MB647363E3B7F21CB35ECBE6669F632@SN7PR10MB6473.namprd10.prod.outlook.com>
References:
 <SN7PR10MB64734F72DBF7CD8374A89EB19F632@SN7PR10MB6473.namprd10.prod.outlook.com>
In-Reply-To:
 <SN7PR10MB64734F72DBF7CD8374A89EB19F632@SN7PR10MB6473.namprd10.prod.outlook.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6473:EE_|DS0PR10MB7245:EE_
x-ms-office365-filtering-correlation-id: 6034e6a1-764e-41f2-7961-08dcd83ee520
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|19110799003|8060799006|7092599003|102099032|56899033|3412199025|440099028;
x-microsoft-antispam-message-info:
 f9TDiipxAPr2BA9fk7U5OmHCHgy1nk5b/6+jYMR3GoSp88T/5kHrqJ5Lpv4jMnIZZZeBVwkNSFd+uDJLr/zpN+VFm0yC/3zpu/PHqWLBjFzc8JNlxYoy/WQkzrzoRXiuA/SobjeWmMLM+Bg5D5q9WnblMBbjOAJDE6lb5BtOEvYyVDqel64H9UIrwCQLQis/BklSIZMAqYLdJ/FMib9ESZzfuJ0ILy6hmKTStXzHrNRkO6SuzXTZeq2Z1bujwP0yQugeTETRuslh2z/eec4B55a+feWE5HzjTaIDmkNTh4e0ipCFgKXZgfmM4nFgp4n8B+vc/kcco1MGIwvk8B6oOtw+1ypHTw8+zn5E0YGCp8hsgKPR5WjdsnyJceAytiElK6YJ5ZLor+2t2zbvUbLovdY5XkoJdSqhVhJX9C359HzQ8wLFugdC6zCmPw17Fl5rtd+DqqYq4WxHQz1+oHWvIZWdqO84GKyiPoBv0yVoAjV2CPaPhuCsdkx96C9y9BHejfdC2/KbCvfcDmL9NApVH6uLmDBhcKoM8q/VoIArln1GTU/cGC8SVM1qKtSf16KUR8UhufC3Vx/SwZOR4ZE/RjctEY6kyIxY+GV8F2U7WggsiNLjYvzx5m4tMed3iGaLnCJn66aoDL2BSNNk8uZZDLaj0aNUBTCLoXPlfuUcANBYD14dZ3rJPq3yNC3DftcfqvNSZ+a+sey9qmEwq4GMWw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rH4EsLnh+ACd12j+/J0rWzreT0DE3dqEXHLHORVQXVX6AfO0SQYJihw8nc?=
 =?iso-8859-1?Q?FvIkJM6hjf0U4/zxjcdMG6FZQ+DcPPGVdgcfGKmloaaRkT82FwOI/kQ/fB?=
 =?iso-8859-1?Q?m+VKMIfmGsUpk1iKOSKQDY+stC5ZwAtUoSFV/X/iaaOJobU7wEM6wbfhas?=
 =?iso-8859-1?Q?LvCLVg764rM9BsTZxah6DAO50N4+rjH0000exkCgY2/Tsu04spI0WP0mRQ?=
 =?iso-8859-1?Q?oJMhTe8YNN0HSgKbTGusowQoFu4jm14ayZ+o0QZcTzmkQu1/7NIuh2FkGB?=
 =?iso-8859-1?Q?HbR1fhzQ1yfylbVNwtO4HQ7DNLGRl9Po/lPFyWb+NZPZ39DstmKOm020jq?=
 =?iso-8859-1?Q?h5cqN7wFLbmzky6TqCxN7Zdks9lPQddfmqTu4REFC5ume28QXT17KLhCPi?=
 =?iso-8859-1?Q?B8T680laL1SgFsS9f/xQRVioBLf+CbNIjBBKjt2FYLPsD8TxlDUITiASad?=
 =?iso-8859-1?Q?XhKTCit9Ceqr++epybEtmZrHiKaXuWAFIMCZ4oWo4uhpRDpp086wilZPE7?=
 =?iso-8859-1?Q?NdKdzxD9IrYqaq7wjRz+UwCG5hTDB8W1lxh0nssXxtae74f2nOB2C3FJDo?=
 =?iso-8859-1?Q?mwvMqFBFyAONQQzgLmz53LRt/YqFcLVl2OxGnKMieuevKGsEGygFBjIICw?=
 =?iso-8859-1?Q?V/MvQNvO5LJ11GqkTf1bhFdzXO3sVUt9TzIL8CTBWyU+9p1NL6tPcql24p?=
 =?iso-8859-1?Q?IOUSIZy4EqjUKgi+zi43M9KkIUcwTl8EZELQF7LWu1ucrTcfBAJOHLe0Fk?=
 =?iso-8859-1?Q?ZMgHuzWQWObFAdsTOu3p/hb99FagrlCNpsTeYnyfL8S+ZB8P/n2vlZyYFN?=
 =?iso-8859-1?Q?3qoqAZRKJWV4H/zqUheloes42ykGXmeqvwksLvgnTpyYlNZOiNwGxz/aUT?=
 =?iso-8859-1?Q?iUVpGIBghBshqA2HKXDoSJUv/HVA67futCZ4Og5uLyaQvbZi3YvNMrM5pT?=
 =?iso-8859-1?Q?YCccQhOhbnK3+5LQB5VMNxxLj2Iox7/icVtlwVIqzAaiAi/1iMDO4rQ3qo?=
 =?iso-8859-1?Q?r6o+Q3EmDHLXH13ngqI0+aaq1uoMPv5o5iV17kSYP/N7pPFfIqIyyI9Jdj?=
 =?iso-8859-1?Q?iyiCD9RiRIKa7uu6vhFYNAGLrFG+wfHQ1sxqEO+FR/MomB0o+UP1BKKl/l?=
 =?iso-8859-1?Q?OIIkI7W/puZ6cYBJhfmuL4S2QE1UwdDqTLvWFBbnhfoN8bGsCo664au0um?=
 =?iso-8859-1?Q?3nn5EV0qCP+YSrCZWWKT3NyNw5ZjQyr7zycTpmeuPlWGkVUlMJ9ksPnLEW?=
 =?iso-8859-1?Q?xgDFZArrqKZ2cNlGbIvF4ZwfjbKDJLRXzLyJ8xroI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-c3cf4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6473.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6034e6a1-764e-41f2-7961-08dcd83ee520
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 00:06:22.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245


In OpenWrt there is a preference to control leds via kernel solutions and t=
riggers/ aliases from the device tree the problem is that the underlying st=
ructure means that multicolor or grouped multicolor LED's are not supported=
 without per device userscripts to customise led behaviour, so often RGB st=
atus leds are relegated to glorified power leds =A0for simplicity.

I wish to make better use of multicolour LED's for device status but are fi=
nding that a universal solution is not really possible and may be so with o=
ther projects or Linux based solutions.

Problems also arise that the potential for multiple triggers to be operated=
 at the same time causing two or more potential leds operating at the same =
time and showing incorrect status from mixing of the colours.

I'm wondering if a simple solution would be to create a driver to provide v=
irtual colour leds by splitting multicolour or grouped singular leds into v=
irtual individual led colours so they can be connected to an individual tri=
gger.

Driving color with in the OpenWrt means applying multiple triggers to indiv=
idual RGB elements to drive colour, just the simple process of being able t=
o pick virtual colours from the primary and secondary RGB colour model woul=
d be handy.

To fix the issue of multiple individual colours mixing by two or more statu=
ses driving at the same time would be to provide a priority element via con=
fig or directly in the DTS to only show the most important status of potent=
ially operated virtual leds(example below of a potential DTS solution below=
)
As multiple staged led's one after the other in a flashing Christmas tree l=
ike situation that is not handy as a status led.

If priority is the same, it could stage LED's one after the other for equal=
ly important statuses..

I'm wondering if this driver addition or something along these lines would =
be possible and welcomed or any such advice or a such with this problem?



monochromatic-leds {
=A0=A0=A0 compatible =3D "gpio-leds";

=A0=A0=A0 led-0 {
=A0=A0=A0=A0=A0=A0=A0 gpios =3D <&&tlmm 50 GPIO_ACTIVE_HIGH>;; // green
=A0=A0=A0 };

=A0=A0=A0 led-1 {
=A0=A0=A0=A0=A0=A0=A0 gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>; // red
=A0=A0=A0 };

=A0=A0=A0 led-2 {
=A0=A0=A0=A0=A0=A0=A0 gpios =3D <&tlmm 52 GPIO_ACTIVE_HIGH>; // blue
=A0=A0=A0 };
};

virtual-led-group {
=A0=A0=A0 compatible =3D "leds-group-virtualcolor";

=A0=A0=A0 multi-led {
=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_RGB>;
=A0=A0=A0=A0=A0 function =3D LED_FUNCTION_INDICATOR;
=A0=A0=A0=A0=A0 max-brightness =3D <256>;

=A0=A0=A0=A0=A0 led_system_green: led0 {
=A0=A0=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_GREEN>;
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-0>;
=A0=A0=A0=A0=A0=A0=A0 priority =3D <0>=A0 //top priority override everythin=
g
=A0=A0=A0=A0=A0=A0=A0 linux,default-trigger =3D "heartbeat";=A0=A0=A0=A0=A0=
=20
=A0=A0=A0=A0=A0=A0};
=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0led_system_red: led1 {
=A0=A0=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_RED>;
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-1>;
=A0=A0=A0=A0=A0=A0=A0 priority =3D <1>=A0=A0=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0};
=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0led_system_blue: led2 {
=A0=A0=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_BLUE>;]
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-2>;
=A0=A0=A0=A0=A0=A0=A0 priority =3D <1>=A0=A0=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0};
=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0led_system_yellow: led3 {
=A0=A0=A0=A0=A0=A0=A0color =3D <LED_COLOR_ID_YELLOW>;
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-0>,<&led-1>;
=A0=A0=A0=A0=A0=A0=A0 priority =3D <1>
=A0=A0=A0=A0=A0 };
=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0led_system_magenta: led4 {
=A0=A0=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_MAGENTA>;
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-1>,<&led-2>;
=A0=A0=A0=A0=A0=A0=A0 priority =3D <2>=A0=20
=A0=A0=A0=A0=A0=A0};
=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0led_system_cyan: led5 {
=A0=A0=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_CYAN>;
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-0>,<&led-2>;
=A0=A0=A0=A0=A0=A0=A0 priority =3D <2>=A0=20
=A0=A0=A0=A0=A0=A0};
=A0=A0=A0=20
=A0=A0=A0=A0=A0=A0led_system_white: led6 {
=A0=A0=A0=A0=A0=A0=A0 color =3D <LED_COLOR_ID_WHITE>;
=A0=A0=A0=A0=A0=A0=A0 leds =3D <&led-0>,<&led-1>,<&led-2>;
=A0=A0=A0 =A0=A0=A0=A0priority =3D <3>=20
=A0=A0=A0=A0=A0=A0};
=A0=A0=A0 };
};

Also, of note On color wheels of the RGB (additive) and CMY (subtractive) c=
olor models magenta is a standard reference color but is not an available c=
olor ID in leds/common.h not so much an issue just a note and I don't know =
if such an addition of this color would be a good idea?

