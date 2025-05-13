Return-Path: <linux-leds+bounces-4623-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F42AB557F
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 15:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06E071B4651F
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 13:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E94028DB4C;
	Tue, 13 May 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="O6t7wa+q"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A97347C7;
	Tue, 13 May 2025 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141469; cv=fail; b=D8yIiCadQnfvyE387W0SLZGyFWC1w/ikLmsNeqeyDEQBksMK8mI41M1qKW2A3g0sdKDpAu+qGPVL321bboIVZvbjDf1Ti2YQZZ0mhniSp39tYufuLzWUexX6wV9F7ss8+i1zcUlKnfPWyRSkcotvX6XT6NB4cqIVWtqZK1NJlMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141469; c=relaxed/simple;
	bh=OWbc3zfHEUYBmvhcUpqn9u67lwodMSLq0nIk74iQkaQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iQEgIm6wxWIcnwhpd8afKIJwCb8FtOQAmdZm73K988Tc/6HDGBZfl3NkUrik+rS39Mk7UHt/FKeQE62x9aW8zWMt39aaegNdlSTxMf5+8tzN7DL8lvuxV2CUblRSH4JU7/7hF6Il5KyZx/CtV9/hAn9VlFJ1PJZ6qJCbT8xC1Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=O6t7wa+q; arc=fail smtp.client-ip=40.107.104.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/YcC7MM0ZM+9rAAyvMNbrTKvasIbUhsCondb2ctRP2zfx88Kwa1XhR/vAPQgo8CEVEkjQ2CrLz7Mbc0v5m33OdO/Bue5PdhnQrV5szHHzTftfT00viyu8EMn/fdGqFlaahoxf9OxrxiT8/HK2rrno5er+hBSUZtjgT4HV7WELsfDHCd9PkW/+4LkZ+lWXt67IgREbbzIYIvuvoIlhEVv9ILHYq0h7/qPjYoPgUo6BQL4W7UfIyWPnp+vrtsPgsTCh6bwuadwd1oMggNHbyOtP1WOnRD/C2EWzAo8NZmiIUnh1A6n7ET76wDWrfrt8P62oW88h3q/V1Ld4JLhrKFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e84IKePQ/DuMJR0yN67COIuTygMKkIl6vmeExA83CPk=;
 b=Ph6fflcKjN8FhQfPk4V0cmubryo530oBfYvzhe7e079zZeqOvolfRdUvBq9F+Ai0q+NwM9cZx+GQ+JqjV9ExjUzpbSuy7KdJJYVsvYP4r5I2ltKx5FXEMh2N7NVeMqEjUjspCqAgir+0Sb0Z06rm5VbrN2DY0Dsyrof8UQC7IqybHdCtiApvmt6R3wt2yKPGLo7AL9koAKZi2w84ZPFl37WZT9uMAr4lf8LIjx0HqgfGqCS5+HB1qHc+HPV2gGXR4cmX+4yhjBeU84JGy6YuzBaVSoIfAETw3R9ZLRZNXBnkcseDZJgQtJjgRMb6L+uH6RiZcqIlKU85r+qZWWeL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e84IKePQ/DuMJR0yN67COIuTygMKkIl6vmeExA83CPk=;
 b=O6t7wa+qm9FmrP5NyBUoNrGKM4LEMbA7lcIyi2KVbvNVwQ0HowbZBFpXzbkP8UiFGcwTgzAaw3eH0C7GwfCzQzcNN9GOmzAsp4Beywf8M/qCEA189UcjmtRFb7lwHyVRO0nRXYsrMSwR91ll93zrPuVTDpib9CoBQ/p1WF9rdww=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by DB8PR02MB5836.eurprd02.prod.outlook.com (2603:10a6:10:114::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.14; Tue, 13 May
 2025 13:04:24 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:04:24 +0000
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
Thread-Index: AQHbvnMzuEeJRwGRtkiTeZxACDeeErPMBIqAgAKi8eOAAK3JAIABOlYj
Date: Tue, 13 May 2025 13:04:24 +0000
Message-ID:
 <PAWPR02MB9281789F85D773CEC278688F9B96A@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
 <PAWPR02MB92814A311B18A6FD8A448D249B97A@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <0bf10848-0fa2-438a-92dc-6d3b29760b64@gmail.com>
In-Reply-To: <0bf10848-0fa2-438a-92dc-6d3b29760b64@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|DB8PR02MB5836:EE_
x-ms-office365-filtering-correlation-id: aaf24bbc-fbbf-4863-c2a2-08dd921eaf38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0KHgSxMXmKtqshJ2xmhslJEWlmCgn32hinGLpNo5JT9dMv2rVHcWdhATzs?=
 =?iso-8859-1?Q?PUSbYe3Eo2T9wetqrORd3X+r3zDlKuJcF5cQCOuNQFiPJubpKyyTY7dWdE?=
 =?iso-8859-1?Q?NXZVRj4V57u9si5yRzKrfs5VFPHIwWhxGw36CTQgHGJ8PZ8ULmkmonhPjl?=
 =?iso-8859-1?Q?3D2STvlagcdxqPtmCw4wpJ0Pagswj+qAxTuYGzIgGqTUY13G8ZL3f3SWpY?=
 =?iso-8859-1?Q?0/G5q8X4k0yZm4Whf0BCpxX+ETbK4tgvk1s4IalKhMBD0vTmtOcKnaPXjb?=
 =?iso-8859-1?Q?OtcwxSIttJMoYiJjERSYggaxOlO2XryyHQivJR+rdwLGXRs2aPhsB8n7L1?=
 =?iso-8859-1?Q?Xg9wpLIT6cpNXR18o7HBZJOJ1SyOv1XBNzzU+NfZJ8lDBCobG2JhhJ7cw5?=
 =?iso-8859-1?Q?JiwwKR1DAB1czO2fGX9H7GyeSrqO+73w3jUOv7DmhPL3iOxB1iUbVXwo+4?=
 =?iso-8859-1?Q?T6NBmE3YWZ+ZEP9rAniOVrMbu+ba1qI87afSwKUANOdbK6kHX8pPvdW4mc?=
 =?iso-8859-1?Q?JCDo0LjK5zU72MLKM1w7g1VZD08uQwLggCAjoerblzFKokk1yfVit3q9H6?=
 =?iso-8859-1?Q?om+TF1RAZYAjqqG6kMLCe5T3d0tgUGvqUtyRwTXD/uS2M7vnbnfJJsJtbH?=
 =?iso-8859-1?Q?MX3TcP8WnHvuHDIDovCg3ifAMmT6xARrSoK4MZXLil2tBeL32jVQm3QIvp?=
 =?iso-8859-1?Q?uJzQOhKExxPY+EqMkGuImo9Kl1t3XCJsnqMhyNc5Aam4IqUX2djNeMyKrE?=
 =?iso-8859-1?Q?gcGaDz8g2oPzvmsPQgLCrL1ioQxV38E6yWE4+DqMlQjqtkjm2uyg84w9dO?=
 =?iso-8859-1?Q?6j3KQ9UEGuauEFYsjOD3pyVq2EJz485ukltvc5N2CYpEYUzG3WFav1dwiD?=
 =?iso-8859-1?Q?49KE4Np4dl+ui8bwQJ2xrLm9xUQ7SlFDnQSgdJIifb3+M0K6kWcPpvz1TH?=
 =?iso-8859-1?Q?fYxn9LG0364ij0G2hg/z9NhckFxGHXy+PZbOBoXOeWwXi2K1C5JLJsTN4g?=
 =?iso-8859-1?Q?z1EEJZOPLDZx1/LTxEBdT9+U9a7lL4pTCWQFx4aesdoFxft7GoElvoaGTQ?=
 =?iso-8859-1?Q?Q9h/qm7VSKH/boTLgltfahnzoBL80Mzex96yb5xeeKT4VNmHndJN03jVJG?=
 =?iso-8859-1?Q?KrmXvgg4SnsOn+UcRQEjlWooxNjY3JW6aODI2LFO1y6jkH/SoO5q9rLEmg?=
 =?iso-8859-1?Q?8yXFzT8hQivTkbbS4CRZ/zFN+aYfL6yQlE1UnV4FSuwYoi9/uD918MYpZ/?=
 =?iso-8859-1?Q?uOL4T7MqzQqMlA6jJKFlmBrw98f+yAsaEScrQq+NzDi5goy5IbH87/2tFy?=
 =?iso-8859-1?Q?FSrtK+7Dxamm2EFymSY35yZcekEb6NYZfH+HBpSX0JOYff+R1yMIFcfNGn?=
 =?iso-8859-1?Q?zF8B+6n+VM2nQzefw1fRIapYcKy0UsZiw0wOl9wzSbXYKVNLWxfg0rlCIS?=
 =?iso-8859-1?Q?DyT7fv9p2nnG9tYHAPbpYobHGWXH6aZ6eGuvI14V+ZYfj7QuenGDY8vDSv?=
 =?iso-8859-1?Q?1MUFG2FiDUspWxC4rWvtm1n6G+zaQZDYlfc6vEIFA7SQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR02MB9281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dfgeGxSjwhzDbS8i4oUT2gH+sPlgXhoP94D2CPi/fYja1iRvYxGceXkkpd?=
 =?iso-8859-1?Q?wBcCVtcAVr3zv+YMYVHDRze6aUecVmHrowBue/IaRV1QKmI65ObxG30woa?=
 =?iso-8859-1?Q?2MD/+FJK1SRz7S3ad3FsitydAPsfrWKwcK5UvfT61GSssQapqI2m7YQ3Mb?=
 =?iso-8859-1?Q?0I4IcBb+yLe5inC+lrn/TMra5QNF8/ILIjSKonFDBVTuWxIfS08wXcECq9?=
 =?iso-8859-1?Q?oI3YU0Puxi+Hd5UW3ICo/OT+nG/Z0ryxQhVgFmX9Uks10cieQKaZ2BJd/8?=
 =?iso-8859-1?Q?ZlO/fHat2JhMJ6P3drXCtAM4LHKO/Q6FWzmvn8EeJmnztNm+wvuzlOKls4?=
 =?iso-8859-1?Q?iiAyqjl6deUpV9rtieuxqQUJIxoarLpHzUUv9YORPNKI+x5kqxmpEy5fRG?=
 =?iso-8859-1?Q?mzxcodW8Nm24RRnABusn0D/X/nDh19BT2hKEN+jqOn6413ylYx8MjDEjKn?=
 =?iso-8859-1?Q?9I+MW/lc3pBQVZlovR+SyLv7AEa5BZp6XVToEwK2VuNs5KkymBsa4sl9/R?=
 =?iso-8859-1?Q?HBpTTXB6j9Rplgb4oRnZiz9hwBxL1aktjelGo9y1eSTStOwiJ6+6LzEs1p?=
 =?iso-8859-1?Q?xogpxDDR5mAMywVtLroCPEKp7cgoEDUJxy8ao7ZKrUJtoP5gIG50REW+iu?=
 =?iso-8859-1?Q?lNScgv+VNGLx4XG59hMGYCrW8gRspn0V/lZ2Y04VHhKKIRpGtsI67rBe2Q?=
 =?iso-8859-1?Q?iuHp9Zbvd/FQtzcwlIk4401/IWBcrZtvrwOqFlvwXldK2Nr6uwfNLP2gvJ?=
 =?iso-8859-1?Q?4HBuPvcu/j1VOZ1WUq1FuGRI+fcHkj/KlMyaPGpWUaCAJjvl3HuJiE46/e?=
 =?iso-8859-1?Q?LT5IfCmhYzPYmRy8pt8FjR1RRK4m2L6xWIYFpmvHWDN1EWRH6ZmWvNagaH?=
 =?iso-8859-1?Q?LKAC2UqVRAjPwI1ocVZ90F8IBNVfFSGASRUJxKaJ2ZhooCww8boKGXrT1H?=
 =?iso-8859-1?Q?j2lAb70lF1rBSTp1kugmgdMK6WfI3bxawFDYzSt6Y4k+DPONDUzF0wv5Lh?=
 =?iso-8859-1?Q?YQv5FOBqwyfielw8iabOb5hh8s6bTFYute5xUTe2QYpHPym5Ofzsf9Tv6N?=
 =?iso-8859-1?Q?d6uBsd8UBTQ+Lh+BlZuq9GPG8g4VvWjg1NZ0SU44ql+jFvBs3DK331+ihh?=
 =?iso-8859-1?Q?OXGLbu97JT07K0qeFIa/oqHwJeM4q6M96h6cAQMiMt3gu0SnID4PEt/XGW?=
 =?iso-8859-1?Q?lHkzL/kwVmXE9FiK9jNfwTh1kXm1KRX+rZn9gQHUt+kBlsvfzakLPFcNmH?=
 =?iso-8859-1?Q?LjledV8zenw1qtKJBij+Pqu8ZWOwn3uHXBRyGfgXPQrmgy3mv0v9UZkPlJ?=
 =?iso-8859-1?Q?UAPGWM42g05MQNcXslY26LKdz2pguJ5nAFG7Qe2HQMHaiRBTVBO5fVCOVw?=
 =?iso-8859-1?Q?dU4N0J1WfQqnti4LKcKOgJ8oYp1XwllWN6YLOMJw3Wxu/pojxSJwSIcDpa?=
 =?iso-8859-1?Q?vuqWWZEiyWg1mvkCNQR+bvR1JLncbDr8VLJEZyP4yYzeyhsxnQHlaKTfaL?=
 =?iso-8859-1?Q?4dHwrqQM8UFBCmYl9HmOwC8eZ045JytBJyG8LeJ/JjvRYcbquM2G5Ejrvl?=
 =?iso-8859-1?Q?G7F+zsjEVTFkbWxsyBgJ5S34CkULMLyteo0yw/jKrjaE6YvvcJIa0g0VIi?=
 =?iso-8859-1?Q?QHY7UbUyXmDmA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf24bbc-fbbf-4863-c2a2-08dd921eaf38
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 13:04:24.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 929yj4L6/NycNiu2/eXXhnOueq8MRl1nrj+oSlWbSF12n6OGXLlh2LuuyuFTRFub
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5836

=0A=
Hi Jacek,=0A=
=0A=
>From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
>Sent: Monday, May 12, 2025 20:10=0A=
>To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
>Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
>Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct mult=
i_index=0A=
>=0A=
>On 5/12/25 12:59, Johan Adolfsson wrote:=0A=
>>=0A=
>> From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
>> Sent: Saturday, May 10, 2025 17:32=0A=
>> To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
>> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
>> Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct mu=
lti_index=0A=
>>=0A=
>>> Hi Johan,=0A=
>>>=0A=
>>> On 5/6/25 12:39, Johan Adolfsson wrote:=0A=
>>>> mc_subled used for multi_index needs well defined array indexes,=0A=
>>>> to guarantee the desired result, optionally use reg for that.=0A=
>>>>=0A=
>>>> If devicetree child nodes is processed in random or reverse order=0A=
>>>> you may end up with multi_index "blue green red" instead of the expect=
ed=0A=
>>>> "red green blue".=0A=
>>>> If user space apps uses multi_index to deduce how to control the leds=
=0A=
>>>> they would most likely be broken without this patch if devicetree=0A=
>>>> processing is reversed (which it appears to be).=0A=
>>>=0A=
>>> Are you trying to solve some real problem that occurred to you?=0A=
>>=0A=
>> Yes! Since the subled is indexed by the processing order, it gets revers=
ed if devicetree processing is reversed=0A=
>> (which I understand is a "feature"), so instead of "red green blue" I wo=
uld get "blue green red" in the multi_index file without this patch.=0A=
>> The mapping to the hardware does not match that, so writing "255 0 0" to=
 multi_intensity will give me red and not blue.=0A=
=0A=
>You are expected to write intensities to the multi_intensity file=0A=
>according to the order of colors listed in multi_index file.=0A=
=0A=
That is what I did above, but LED turned red and not blue.=0A=
=0A=
>>> The order of DT nodes parsing is not a problem here - we save=0A=
>>> color index in subled_info to be able to figure out which color=0A=
>>> is on which position. This information can be retrieved in sysfs=0A=
>>> by reading multi_index file.=0A=
>>=0A=
>> Maybe the bug is somewhere else in the leds-lp50xx if that is supposed t=
o work,=0A=
>> but I still think it's a good thing to be able to get the expected order=
 in the multi_index file.=0A=
>=0A=
>Please make sure you read Documentation/leds/leds-class-multicolor.rst.=0A=
>There is no such term as "expected order in the multi_index file".=0A=
>The framework is called multicolor, not rgb. The order of colors does=0A=
>not need to be RGB.=0A=
=0A=
Maybe I'm missing something here - but how do i specify that a certain pin =
on the driver IC is connected to a certain color of the LED.=0A=
The devicetree looks like this:=0A=
It seems the first number in multi_intensity seem to go to pin regardless o=
f what multi_index says.=0A=
=0A=
			multi-led@0 {=0A=
				reg =3D <0x0>;=0A=
				color =3D <LED_COLOR_ID_RGB>;=0A=
				label =3D "led:rgb";=0A=
				function =3D "led";=0A=
				linux,default-trigger =3D "default-on";=0A=
				max-brightness =3D <255>;=0A=
				#address-cells =3D <1>;=0A=
				#size-cells =3D <0>;=0A=
=0A=
				/* Need BLUE GREEN RED here or reg to give red green blue in multi_inde=
x! */=0A=
				led-0@0 {=0A=
					color =3D <LED_COLOR_ID_RED>;=0A=
					reg =3D <0>;=0A=
				};=0A=
=0A=
				led-1@1 {=0A=
					color =3D <LED_COLOR_ID_GREEN>;=0A=
					reg =3D <1>;=0A=
				};=0A=
=0A=
				led-2@2 {=0A=
					color =3D <LED_COLOR_ID_BLUE>;=0A=
					reg =3D <4>;=0A=
				};=0A=
			};=0A=
=0A=
=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
Best regards=0A=
/Johan=0A=

