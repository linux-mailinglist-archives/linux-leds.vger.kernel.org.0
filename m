Return-Path: <linux-leds+bounces-4715-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46774AC431C
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 18:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD5011895FA9
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 16:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AFD23D2B0;
	Mon, 26 May 2025 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="CCvl5IB5"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7CB2114;
	Mon, 26 May 2025 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277755; cv=fail; b=ib4NtFSnYrMwZYrRqD3aVSya4KhedNB5NGujTtJNhxmpi9mRXMkz2j7Gr7iR3m7FVO7R2PrwNtXPEOZLMSdLaXQhSSWdfIkCDv9fhVl19C2s+lR++BPg82HC8Laek/otNvVwQNALN6iov27645RfFSJWuYsyWGn7+vjcvaqufNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277755; c=relaxed/simple;
	bh=Tsu6tOjhxNQYMkG7ejDXjA7nlrpqIPpJJU2Uwhnv6oA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bYpooGF4/fk7cXwD2UrR7CFjO2KAb7dT9PyK1Kjbf+RyrcqY6ZdumlWz/rlkk3F015tbUMM1j8NnX9+HuOsuiOUxsbp0+kTfZ2N4cmyQdVaUEmHqPlQFDonwHQWqmnIV8IowzBnM1n+lydK41qESE/bpJ50QKXc6uilQsye1WHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=CCvl5IB5; arc=fail smtp.client-ip=40.107.20.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBQNW31W40HZiRq6ER9ylg0s9YXzOdAPg7mJcqad2SFWs50k4RCbLn1u8RFytfVxaDSgnafr7DEsNFgxKKfs+V9RZgc7vtiJpha/JdldTpIUOcInbGFi5F7RtkJqlpqcLE3UF0lBgtCkjr80eDXFNc2vcd8/yaiUf49BItaLJZ3wfQrdAtPSqBAvpHbS72PUoBKWJ9An3Jztd2g2tIULh/W3sGNDwePzfy1LqGwCAYITIoxm/Y9GM76JOP441IZEEz7nAj7wET5FJqIr80gSkVHZs0OTnJo6Wzu4pagjhSBYvhkY5o6JQyqmQYMMrrITg0evQMRuqh2y0oG7iwe9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTDUc/MzyPCUen4MjjuWsbxKJ1tHJXaLrmpBss6NogM=;
 b=jd4LE+oTN6dwHi2OB4iYD9uvK5YnIQMFq320AYlHT6+9h/NK8uhyeILnDFCC5WnBZ3ucaBNUdHSqL4x+zuxFhVVA7IlMQ4sO/6fLjWHclK6oiyZ5y6rj6MDQoKgH/4boI85H4bwP1rUfVYajFACuubhTmRAvzRu0GOIPgQ1whSCGvC+r+mVHHDv7Ha/Axn/1UEtBujbGDOqyxNMMblBJ4mLZszqcod8b0fI89c+L24rKnWcPmRh6OX2dBDK+CdkVwQ48nTuVeA++19ieo+OUbYWspRv5UBiXsmBMOnhJT/dJ3eUwdrXuvoMzvbRJmKoA4+JW7LHxAXIgyH2rxzrRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTDUc/MzyPCUen4MjjuWsbxKJ1tHJXaLrmpBss6NogM=;
 b=CCvl5IB5RtLnhNCxCTXWJisT0SJWd0IuhXCAKc4w5+ffUREoTamqELOv/5/u4vlivcedMA8KXv9hTFQsiX9mMLTVvHNW+FiCWANKlp9osR3yHBQVhcQI1yWDV1SZKNj69x+mt+dZc14HN5bzfGrMMhz/npAh5LDwul59XYDKJas=
