Return-Path: <linux-leds+bounces-8922-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G6b5EPWXR2oobwAAu9opvQ
	(envelope-from <linux-leds+bounces-8922-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:07:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9017019DA
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:07:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="EZ5/FYJA";
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8922-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8922-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2E0B3003D35
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 11:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA393B440F;
	Fri,  3 Jul 2026 11:01:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010020.outbound.protection.outlook.com [52.103.32.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7086222D792
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 11:01:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076484; cv=fail; b=r5p3Vy2STJrHDwMViPm1cm9OY+qD4KT9auXnXtW/ORoA7sL6AxYmf4iYsmY23UcZeXYh+08sSL+DD7Eivkm50POrY0GL4Bq0WLqjleqjckWKfPWFEVXwlJXflJ8qnnalq1Vuhestn0GzLWlSeVcTzlv9bB+Gxza8pQiJfO2MeA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076484; c=relaxed/simple;
	bh=1yTTT58Ml5wxvCu8+4WdNFRi/MstgxoNezZ31GlZlZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=u71r9IFfh6bBFBtK3VD0yAeB6PdgiGNpLuPjUraxRvnbGmN4nuUorIfJLHnLjJm4kJhCOgEh1SO15R04M7poBem3MTJhqpTdepB+LovrxuHPgV30AZCqgJJLWzFYHaZRANfUTAg7VRXmfYsJ2JdyBOmGbvdoSunxbMxFpXPnFAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=EZ5/FYJA; arc=fail smtp.client-ip=52.103.32.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8YQyur2ae093tG539HW2g0C5bpKeaGUz9AXCivPemlg2CAEyKI0EJW0YvoGWzndyQBGeIORkbEquOiWEj9yursooJWPAc2CaHCl+tmdrJBWFrja4qClWr3a98l2C+kSlIYloqT/hUkBoawD4uA+UnAyz0n+fDVmMxE4Zpuqdntgh96U6iPK2d+dHgKtapgYdxvbaAA991hpLpTjoOVwij+3kpKTREfocHCmXsGBAUN7YW7/Om6M/KUjM8HjIu1p8ACtzromg0tMzKxEZHAIri8/RLPriA7exNprbO8EexNOJQpMEy1S8ArpFuJ+0BXnx6BKdNadV/u0SKA15sUoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yTTT58Ml5wxvCu8+4WdNFRi/MstgxoNezZ31GlZlZU=;
 b=xeO+2kDzbHpQEXWwBSFQQdzb6tb+GnkndeaE/K9qIe+VWaEniEFz9/pKkO6Bh96Nb25zAIAGlgvWQ3g0iK5yGJC5/rLwYpIg+DDGzGp78XY36Y2gd9YZgtT+9doTYqitCSF4LZbGJ0BCVmkzREC5SGMLp4OcWRErDMIgF65Vrg212IFrtE9+QT5gdg0z/oVr+sFGDo+piuMuGsdsgX0PUpMfjXPsJqMvoZkelvEnpEUgjwxvWxu+4HK3fOr1Tz70SfMwFN+Zw0h8hSQoCL2mohyNOddk4a6n83Ld0Cb8oXAo16KzT1iGu/M4cFZE5Jpo2CA9lYOz7EzHswr7tGexLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yTTT58Ml5wxvCu8+4WdNFRi/MstgxoNezZ31GlZlZU=;
 b=EZ5/FYJAc3jLzCLfWUSgluImY54P8tLShClFFYPVY9XcPlO12JrjcJq76sLtmgfke5VQmimHtXoWvGrs3O6iN2Qjwk2RCamYtPS/oh/fr0whwpExlCH69BV80BV7lI/ENQTCg1Ei2HoLJVQdbrlPDy0w2wKjvgQ0eWHpKeBHq7mG25qBU43pJtM1RJZnEvI9sOFwEfEHmQMgoBtw8jnyTPuitFreDGkuNEiK3mBvxnoEHJxnQ5x+M4laUIw1Lui6C9c1VJ451FSgLfmsXwu40AGDhFHa6FZcVTAyzEabdtsQbesQFGGmtZhTeBizQjy7LXZ1w4lPs0i7SA5+l3zZwQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VE1PR08MB5630.eurprd08.prod.outlook.com (2603:10a6:800:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 11:01:17 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 11:01:17 +0000
Date: Fri, 3 Jul 2026 12:01:10 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v7 8/9] leds: st1202: validate LED reg property against
 channel count
In-Reply-To: <20260702224923.A83671F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB8497166A2C8177358D2A3503C5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB849718B43321DB7E5A05D17BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702224923.A83671F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0472.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::9) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <4272eda3-f26f-d7a8-72ec-4d8ccf84862b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VE1PR08MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: ff53ad92-1f0d-4b72-4535-08ded8f26823
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|6090799003|24021099003|19110799012|8060799015|37011999003|15080799012|2604032031799003|25010399006|23021999003|5072599009|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nUF/lE1hTye1yYonysc5oc8o8C8u/10ohmSKJJtbirc5S7iPSOrHyGbKN6Vm?=
 =?us-ascii?Q?MDrWGnvfqiSywZtzquNlB4PRd177Gapq1jgwGD7LE2JtuqLI0tF2sRTVwOvg?=
 =?us-ascii?Q?AlSeRnsmT78BjE1jeJjMnOiUlM/5Or206VoqClUv7+EoRpVVWg9YE+p7nCM0?=
 =?us-ascii?Q?FF7hiL+HQkSTm6xO2seM8hK2nw26Ge3P1CVm7anjLP4uQ+ShW8FLtgx7ZqwX?=
 =?us-ascii?Q?Tu/8UIr7F5nAAFF14bc3TdocgCoIU6VInDtAvvORUvkbFIz003CjfMHfk/c8?=
 =?us-ascii?Q?Inj54Sq4Mad0S5FUOsFBb0OUK1nn7TkYIr8RNmASido7Dvu22z1U3Fqa6ffp?=
 =?us-ascii?Q?VSdsEmZIf+pMmN0B0Ccrh9f8kZRqD9kjZbmzCZZgtvCoHZoSpAzZQll6QK4C?=
 =?us-ascii?Q?h9rYDTX318XB/ukq9+LgxIjtZhnIno1bx2cDjjqyvTR6eHKrxXOJQAXKpLYt?=
 =?us-ascii?Q?x2bfICHYfn68ffjMVfVtLvZC0QXiWK2BkMisSn3QrTs24elGyPZnUHTcLLlb?=
 =?us-ascii?Q?0qCsRckYNkUEiBrqiIH+H0Q78JJIUbTOhKCTlnuJllDhF5R4AT1r4YZcgtdc?=
 =?us-ascii?Q?Bo2JGIR+XNdRFZO/ZnMeR8YixMmei5JQQrl9zeAbQu1u7g+4EhtsTszuRsHS?=
 =?us-ascii?Q?AV4kSgiihUou7BVo8DGdlGEMWQo8ha0YiXLiUsA3e3sEk7ihmIActKq9SzuS?=
 =?us-ascii?Q?SSCWATiIUQ+J0ib8g2hfieUOkQWWpeaJBR11tapTEum+DI8YA/imod8VSpYh?=
 =?us-ascii?Q?DwYOxeNtbiTBqY3qRxnSVcBcaLEoe3uVD0T8XBC6wRY5TcawEgDW2z0qNAr6?=
 =?us-ascii?Q?LShTWnMIZZBMz4A8oOCJfTrrb570xfFNi+Mem9XbHSzcsEv51R/ITdeakbvn?=
 =?us-ascii?Q?MwZSGtGhlwbAGHjTirICBZnqVxjjoi7D3hwRqAhH+E/I5ncply1dqVh/c5Uq?=
 =?us-ascii?Q?SGjEqYPf7IaE37R5h6uOr67YdY2US817UOsVE0XIKuy3p+T59OmeHI3HdtKH?=
 =?us-ascii?Q?4FnERs1ab16F0KrH0E9NksRxwyVqfNXNQ0FHvgUxuMSZk6U=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/u6rxIe9tOgHGtCG6I0coF3M7TCXBOpJrCGLVfOEKT++/03UAQRySG7h80xg?=
 =?us-ascii?Q?Ywa8uef0hMeWTKQVc39mIFicazbFO+LgirmGH7ReNv61Orh7sByp3ovsZjW1?=
 =?us-ascii?Q?Og5/8qJrUq1iQJmyufIGNoM1StoZ1u6pomUkGDruZljyzxpNGtpHN8wafqYI?=
 =?us-ascii?Q?NTwxyOzTVxKp8XNoazESymCKFgtJHDfgRTjc+b0WfEoCTS4++dSrmF/hY19/?=
 =?us-ascii?Q?CLgRENolQl/lSp9usqy3Cuz5lMVoYBaQT9jGbKRd9x1Tx0lbPgWX7w5fn3lV?=
 =?us-ascii?Q?ebjRO4h1VXZ5NkWja0/28Zs+CyZz2tECE/OHDOc6ugJAE8KfFMRVGiUcTrBF?=
 =?us-ascii?Q?Mkm9+EhkllzjEKNSlpTFv2T/NzsdvaH85rPZL3eoslXta2bcGzt8g3nFSWYs?=
 =?us-ascii?Q?YQBHSS+AH4hUc6RFLndk2ZwD5wSyk3hRzfH+OiyjxeKQJ0aOfJi+8Zrm7ij4?=
 =?us-ascii?Q?OPFnCfCRhb+CjXfyhrNEgsNZtu2NB4nVjvDkUaF7Wo40rpk8fgf25BnB8LHv?=
 =?us-ascii?Q?HFwi+sOQZlcobyjcdqWWtfBzOnpTfDdw2L46tziHbKrDcpDMF//dRtNKN7za?=
 =?us-ascii?Q?xrFKgpE5PTOY3QheyxhXGftndvdZLoIlcqtiHFo2h2m1uUF2yf+ZULrF6cBc?=
 =?us-ascii?Q?O522J4mxm6/8XFr3yUSneVzg5mycyUqh7VGJhFvppQ7voto6uUJU4q62qrEp?=
 =?us-ascii?Q?WXryv+jld2E9LeF9/vog7PIcsBKjF0NndhpmAjyWlCuVzcurUm+0MW9awlUF?=
 =?us-ascii?Q?N8V1EjRrMFvYe+YuUhQSKEwMZ8Y3ItvswIhDHen5WazooP/vjxOrwIlawPxW?=
 =?us-ascii?Q?RF6bpV9CmJ1Xp0ukOb0CXZQpUF2EIc68jq0QtrbKHIR71V76XrSeIkJPyLN5?=
 =?us-ascii?Q?f+s+SUWZviwNSKD/OBVd0mTKsgxpfahElPW1FDx9aXjHzblP/+qWSkC1QcdQ?=
 =?us-ascii?Q?Cump3PGcUXT1AFdgPJJ3ddUniucyjtBklNBZm3zNn7qYKZxHKNPPRI8OB+Kw?=
 =?us-ascii?Q?5jVHnBxcs/H5yO1OEM4u0EiD7OaEdt3oKBKG6Wejjf29B/pTUzS8rj+jVTuO?=
 =?us-ascii?Q?mJRx5NnEpmj5/r72b1iGXUShgqGU2PyLoDKsS71c414S5Iz9VTbPqVFd4Z0J?=
 =?us-ascii?Q?67EO+P02xzVvjsLztuM+kj1gXtQbRkT+mcIqygqhr1t6fZGJpPIe7EriXjlK?=
 =?us-ascii?Q?T2ta+II+gAlE21YBGpsDyPv6N9A45zisMxuCgMnKP7O9sxSm01f2BnWQRiXw?=
 =?us-ascii?Q?r5ukD4ajKEmqgVmVro60c1Zu+Bie4xcx8ejwBdEHXQS3bCUyWpGz4Iajpteb?=
 =?us-ascii?Q?qgiPbREGQXdo43Zoqb/uN4Ml4pSDgvZ6zbK4l3VGqko8rWRHaGmp6yYPnVuC?=
 =?us-ascii?Q?NrbQ2mp4ZAFOGwSWSP7YYHgcvx8usy7QB/6cmKgyoBsXspm1/oiU7dtlw+aB?=
 =?us-ascii?Q?fv1rxqayFJw6S2ho9ie68pqKA/gOhzZz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff53ad92-1f0d-4b72-4535-08ded8f26823
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:01:17.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5630
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8922-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:from_mime,outlook.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC9017019DA

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] The driver assigns a sleepable function to the LED subsystem's non-blocking `brightness_set` callback, leading to "scheduling while atomic" kernel panics.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

