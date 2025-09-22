Return-Path: <linux-leds+bounces-5542-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B29B939B9
	for <lists+linux-leds@lfdr.de>; Tue, 23 Sep 2025 01:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521F9188A5E8
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 23:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E02877C3;
	Mon, 22 Sep 2025 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="IdulOHfE"
X-Original-To: linux-leds@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2058.outbound.protection.outlook.com [40.92.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C131E502;
	Mon, 22 Sep 2025 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758584317; cv=fail; b=ZdBo24BUYd1RV1pCuCC2THwivX1KyigzKywJIvRaLAf1wS9z1Z2wyOKbjInrUZhOIDHIxMfLbX70cVdX+u/sRjEWOx6XV9WHik8vEu/sJqtlhl/Ecn03m3IcDg5v0KaBPCC8BjHNDNDfDLGFm/qxnhgtV8yk//WAdyn3U1UOdhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758584317; c=relaxed/simple;
	bh=WXrD+cuv6sW4Vp7WVDKmOjBuxg/brH9FJKnX9KDGEjQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RtgCsFcbQLThmbvhmG9UMD6RQta6uU3UQoGFMlMM+3vTQhLQlo3ivt6hpSnVaRM+ltqoysyRlCtm+ESx6HeXVzHpfgS5I/FeIfMkrp6YuwZur0JxlOuTgDP3h78Frgm78zCQ5w4Y5CNJtb0oUHb4j9zf9Y4Q40r4ZTZz5PDL79A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=IdulOHfE; arc=fail smtp.client-ip=40.92.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSk/g0ixkPKTnzsfESJ0l4wACU1UtcmW9rhGmalCxNNG2K8aH3IVz02Uv0mVGBd49n1nyH+hwxev9ToykYzfSsBKXRZ3jr/MeuLt8VTC+AobaItlQf1DUhcTE6egc3DWZOm8yV3MNVyLyQ1vuGbihEKkpFZJ6QK7DJ0YHM/asM5AprmJLbuYZlwInM0SuWfQfkw6zY/AaKTLvlvpv2rMrR6Si4FtPpvFYlM+j8StAtHAZvH0uOzHM9padcWPUOy+HT4Fw6mSOAVNR/1NInvru1AJqsO5ITOUFNHM6XgQre0AwSdJ4fIjv+gEnI6UKbDEqSQKageTXKCL874i/LcZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WldYG6BSrMWkb6d7NAUk+memRlD+IJ2bSk/Ybsaui+0=;
 b=fAgExyvAh8/VkhnezlW0wcNfdXWmySorfec+FH0ljW6Tl37vHhjzgd57X3aD98PQAAzXby7QUWmTl3XeTfGqr4/cidFlgVFXrP0TdQZRlDb5iIf3wZRRH9SXCc+Ik08OJELEFmETxLDfy5O28z8/stQ5DekXr1+Dk4gC1uhNVZ0OhjrB4kL5nIQSn5IhkxML6iAjJG48RmATdf/AmlRbEM8lsbianE/RcOy7irdUmk7m6k93tySf2tvhTZuHTaVGl1kgCDdwK6Otd1tvD/igr39IoK0Km7fhsbm222/QBnIaWwpkAn1UQ5AElwEGS0l/9t9MGVt+bgRrvreAmt/gFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WldYG6BSrMWkb6d7NAUk+memRlD+IJ2bSk/Ybsaui+0=;
 b=IdulOHfELVcXgk7eUyldTV97Y78BDexpO0JhF4lR9fxH6Wx2/D2mUP1m9sQqmGZDwiZD5GfMEH3ai9j5Ji6ptp9x1+w4Jx+e2lXh8u8pdc5apHObb6KOhblOIp2RXZGpeNL0mbngz6WFVUxqiMJkcBodz5nuLhvELgW8GG++8sUFP9+sI6WzKdoBefxGuF0SScAg7uvZtxtnsC3PXsKCQkqhWUjwj9r6L6qXTknKUhutwxHSS1lsBuRwS2U0tcOV0/7dg2BD1QrNx02ftp+bqgdcbz2km93Hj/McLzPhLTANsFHreXnpiqK1slC9KK0T0y+iOsIXvGkNXcdG2QMlUg==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by PH7PR84MB1960.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 23:38:33 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 23:38:32 +0000
From: Jonathan Brophy <professor_jonny@hotmail.com>
To: Rob Herring <robh@kernel.org>
CC: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Jonathan
 Brophy <professor_jonny@hotmail.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Radoslav Tsvetkov
	<rtsvetkov@gradotech.eu>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: RE: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
Thread-Topic: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
Thread-Index: AQHcJvlrwrMwzAxm6kCkhb7N/0DRB7SfcouAgABmGEA=
Date: Mon, 22 Sep 2025 23:38:32 +0000
Message-ID:
 <DS0PR84MB3746EE49A746344D3579D32C9F12A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
 <20250916110217.45894-3-professorjonny98@gmail.com>
 <20250922164505.GA390320-robh@kernel.org>
In-Reply-To: <20250922164505.GA390320-robh@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|PH7PR84MB1960:EE_
x-ms-office365-filtering-correlation-id: 71a0a170-57b8-437a-e959-08ddfa31247c
x-microsoft-antispam:
 BCL:0;ARA:14566002|13091999003|19110799012|31061999003|461199028|8060799015|15080799012|8062599012|40105399003|440099028|39105399003|3412199025|10035399007|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Kz6D2EB25999QkTpxqdxpDl4ZeFRgI8mBMtAhuPacLMGACmbiUS8X7MWbEWO?=
 =?us-ascii?Q?X3Iw8s0gszrKEVKFUf4uXeEh5GdkShGaE2jy6AqXKMgoTiDtl9KtEI+HSHEW?=
 =?us-ascii?Q?7b1cT0cZmGcMqxzalvLdAAKZ7jp6ewJ4ubOm0Vx1dB+dk66bBoBp3Uaeb6Ic?=
 =?us-ascii?Q?i67pjkWTeQghzWnqJH25FgvDPC28K79f6uPNKlHn99F0pIocpCOJZqoozAr+?=
 =?us-ascii?Q?wRFpdNsSOHdHAVPZ86BRlwexuBSekIF+TFBFbC6PS9U2uBz+kPi///HhWiZe?=
 =?us-ascii?Q?m2eOMXVtWtToEeRJIV3w6j5zbU3Wujnr9V2xUjQL0A/KZX+bVPjAdoFgq79N?=
 =?us-ascii?Q?Ej2yy367zqW6+x24ERimFINwAuiJBFA9bIBr4oo2T/Iai/ZbNtumI+wWHokj?=
 =?us-ascii?Q?0r2fjyYtz1U7uzX83RaOEk8EUySNnSOz5ZmXicPwiruDMpQOLPHNeQpGLnGt?=
 =?us-ascii?Q?m9Uzj7wA75JPJIEGrk384jorGIM51GJ5hDG9l5QDsh2GeeZVs2H1Zz9oy6Hz?=
 =?us-ascii?Q?j/Gg6frz64yX/ITRmrM7SNA7HiuE+5TD6AT6VcQTbpWyRD9ACRUDzihuVs+Z?=
 =?us-ascii?Q?xeEJKepySye4zD573V0Q+eqnkrdK9jX2Qfml5/BXth4RUbD6uqsZER/TCNQP?=
 =?us-ascii?Q?/MCERRzFy8JdhMLFwGKuDadReXSg+OPM4bC9dMDaFrPsXpuSFF6Lo0Xz6shi?=
 =?us-ascii?Q?GLen5GaiWLAXgK7zSMTTUuPdrs5NLfcT9Pl0fuEUcGFaT5XoStbmbAiT7h9J?=
 =?us-ascii?Q?ZYxf3u1gIBW8I3gh7Bxe0T65nqVBo2ab32KhZIXX+PmBlKDj6KncKqi8gw72?=
 =?us-ascii?Q?Tw8ViSQXAVCJntWMXPKUUCEcldcSKi7osaUJx7mAtaZX+bQCV1ROIrVBoviF?=
 =?us-ascii?Q?q0Q69xSWnjeaKF1Sx420IZVgjS+TWZwEB9+13HlZqGtMIaEIu6fpWuRly2BF?=
 =?us-ascii?Q?jukIoVh4wwNf07JcYQZ9wK3CM38vGgLWI7IXxvgu2dgkfXHE3GuuGxO+0hgf?=
 =?us-ascii?Q?k/RmT63k102CLty1gU6AFPkAlI/Rl7QpSTlXfJ9De42AJZzDM/XMUUoMsyZs?=
 =?us-ascii?Q?9qdzyn6HPeRwdun8kDa2LsWlRANXRd4kX4J02ngk85u8GyENaUS/imIaxYHT?=
 =?us-ascii?Q?TBaU0yZULbE12s+cxqcvDGPJ8ieMpjh9eq9aqiqbKA4l5P5reqiYlx3XSYms?=
 =?us-ascii?Q?U7yrGUQgGc/AQB2BbvBNpUVgSv/mFqrulKXTbQoZSf020J2lhWCiJcznkkA6?=
 =?us-ascii?Q?sLOlW12oZnCBVVKGDM+q?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AqMcoMdI3mNZO/YHNenjoPKRt6RQnpfNYtRkZDqjr6NN+7bIJXgSXplHT9gG?=
 =?us-ascii?Q?WKgw194LnC13rZ1Pi9XpnKnn/W9E0phVlS97G32xUnxnmYCcPOr4mgwgzcBe?=
 =?us-ascii?Q?fm3eYaUz7l2FqRAxvpbGQP550akZtRozhg9hxPYP0jgixhkGYZg3NAoTF5Xk?=
 =?us-ascii?Q?6YhDDeN83j7/l7HI0fQ1/H7THKpA3OjaVx/aUzbB6dwvq6Jq3Mn+2EfQA+kC?=
 =?us-ascii?Q?zBkgQORIVGadE16AZ1MSNswM6JjOeBtjxYH8Ikdy4Y1O8dvpgFOAYnzV85R3?=
 =?us-ascii?Q?V5Db1mOAoQd2ZjvY8pd79Q07yl5kmM8ULR9PyRA2/SatTIh+fsQT0viswemn?=
 =?us-ascii?Q?rxGCphBsBP+fcnbPUvhdpGUiJJDGZRgJxPKQkeXTcNMeiuJE+BPTdj0DtTah?=
 =?us-ascii?Q?b0dU7N7m518ebZsdTTSmLf7/l1AdIHwhdYgavuoCqIqF8Yi738CD45Wyzyr+?=
 =?us-ascii?Q?pvghl0uBB+3UK1F7CSyCjp4m5tDfKUdnncdvrliHqmdsLta2qprDIseV4dxB?=
 =?us-ascii?Q?FavBVvMxlYT0YbdoDzl/6tD3N0Z4XbcWkkCvGVRcEkGkdxvp9ObQD4Ih7rWU?=
 =?us-ascii?Q?FKjLuCjRzS9Dp56fJS5or2rXZbi4BbBbTa/y6cJF7RaQhy9Xa9MzgGFmE5m1?=
 =?us-ascii?Q?eLTBL5q4YdVEDap5R7Hek8Q8iJ7elZpO4oGFhs0/9gNKXyJHcjx698ifHXbm?=
 =?us-ascii?Q?nxpqclt6D4ysmaVGTduayz/50t8bZN/S3BcdDre/raiLHOnXf6qgHQBRz0E9?=
 =?us-ascii?Q?thXxP3JndtdNvx0UROM6JYh2MTOFgRJkbZdeLLZNbeQkuN4eVfru7b6xndOu?=
 =?us-ascii?Q?6SPQohLMNF2CHgtxKJH5EyRhR2rahUeajPvdHcVO+yf9NStavwhdtVPWMPlL?=
 =?us-ascii?Q?eHnXlYEfPLKemCwjcHmpTxcDkVsSrZ29pZKMq8U78Vy2t4Ehy4JQ6MDoOFg0?=
 =?us-ascii?Q?qZFbq8gETpkazGOhlYy7iBlB12h0xtLzmMvQBtNBeWbI6W7Tyyq+owUpb4fq?=
 =?us-ascii?Q?YGVPQg7Us87hRAmMg70wWGYoDB3rrPm0sMw8iHgivF1Rhzdn7zWNuioXB6Vb?=
 =?us-ascii?Q?QRP9cjCttLRfUzYBBhD9jztsxdP8aUuQ9p1NeLvC0esibbEphlk0mBkJiK4j?=
 =?us-ascii?Q?MomljKUW0lp+13Bb9Y/8wDcK90A1NSwRkGadN3v3QfsbTvzy6wy2ECfXYPol?=
 =?us-ascii?Q?HcGnUjVvtJ/XLv0U6xheDckew35mKUTUiVa+Au0CG+YrjaHTvNT8RgcZiIE?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-774d9.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a0a170-57b8-437a-e959-08ddfa31247c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 23:38:32.8576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1960



-----Original Message-----
From: Rob Herring <robh@kernel.org>=20
Sent: Tuesday, 23 September 2025 4:45 AM
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Jonathan B=
rophy <professor_jonny@hotmail.com>; Krzysztof Kozlowski <krzk+dt@kernel.or=
g>; Conor Dooley <conor+dt@kernel.org>; Radoslav Tsvetkov <rtsvetkov@gradot=
ech.eu>; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-le=
ds@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual C=
olor LED Group driver

On Tue, Sep 16, 2025 at 11:02:15PM +1200, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
>=20
> Document Virtual Color device tree bindings.
>=20
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-vir=
tualcolor.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcol=
or.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.ya=
ml
> new file mode 100644
> index 000000000..945058415
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +title: Virtual LED Group with Priority Control
> +
> +maintainers:
> +  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> +
> +description: |
> +  Virtual LED group driver that combines multiple monochromatic LEDs int=
o logical
> +  groups with priority-based control. The driver ensures only the highes=
t-priority
> +  LED state is active at any given time.

> Isn't this what the multi-led binding already does?

Yes, but I think the virtual colour driver needs its own unique bindings to=
 distinguish it from other multi color (RGB) LEDs as it is not a multicolor=
 or RGB  LED, it can be thought of an array of LEDs exposed as a virtual si=
ngle LED.

The multi-led from my understanding is more about combining control to modi=
fy and control the colour from SYSFS.

In this driver the colour is set from the device tree by combing LEDs of di=
fferent colours if they are combined into a single element but it is not it=
s sole purpose, it could be used to drive every single LED on power up for =
example.

If you think it is unnecessary I can remove it, but I think it would be bet=
ter to differentiate it from a multi-led as I don't think they are the same=
.



