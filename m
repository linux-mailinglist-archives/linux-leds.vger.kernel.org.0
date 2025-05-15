Return-Path: <linux-leds+bounces-4645-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98EAB7EF1
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 09:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94FF83AE903
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 07:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244CE234963;
	Thu, 15 May 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="f9qeHLJW"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCFC202C2A;
	Thu, 15 May 2025 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294578; cv=fail; b=qnAqG2/vA9UaLAzXYqPzUq4GGOMz00lafPp6BdK22OuC7tNH0itYyfoWLZfhAbM4s26up7jo/ZlWCaUSRnKzZSq33jfOcXjxJT1SGy3VlBu+c3/PFZv/sKSX5AlP/WQfg3uTqf9XGYQTTXNjkXFAAUoXBr44INSauhD56F/lVRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294578; c=relaxed/simple;
	bh=TDn7Fik/6LGb5lNoCQQ2ChlCU5US4jh09XBxUB8hmws=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jC4ImrM5hZ3dwdmkIxgVJ5xI5SlznaMgVrJKb6lnXgfj+XSLbbgZ/Y5xXeCYEHcaILfA36sQ3mf6nY2hk3TKnY6s9rsxceApPEuUlZJkamClflMaZhnuUwfgUcdnnT8m3TDDdDWEjsc68qAKun1jBd46HSJmDcYuE0KgqmXuqJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=f9qeHLJW; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmiZbTjY5QRUqTSP6sW+R07El3rulExrlQFZC50IH75x1f7B76XLVBYcc4X7KBlSnimrFpLJO44xwkwf1kvl/+e/eH7g6e5DVEbB9qaW891i3WlVIzORwKSVSIX6No8/c4l1WXY3ydDsx3VdISE69lXiI4ZOF0PxNyO/trGYDeKYMfoTPGCKXATQnW94I3qYFShSGmlfCoPJIpjDEtlDwCI2h0WIZm9RLV09RmIEvv91uUJ5/L0tzXP/OrRSMMqmGMaE4jEvpTyjqIDr3PVm+NSbNvLBOqlGHNSHqDJNcKhuHLc/Q8Im3h2zCh94zrQO/hAcC70K3XW0BUlEYxFJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nxw5jtT126AcP0WjWfaBOJkpSA3cOIhamuEig8HTBzg=;
 b=vCvGECHfChw7pFEBlFo32oDy3b0+QxMJht7XF/vg2ovOL5WgDhhQGz6hXaQiBao6pA2IeNrYsB/MJnEJ9gAFTVpe8YDn8aoQkl84maC7DoIgrsISuFGIsCGXV/jZ6CXDpV9icznI/x6pc3CCmiW9urbxbw353ggyqT3Vz4KAm9OdNsMlI7fvMwa4Qw8itJ7qE7Tuovny57a1E+UbrabFCJ4+0t4ChZ/ctgSQpBWKWhwFqRlcvGdzbbk1jSiN3pi0/8pDWs09mgiaX42LsIJfKRlCti0nQcsv5c1/d7gxd3Diz0ZtQWZRWW3/Uh0b7zPjgxej5RmqUXC1W72Zey40Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nxw5jtT126AcP0WjWfaBOJkpSA3cOIhamuEig8HTBzg=;
 b=f9qeHLJWiDeH+h+XRAB8WcA/3ZZaHZP5PX8X0ch2aTJ47qga/jynk4cuOxn7nQqbEJcwLcawXr/VP5RqcDvhITjxFqqOk3QAmxFKN+yBq5lXpiHoFGNSFAAZw+oSIlDooP9RVgN6JPjILAv/X9iO4tlFmaWNycxc2LAkKuvC8OY=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by DU2PR02MB10109.eurprd02.prod.outlook.com (2603:10a6:10:497::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 07:36:08 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 07:36:08 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel
	<Kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Topic: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Index: AQHbvnMzuEeJRwGRtkiTeZxACDeeErPRBBWAgAE4NHmAAFsqgIAAu44f
Date: Thu, 15 May 2025 07:36:08 +0000
Message-ID:
 <PAWPR02MB928130924556174EA494C97D9B90A@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <5d34aec7-5027-4575-b860-afdf7b2c0757@gmail.com>
 <PAWPR02MB92815DC59F65E90956269EEC9B91A@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <449cf572-f637-42c9-b804-aaf74178e96b@gmail.com>
In-Reply-To: <449cf572-f637-42c9-b804-aaf74178e96b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|DU2PR02MB10109:EE_
x-ms-office365-filtering-correlation-id: 7e90342d-68ce-49d4-a888-08dd93832893
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+Dfh4B1ANO0ljrtyCgB8QRNemDHxdK72gQ4eFHbFJrvGLXWKpx8kdHDuDF?=
 =?iso-8859-1?Q?THCZ0a1mjFT6XQoV3ci3ugSevBOiTMv1TjVNutEK5OymikO6gjm+SIcDnX?=
 =?iso-8859-1?Q?YcmUgKJ0T3i5Tubmpua5KC02XqZR4oJ8ydoGGeKZ6sE7j6mUHdekJMl0h+?=
 =?iso-8859-1?Q?gRlM1dex6x+p1l4ENIgztp0NnmrnHoyZcD8OlD2jkORZhkmrfve6qadWmu?=
 =?iso-8859-1?Q?PcP9AtWQBG6AJTisSdPcXIsFr2o865+UIVAZYOv6DIbH5Yzj5wbg9r+hfQ?=
 =?iso-8859-1?Q?dbvEAJ1Cbu59OrAQjOwwtqZMBAXRD5zQnQKfWOJrZeUqHyHvy8rltOjSA8?=
 =?iso-8859-1?Q?EXTgtJMaTEW7PXjRmRyvG7JY0jdFOQrPC0+V3RQbwwHGj6Pr1aFzHjy1LR?=
 =?iso-8859-1?Q?0tbB7Zb8GzZ9ePe59DSmq/Vw0qg40o8ceRWyL86CBn7MRU3Zy9oYFSpkIk?=
 =?iso-8859-1?Q?bdiv+3VtrD80gB9Wdy/obTCXzfqOyMz5ePtQaFfqXyQbfgMQnRi2yoJ/FA?=
 =?iso-8859-1?Q?/m3Aef7dxFuuGw4FC3159MrS2znuQA0GRPz4Imir4N6Vu36zpfrikQI5UY?=
 =?iso-8859-1?Q?ZhpNUUYEYpBUMhTLqyPTRMUehyt7gISzEQl9Iv5RLWFeazWLtNwIeK88Gd?=
 =?iso-8859-1?Q?c5fWWxjZ83RHbJBypocwEk2dHnC5FnAVo/+N9ZUAV6XQHmwH0j/0dPx1ny?=
 =?iso-8859-1?Q?5BL1d5Iy+Y8elWyL7XTnWOXcmwcUItpr0jtQSM+cc6NAixcBsQg8JHweKW?=
 =?iso-8859-1?Q?phYslyEiF23Knn0Y+BH0QPsnRW/7CItQJbJU0ZkNHQldt1wSmVTcqs2TTh?=
 =?iso-8859-1?Q?xRfSkMISnCITlshp5WWQQNFD1WfxhV4Lo0hJ7R9gTwck5AkR+vMPFr6Q0q?=
 =?iso-8859-1?Q?pBOixDvG3D1Vk1pNrREbydqTwk8yda2uehoeDIF4T6r8sR1IuI8YIULn+K?=
 =?iso-8859-1?Q?GWpuYeVkTgw4id/hJH4L7pxRCEpo9opzRhc2qzs2HqpiOcnQgArP3PmKtI?=
 =?iso-8859-1?Q?aG1ySOYTWfjv0BDtGgsbRUyfBvodBKNH4hNUN6fhmAwcSYwk1h/lLpP6oc?=
 =?iso-8859-1?Q?bpAk341NGkO2aUHrloMtRQk3WCzrm9IPcb4skEAVkeytQhHqsSHdeHZAUK?=
 =?iso-8859-1?Q?toKHs0O4Qyza94fyBcGKON7bp6bAA7up8VBkja7gqcWJJH7bk963XQsWyr?=
 =?iso-8859-1?Q?ropmQEYTthU0NrV5FAJDNqyj13EqGYFZgasS3Q6R3rbu4nb38nSDGgybrB?=
 =?iso-8859-1?Q?KHU0iROofd4Uesr9zEEL1/MQT++7um4bLRkBqB2CvKQcr9Eoyxz9Too5dZ?=
 =?iso-8859-1?Q?jvSxoQ8Yt/kuh0ESHixogfkL83ptejO7lUuNSgMolmAB+xnAlevywhzSP6?=
 =?iso-8859-1?Q?kuh1duTwjQd9/mdx8bSmof2OhomLdI8r419IXzLQctqrJkSaHNHGLEXw3p?=
 =?iso-8859-1?Q?LWShnLpN4hjE5g7mRNX+SAOXb9S64UjkZJt7D2P93xkW8DQpIEAhlUw9Ix?=
 =?iso-8859-1?Q?8wpnYR1ys9ycAUJegUMsfQE5CtSH+hYWV5fDrw9CjpXA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR02MB9281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oMs4X6EIfMI/TAaryUtQFHpXkRSH2e5xtn2r7ffENTkCIob294SXztRHrh?=
 =?iso-8859-1?Q?/9tF2pJknQi7XMC7/kVxVn0dRD+G8ZYNBPPbPLz0z7LFyS9qVqfEonpbIJ?=
 =?iso-8859-1?Q?d3LbJKtBO9udyCGID5wyqU5XorwERTuEvxcywx74VfvzZRPOeZxt5QRYeQ?=
 =?iso-8859-1?Q?cGzz3v+aGsDNG8tEySnceI3Zphc7zTD6EdtHMq2J2cIla/3EV+UKVK5FHr?=
 =?iso-8859-1?Q?nZrOm8bp1g3FVm+tQGDlwBHdNK6wuBvWNUC9ZDNOAF9EY1xRAqeA7HQ29o?=
 =?iso-8859-1?Q?uIykayJmoOhPxcZ5ZnFl3nNCI6ppO+B8WHHx6Sh5edQFdSfGlbQyNRdJXs?=
 =?iso-8859-1?Q?JVTusTqRm0GPELna5otYmuODcxBtNBbX3VO8We3luayaCtdLLpUesTPWMf?=
 =?iso-8859-1?Q?u0jPbaARR72lpsRcVtOXxu360da4EkI1X7DrWldcolYTGnLqZmDCXXp8gI?=
 =?iso-8859-1?Q?aXTRpBkYkLtAm7+MAynI5IOWS+4sXLqw9Shi6VrBYSm1JP6jqJ6VQXOOYZ?=
 =?iso-8859-1?Q?sYG+zpTXdgpIpd6ohM/93+OrE1p6hxtq5QyshKdpGHTJtFwvEnNfaYNR7B?=
 =?iso-8859-1?Q?BVSRrPewxen3Uf3qeHT8/P5K1I0lCL+NOzZPmND2sAzpi6/jqE3I7aqvpr?=
 =?iso-8859-1?Q?Cksxpc8YG1PhwdLURL3DRQ9VZXfEIcEPsKQee8WKDyaVvUauDByWzhQ4oy?=
 =?iso-8859-1?Q?8p+Bo29oq91UMZDMoI5gn34Ab29hb1l9E7uwuYqHfN9USryeNIgfZYFMtR?=
 =?iso-8859-1?Q?Tis/18GgAggo/p3NYUdybvU3l/99dVj9zg+4m7TFlrJrpWwJjE4pXLjOd3?=
 =?iso-8859-1?Q?vIgSKF6iSfznkvzpnE5IO9jNO5JBaxTZPFSXa0oWCqsYNMIiSPXZUZF6hy?=
 =?iso-8859-1?Q?xLJzH6hY1kxlF3KAXe4cJvVzJ07fep8RMsYweHXi+6RXckpSSvBx7yUhtR?=
 =?iso-8859-1?Q?sXLiziF3ezX3IpSHWJ7FwvivLe3prmG3DvWrCzn+yuYENFsX6zjbp6aNGp?=
 =?iso-8859-1?Q?CPdOo07qiQQDN34xwp+TonIhsR6Gn+aAFnvoxOChPsiWOs6T+4wgz96Uoi?=
 =?iso-8859-1?Q?SC2f9lL30IPU4P+Gyv7ZAQMWOquce1wKrFaGVg2WwobQnqlYrMSBlft+eN?=
 =?iso-8859-1?Q?KhVf2GbWh3UhoIkA03iAHpX9d3IAY/HfiFI0vYCenoikoL4kEjlC+PeROY?=
 =?iso-8859-1?Q?7JLHmuCQ0Em0fdc5q+xlq+4GEuJ02RLtpkent+ZiVfpulVZEI03M8pxT5l?=
 =?iso-8859-1?Q?t/OY4c/1EXO0aD6VyYeivk4W2fFC45hUY60RK+iyUIPOMJyKS7j4i6/4Cs?=
 =?iso-8859-1?Q?ymnA4DrIvpEaA+dhiwseEBgAeha30EIE5n5KnWTyo/Lz/g4C3NT/j6zcJC?=
 =?iso-8859-1?Q?V3c1vTjZvLjLX2erRvW6IiW1uczJYvgvi0mrfb65I/VTxhTVjCxGqsXjhv?=
 =?iso-8859-1?Q?9QL5FeyBAKXwTEWMBjW0020+1DzCeAKtJeBP7ilns6Ty+oOqI2XdCAPCnU?=
 =?iso-8859-1?Q?qze8I9hV1Rmq0tsQtrkhxbhg0AnT/ol+3OlxS5fEQZ2R8Ogvw5kM72TrR9?=
 =?iso-8859-1?Q?xamoA3ilwp+r85iZzIDNiMG/rTQmpsVKDNKSj5GB4JVWt25m8KgDbU2BQS?=
 =?iso-8859-1?Q?zLh/fPgv3kzh0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e90342d-68ce-49d4-a888-08dd93832893
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 07:36:08.7202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Tb+E6Z0HaPk46/rvkClaMm4cXIrO4ya1YRO0Hm6uSyepqCwqy7cJK2fr9qCBo4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10109

Hi Jacek,=0A=
=0A=
>From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
>Sent: Wednesday, May 14, 2025 21:55=0A=
>To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
>Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
>Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct mult=
i_index=0A=
>=0A=
>Hi Johan,=0A=
>=0A=
>On 5/14/25 16:34, Johan Adolfsson wrote:=0A=
> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
> Sent: Tuesday, May 13, 2025 21:52=0A=
> To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct mul=
ti_index=0A=
> ..=0A=
>>>                        }=0A=
>>> +                     ret =3D fwnode_property_read_u32(led_node, "reg",=
 &multi_index);=0A=