Received: from AS8PR02MB9288.eurprd02.prod.outlook.com (2603:10a6:20b:5c0::8)
 by GV2PR02MB8846.eurprd02.prod.outlook.com (2603:10a6:150:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 16:42:29 +0000
Received: from AS8PR02MB9288.eurprd02.prod.outlook.com
 ([fe80::4aef:7bc4:c6ff:54e1]) by AS8PR02MB9288.eurprd02.prod.outlook.com
 ([fe80::4aef:7bc4:c6ff:54e1%7]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:42:28 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis
	<afd@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Johan Adolfsson
	<Johan.Adolfsson@axis.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kernel
	<Kernel@axis.com>
Subject: Re: [PATCH RFC v4 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Thread-Topic: [PATCH RFC v4 2/2] dt-bindings: leds: lp50xx: Document child
 reg, fix example
Thread-Index: AQHbzk4HUwhiuYAGWUqwYB2ZGAIGfrPlCsoAgAAK97s=
Date: Mon, 26 May 2025 16:42:28 +0000
Message-ID:
 <AS8PR02MB92881DA3213861C52AB0EC729B65A@AS8PR02MB9288.eurprd02.prod.outlook.com>
References: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
 <20250526-led-fix-v4-2-33345f6c4a78@axis.com>
 <128e3853-7192-4e90-bbb6-cb0b6e1aec3b@kernel.org>
In-Reply-To: <128e3853-7192-4e90-bbb6-cb0b6e1aec3b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB9288:EE_|GV2PR02MB8846:EE_
x-ms-office365-filtering-correlation-id: 3fb9029e-9488-41f0-57eb-08dd9c744d8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gWyZM1nIsi6TOZwNazBEE/a7EDX2oHkJk7hlwMcqPiqZC4QQYAf8wG/nLu?=
 =?iso-8859-1?Q?+nxSimSgQgNBYBP74N9gCbOKXCNRXmdWn6EzNBmpolL6JxXcrQOfN3guTD?=
 =?iso-8859-1?Q?KaHXe3ra489fTwld6p2LRNUktNG6iSAF5343xcMrd6lKM24JyTKfc7W9Q7?=
 =?iso-8859-1?Q?SeKqEkO9Pnm4At1f8aLKS6on83A8HK/CMKXyMroJxu5SabhszdzLXOErT6?=
 =?iso-8859-1?Q?tMEeAi55wD4vgZ6R/89q+mu/NQVf5BFwNWEJybz+5pujXyI7FzXA4MR8rV?=
 =?iso-8859-1?Q?LvoDia9uWluJePXIJUobT1w2qg1RG7FwGzQqJekPouQF9EvgJfBYoApMR2?=
 =?iso-8859-1?Q?0YmWWIyUEpNNJy3adsXLyiEUi8fVAyy0t89CO0krOeGikGmKK2cBzE+HVX?=
 =?iso-8859-1?Q?a2V9qL4A6lZr4mqssmSk02nmeNGDNvr7mVo6+tifeEtNSedX74SZ3lENSh?=
 =?iso-8859-1?Q?GQHK7BstCTP8mD41X5HpKKOCguzriwVDYQuDNzCyEGVOV5dtZRLeG5veWu?=
 =?iso-8859-1?Q?eudglTdvkP8fk3+WjfoCo7xSePEi5iWsM8p+mu3FOmnVtxb8BbVzqbMcKu?=
 =?iso-8859-1?Q?/wzd1xHySW6IgnwTa1tTarL6Elsc5bfZJMNtc2vz/Yoj0mToVmHpZUyGUT?=
 =?iso-8859-1?Q?Z/N95ucsrZiqt0Xdlo2wFzWX0UTwp5LgoyAZnDC3mXDoJ4CKSiM2zphovR?=
 =?iso-8859-1?Q?NRAttVSSyeAWarSMpGkpaox4Pli3sjZ5dwGB4xyIubKA/wdu4GCrAMhCOr?=
 =?iso-8859-1?Q?PxXHtqXIiiodpLi+0GtoE17lTD1c4O4spTHPG2ttiPMsVSNuWyr7nP0YIs?=
 =?iso-8859-1?Q?ykmAxYN5nnQa+q05Rg53wcXzkTgYyQVW2oxxYyicFv6oTji+Cl0ZKZTcYX?=
 =?iso-8859-1?Q?amtGkBtUkaa3c6c/FSFne6wZK8ZmMLw/HdeRyudoD0II9nOYLH+r9O8tTj?=
 =?iso-8859-1?Q?yyWgidigSvWhO66Omq1bt3UdcqcS33UD4Mjyo2Q6Iw4AUljJAkekxx0IvS?=
 =?iso-8859-1?Q?Qay3anQ4vS+c1FcA20i0pMy889RUKWvbMOwc5rBk7BEDiYA9D9vKK5KQ97?=
 =?iso-8859-1?Q?wLBfNyQMnSYSFOMTHIxU42R9MCxUUmC1LVhIG88lX9q1qL6SL2DCP2gt6X?=
 =?iso-8859-1?Q?zgqDPgR8qaQV09+NQ3r97+GSET28LMtSf1PA17BVh56O0bmCgBHoo3bqUr?=
 =?iso-8859-1?Q?da4wsqJN3YBA/fgv7Va3lDk9Ka3asot2xgaHVQg5XMxIt5Qtf+4Ox1yeiN?=
 =?iso-8859-1?Q?bq+0j817BZb20kqxu0sxZbwO+cLCa+8gYYzwq5tD8s2m0xAIi06Tin0uTx?=
 =?iso-8859-1?Q?YXw3cQ7IBVJAcsbMbNZezZJTgTw+yM0PCDMpKmBbz9HLjGtwgHkM0BOezm?=
 =?iso-8859-1?Q?BNor21rkNjmoEokTiLtf70fgG7V4544s4D4qqAj6tvA09nNVMSAoCSJ+Jr?=
 =?iso-8859-1?Q?tiTGCW43FGLBTN+AlYA0jzUpGMCvzEHw6648/1rtZFMEYMAVE1u3xg1Dei?=
 =?iso-8859-1?Q?KwcFqE6DqNJKu/T+FtNUA6t1S2wd4jmrCPmhdygOdnSoyJlJFk8fI+IvIo?=
 =?iso-8859-1?Q?40efmhA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9288.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ATfLsxVavByPzpagpSzixXIXOxPN/Z/n4PX3KhldcVpGACMOGh9nAIuEok?=
 =?iso-8859-1?Q?4WIqsTEvc73jYE+ywokmOPxDKqbGDa1aKw03Uu0nngfFYJQ78tVG/xUHCs?=
 =?iso-8859-1?Q?XIvOjObT6KSUZBtzHHdq2rG48CYP5ueSFSqbHgcUVS57RaUJs33LBMg0p+?=
 =?iso-8859-1?Q?edTxijE0TBvFX1eObzcCoPhk71kayyj0f5IW80YF5NQx7wDNPcyEwagXvA?=
 =?iso-8859-1?Q?d/fCzDuh5S6cvv0PICrxbHwv1grsqiSLKvDe0GrxoeW/l1ONbT8tH2xfsp?=
 =?iso-8859-1?Q?9Ysf4IfHOBOB+OPQOZxNKj+zQXMU+kU4Ox7+/wTaSWhUtLEOPFZjCTz/TY?=
 =?iso-8859-1?Q?MkHI3GoAI1K+1QZ0iYcs5J21mFLSEtN3G+37kW5C1FxFeYO6Fl9/HH6acC?=
 =?iso-8859-1?Q?1CKUcAuwIFq7ccQLko1rnuDrCTSXWhlv6kvXz3QKwH3r5Hy+LnOzmFLEyt?=
 =?iso-8859-1?Q?+tTm3WjmN0cbNIKtyrCmLqzmd7AMH8GJZxdTWYqbjsPa8I9zWK9Eis/Z9t?=
 =?iso-8859-1?Q?ycxovn+9PTC6v47xa1ZBC+zIE+VBxTdV5L4FHuxIljNvwQGnvfXk9ztgga?=
 =?iso-8859-1?Q?UYFj+QmQs9JRvDRFK1FnSOPSEZ5VeyT7Oo7OVWkylMTZ6TA/vCWDSYs3gv?=
 =?iso-8859-1?Q?f+MVHFUVfAUeoe7Thr8txmgaZY84wxHF4aQamDRhZMisWxlOSeCIE1P7y4?=
 =?iso-8859-1?Q?68Snh8PCmZDOAqFoWujyMx3E0Mi/lgwdPBkEiElgH8Zq/4ZZce4L0meWHY?=
 =?iso-8859-1?Q?1U3IFfHVETXShF1qrwaQPL4AS/LVJG0hBmeIExfHyqfA5gADgFgrWExlu4?=
 =?iso-8859-1?Q?4jx6rFshD0XoQdSwaYZLhHVIytSFlFpDYKoot8oz5hkw0r3NFGWipxfYx8?=
 =?iso-8859-1?Q?UGn3DJVtKXhoLlvGydD/mkRZFXxMZ0bB9zJqSJb6BhXBB6AAREkX+DDKYP?=
 =?iso-8859-1?Q?iXNX9IZZaRNfqwyGxIlOgcM16OrYwx56NHJSH+5qD+9BE3ryQU/GpDRSRI?=
 =?iso-8859-1?Q?AvyvW/1x4uNEnHGWrgFMH6321kNigGPv1oeHv5wIVyVRFmmYdXflCBjaZH?=
 =?iso-8859-1?Q?JB4bRxnQIvWJInOVqmKTMyQDrnag3fb8AefYxgpxu2h5HsCpSXl+OtctCY?=
 =?iso-8859-1?Q?4TC6oSz8jmfoHlEjbI+6BcTLdQSAfhMvwrlcXBtl1HJf5cOOKKooOpfevf?=
 =?iso-8859-1?Q?uMNHK4UFAClMh5OoQadCJtVJveq4oRsu+8qlznpYHSExLCjJWRqOwwfo/z?=
 =?iso-8859-1?Q?ro2JD5raPjcXFNIISjgs5Uf6m4QgzcohC8JaGmUGuYHcbQ2oWJodazZQYI?=
 =?iso-8859-1?Q?daV1glb9AX0iZI5W4a/Z+s00vJeHm1ASHn4AhDQfRU7WTWesoIuvMogqzK?=
 =?iso-8859-1?Q?JnepuTsL0JyPQkjfpcg9cH7EBB2iIYA16bHcFPsABKf5CAwtMUBQihyNIC?=
 =?iso-8859-1?Q?wcXPT7UQLvC22KWiWsgjv3HJopIeWTuDXj4iZofqoruNGc6r7anITCHtar?=
 =?iso-8859-1?Q?EzVETHh5NeMDX2GyJzL7uxWqfrQTKSJJ873/RIDyrj7Ov/m6z9GUXsSbL6?=
 =?iso-8859-1?Q?r5A8AQ+xZ7r8VRsQ8gG5YDluJlnyRHlGSAGiweAn6VE9pces2bYXF0QOVu?=
 =?iso-8859-1?Q?JL+hSEyhGhzh4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9288.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb9029e-9488-41f0-57eb-08dd9c744d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 16:42:28.7572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2T3xDmdcbPj0u+YZxLGzJVvlKFUg3GoNEXzhfPaHh6ucDcCgXoOZz1b4mz/TnYxo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8846

=0A=
=0A=
=0A=
>From: Krzysztof Kozlowski <krzk@kernel.org>=0A=
>Sent: Monday, May 26, 2025 17:34=0A=
>To: Johan Adolfsson; Lee Jones; Pavel Machek; Rob Herring; Krzysztof Kozlo=
wski; Conor Dooley; Andrew Davis; Jacek Anaszewski=0A=
>Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; devicetree@v=
ger.kernel.org; Kernel=0A=
>Subject: Re: [PATCH RFC v4 2/2] dt-bindings: leds: lp50xx: Document child =
reg, fix example=0A=
>=0A=
>On 26/05/2025 16:54, Johan Adolfsson wrote:=0A=
>> The led child reg node is the index within the bank, document that=0A=
>> and update the example accordingly.=0A=
>>=0A=
>> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>=0A=
>> ---=0A=
>>  .../devicetree/bindings/leds/leds-lp50xx.yaml         | 19 ++++++++++++=
-------=0A=
>>  1 file changed, 12 insertions(+), 7 deletions(-)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/D=
ocumentation/devicetree/bindings/leds/leds-lp50xx.yaml=0A=
>> index 402c25424525..a7b2d87cc39d 100644=0A=
>> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml=0A=
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml=0A=
>> @@ -81,7 +81,12 @@ patternProperties:=0A=
>>=0A=
>>          properties:=0A=
>>            reg:=0A=
>> -            maxItems: 1=0A=
>> +            minimum: 0=0A=
>> +            maximum: 2=0A=
>"not compatible with minimum=0A=
>  and maximum."=0A=
>=0A=
>No, it is compatible. Just do:=0A=
>=0A=
>items:=0A=
 > - minimum: 0=0A=
  >  maximum: 2=0A=
=0A=
I have tried every variant of that I can think of and can't make it pass th=
e check:=0A=
DT_SCHEMA_FILES=3D"Documentation/devicetree/bindings/leds/leds-lp50xx.yaml"=
 make dt_binding_check=0A=
=0A=
Exactly how should it look like? =0A=
=0A=
=0A=
>You call this patchset still an RFC, which usually means - do not=0A=
>review, not ready. Usually when I review RFC I received negative=0A=
>response that why do I review it... Therefore I tend to don't care about=
=0A=
>RFC. Some maintainers completely ignore RFC.=0A=
>=0A=
>Please EXPLICITLY document in cover letter why this is RFC and what you=0A=
>expect from us (IOW, why this is not ready for review).=0A=
>=0A=
>If dropping RFC, keep versioning (people also tend to do it wrong=0A=
>completely messing up the tools), although I see you use b4, so this=0A=
>should be without problem.=0A=
>=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
Thank you for your patience!=0A=
I think its' ready for review now, If I can figure out the correct syntax f=
or maxItems together with minimum and maximum=0A=
(if we need maxItems?) or would v4 be acceptable?=0A=
=0A=
Best regards=0A=
/Johan=0A=

