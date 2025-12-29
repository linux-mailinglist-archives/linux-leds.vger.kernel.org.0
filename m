Return-Path: <linux-leds+bounces-6482-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3CCE85EF
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 00:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6A03012DF3
	for <lists+linux-leds@lfdr.de>; Mon, 29 Dec 2025 23:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A97E2FC871;
	Mon, 29 Dec 2025 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="cTw4qVN+"
X-Original-To: linux-leds@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011069.outbound.protection.outlook.com [52.103.23.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909AA2D4B77;
	Mon, 29 Dec 2025 23:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767052753; cv=fail; b=hOmb0uMAL7kCGjAVotLjtJGuTjNM0xUYxzUJmlC8lQeQgqLB0uKheAQVCI22KzwtBL8Zi3FBTzebE5cs/shukNsaZNa/VZjYvgdx40D8Vpq5MW/BzLIfudeHPUOnvYJSzlKzYnIAMVuLT4YfxbVvv2Mnjv3OyrA/SeG9V3szjzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767052753; c=relaxed/simple;
	bh=3ehR7bflzxFm86g39tU2aZ6GIay3v99qJEwothzvtAI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZTgpgADmhKLuuj3Ft1YAXmkjVC3FqcrXDN0EvAqU78K1HTXyg8T4/E5SPFoZqWrso/f3+WUnc2WyILzgZow8X6OBfyJZxRwKtDhix6OVBNSLBqzoB4xXAU/KcvUDl5uMQkXU5ezzBgCyyN+jjHgHzSUbMyv6wv79arvNgiWVmlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=cTw4qVN+; arc=fail smtp.client-ip=52.103.23.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOGv2pPUciE0MW8DRv6flfIzrdikNRBR5cfiXGuLHyGEtGcbezqVKXcfJVObCq90G0Q5tXWTPy8viqKXiR7AZ7VS68LhhfDqv9QmGQUM6Uj44AsTgKy97D1LI3/noj2WJrFu11RGxTDpVcjhAj0+gbk4bfNaQuxd68q/xUpsRVvF8Wk2K/wAIBJ2WaGCqkK/MBSORg8nwUeczFZTeIhKrDcpQZxW5iq9s/4NHT7WXi/llA6VDYzRUCdPOm/7Mt4AuV1T9MyEQVxUzw1VbHFtSFQdyRVt7S7MR0cFYokV1m9m9xbEsnUoKSA4703pUXiwx518Ldn3h6LLxpzuT947pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7yQT4PT2G0FwJiCqlzdvMfW005wwxPpFDKldz8ncWU=;
 b=TD0peA4i05/N2KwL+ymo3B90CUdxUHcb6I34a45ZzMRCtiyo4g4s10jsMJTq0YzHOX3UHYyQyXCHqoR3XSz6RrAAKtWP9stcwDHwOF6oob0qkl4nGQy3xI6TVGX/OneOuMN282B9zQDwbsDhE6hEPikaOrBhgF/YdyFpxXV7CVvwZrYodrRYNJxSdHNsXMuGpBxBlmZVFVNz9TWs/yFQ+ZSAM+RH35TZDmxen3A7LrW49tm7ECgGR97vHDN+g0YJmu4aByHS0XSMrrgzmF/36G2sCu7wF2TW87mO1SNm+CM5ez7a4ZyKymJwXBVAySLRZpEWMTiArHabA0CpQ8iAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7yQT4PT2G0FwJiCqlzdvMfW005wwxPpFDKldz8ncWU=;
 b=cTw4qVN+b4XEMYGmnjPzPMyWzDk8Rkz9RjE5gZ9qNcNNBMQ32swC63nO1odVFi92lyBR0sNsNWoUcweAeA6fYOr7/STeMhg4Ao30VFHpsPt+nyAOgrd+z9+0yvCsj6GasdfoS8ZWo0bSjO9SN8Bat0lbNbb12XgB8DiFeall29KBpOASfjL79igXM5AHsf42g3X0z7aBK+V1102GHG/KkWNQ1gLWml4wF6NTXajr9Sew5lACKwEIZ6qgulYhleq/VGZP6EPp0h+Hc65YrqMynFC1NSoGTQM7+9Bf83HQv1l6HSEosXaw0mE2vvJx1R3fwGofrHcxnX+AlKEqdM+DMQ==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by MW4PR84MB2260.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 23:59:07 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 23:59:07 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andriy Shevencho
	<andriy.shevchenko@linux.intel.com>
CC: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Radoslav
 Tsvetkov <rtsvetkov@gradotech.eu>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Thread-Topic: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Thread-Index: AQHceCcOjAMDwlV3/EG/31Vvyxsr6LU4eMuAgAAUzICAACDdAIAAiw8l
Date: Mon, 29 Dec 2025 23:59:07 +0000
Message-ID:
 <DS0PR84MB3746F2BB2CB8381BA02013059FBFA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <761d6573-3751-47fb-9b0e-8063f3cecf76@gmail.com>
 <aVJ0c3injbP7yRIJ@smile.fi.intel.com>
 <44ffa209-48b8-439e-a1ce-f9eb2aeb2f26@gmail.com>
In-Reply-To: <44ffa209-48b8-439e-a1ce-f9eb2aeb2f26@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|MW4PR84MB2260:EE_
x-ms-office365-filtering-correlation-id: 49b0543b-421e-4885-1c5f-08de47364108
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|15080799012|461199028|31061999003|8060799015|19110799012|12121999013|8062599012|51005399006|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?X+09hUXNhwddvJa6xfKZnTsn37cIfblZuiSqArWln3wrLEPQMxurRijtXu?=
 =?iso-8859-1?Q?AeFGvEtaSyrVb2oMj3fp1BQyTpo/ya3W3lkGVzAEhGCSg86F/dBPEpT0IC?=
 =?iso-8859-1?Q?BMLbxSlMY16LdZjDkONuEeGGIW09g2oTAZCfWDUoo366sdjS5Dnz5S40S5?=
 =?iso-8859-1?Q?mzvDKVi5HnE3DXpFCI3aZpKjvu18YpL7BWrqG/oSTqoQhtzDWaZzpIPJyx?=
 =?iso-8859-1?Q?2wyss5ognSYo8Z0Q5BDzneOY66AQU4wVxOUKBlEp6eU4GtRdRHz6AO8QFd?=
 =?iso-8859-1?Q?Pqfpoeq4ucrR1cbuCpWzqaSGeC2ZboZdmj88yVTOCsdSuAc8wvDzPhFUY0?=
 =?iso-8859-1?Q?vHQITwlOHk3d5dKFobblVlZ/iCTzITPhYIG4IZhlMV9uVHwqrkADDdpEDM?=
 =?iso-8859-1?Q?Zt3bAYntTLkYBrhjUyYPXVjxjbWSBq5UT8Vy+CbgzhYrJLrDjxrGtOZKKv?=
 =?iso-8859-1?Q?5a0SDnF3vWadHj9p+9UeLemRoGvs0d14GIpRqhqfbrjdufNT31qIXwCUGo?=
 =?iso-8859-1?Q?oiSCTPAL9o5Bw4Ymzj5P29N5vtGwVnHNvYWwgvcsT2ryOpYuDe1sGDi5Ao?=
 =?iso-8859-1?Q?6fu03BiW60HAvSArvcbrIPlo8dqojennLIc91AUfizG9TX14o4bqu7SVzR?=
 =?iso-8859-1?Q?I3QvpVeLJ5A37/nzP1z3KVf+kzLKCNmbih9dngykD0p59UCrHlgSV95iVt?=
 =?iso-8859-1?Q?iF2OGpqZKIwJ6SvSKWKfb/r+Ya4gG9K9shbU1d1gbRyzwrjKSqWsh0EUXd?=
 =?iso-8859-1?Q?vGLSe9VYQmni7x/auXKvZY4nqB4m72G+tRBIPiFzJqSDxo7NtL3KUbBv5w?=
 =?iso-8859-1?Q?N4W6N7YY1Rs0YFIgNoITQKNy240CtmiMKySSFG0PiKQSaXBhA551vR6bAI?=
 =?iso-8859-1?Q?NqXDKlVy2U0APWgf3Hti36dq6/NJ7Lh8yWtaJIPnfhLZR5SKBTC07mQfFP?=
 =?iso-8859-1?Q?QqpePLHN0eHmR7P3v2qr1EvwniMIrcuioDmG98VcPjDeC++Ws0fu3e8LKw?=
 =?iso-8859-1?Q?Bdl4+pWAD/5wnaPMXaCNGK8nc6L60+wU+dEm9tEhdQjM515ETXfyrBYQW8?=
 =?iso-8859-1?Q?95mjyK3B1psmV3DvIyUOgR/4ETi11vwkE2O4KV0n8YhMeq+oda0K3Qwx+3?=
 =?iso-8859-1?Q?NQf5rEsft2n1K7gAvDuYwwJbj+X+swk2TnsjMYckKsqU0uI0sTu9JRH7s1?=
 =?iso-8859-1?Q?JSND2a/mKYIZOToYZZOqU6ybTwLZkx4UoT1VorVSinGq49WdMA+bmHoRWD?=
 =?iso-8859-1?Q?N1Uf+KekCnSwet2InjJILIhgmvCGNInp6ha9Canij+nUZ2YpPVgE2Og7Ta?=
 =?iso-8859-1?Q?/dex?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HfuV8C23Q9uHzTxbjRxwDmCTuZuvdbwcgtZhDMS/TYG2aIesLbixeBm1ip?=
 =?iso-8859-1?Q?+cYhynFVq2BGXHpROZABNnpc4frVKw1E3cXlMGmbFrugw7NFxUu4LiuQuP?=
 =?iso-8859-1?Q?y7o7s3yGO8/YTeyS2VeP85yTgPJLFegowJIWi0AkDP8CC9LxcPq4MzB8Hp?=
 =?iso-8859-1?Q?JxmK+/QArlVhr1jVrCnVRb8g25diHrk6TYbHzRgbqKXk65pvy3mJYY70iv?=
 =?iso-8859-1?Q?/dHfAKVsuxm0F6OW41hCqpcrKAidP3Ime0dIC3SUF7xltOmi86IPQdv3Kf?=
 =?iso-8859-1?Q?ybOHEFWPfqGQtbhQh3350mN1QT/TGzbdHWCD+pUxGmZuVOIHBF7NSWj1Ma?=
 =?iso-8859-1?Q?w+D96+bbIDKkoqtBS1cRH+NdGVQEpXhaqJjyQYoey+L5MTNIawWwitIVqR?=
 =?iso-8859-1?Q?Cn/WNGk4S6SpH0FeaYXtkEMWP7sBHHFLl3rsxbZ+L/haUmNN62HQryjBO2?=
 =?iso-8859-1?Q?JJXNPJw3QNvM0ElvFxXZUMqbUt9NgaXaT1FvneFzpRvTQFEp9s1/hblIiR?=
 =?iso-8859-1?Q?cy581GWL0/vlGg3C+hQZd84fbaNsAgU3O1YU1IGn9SItTcp+A6gM0o/8nM?=
 =?iso-8859-1?Q?94Mu3WrMxIjPvmvDuU+2M9FItJGDO0sBm2kquqilUOiAsalttmNrRh3JnT?=
 =?iso-8859-1?Q?QnJhcmmKrfqS8N65IqF+MvxCoys2kCVlo8HNWwfc13JLXhuoH2rLiH4I0m?=
 =?iso-8859-1?Q?BjiZjqGJ2l8mHIdel4A8ojklhxFuRNNHTqZiAvRFFAxWyLoRlrDcC/cwC0?=
 =?iso-8859-1?Q?BeT4qdlyjyCozso5D8fLLWGSj18Z+ZIu3bHbqpUORKw+Fy3HYkpX91YqfG?=
 =?iso-8859-1?Q?Cn3kLXeE2mRGiPRC/NDDwvkKcq1EmlhqT3Pi8DncP6enS3svFKIaruQChy?=
 =?iso-8859-1?Q?gBL62HMD8fFmz4QcRlc4qQDatszMgHkXufDNvIHQkOjQW749dPWag2Oc9V?=
 =?iso-8859-1?Q?8gRfJywf7nFDDocbsOvEdwcTB6u30b7BvqNvp6mYatP53NerE9C5A1jonM?=
 =?iso-8859-1?Q?Pgtg9dRSijevldDu8g0IOibT6TAE+An1AWoeAG3+4+Yj942vT0q/MrUiyj?=
 =?iso-8859-1?Q?ywb1VYo8vcP20CE5ftRBE/AirttOG8WDJ4uxysAZ57apvrf7of0xVig2fr?=
 =?iso-8859-1?Q?WmRoTx4LVRIG+NDyomtSOnlRrOBDfgmMoiNAdYLz2ooZqf0fhwLw2/NAFL?=
 =?iso-8859-1?Q?iHP2X9JZj8+SnagkUMYMtpYp4W6gnOZ09qSisAjUics6IVDjUFPwj1OZ5g?=
 =?iso-8859-1?Q?WCmnLOtDV/tQ8864cydfaLCLp2WzfjFMNyRQ/Lb5lvgKwyVbLW7/TbZXh1?=
 =?iso-8859-1?Q?4v86E2NevZWZTTKyD+AeZ//SBntXd8CfgkIdaxUtWlruNdqSNhsvl15Xi4?=
 =?iso-8859-1?Q?qypYfWEZJnY9BpPkJTio8FLY/QQT939ubXF91YQjro0Vhp50rIE/dclf7J?=
 =?iso-8859-1?Q?JceUOnDXWUi34OKF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a21eb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b0543b-421e-4885-1c5f-08de47364108
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2025 23:59:07.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB2260

=0A=
>> The problem as I understood not exactly in this. The reporter wants=0A=
>> deterministic way of the mapping between HW numbered LEDs and their resp=
ective=0A=
>> names. It seems it was already mentioned that current code depends on th=
e=0A=
>> arbitrary probe ordering. Saying this, I now think that perhaps GPIO led=
 driver=0A=
>> should somehow allocate a range of the LEDs and then enumerate them in=
=0A=
=0A=
> accordance with the DT description?=0A=
=0A=
=0A=
>function-enumerator DT property enables deterministic enumeration.=0A=
=0A=
=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
That's not really the the problem=A0I'm trying to solve but it is part of i=
t.=0A=
The functions are quite ambiguous at the moment.=0A=
Having a string that  can define something custom, the fallback _1 _2 ident=
ifiers are=0A=
high lighting the issue because the lack of options.=0A=
=0A=
I have a virtual led grouping driver that this restriction will highlight t=
he issue even more.=0A=
with a status led on a typical oem device that indicate multiple states eg:=
=0A=
=0A=
 - Solid Blue: setting up/ committing settings change.=0A=
 - Pulse Blue: factory reset/ first boot ready for setup or WPS in progress=
.=0A=
 - Fade in-out Blue: system upgrade in progress=0A=
 - Solid Yellow: starting up.*/=0A=
 - pulse Yellow: resetting/ rebooting.*/=0A=
=0A=
From sysfs i will end up with the below that really does not explain the us=
e:=0A=
=0A=
led:status:blue=0A=
led:status:blue_1=0A=
led:ststus:blue_2=0A=
led:status:yellow=0A=
led:status:yellow_1=0A=
=0A=
The LED subsystem has a semantic ambiguity:=0A=
What does LED_FUNCTION_LAN=A0actually mean?=0A=
LAN port exists?=0A=
LAN cable connected?=0A=
LAN link active?=0A=
LAN traffic activity?=0A=
LAN speed indicator?=0A=
=0A=
Rather than making custom identifiers that are overly specific we could mak=
e=0A=
them up from stacking qualifiers or include a custom string to add meaning.=
=0A=
Would this be preferable over filling the common.h with long time gone =0A=
devices past identifiers that are overly specific to that platform or devic=
e? we=0A=
already have a few of them now.=0A=
=0A=
Something like this:=0A=
=0A=
led-lan-link {=0A=
    function =3D LED_FUNCTION_LAN;=0A=
    function-qualifier =3D "link-speed";  // NEW PROPERTY=0A=
    color =3D <LED_COLOR_ID_GREEN>;=0A=
    led-instance =3D "port5";=0A=
    /* Result: green:lan-link-speed:port5 */=0A=
};=0A=
=0A=
led-cellular-signal {=0A=
    function =3D LED_FUNCTION_WLAN;  // or new LED_FUNCTION_CELLULAR=0A=
    function-qualifier =3D "signal-strength";=0A=
    color =3D <LED_COLOR_ID_GREEN>;=0A=
    led-instance =3D "modem0";=0A=
    /* Result: green:wlan-signal-strength:modem0 */=0A=
};=0A=
=0A=
=0A=
// Network qualifiers=0A=
"link"         // Cable connected=0A=
"activity"     // Data transfer=0A=
"speed"        // Link speed indication=0A=
"duplex"       // Full/half duplex=0A=
"mesh"         // Mesh node=0A=
=0A=
// Cellular qualifiers=0A=
"signal"       // Signal strength=0A=
"activity"     // Data activity=0A=
"registered"   // Registered to network=0A=
"roaming"      // Roaming status=0A=
=0A=
// Power qualifiers=0A=
"charging"     // Battery charging=0A=
"low"          // Low battery warning=0A=
"present"      // Power source present=0A=
=0A=
I'm just really trying to find a way to make the naming more descriptive an=
d I'm=0A=
open to suggestions.=0A=
=0A=
regards Jonathan Brophy=0A=
=0A=
=0A=

