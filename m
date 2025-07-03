Return-Path: <linux-leds+bounces-4972-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C69AF68E4
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 05:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DF7B1786B8
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 03:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FAC23C50F;
	Thu,  3 Jul 2025 03:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="cYrMZSxk"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B523185F;
	Thu,  3 Jul 2025 03:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514892; cv=fail; b=rmU7Ci+SciJ7dhHqVH8TgO9koFv2BI0Z8j8ECfjkI71/BRGBK5Kuq5ix+x4aDHTHjY6Wdz5oRUU5hIGfJm89C9BHbqk49UbnZ3oWc/g9wJa/qzjBcxeGjFJC0xkp/U3FQyHsbjtyzD1sQNlzGbOnseabPpp1WWqB0nYjsZoXG6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514892; c=relaxed/simple;
	bh=VYRnXuvHeRDKqvJ9iD6Mc62g5PfnRF3iSzthNiDNCUs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LSN78nrVeSofP/SJmFeV1+uZ1Af93g5NAipufHTjk1UWZqQgvxGIlNhCq5yo0Uf/ZTxSlfBLWnNVp2HUhM5Htn5djesGG1fm/BjAua3wlTdI6kmxUX+bMzL3RsxTSZrm5BDAWaSMKiZFdAnriLe3MVerieR5vKS16qc/Fme7tnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=cYrMZSxk; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qykD+Ga23GNmzb6b/4Hz+O565XZIoLzUD8BhRo0+piOn13yv/bm5Q65IbHDkrO9N6W856gfHCD/BKdm/CBhkGQSU5kLdoUzjL4A/7ypEZcfqTiY5vnK8Q7VnpcnZw9Dkzj8H3yBFgXxgORSR9eJrJhyz4GxFQmuHyrfWs7EjHi3aEE/Cf/QtkuoxC7Jp9/A8nRtgqKS3f3dUBYLcTHxy1ls4BLw52aFxAszqNsCvWPBM/UyZNUDauT77eEtn0I+iIl5ledqmZPFk+W1hLrt+M5xJWLXPfXBMbyoTrYMgAcB6a/QufdgsoxyNYkLdDrBjt6kIioOhqFGp+UpB+5XO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0e9iWrOpS1DzgDtvL+VEw6cjd24diqwIaQecT3cau8=;
 b=fPzHcbg4tYyCV1lNJizVqMfIjY/haJNmcqnv11Vi2AxV0NM54h6+WJBIgKDokY1MRevrj5iUQnIyCMbplwtUonZKcYObKVIhJ9oWO22x9dlWR2oQPMCvX/dlD1Fd+lV7JwZ71IYcOkPcNKv1pw215bQ4ufbkeTUraktFWQ6VTSvQ9ZA8U9J2LAoEGRMRtUPjfnX8TConUtq5BytS+Sw6G08THN5jN3xvSdpPHCS4RUsfSenXcgNeVko9uJc2/7Q9SD4tYL0Zh+avVs5meiAv1KBaLdzkEe60dwZuk0SjH3Q0JjPiD08pEJjDJmMmhc1HdedS/QLlbjQXnH6BNk5V7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0e9iWrOpS1DzgDtvL+VEw6cjd24diqwIaQecT3cau8=;
 b=cYrMZSxkB/XrgT7+wpu1hBA8GbslYYI/u5MSX3Cpa1nT6qhAaiSoicE+s64PpTxuiUseu5196UFiZUkM21Llr1jefUarSLCG8jm7OvtvFYn0P6sIPYp5j6t63p0/aQ7lX1uLK7B8Rs5OjA7aLukWKCMBuHVqaDjA9XbkTRL0q+c=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by PR3PR06MB7018.eurprd06.prod.outlook.com (2603:10a6:102:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 03:54:47 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8880.024; Thu, 3 Jul 2025
 03:54:47 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>, "lee@kernel.org"
	<lee@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: RE: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Thread-Topic: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Thread-Index: AQHb60cttvgZtWYm/0as3a8q/wD+07Qe09mAgADxulA=
Date: Thu, 3 Jul 2025 03:54:47 +0000
Message-ID:
 <AM9PR06MB79557F8FFA113011C4D824D6D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250702114759.223925-1-Qing-wu.Li@leica-geosystems.com.cn>
 <175146290821.1131432.4001907939183416459.robh@kernel.org>
In-Reply-To: <175146290821.1131432.4001907939183416459.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|PR3PR06MB7018:EE_
x-ms-office365-filtering-correlation-id: 34d1f890-a275-4482-5a9d-08ddb9e55a63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9bp2mWbP+ftV3pRVy47yuk/H6BkTC5MurUxZ3SUiuSZ/PjYs69GRkyoksMmn?=
 =?us-ascii?Q?rztgCaJHJO9LTwRPYbQ+0AEKkHMRf/TrRx4gBKNqwbywdnk5HD5KyGhzGAnu?=
 =?us-ascii?Q?NWNkjV5pAdGJEYR+ZPC5iXE0ueljiK0vHE8+EukMFcwn2SjpBp7J538z6DeE?=
 =?us-ascii?Q?v8w9SKC3bU+hA3brxjdaCetLmuIhZyeGYCy2B8FiESfpzrlGfqQvQwl7lIHy?=
 =?us-ascii?Q?nHav1utn0o6X3kHzdz/FFwNlBP9VfFIomBtoqQkJ7Nc0kCIXqQ/rcwln1dXf?=
 =?us-ascii?Q?V8LPDs6bvX5F4KW34A+y936I41CX8ll3fSj+lBJVLlYB9S9KNuC6ex5/WGfD?=
 =?us-ascii?Q?1/6w5UuIBX1WuQMC6LbcaTQpAbgZcWioZrcVQBHrX43tZk/6mca2KlsxCoK0?=
 =?us-ascii?Q?q+9bCCpQCO+jpiZwYI8QdAr7W8FMJnmeq+XJO08QkI2MUO4wfcilzydpo+i+?=
 =?us-ascii?Q?lJa9u7kmCDM+s4+tbLVHwfGE/fiEXTMQu4URPlAqVXgDWjaHwDnlwPR+OPw4?=
 =?us-ascii?Q?Olxnyc9jU6JY6X5xaB/t11W6WCyn7BjBeh0FEPDB4gJ2ltpeswMEuCieqleM?=
 =?us-ascii?Q?Z8MuEFMXCgY+kW8IPM84VKqcPuNdl61EsP/HbuSkV1VqqhstZKOV8GeoNEDG?=
 =?us-ascii?Q?Gqt190EFXO8ekThHHEsL+a04Xaq7LOVRuarQ0HGlOZd8cLvmKf7PHjlwZMpm?=
 =?us-ascii?Q?zzzWsTu7AKzBOeTfP51vf4yWy9OoFROoGPJK/CG8bD/IXm18J8XRq1SkOPjE?=
 =?us-ascii?Q?oMrfgy0L1bUXKKjfIvztAd1/AMT5TF1x/SbCQjGQj4iPB6T58Zq734fgGxnV?=
 =?us-ascii?Q?KRqQzXKrFerSH4amwHIfXtAMd+Rho58jZ+W3X3vW/wWQeZgwyPjaUPJTzsp4?=
 =?us-ascii?Q?0xoEfRv9StMh8rbkfN0dFPO6K0prt618bzzLh13fu+XPKjfukoUJKwRwvW+m?=
 =?us-ascii?Q?VwfdhdU5qIXN5qxOn1JHS9Z+0MFkHCx+MlJbzDH/kZl6MomAyblv4+EMCAlp?=
 =?us-ascii?Q?1sHTOBDEHMfKjRVw6V5HJfUEKt3bu9oNpIs+A16bLz1+KYQcdi460IMwCGPn?=
 =?us-ascii?Q?SjHkoZh0kxR5t2EjX19MAKb2NgmtkkwGfynNha6ntdMLtfHbLDGKmV99JJre?=
 =?us-ascii?Q?Xl2761ejOODuw1KOzn4wvxZrlF1lPncckHukOlBOQ1hVkXz7mgkWffcvQs/J?=
 =?us-ascii?Q?CZizYzKSeoM5XOuGlEEDqpD5IJg5XObYbSUZqTGCl8VaweF3QrWdOQJWDcwV?=
 =?us-ascii?Q?Chsv09LNCGCpRrgNOj/XxfR2lX0KgR3Cz9Q3qL9HtU2ChmrKWG+6V7xAO/yA?=
 =?us-ascii?Q?vw9Lor8dgrQ+1HkfrZtkcFHgWuVirjOm54/Ebz7uYcR75eS0Oj9No93q+LSf?=
 =?us-ascii?Q?rQ4R0D0aKy85h/leJOmdTj8FfFgVD3/IT/3jCAZ1xy32ZyvLxnTdUh8lGo7p?=
 =?us-ascii?Q?l4fIzZLLgYygd5yrzoM9FuJ71q83WAZteNC2amv//Lvq6EZMksaykQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fEUFHMxnEIw0w6jNf8D4jt0ONK/gqXDD0C89aaQVl6XUQPF3Z/740dYnD2PS?=
 =?us-ascii?Q?RPQhfHJrCyIj6T4IXXeO9Tvg09q0lGL7J/fgE8lyOEoIlOAU0V5TXR/gI2o6?=
 =?us-ascii?Q?/POIezOBRDmHZxs92cj7/tQpHAhnDKWmofiR+rfX9zFtZByZcXbR/BBPK9Fz?=
 =?us-ascii?Q?myaQL6tcXyx0Lvd2Yw5I60F3crERJ5rODsweSW+3Tq4v8/8h0lrPFxulB35r?=
 =?us-ascii?Q?RHDvXimq1gMAdAuVLdRJ9ReHMwEmhL35OFVfC0YcNE1pYy5bzfylFkEEramm?=
 =?us-ascii?Q?8VaIMFPqH4eMGXp8WlbBpn9ZOCXQD8SxEXytE2X2IjAPav1pc4ArIJ7Kyt6t?=
 =?us-ascii?Q?k461LpLElOnQ29483LgQ3XYneYydsiJnE5UfjsIqrtHeS6RPbHXS+wTjwgW9?=
 =?us-ascii?Q?69qMQHz3FteE4kaUpxubBz8XAmqnoq6qtgoduelMnMXvZS9v02nyS3x2qxpQ?=
 =?us-ascii?Q?KVVGpAYC2tAAuDgHEno9DTXNMByg72kpNSFKDn3siwbN2UDLYoq8jAsrKqAt?=
 =?us-ascii?Q?Uayx71t8MR9gRzUPw5/Tupyvi9ivxsUXAyqS7vzSTqfUyyE2xh4aXc+p9C95?=
 =?us-ascii?Q?y31881ZEOTwP5FFjadVQS3bdC/mI8qrzzG0Lq5m0C1a/ryqvD+2jA7U/JGm1?=
 =?us-ascii?Q?pD/KPq1QFPVTloWhBn1XjdBvNcCOJxMNZ7kMaesLgwXRveewJ65dkeNo2ivu?=
 =?us-ascii?Q?QukxvTrPB9HkbpFxYWUoiIB6MrpHhnJXM0yPpJTAnJPH8L9xSBXSTxiuhxvY?=
 =?us-ascii?Q?C6pKCAdrKsNVGFOL2nwm2dtuR6KRWR0cyXt4oVypLlP7NeypE7iKu//aYMW+?=
 =?us-ascii?Q?lmQKJKY0k6j1BMQD8XjQ+6OqSgDlfY+Y0lM2r+8WzIxKAT9JcMPWfgsTdYez?=
 =?us-ascii?Q?GbnsAbMOyg36VnAxtIREXj0DcZKttpuXjC9MnCQM6rY6XGq3wzB/kbB7c0GJ?=
 =?us-ascii?Q?OdiYkwCeKbpBOA+YnRqUMCKk3me/fdg0OaUVjazTgvaTbfpSpSPumelx4AhL?=
 =?us-ascii?Q?jpnDZiInkf9Yd+oUzhRIOSRBZbWzqg/cD8sSwZZZ9ygeKojISKX8zwdk5HpV?=
 =?us-ascii?Q?BzPVFpDP+aS3b3R5pF34Vvm73tSerXdCMKiQ9pZv7F0+C2BlJw5dsm/ChN29?=
 =?us-ascii?Q?g94LVqIUbcpLs4ogwz8mCTf1JTulV7xd0idp6Vxd+lZ1rZk7/dpJkrMYrFXg?=
 =?us-ascii?Q?7WR+ZRvE23e4tJ8W5TLvAVInduwAGCKNSJHLyJpmnSAWcmL7IOLIMFTj0qMA?=
 =?us-ascii?Q?DyJDrlBJjExezMnYe+ZuTuAPZAMoAdDKZ5/Ow2U3gPSpI1tr7EfykvsrqqlM?=
 =?us-ascii?Q?iWSE+Z1qHpMF3otm/LypuPXDecEbJznqAS+Z+aGon+piVuj1tD7vTbFq/hCX?=
 =?us-ascii?Q?rI/2LaSAQjjLGP1DE9wV5N3WT7wBjtH4LIaDZlPkC5K+xkgh/y0SzDqHx+54?=
 =?us-ascii?Q?DmdlHk+UWubKG3rpiJzkxiqdWCmbTWY+e/obIK6mH/9sVjkjo8Rj6bia8DmM?=
 =?us-ascii?Q?/ckuU9Fzi1k5mOKgkx4w274Hm/bA6GpFbIcf8GsVd5SgifPoJZ5bBFlMeVhj?=
 =?us-ascii?Q?JF2MGn/iZNM3RNF21BLFTF26a8OYbLZ5IFiB9k/2DfA6X/sAoC5hSCpafRdn?=
 =?us-ascii?Q?jBmSIpdnNRY41CTjEyZiO4w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7955.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d1f890-a275-4482-5a9d-08ddb9e55a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 03:54:47.1165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOUUheYafC12Bz0u1SAuPtWgv5MFp05qMsvMOWJEl5kAr3Saffxc34eoif+lpbNNpsPHNC4T1ABNkxmShi57tRXYzthxR3BLXnzp6ZLxEEnH9cUJix65B2GNNelMoyS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7018



> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Wednesday, July 2, 2025 9:29 PM
> To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> Cc: krzk+dt@kernel.org; conor+dt@kernel.org; linux-kernel@vger.kernel.org=
;
> GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>;
> lee@kernel.org; devicetree@vger.kernel.org; pavel@kernel.org;
> linux-leds@vger.kernel.org
> Subject: Re: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios prop=
erty
>=20
> [You don't often get email from robh@kernel.org. Learn why this is import=
ant at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> This email is not from Hexagon's Office 365 instance. Please be careful w=
hile
> clicking links, opening attachments, or replying to this email.
>=20
>=20
> On Wed, 02 Jul 2025 19:47:58 +0800, LI Qingwu wrote:
> > Some PWM LED chips have a dedicated enable GPIO.
> > This commit adds the support to specify such GPIO.
> >
> > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-pwm.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/leds/leds-pwm.yaml:44:21: [error] emp=
ty
> value in block mapping (empty-values)

Fixed in V3

>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/l=
eds/l
> eds-pwm.yaml: ignoring, error in schema: patternProperties: ^led(-[0-9a-f=
]+)?$:
> properties: enable-gpios: description
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/l=
eds/l
> eds-pwm.yaml:
> patternProperties:^led(-[0-9a-f]+)?$:properties:enable-gpios:description:=
 None
> is not of type 'string'
>         from schema $id:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fjson-s=
che
> ma.org%2Fdraft-07%2Fschema%23&data=3D05%7C02%7CQing-wu.Li%40leica-ge
> osystems.com.cn%7Caaeff71db4f841ea959f08ddb96c586e%7C1b16ab3eb8f64f
> e39f3e2db7fe549f6a%7C0%7C0%7C638870597187709015%7CUnknown%7CT
> WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4
> zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DSMmSnn%
> 2BwemnBgU6prZWfMiZ3nMXk20PKDFB96E5vMoI%3D&reserved=3D0
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/l=
eds/l
> eds-pwm.yaml: patternProperties:^led(-[0-9a-f]+)?$:properties:enable-gpio=
s:
> 'anyOf' conditional failed, one must be fixed:
>         'enable-gpios' is not one of ['$ref', 'additionalItems',
> 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default',=
 'dependencies',
> 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'el=
se',
> 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems'=
,
> 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern'=
,
> 'patternProperties', 'properties', 'required', 'then', 'typeSize',
> 'unevaluatedProperties', 'uniqueItems']
>         'type' was expected
>         from schema $id:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tre
> e.org%2Fmeta-schemas%2Fkeywords.yaml%23&data=3D05%7C02%7CQing-wu.Li
> %40leica-geosystems.com.cn%7Caaeff71db4f841ea959f08ddb96c586e%7C1b1
> 6ab3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C638870597187750588%7CUnk
> nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsI
> lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> B4E7joIeKPsOCw1Vb0dr4O4WAZJi5OuPjFMdGyIH%2BqY%3D&reserved=3D0
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/l=
eds/l
> eds-pwm.yaml: patternProperties:^led(-[0-9a-f]+)?$:properties:enable-gpio=
s:
> 'anyOf' conditional failed, one must be fixed:
>         'enable-gpios' is not one of ['maxItems', 'description', 'depreca=
ted']
>                 hint: Only "maxItems" is required for a single entry if t=
here
> are no constraints defined for the values.
>         Additional properties are not allowed ('enable-gpios' was unexpec=
ted)
>                 hint: Arrays must be described with a combination of
> minItems/maxItems/items
>         'enable-gpios' is not one of ['description', 'deprecated', 'const=
', 'enum',
> 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
>         'maxItems' is not one of ['description', 'deprecated', 'const', '=
enum',
> 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
>         1 is less than the minimum of 2
>                 hint: Arrays must be described with a combination of
> minItems/maxItems/items
>         hint: cell array properties must define how many entries and what=
 the
> entries are when there is more than one entry.
>         from schema $id:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tre
> e.org%2Fmeta-schemas%2Fgpios.yaml%23&data=3D05%7C02%7CQing-wu.Li%40l
> eica-geosystems.com.cn%7Caaeff71db4f841ea959f08ddb96c586e%7C1b16ab3
> eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C638870597187780819%7CUnknown
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DR9Ixi
> 0hiwK1YgNx1uHbGLDza2Id%2Fmfuw62TiQ6A2QVY%3D&reserved=3D0
> Documentation/devicetree/bindings/leds/leds-pwm.example.dtb:
> /example-0/led-controller: failed to match any schema with compatible:
> ['pwm-leds']
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fproject%2Fdevicetree-bindings%2Fpatch%2F20250702114759.
> 223925-1-Qing-wu.Li%40leica-geosystems.com.cn&data=3D05%7C02%7CQing-wu
> .Li%40leica-geosystems.com.cn%7Caaeff71db4f841ea959f08ddb96c586e%7C1b
> 16ab3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C638870597187806331%7CUn
> known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
> sIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3Dn%2BgfWLuIv%2FVPSodnF7rj7LqwTaMtOIbiAztOasgfDlQ%3D&reserved=3D0
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy should
> be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.


