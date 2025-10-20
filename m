Return-Path: <linux-leds+bounces-5828-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF3BF2C53
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 19:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBE93A3741
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 17:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55653321B3;
	Mon, 20 Oct 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="S+EoXK5y"
X-Original-To: linux-leds@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011033.outbound.protection.outlook.com [52.103.12.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D12561AE;
	Mon, 20 Oct 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982064; cv=fail; b=b3KAHgRj459LUxV5ZKsT5GG2P4Fq/nY4HLuuSpS9tpMNed82788j32PfJPZ/Z+ZvoS3QhGc1pSyZw/Ee6WflhW1jax5aAQkhMLp1boWfnS23aj2pf1qKC/S9cEG96xbsoLh196+pKaKq6QWzpS2UeqPboxuGV5BR80mKa0EL1Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982064; c=relaxed/simple;
	bh=77ZcNMWbJcaPSQZ4scCNT/kjLZYbw19u1j3PuOHWa3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EyR6c2K+wG+XneoYPF8l1K3DSEseYx2SPdBDcoImVWIby+NiMFN3p1CBVQW1fb+Nvue3uTuwT+JHjJhj36f9xxfET0Ej2CnAzC9ug677VBxWOqSwFei5zLFVWTI19/7GhBmP1FwxULpGZL4tVp2WD8vVRPsADIYVUODDhvCwF+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=S+EoXK5y; arc=fail smtp.client-ip=52.103.12.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYPgHO6YUm6bMOeAqueLZSHRDQvBElEZRWVNji/89ZdWqHvIgJNzEvuD76+imcCvCoX0qypJl7meGbs0ifQ5iBpFrsV5Xfox8rF2JCkjUE92uBEssEeIEYGU/4/Q8GkNrtDlOyefX/2GVLUQNkGC9n3r8soWQx8jr5IHwbTdjBn/1aVT65c1Yu22ef6jk731/qCx97tqKU8hdJoHjC/K/YxavqAFqFT2gDiOOQ5djSxtv8zpZKij+kUEdlX6Ca4Pg0XB68CIgIPiUOm5VWhLblMXYIggEpP8QzIxCWmqPrbRlKX2J0cRaXJsxDKKTolGQCaC9p++2CwFONf/D2pUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77ZcNMWbJcaPSQZ4scCNT/kjLZYbw19u1j3PuOHWa3w=;
 b=DkMrrYX9J0imuncRGCi2mgzc7nRH0ZmsmgHeB1CAOI5cwelNnxrWoWAbcvfpC8LPQh6dED5hCeeUXHyLVxOeU5Y1o33KIKfJqA+xxefLELbMsHqnIwEu7296YKshWeCz/EcH7bSHFjzZoFuYQh3KvuQKDcMS22lImJ5ijIsiE+ESrTzD90QKrfuz0/1LGKOIdjEVxpD4hrYtoFjQHFZZ7LHnBgp8P2usbQMEPhL1m3uba3g12Gwa///q597KFj0BeyGHpVOIC0om5pu/3OcLcT9wIhMjPuPuvWZGrOL9HLWFJ3dgllFJw7lejOcMsmV5BzUz1E3kB1ZoJfysXPCOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77ZcNMWbJcaPSQZ4scCNT/kjLZYbw19u1j3PuOHWa3w=;
 b=S+EoXK5ya2BD1icmTkBXBKQDUd0TOMH3GkOVZvH95M21LT8cF2ekhQc0VFjoq04q4k5T9eSmUCpCSfB9KmRAb2Ii+SgwRbm0GoTgEDPs1FFnnxem4kaYHjsrgBlgnRkFOOTSLIfiB22FfiYECw0wLU2r2QR2+102rnOd3e+oDvLokNewpwT1ccIQQZhI7myu0Cqr0YuQJchkRa9yc6py7laFAKleW3aEvPmR/fwW1ayfz93+ndOW/H7DyQldVkC9nI+tEv6lOLC2M2msD/Stm9kmbJv3m3ksj1hUAuKrgRvQ76OlZvwmW+Gujsx+IOL516/2CtSPFaWloobPyYtY0g==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by PH0PR84MB1788.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:162::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 17:40:53 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 17:40:53 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>, Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Thread-Topic: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Thread-Index: AQHcQNopJuD6pqltWEyBJIQ4E9N9H7TKoFUAgACtrl4=
Date: Mon, 20 Oct 2025 17:40:53 +0000
Message-ID:
 <DS0PR84MB3746EC461381006D35D190FF9FF5A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251019092331.49531-5-professorjonny98@gmail.com>
 <202510201457.uOrhkKly-lkp@intel.com>
In-Reply-To: <202510201457.uOrhkKly-lkp@intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|PH0PR84MB1788:EE_
x-ms-office365-filtering-correlation-id: 29a7ac13-eb61-46fe-999f-08de0fffd135
x-ms-exchange-slblob-mailprops:
 rYPt1fhvLTUem4+YyY73AGh/GMpkrRb3HoD+CYyKQeu78EVhOvj9y2nJh/NBzwipTqzQPaEBaG35J5qTfHgXByirCDxyoEHLAgh8ZSohAz+WkebyHbFvjtJa/FU+ULWKTG/4Ru0TirkpLz1k0hPALS30J8YQEOn8AGYFdyNRHqQ+NsT/N4Lka2dJWdcVYMV6C/i2jt7XYRKSa/7A2ths9jllzRfdj3L1OrqF89v3fHEWXzQ7BcNIAkAZtsYX9eeY4r7nfH7Db2eLXNQAxqJ8jFUIdHKe46KibGyLcGnggAs4M2CMBmfhhyYatC2d2G7579y9jsn1zvqG7wP4hn9r4k9Uh4/HKPjxumLBFBjxeSSDyrHdvGEWoE6paUICVN7hSG0uCJOHjAQl9nO1GZKabxvn02eKah3NZMJ0JGBwn0aACxmf9k/9PujL5p9ocQQ9FKDubWU8wFajQNYvA8cfEGdsm5ccZBpxD33IVrwWZr4YCEDLQxMyuaUCjcgHOtmDRbaM2Dr56OVZB9gCPnWtomuK0R4KJPjmMSlAhinQIecq4ovA/5ELqAdAnjgUZ1qzQA2FclO3VnSZXHteJA9q9xPyiR76giZHLwTMD3BP9mogEdIHN2jxhosJ1vhYER9X9IcVacd+X20VDfYNZe/JSe7IX9GbqCECFxDs8RjsHt1dwwBop7ihyWDYXWjVHB7vLhYZgUHJZC2eybuX8YJUJw==
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|31061999003|461199028|8062599012|8060799015|15030799006|15080799012|440099028|3412199025|40105399003|51005399003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LoNQJI39AO/zWcpgKubKkeDIlEBgRJvorPS04ImCPToZ9EzG5G0CuffjNF?=
 =?iso-8859-1?Q?4zQN3+fuJnOdgHIPIcPzbRTJehmUcCykCCU4Wy3LJ1zRQWo7VvDEKa1ggc?=
 =?iso-8859-1?Q?kYVdzeelBQVF9DcrWEYS4hnBVRrPPWovL2h7ZNnDmbo9bYtKnZNwJHeBsh?=
 =?iso-8859-1?Q?YjiBXxUHHYjj0ftYJM4iiaqlMnvVao65IklfI2/r8hXTCX5D+KdA/irQYe?=
 =?iso-8859-1?Q?Dr6OZQ2WDDoZr970cjwMbw3fBiWCw3V8acngKiGLTmyiSJQjpIXuhWi0LV?=
 =?iso-8859-1?Q?Ymn5aGW5MbDribVldP+sOqPFRGPw2YqlC3OnzByArzi3W5BU9i94pErpkT?=
 =?iso-8859-1?Q?3nsekBth6ilq9iyer8H4lNN5J+4/lvL2tWEDdX1Lc4VlNwTnTPegNCUgXU?=
 =?iso-8859-1?Q?xylwMgD6Zoy7UT7eZFdDPHikzPRlBTWrVbvcm2J+45JTfwtAx2JeW1xHJm?=
 =?iso-8859-1?Q?RM4PmMFigVVzsMcBGPeI3JQxWhSZEgI2lcq7zUatM/+yt4LK5z8588a1IH?=
 =?iso-8859-1?Q?++l8wD4y3jUZfIOqTnaL561ayZI/cfGDTz+Y1fS+XRJbMjrbBCf+Pb0G8G?=
 =?iso-8859-1?Q?0gVvVX0k6beGF9c9xV8kDp2wJ1+wLjWonTzeBsCS9hiIWsceQ6E2WUp3ST?=
 =?iso-8859-1?Q?YCjJdOai420m+hTAJwGRUCSzJw5JPRQsvDxZo/tSpCd82KGlVpoMDd1F6z?=
 =?iso-8859-1?Q?8Fcza7AQ8QiVyFVti5YknfSVzN6K/wpZAhcie5oRPm7/EPM1xHl3tBIWPg?=
 =?iso-8859-1?Q?fzu+jpOmuOcwsKJM7gGUbi37qgmg40yglrKrYncFHzG2SxoMoF7iF2xT7u?=
 =?iso-8859-1?Q?HJguMaAp7VxaOzPl4pQ2xayoquHn7wtcuM/dHfi2rQM3TDRDjskfa6PDIm?=
 =?iso-8859-1?Q?U4RgFafqLgX8TfXSnxofcsE8DBsXulCW6JeD9L49Z56YMHb6uY69ulsc9+?=
 =?iso-8859-1?Q?o53FslCYIveWA86mnCys2lL9B4VjHax1oBLr4vC5+FZbzD8H1sxvxuJ202?=
 =?iso-8859-1?Q?XdsXOWjB5jzZFz3OdO5FvB+KETB08/IxhVLa6qbeA9kTL3yrTZeL3XkI/x?=
 =?iso-8859-1?Q?x+jS00GxJH4xuNdH2HnCiyNf/2C7jRrAPWLCuFA/h1uFBd9/B2ZZgPHp6h?=
 =?iso-8859-1?Q?6IaQ1hb5zx7MjSFIrVrS5f3B55luhdmsZX9lCK21Z4sxqOjfQA7p3VgaDN?=
 =?iso-8859-1?Q?mQsDnsB+k1Mr1l8SFE/F8wZ9SlLQ8PQ0b+JRQS+mgT+QcgLZmAcjUrJ6oJ?=
 =?iso-8859-1?Q?pKa0IObvB7SYn3r83n5g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QkBzBzCzIZKDFBVUKbSZhGDw+jEE3ydIBPQoxOk1UJV4yMrq77pI6HmZhU?=
 =?iso-8859-1?Q?fZA4W54EgDmPtU0LhzEFC0pXBYOj4qW/3cgGW8jGU1HqrbkVmjSi3cN8sh?=
 =?iso-8859-1?Q?wgFnOgEbkqPjMP3DfYKk/Kr1l7l1B2LrD0nG99DBjQBBQtUhpaWHchr/18?=
 =?iso-8859-1?Q?Ps7QTy71dgkm1XPIvNob8TvyKgNBh+ZLGIBNQ+V5Sr4IzZzGuED+A0Dy2P?=
 =?iso-8859-1?Q?OQ+94mv7OljH3+e7feFcN2Ns4YrDXBKYsUU++SNztdfIZrNGW9hQAyNLK6?=
 =?iso-8859-1?Q?SNdo/1IgmXj90GPJ+syEHluJXw51FGiChMaNKIDMMaikki9rPqywlW5hNE?=
 =?iso-8859-1?Q?QndNEw5E9JlBj+TbCXAlRF+4UD4d35moHvPNP1ZtrUqyqh82NUoajJkBGg?=
 =?iso-8859-1?Q?iMAzRbBUvgcdu3rGKjdbIaD4E89S1EZK3sTbo0M8MYPy5Z+wzqUD2rn9jG?=
 =?iso-8859-1?Q?RbV5lA1y0oYBDkJEeQ8n7TC5ZryppBh/CwXVbG+rNmZ4bmWC6ncrYOAOks?=
 =?iso-8859-1?Q?YWY9wQUE7the5uvVZuju2tHUTyS3G+FHj7ZL9hS0ZyEmR+y8ZUWuZNAc1+?=
 =?iso-8859-1?Q?cDmsdj/pgYsGRcZhd0JfPORR85MiIy3ifFIrcl9F8EtwQ5+yTX6XzG9dRA?=
 =?iso-8859-1?Q?4dX1Q5ww8x9cJ/v/eAM/aAUmopHdJ7ErKBFqrU2lbAm8hCbeLSDgkv/uuW?=
 =?iso-8859-1?Q?B83l4+v/AU9zVZ/ojP6pZzdM8y2mVGEjTXYTiMyUjfHiPEr9Dp1FfdJVH6?=
 =?iso-8859-1?Q?gPtoOMZZxsnkgqpDQ/7lLTdqbon9S05jIePZ7kNTQbpCBY6+efm700tJJX?=
 =?iso-8859-1?Q?vQpn08gBG8mnEU97N/3TVW6O3C32sHdcAfvuaSqg+VaRdw9AZWwhLzlCJ0?=
 =?iso-8859-1?Q?vX5XhVUwQ+Eo5rE5RsC8E2EX9TTDU6vFsdlaO/n9UNejHwe759PMAuEJ6+?=
 =?iso-8859-1?Q?X2UVR92qOSUv+nbFLzri0ACy1jArbKJk+AXVJeucM3degMZChzD1QPzYES?=
 =?iso-8859-1?Q?kajFzYFDcN8lrc2SmoPEwgzQ88PuWA2yoN4LVEav8gonEmwDL68B5dYieD?=
 =?iso-8859-1?Q?2MRw3E9bmOLkTZrUkFHxNJpfZWq+Lr5u53WrjSfjzrK9Lub6HfYc6+EVrf?=
 =?iso-8859-1?Q?ypdV4HPK+1MpnLKF25fRsnXPGBr6x4LhnZxBPRhjosar+MYh3oO5c0WkRe?=
 =?iso-8859-1?Q?5kblKy435CMXRPR7RF2/n3I7WzljisGiElvkHZe9pG3nJ+ueC3bgM2vsF6?=
 =?iso-8859-1?Q?CvZNKfZmYFxm1427SqQM5RZM8D4q7+XJ027uV2boazYV8PiQQHKLN9Cb9y?=
 =?iso-8859-1?Q?cI0DfwClZSNSC9J6WlpmJ3dvwlZHijqviIb4rMiN+NKIJYoI61eqjVW2QS?=
 =?iso-8859-1?Q?kUxPomKkOw?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a7ac13-eb61-46fe-999f-08de0fffd135
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 17:40:53.4086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1788

=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
From:=A0Dan Carpenter <dan.carpenter@linaro.org>=0A=
Sent:=A0Monday, October 20, 2025 8:13 PM=0A=
=0A=
=0A=
>Hi Jonathan,=0A=
>=0A=
>kernel test robot noticed the following build warnings:=0A=
>=0A=
>patch subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver=0A=
>=0A=
>drivers/leds/rgb/leds-group-virtualcolor.c:303 parse_monochromatic_leds() =
warn: 'mono_count' unsigned <=3D 0=0A=
>=0A=
>drivers/leds/rgb/leds-group-virtualcolor.c:303 parse_monochromatic_leds() =
warn: error code type promoted to positive: >'mono_count'=0A=
>=0A=
>bc8d39d8adf81b2 Jonathan Brophy 2025-10-19=A0 299=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 u32 mono_count;=0A=
>=0A=
>=0A=
>This needs to be an int.=0A=
=0A=
Thank you My compiler did not pick this up.=

