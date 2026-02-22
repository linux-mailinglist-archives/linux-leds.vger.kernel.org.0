Return-Path: <linux-leds+bounces-6975-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XfppL1ycmml2dwMAu9opvQ
	(envelope-from <linux-leds+bounces-6975-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 22 Feb 2026 07:04:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D1E16E8A4
	for <lists+linux-leds@lfdr.de>; Sun, 22 Feb 2026 07:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C71B300D9D8
	for <lists+linux-leds@lfdr.de>; Sun, 22 Feb 2026 06:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DD317B43F;
	Sun, 22 Feb 2026 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="LnoMsjVd"
X-Original-To: linux-leds@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011024.outbound.protection.outlook.com [52.103.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF135957;
	Sun, 22 Feb 2026 06:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771740249; cv=fail; b=aUG8KsN2ifhoib6VML8pfEEPxGOyIZMeWrso6L8irTr4paoo5mLWdznQZ7xJ+lkRCRJqHugSlKv0avGvBGOuOm1J/rs2Vp0z1xWqpp4/M+e3as7h2HZEOvSPo6oKVXG4a/SBJmDmLJnvy1YPCLRdqhao8Qu2GL7bLN/K+OrTcvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771740249; c=relaxed/simple;
	bh=ON/Sm0eqpXz4OvpL4//bkVTTElnUxfzacjzF5nLPETs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qPYL0tX17fbnqidY5MtcGAWEUOuy/xPke5N18tguKriaUCt5qsuWnsyCdq1DzKZ8J6I4ej12ib8CvNgtg+JuP1jzv8mNEEpRHbUaHLBRLvLWe4lpDDOqPQYQYxf9S4fry03tnaGMljDfmkFT9igQaeKhe934OUHuO7uOGaWgwVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=LnoMsjVd; arc=fail smtp.client-ip=52.103.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMWUw7VExCJQ3+SFfmm6LD1ibkrdMjoMXrePAFJ2zvBAAKY+F7mLs0TSgVIPDTbEWl05xneLTllsoLuPIBIxJ3oggZYQZIch4kUzPlOiZarrOlKgMJ93bKv6UeUN0wk+aRyEgSCW/EySSP8LgSj1t2SscrA2pdkcbWp3dw7R0Ji2LMqo3JU6qWz9WHC8pJSUJheDHX6zByMOa7+gS6QPYSwFX7L+pQtA+h74cmVtwSriAQ2gTF2zKt1p2/GeHr47BSJSUlyvVjEKToVhiTHCedes9jqytEClhy8DS9jREVGzKoogxNvrdXro1V/LXqAX4siyIeqA7m+FsOnmB7NdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0L0hmHkoFKOX5UEiHIvwWGBnQJOEPEAg5dFtCVNVbI=;
 b=Q2mLOgqdx0QxsNGp77ZPimpkm9IDNvl3ExZN55mwuf+MeJN+Neuhx6+aViv8uFP/bEzaNFucYdqqph/lAImBZ7QATZoB3RaYIsHBaMP0vhAi2te7HdeIHUYQivCHIttLcmxU8tg4BgK2RdLpSpStBU2uPMk7KGjerShrE8Po+vpXPGE7o09HzJxGJ2hyQMrLQvaqd/0geKvjpeWuVcbDPoQtuBWgAp3/OZP0bv3iUudWTrfMZl2GqNzJqzaL8exOQ+zPB5Tm+XtsgfUSf0jOcUHbdkRWbe+AqtEYtvi61ulzFCjEWcJqZ4aElfZHdcpy71Gd8uANPiSYEr/nGvzEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0L0hmHkoFKOX5UEiHIvwWGBnQJOEPEAg5dFtCVNVbI=;
 b=LnoMsjVd3ISuvfC4esG8NqBIW1yUWDmu388kHYsrNxLr/X+dVu/NpUFmGyi15drKIK8Q2bah4MPUEiXXm071WNluGD9BW3+48A0GAkfqGd1bKXw73LE7HwHFoqF4O59fW9V3HOI6AqD5fdLUymt/t1Gow9yM7BO04KBriXmTHbT4qGnQmnuzhf9uKXMjBBK+Lyda3/jRxInt6xkJca4RDm4dYe9t+o8G29j2IVzz12XiSodUc/Jh7MftzsdrCbmQ3r/vMDG64I77CRrAfxdkz/cXdSa+eWkhnYO3MVRQ5XTYsNeJZQ+Oknuy5oKt1QP4qtLWXkQ2SeIANYseVjTL5Q==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by TY4PR01MB14718.jpnprd01.prod.outlook.com (2603:1096:405:261::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Sun, 22 Feb
 2026 06:04:04 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50%6]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 06:04:04 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: andrew@lunn.ch
Cc: davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	pavel@kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: Re: [BUG] AB-BA deadlock between net and led-trigger module
Date: Sun, 22 Feb 2026 14:03:23 +0800
Message-ID:
 <OS7PR01MB13602E8AA4E5ADE00E7441B6CBC76A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <a592f471-fe5d-47c0-a5f6-305fbdcf686f@lunn.ch>
References: <a592f471-fe5d-47c0-a5f6-305fbdcf686f@lunn.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID:
 <20260222060323.440-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|TY4PR01MB14718:EE_
X-MS-Office365-Filtering-Correlation-Id: da6cfc8d-3a18-43a4-4796-08de71d82e50
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|5072599009|41001999006|8060799015|51005399006|19110799012|461199028|1602099012|40105399003|3412199025|4302099013|10035399007|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?klpZPfYA398V9y+BtObEG5HYElBNEIHPCkTfS1yzpPPGCw8a8VwmMft4D5DR?=
 =?us-ascii?Q?SdgtKQ2h2rMrAo8ffzkrbS/WPBE+ubjicLpZ2yRw3BPFBNDjKvZ0l5EyIcFL?=
 =?us-ascii?Q?BQPX53Y2jUlNWCedYIebG+dSN+Irbg/JYFI14EiMA2Bg4g4K/BCjj4ZccW7e?=
 =?us-ascii?Q?M7oUtf1rfE1DtiCH2rUQXlZI3TNoK3Ri7Jp9SuQypS4+qcrszflul3XOnDNx?=
 =?us-ascii?Q?aA72yyoJgYM+kByW/aa//UVZdCEMifO/9Vj/AOR46zdKN/STOmHSdjMRtIye?=
 =?us-ascii?Q?tHrZLc5HnwvV5d8wFs1q4CwDuqdI+gNhRLptRXl5SbGgLEcnaaBHEwe2sfxO?=
 =?us-ascii?Q?G+fy7+OM3adUhyf5Zobq/f+fGr7ipLJh6OLxscpgOb9wD1RZZcWO9I7tWMql?=
 =?us-ascii?Q?ZmXhOt/XDxH6/B6/LtogQ1KcWcDDAkZxii8j6DbaBMG2w5nBWWnSAhadrMWP?=
 =?us-ascii?Q?zH2YWc7tpRXEj95USfj9Z8p1V5TNWzPqHFaaRx6vfjwoNhQq2BCJfDRo0FRC?=
 =?us-ascii?Q?uVtlGZWuT2PlixjNvs8rf4oXB/h/1SdLelfjKilw+ki2MWZsrpN/CgfGOZNG?=
 =?us-ascii?Q?19ECsHaQg8kjy+GZ+nkP/Vu2prd8W3akB2ZrdzyYSno3kmKvEkbO/FQ18GmM?=
 =?us-ascii?Q?g7ma/NpYySlvBWhTtiou9+k+Ek5T1U4p3GNDXCR/4LCbiNw09amWvw5hvEeD?=
 =?us-ascii?Q?209l+f0OePhVvaqZWxg3IAASpo1oscuQvq7QGk/hfKKYaXi88nULMt0HlbNW?=
 =?us-ascii?Q?qprrinB7w+3NhJasCeDUPq8oMLetOlj2+1qX/dRuKnNcQD79lcosilVLt7I/?=
 =?us-ascii?Q?6jqVRhbS3BFCUuZ4d4XeGxE1tkmLl6tEX+if9dtcx+q1Hk8FhRBKP1Ws53PC?=
 =?us-ascii?Q?MG46qf3uMwOyb0i/citj6uxikSXc0CaEdVAtKz5Aur+BsCTsb6d0lhOLs1aH?=
 =?us-ascii?Q?REWLcKvVVzANh+MqmzZbLxV/we60sJwhXuCitNNu8EytscmNas+um+0uMxHv?=
 =?us-ascii?Q?5CSkx1EpZIfDfbULooZ0lHfk0Yw1rSS7IpfYBxoLEvDTI4xoi1epmMiBp5hz?=
 =?us-ascii?Q?ovXnqXZTQuABMVvsbVoNPeTf48KCgkF1B8AV8mEs9UyPQNov+MDYaYaUzwlc?=
 =?us-ascii?Q?8NDzw3TuO+cMCc6/f5TKfr6L1cfjuHv5vts6fi37bUUZdD4b7OLfkWVjHyz1?=
 =?us-ascii?Q?CpU8ACFFK0FWXx7MaZkpiLxU4s9BmODqObah9M8xXpjwP9rBKo6ZA6/7engR?=
 =?us-ascii?Q?yPyrL5TfNyj0ytzB5RsJhm4a4x7k0lcE/b/cdlYnbajzQ2Ldo1z9V7yXR4cA?=
 =?us-ascii?Q?/DPpvB1ChBhBNHAga/r0qYaawc5TOZ2d1GtjJwkUFqyWYuz1jstnWvhohjsk?=
 =?us-ascii?Q?jl5hAbst2VXMHuWX9FZP8a3A9mGD?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V6sn4BsWj8sADo3YHVkPxHdDD/XQlV60bZHhyTKwluQK66jdQkQ8+ki66QEx?=
 =?us-ascii?Q?YwMUCGxqEwe4jChOsP+F3nTsfqFbC2MFBXUaOqEjINAkgUKVNv5biYVrGdAK?=
 =?us-ascii?Q?p43hpiqMCtjnjIgiXVf3Rag4YBJpLlFS3PI3om6ZYj7a156SpTJ3yyHp1CBs?=
 =?us-ascii?Q?fftEMTXXJ7U96Fasag6CAWDwij9wZGUjROvu+wuw+7cBizukzZFwoe1MBxdu?=
 =?us-ascii?Q?+8Mn8FOBn+gy2MW71+pzagZbW4/J6thnLYucVQ57jtVybAbNEPtK9/6cmIxR?=
 =?us-ascii?Q?zVehWfnZjSVdbuNDg5R51LcIrCVNb1ISIcYjJOQRzwlNkqwCIfnnJYCfpn/F?=
 =?us-ascii?Q?28rbKqr9diBtx6jGLO5LtguuSfRfbQyikaxWoL+g1TZqaox8Fcaa6X7BUc6/?=
 =?us-ascii?Q?sEC2SXHkn4xAR59hieS2loNePW/ex+KD7N7bi9CcqSc2aPDDJe2erho1hNBI?=
 =?us-ascii?Q?5YPZdgw90VJ08/bxby6asF+8ZbHjcMhAO6GJvI8EzdDZr0y8Hkd2xzBfvRlg?=
 =?us-ascii?Q?lSzE8xDPCHGHJiNX7bwkIuabxV9KNelsrbQS2Upr4m5UIAhUq9VoFGAfjb69?=
 =?us-ascii?Q?mMSbBbkQpDCpmhOHrBUTcJiZeSr3Wo+N06CwwHRojsEJKlrUh6KN+cgw2Gmb?=
 =?us-ascii?Q?JxqSBaANul4KGyz4s5e3NjbJqt7w4p06JsbMmd633tOd0afjVSF78tW+j275?=
 =?us-ascii?Q?xd7XoWJCJ82BUvwlBrBCUG5GvRH3Jb76ZMCPmguzh02mSVZBKJodQ4066jS3?=
 =?us-ascii?Q?2OpOoxOw607VgyIjY++J3nVAgqlnbjfulbZQUS0fU6q6V4ojTfxExD9ZukKC?=
 =?us-ascii?Q?lmm/Cg2ZCBJmVxbRaeROHAva6wFmlC4jYuI2J9gq/sewhLMH6DBkarYFPgrj?=
 =?us-ascii?Q?CnwWUYlVn8wvDu2qVd2LKvnSO5+Eub4micfUC+uPCszuYigvOuAjSNWujKy5?=
 =?us-ascii?Q?YF/1tK3I25Ie2Kl7zOXku7akJ3dP+12mvrayrGZZDsWZBvHrUa0npIlLFH0u?=
 =?us-ascii?Q?W0XQa6YxGZywOz9DcH/VugKQeYgtyVofb3HzwQ4Z/aOwzlipnKVYs/nsNIX4?=
 =?us-ascii?Q?Cr27YrR3hdZdNKsNWZLUAFMsqN7Kju0RX0DyL4IvGtsKUM1u8Y79Rkk8n6U3?=
 =?us-ascii?Q?Ik4qW7aSArilmIYYPb+p/O9/k4gbbmlrPECw5pKP31IQPjNXfs0q1XwNPgjM?=
 =?us-ascii?Q?6FwuGd0ZPZIePN+PSo1d6HQEqSEXqUYseiv4jZyQMFPfTlWUUj4XTrjbiyVJ?=
 =?us-ascii?Q?SlippA930+YFuHc0RMqmAtXY3u3awvlHHwB9Q/0G/3TiCEMYvrPobwo/M3pp?=
 =?us-ascii?Q?St9fxCNcAv1mdb8XLtmlRX97PQaSzDlY/sPZ6gvlCks/bwTmcL7JiQkLetx/?=
 =?us-ascii?Q?0V7WYOdUusk8aVtK8Pnrf91wQHf7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6cfc8d-3a18-43a4-4796-08de71d82e50
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 06:04:04.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14718
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TAGGED_FROM(0.00)[bounces-6975-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,vger.kernel.org,redhat.com,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangshiji66@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim]
X-Rspamd-Queue-Id: 24D1E16E8A4
X-Rspamd-Action: no action

On Sat, 21 Feb 2026 23:48:22 +0000, Andrew Lunn wrote:

> On Sat, Feb 21, 2026 at 06:01:46PM +0800, Shiji Yang wrote:
> > The OpenWrt community reports that sometimes devices fail to start[1]
> > on 5.15 kernel. After further tracking, this is caused by a AB-BA
> > deadlock which can be reproduced in at least 5.15, 6.6, 6.12 and latest
> > 6.18 LTS kenrel.
> 
> Hi Shiji
> 
> Please could you test this patch. It is based on the net tree, but
> with a bit of fuzz will probably apply to older trees.
> 
> Thanks
> 	Andrew
> 
> From bf4d66187585a1893d558cb9357f1ef63437b898 Mon Sep 17 00:00:00 2001
> From: Andrew Lunn <andrew@lunn.ch>
> Date: Sat, 21 Feb 2026 14:51:54 -0600
> Subject: [PATCH net] net: phy: register phy led_triggers during probe to avoid
>  AB-BA deadlock
> 
> There is an AB-BA deadlock when both LEDS_TRIGGER_NETDEV and
> LED_TRIGGER_PHY are enabled:
> 
> [ 1362.049207] [<8054e4b8>] led_trigger_register+0x5c/0x1fc             <-- Trying to get lock "triggers_list_lock" via down_write(&triggers_list_lock);
> [ 1362.054536] [<80662830>] phy_led_triggers_register+0xd0/0x234
> [ 1362.060329] [<8065e200>] phy_attach_direct+0x33c/0x40c
> [ 1362.065489] [<80651fc4>] phylink_fwnode_phy_connect+0x15c/0x23c
> [ 1362.071480] [<8066ee18>] mtk_open+0x7c/0xba0
> [ 1362.075849] [<806d714c>] __dev_open+0x280/0x2b0
> [ 1362.080384] [<806d7668>] __dev_change_flags+0x244/0x24c
> [ 1362.085598] [<806d7698>] dev_change_flags+0x28/0x78
> [ 1362.090528] [<807150e4>] dev_ioctl+0x4c0/0x654                       <-- Hold lock "rtnl_mutex" by calling rtnl_lock();
> [ 1362.094985] [<80694360>] sock_ioctl+0x2f4/0x4e0
> [ 1362.099567] [<802e9c4c>] sys_ioctl+0x32c/0xd8c
> [ 1362.104022] [<80014504>] syscall_common+0x34/0x58
> 
> Here LED_TRIGGER_PHY is registering LED triggers during phy_attach
> while holding RTNL and then taking triggers_list_lock.
> 
> [ 1362.191101] [<806c2640>] register_netdevice_notifier+0x60/0x168      <-- Trying to get lock "rtnl_mutex" via rtnl_lock();
> [ 1362.197073] [<805504ac>] netdev_trig_activate+0x194/0x1e4
> [ 1362.202490] [<8054e28c>] led_trigger_set+0x1d4/0x360                 <-- Hold lock "triggers_list_lock" by down_read(&triggers_list_lock);
> [ 1362.207511] [<8054eb38>] led_trigger_write+0xd8/0x14c
> [ 1362.212566] [<80381d98>] sysfs_kf_bin_write+0x80/0xbc
> [ 1362.217688] [<8037fcd8>] kernfs_fop_write_iter+0x17c/0x28c
> [ 1362.223174] [<802cbd70>] vfs_write+0x21c/0x3c4
> [ 1362.227712] [<802cc0c4>] ksys_write+0x78/0x12c
> [ 1362.232164] [<80014504>] syscall_common+0x34/0x58
> 
> Here LEDS_TRIGGER_NETDEV is being enabled on an LED. It first takes
> triggers_list_lock and then RTNL. A classical AB-BA deadlock.
> 
> phy_led_triggers_registers() does not require the RTNL, it does not
> make any calls into the network stack which require protection. There
> is also no requirement the PHY has been attached to a MAC, the
> triggers only make use of phydev state. This allows the call to
> phy_led_triggers_registers() to be placed elsewhere. PHY probe() and
> release() don't hold RTNL, so solving the AB-BA deadlock.
> 
> Reported-by: Shiji Yang <yangshiji66@outlook.com>
> Closes: https://lore.kernel.org/all/OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com/
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/phy/phy_device.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 9b8eaac63b90..cbb4af604aa5 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1866,8 +1866,6 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
>  		goto error;
>  
>  	phy_resume(phydev);
> -	if (!phydev->is_on_sfp_module)
> -		phy_led_triggers_register(phydev);
>  
>  	/**
>  	 * If the external phy used by current mac interface is managed by
> @@ -1982,9 +1980,6 @@ void phy_detach(struct phy_device *phydev)
>  	phydev->phy_link_change = NULL;
>  	phydev->phylink = NULL;
>  
> -	if (!phydev->is_on_sfp_module)
> -		phy_led_triggers_unregister(phydev);
> -
>  	if (phydev->mdio.dev.driver)
>  		module_put(phydev->mdio.dev.driver->owner);
>  
> @@ -3778,16 +3773,27 @@ static int phy_probe(struct device *dev)
>  	/* Set the state to READY by default */
>  	phydev->state = PHY_READY;
>  
> +	/* Register the PHY LED triggers */
> +	if (!phydev->is_on_sfp_module)
> +		phy_led_triggers_register(phydev);
> +
>  	/* Get the LEDs from the device tree, and instantiate standard
>  	 * LEDs for them.
>  	 */
> -	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev))
> +	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev)) {
>  		err = of_phy_leds(phydev);
> +		if (err)
> +			goto out;
> +	}
> +
> +	return 0;
>  
>  out:
> +	if (!phydev->is_on_sfp_module)
> +		phy_led_triggers_unregister(phydev);
> +
>  	/* Re-assert the reset signal on error */
> -	if (err)
> -		phy_device_reset(phydev, 1);
> +	phy_device_reset(phydev, 1);
>  
>  	return err;
>  }
> @@ -3801,6 +3807,9 @@ static int phy_remove(struct device *dev)
>  	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev))
>  		phy_leds_unregister(phydev);
>  
> +	if (!phydev->is_on_sfp_module)
> +		phy_led_triggers_unregister(phydev);
> +
>  	phydev->state = PHY_DOWN;
>  
>  	phy_cleanup_ports(phydev);
> -- 
> 2.51.0
>

I backported this patch to the 6.12 kernel and it did actually
fix the deadlock issue for me. And the phy triggers are still
working properly. Thanks for your quick fix. Nice work!

Regards,
Shiji Yang