>>> +                     if (ret) {=0A=
>>> +                             multi_index =3D num_colors;=0A=
>>=0A=
>> Why not to fail if 'reg' parsing fails?=0A=
>> It is marked required in DT bindings [0].=0A=
>=0A=
>> I didn't want to start failing if reg is missing since it has never been=
 handled until now, despite what the doc says since 2022...=0A=
>=0A=
>There is one in-tree user [0], and we will need to patch it as well,=0A=
>because it uses reg 0,1,2 for each RGB LED module, instead of iout=0A=
>numbers as it will be after your change.=0A=
=0A=
Not sure i follow you here. What works for me is starting with reg =3D <0> =
for the childs of each bank (multi-led).=0A=
The register (maps to iout I guess) is calculated based on led_number * 3 +=
 i where i is the offset as well as the color_index in subled_info (reg).=
=0A=
So I don't think additional changes to that dts is needed.=0A=
=0A=
>=0A=
>We will need to also state clearly in the bindings that 'reg' property=0A=
>maps to iouts for the non-banked RGB LED modules.=0A=
=0A=
Not sure it actually does, haven't really tested that, or at least not gott=
en it to work as I expected. =0A=
For the non-rgb led in the product I requested those to be on the first pin=
 on each bank (wasting 2 pins per bank),=0A=
since I couldn't figure out how to configure it in another way when prototy=
ping.=0A=
=0A=
Since the 3 outputs per bank share a single brightness setting, it could co=
mplicate things as well.=0A=
(And we didn't need all the pins anyway)=0A=
=0A=
>For banked RGB LED modules it is more tricky, because there is one=0A=
>LED multicolor class device created for them. Probably to be correct=0A=
>we would need make the 'reg' properties in the subnodes also arrays=0A=
>reflecting iouts that will be governed by BANK_A_Color, BANK_B_Color,=0A=
>and BANK_C_Color registers respectively. And DT parser in the driver=0A=
>would need to enforce proper iout definition for the banked modules=0A=
=0A=
>E.g. the multi-led@3 node from the example should look like below:=0A=
>=0A=
>             multi-led@3 {=0A=
>                 #address-cells =3D <1>;=0A=
>                 #size-cells =3D <0>;=0A=
>                 reg =3D <0x3>, <0x4>, <0x5>;=0A=
>                 color =3D <LED_COLOR_ID_RGB>;=0A=
>                 function =3D LED_FUNCTION_STANDBY;=0A=
>=0A=
>                 led@9 {=0A=
>                     reg =3D <0x9>, <0xc>, <0xf>;=0A=
>                     color =3D <LED_COLOR_ID_RED>;=0A=
>                 };=0A=
>=0A=
>                 led@a {=0A=
>                     reg =3D <0xa>, <0xd>, <0x10>;=0A=
>                     color =3D <LED_COLOR_ID_GREEN>;=0A=
>                 };=0A=
>=0A=
>                 led@b {=0A=
>                     reg =3D <0xb>, <0xe>, <0x11>;=0A=
>                     color =3D <LED_COLOR_ID_BLUE>;=0A=
>                 };=0A=
>=0A=
>=0A=
>[0] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts=0A=
=0A=
Not sure about that, I dont' think we handle an array of reg values within =
the led node.=0A=
=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
Best regards=0A=
/Johan=0A=
=0A=
=0A=

