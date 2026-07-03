Return-Path: <linux-leds+bounces-8920-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id euBiNCmZR2qYbwAAu9opvQ
	(envelope-from <linux-leds+bounces-8920-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:12:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3968E701ADF
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:12:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=HrQOYhU6;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8920-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8920-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A8A30221F5
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 10:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B6C3B4EBD;
	Fri,  3 Jul 2026 10:59:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011034.outbound.protection.outlook.com [52.103.33.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CDF38B15E
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 10:59:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076370; cv=fail; b=JGskllBIjLZLdCWC4U10RFocqqEm3010RZaS5rOlO521qE++esTlO8PqCds5l2n+IJb5mWwCZeKGRMmuGzGZHpbGcqQt/QWb7syvcVJeTw4u0qKKgwOO3HTZJ5lKmdYVAQ/Kbh56iVuGGm9yKt6lsDwHQJktRpGVmr69WQdEKyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076370; c=relaxed/simple;
	bh=aOrmacRk/ILy55ennZorLiS6hawXPuJkJT/e/u3pRbk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=EjE8t+HP3hYlHpesu9Wcu2YV8wNNbDDLtgrFmWpUS/dRpqol43HZ42xE48J9AjW62cYpZHAwth0wucgsTJgVqdO2KztnUhRXR5YV6Rg5PyMwV+UhwptG017+hIeQJjQMW2z1K5xYtGHVY7f3M64V1oHuFeNiWAs0mV7zbi86jAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HrQOYhU6; arc=fail smtp.client-ip=52.103.33.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/8mdzD1HEUKMsvw7rma9qfAC3SWYGSo4zNnbw+xiTXYHYvo5+0xrBc3H4Jik+3n7f5h0GWMbjx8DkviIu/Hm/Ba2Gkjnp7UCLZHpPDNQZRG/FqF7Cqc6YU7vJri3vBKYkunHj5Bo7WTi55l7SEsUDxnpqpYC/OjaOUo6e1ZalNbRqFRYqlop6Yy5SNkCvAHZavr4F9bzpF7UCmF0o4gwGh+yTifKDa6j1XqtpngteCN9cLGn0mbE1OkaIo4EQuBAnobQ2bWGcPTPQpRHXHWRrRWeXhqAYtqaU06JvBhxJD53IqqZyWautLA0jk5HLQtC4Te+J/fnF7SD21LkgFUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVJWb0vy4mNAxVATOwznxPGlCIpelRvt5rey32R8RPE=;
 b=UeiF3RO3pvb8EVr+YOL0w2Jm3W13sQ5dzFBdo4Zapl7HeCjsMo9LcGjODluanjEgXMrqlEAxebrVWO/HmsjQM9eGwjEv/Atr/FA15cRCY56rFS1CPKg3x6tG3d6JHHBAd0y/lx6PmWS+Fnc3XIdivLFX6HjKulrKHcft2FS/JDXRfv73XUZEUGemSSnN6Z8qS7AWbJ6q9Ly+6sCRg0FqMMGIH+ZFHrHjOKqlwcPWf9xHNe0ISV/OXDVzDM87/mFKi/eTUvYuRqX5CEUQ5pMat2TRar+JOC94RVsxsTWHgd5DbZTO5321l199srB7vTd6p3WY2tAazlnB8VMZOjiktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVJWb0vy4mNAxVATOwznxPGlCIpelRvt5rey32R8RPE=;
 b=HrQOYhU6NcONxKSOORfChQotCF9p4u3xR2oJR8YqxcouidoLfKUeQWsoTnovF2VBlBSYaBKgDssSQOeOL9zG4frRkqBhssgPuGQ/AtpVzlJFGS6/Ucr3dOTcYxrw99gheFA/xDePXovHssoBT4xCzuiND0tSGtq8AMDZLG0zwhyMOa3JDQo5kg9xOptOOpmSb43LEwZCAtmys53LuWtH4QGTCYi0pT+8brZV32HBwiWdSbsWGR+59t7TpoAsn+3r/+MxIOsSGd1leRRYmFh3nd8RBt3xKkB/sFY1gG68hcrlD//NAibSLIBL8gO3HvFFbccIgac/BsS/w715sn/Hqw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB9838.eurprd08.prod.outlook.com (2603:10a6:20b:615::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:59:26 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:59:26 +0000
Date: Fri, 3 Jul 2026 11:59:19 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v7 6/9] leds: st1202: fix brightness having no effect
 while pattern mode is active
In-Reply-To: <20260702224925.2BEBA1F00A3A@smtp.kernel.org>
Message-ID:
 <GV1PR08MB84974D82123E82672362C0A9C5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB8497570FD162D0D42A9864E3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702224925.2BEBA1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0636.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::14) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <00c867ed-2e96-2121-d0ee-b742968cafd2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 311f3ed4-96b9-4448-a386-08ded8f225df
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR9JgLCvVrUcJMGOMUEsZ1mze+Oj6HPPWG/nni8yfjO1w3qqcgMai0CJ1+1Tpw5wDeToNJZlhxy3KeS5qjfjh61DIw04QRXvsESFDhLx462W2h69pFxmlRCWmxVFcyWcBog6lGVTBdpfUGAbIgkbXuAvKNxRSldpcG/YUOnZcAF7nqWgIWJPiaBD3ppVwkMPiT/mMXFKtz0WfZ6JNWDN2wWllh1ugLzSUbowZgEO4iPEeOuL7RgprbYlomrOHnd1LH9qAqCPwldZUfY+gggX0TpL9S1Jpz/3CrAA1JzukJYv7HWRMoseaG0i6NXLiaHHK57b/oDDHfC8LB6G0sA4wi3SjDfddD9g6MpkdcUDGmvbo9X/SMIPUUkX15upADFBVlbOsZu/gO2UtRR6L2iZtSUXLcCkwmEt7hDAyrV/5wq+fq+2lqzvJ15ECCdgS9jM6jE5bl9orK596+FJ5qOoUeDyn0onk+67c4OX8gRYaxm3o55jKiDxY9WPrBHucEiHfsU0veHQHb+tVieHeQrZeUodqwzFZbuIeSiDEOblOGKKKHcFgLJb2ztZyDBJwrB+hddNTkSsIQuZrN7y8QQCFiGL6Ik6j+FI6hoR+WEfPYhf9m2rmPgJtq7fgHZTBgxj+FUoNTUyDBbkemRTFs+iE4TXN0/nd3REvbTbavj7rvKM0HkqyssjvNWimdoNUremFwNX0Uzi5qkfEhXPnjjD1Ve9UV1dJTpm8n1D7h3eDUVuA=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|23021999003|25010399006|2604032031799003|37011999003|15080799012|8060799015|41001999006|19110799012|6090799003|24021099003|51005399006|12091999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4mxfSU+Ba6ieRZsnkQ+YGJMuPxlkloOcotsBrm+4MbhatRQDVhIPMaU3Yisy?=
 =?us-ascii?Q?4qKTgmFTliqOhgdSFlQp1SURVjIpFJ/Yj7T/YOVNE30ttr38wJQwtfajCUEs?=
 =?us-ascii?Q?e1jxbKj9bhZVML0z9YT1XO8FfhaMgKg6hv43z+0WGr4/1qUzP/DN706WtBPY?=
 =?us-ascii?Q?diuF723egCcr2zUAdigtRFNw3uAmitB6Fbbkc/BahqwZpYWxAgciIt0VSouq?=
 =?us-ascii?Q?ftv/oEUfY5EqVSj65ddF9y2gh3t5K5PUL7n2MIe7pmfd9XD1HpnFmR4KCDJv?=
 =?us-ascii?Q?UfrAJ4+AZzgBBACoaPLxpktrYaPebuz1sGlsQF8hzj8jsqLM8p/Absf+96Lu?=
 =?us-ascii?Q?jKKRISWQu6PAgzDZ6Y+q8aMF8lGrUkGGhhFhajYfjx8pFw8PWNvZVtfGrtAa?=
 =?us-ascii?Q?HUwRo3byWnXK9i2yfzC4t2mpdzvnERBwxchNs80Fa69r35pfU/UvXgt5rLAC?=
 =?us-ascii?Q?lHqNiDoSXlwDjR9bp3oFQUwYT7/gk1VqOYrYvxEeoNEjeytoEL2tJ6d3wXrv?=
 =?us-ascii?Q?zwZjTGEiklTgYO+39pkGG6DH3OzQWa+GbcVdo2IItpktn8yen1mp2CBibXji?=
 =?us-ascii?Q?bF/R6JKESuFRMpwtQHUASyJn0yPh64O9KHUTjhIGCsYUsI98KlMNo8VDutXF?=
 =?us-ascii?Q?k4VVm2NOGWqE9IeXvWV/sWAJtuqAeD0/LxprYICbF/Thc4tD3ewDS5gsY70K?=
 =?us-ascii?Q?7gfDVoGbm96cBXj9OpyBhjgOP8Fj9MDsfUn509q8O+iJduEm8eWu9qnGP3Fj?=
 =?us-ascii?Q?MQ+PwzipKMmgIMSiwzifBk3Wuk2tG/CHN7YYd9JofYvj1XBAwpz+WqoJbgKE?=
 =?us-ascii?Q?+6BYXtfK7ipZcou4adCUS9/jf9kCy2x2PTF8zLCTtUNoVGhbIXk7YewH7uFg?=
 =?us-ascii?Q?U3yAd+OTaJaotviI0gaD0agu5KH1VkyovRIwUIG8YoouFgib1ysuZdvxAuet?=
 =?us-ascii?Q?9pMZbY9b5lLHl1V8cGkjBpuZSa1RFdjS9oQBeM+QtNM6KO2W34hEqkMczoeZ?=
 =?us-ascii?Q?ab6m/gyFCSwdDpCmH28NDcnosEmNjaRoUF2cC0JpDm5brN1PF91l54G1HjKU?=
 =?us-ascii?Q?gmIvdNchjlPCFu1GGKihlpGv+V0YIS2qYVeTgESg9cfa7DAEGQU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4lB98kIdWs8TVhd91m1cJypL9BtYkRC3UZjB/dcbYbypTlechp7xNKMXHg6v?=
 =?us-ascii?Q?zN11baAeoFzbI9hsCGEc6YPb1Yo3VjhZH1ZmEjyzPp7STz2ANYoRKb01smq9?=
 =?us-ascii?Q?Esmt1lZg+O98VdgxTq8GqOD/LsCNqfQ0yfCdzwjr8+bMWNG+z0QQzy9fBJrG?=
 =?us-ascii?Q?1Pty4cls+IrI8v2rt+umgDlnVuVTTRezkmRk6bWpPsnEmjqLuvqViS1MIxWM?=
 =?us-ascii?Q?X6ruCRLq/02d6k/LhWyUmDYy9ys0be9XP2lP4y2eSDEiJtZyzGoRftHY/U+j?=
 =?us-ascii?Q?qbF4SMTN9Ex1zLOzTJ31dQw7annUIEMyCtTutRY4E+VOOsaOD0rH0O4kHBdx?=
 =?us-ascii?Q?Nm6aluwAMGHTgVGEV3xSdnCpn4suJJv8WrhH2hPN/KmUrP/AQ5GOWH5/HoFW?=
 =?us-ascii?Q?AaAi1tQ31Ng0haKFhqNlgqonrIIMPFr6xhFmSU/WSDbtLcgX9WwT+gdsuqXL?=
 =?us-ascii?Q?ANDCVjiq3qQ6ihpRTCJyC354WCrsYD/KvpxXewveG7o1+Xi/f31hFcwilhKC?=
 =?us-ascii?Q?Tg7LnAnITvdXwVxTyPWhESqCFlmd9Vo2jYUDNB5N37mWLTEs9iaqYslD7vpl?=
 =?us-ascii?Q?l8789tMeiKjEzj4Eb1MezsQ1/h+AbsoFp805imWSOIEg5b52B+8X+PUfD1bm?=
 =?us-ascii?Q?m7/UnTE3XYnUhwbFNFlTlk3pYx53esE+6fqAug4t95J1ssvnKj73i4VBvzYL?=
 =?us-ascii?Q?i/ZrXEf90xPzP+qB8W9wJjmDpfmjx02hjBpXSp2Zr0wyH1YukpWOlNIbJ+9M?=
 =?us-ascii?Q?Kl+YQxyrcpqz5pIjetvfewsry3b65vpOlIi8SRZ8t0TtUGAeLlpfKgAPcZ30?=
 =?us-ascii?Q?XvOUS5lIrnO0I32WKP7KsPQL1iPwfYphHX0+iiS+ExTBnLk1qwv4TmxQXMzk?=
 =?us-ascii?Q?7FnM63k8kKBXBYZ/zYikxkP98zelqpqYl3BKlJ3ECQucBI4KoKYcRoFcZyFY?=
 =?us-ascii?Q?MdPNmeuGK9TqJPFs5EDfIrQlPeeMvJcwt5R/09eKTPCq+r9hSrNmKWa2OvES?=
 =?us-ascii?Q?lXMqaj7raGyZ0oVufEH8y4KR4JR/os8J2VrRY1b+xISzxl2Y3dRxabFIXhVj?=
 =?us-ascii?Q?U4qxEaGZD3gkn5dZbN/Pl3HtW0FL9QSp87FAXgNApR0OYWw8o0r3X7D+j+Cb?=
 =?us-ascii?Q?tKtMVulp7HEiQ07/Ov7pGS7kMHPdBIdwdAdFhaJ36GKZnk03DHWEP6l/90HH?=
 =?us-ascii?Q?juVbuPJG+DMEpX8hAuYF7giBErEc9WJBGL+ZCz5KixJ+Jxed0Y4Emum6M6Jo?=
 =?us-ascii?Q?PLsp/lXLXP7UduoH1VwbGJMObtwq5BcAxIiJx+Q1GrWoMC1eDjrnPGkbCFIE?=
 =?us-ascii?Q?yWEHcoGm/1cqp1rXHIA+z1ccj3aAGNJVTLNATVNEOtcmcTDFgInnNZyTyIUw?=
 =?us-ascii?Q?Y6FDNskD4VRaS+rix1YHcjmayTv7+WwnjR6qtgFmJgpZIHD4uZDXZbVHxFFI?=
 =?us-ascii?Q?LQxnqWmvhhEtAOJg6rglr04za4/32qu5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311f3ed4-96b9-4448-a386-08ded8f225df
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:59:26.6230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9838
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8920-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3968E701ADF

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> New issues:
> - [Medium] The return value of `st1202_pwm_pattern_write` is ignored, resulting in missing error handling and I2C error log spam.
> 
> Pre-existing issues:
> - [High] The driver assigns a sleeping function to the LED classdev `.brightness_set` callback, violating the atomic context constraint and exacerbating schedule-while-atomic bugs.
> - [High] Per-channel pattern operations incorrectly overwrite global hardware state, breaking independent channel operation for all other active LEDs.
> - [High] `st1202_led_pattern_set` does not scale the 8-bit brightness values to the 12-bit PWM register scale, resulting in extremely dim patterns.
> - [High] Device node references fetched during `for_each_available_child_of_node_scoped` are not properly acquired, resulting in Use-After-Free when they are accessed later during LED registration.

The comment about the ignored return value of st1202_pwm_pattern_write()
was also raised in the v6 review and addressed in the response to that
review. This is intentional: a transient I2C error on one slot does not
guarantee subsequent writes will also fail. Breaking early would leave
remaining PWM slots unwritten unnecessarily, putting the channel in a
partially updated state. brightness_set() is a void callback and cannot
propagate errors regardless, and st1202_write_reg() already logs each
individual failure via dev_err().

The remaining comments are pre-existing issues outside the scope of
this patch and will be addressed in a follow-up submission.

--
Manuel Fombuena

