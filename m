Return-Path: <linux-leds+bounces-9071-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZG2NINpBVWqomAAAu9opvQ
	(envelope-from <linux-leds+bounces-9071-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 21:51:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBC74EE56
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 21:51:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=cWbgQGux;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9071-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9071-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5E4830205F7
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 19:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331234499A4;
	Mon, 13 Jul 2026 19:51:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011025.outbound.protection.outlook.com [52.103.33.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13832DC32C
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 19:51:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972312; cv=fail; b=OekV5Y5W6Wgrc0mdZM9KAAJmCNJEHDSVvyJqNe39X7YnP3NUHd3cDmzX8VEEluC8xOME3QW3Fi82e10trtzFq/Lhh1tJUb3p+dC9EvuR6fbwE5CCJpUQrlTP6Dt8uDzFrH3G7f05Ktkn9NoCyMkNi/iDDpa5Yx5MxypFfC2WccA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972312; c=relaxed/simple;
	bh=8vVXV757Ihr3uf4lKKq5WCnRJz5NuHDFTg2CxmTmQ5Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=mhmVmIHhtXkmy31EV9+7F/hLW0c/+3reVgFw/NnZiSiam8xJ77Z10ILvkwOr0vX+4jN3/+jdS/xoOxiISY5trx72B3n6dRLKcblhpd0NgZCTLqxQLTpiqMNC2jkGK4bZ/U0/KIl6Ra84feWP0qXPFDNkI4CUSMVX2vvW9/63Yjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cWbgQGux; arc=fail smtp.client-ip=52.103.33.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLFOsrykkmjhhrQmH6Dks8/4vHYkcYihcfL4eJooU9s0j4Qv0QzOd8ixkMB7QeLT8bHESlOio0AgVdcsYQvf/Dxq3KJ67ksl/AANEWvpD2Bmm26Q6o2nF9jmh1rouzBC0/h9c36rcnq5AcZaoeB+9Drq7GQu2SKjzyvHkig4oBuSL3rMbadOXZ2DwT9fj8IWDcv0Q35GvQTYc/QzcLeTIBNxodkXfYAeXmlVVPccamN30fQf+PIaV12FWoG5fFWlVpLmbrjrwiX5rTlIutymWgRVGCgu0RqQ0dGtjN7SCmdfyHXsKL4rXuGSHnoK7N7/cg7C2ZAm/gyF2W2Qol0gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz7zL3bIwsPntLrICKuwxg0AyUymej2pJo+CbLeqgOo=;
 b=P3gg5AHvyAuFaqyIyP0C7iQskCkaEFjLJiqPR7QMCfxJR6qbyWSdpN1CsZWl29R7ZaRKZge3DNibWPbidVXntRr8N5HgAbrQ9dFs9BRWGSDRMVIAn9wChUzMZzfXGs7txcSHyu5YQjjvN4X+yKhA8idn5liYetr6yLUQvpKwT8GcGJFhTPD6QIPj9MfLXBoHSQUMOQg/Zytu7my0jIZbP/F2AlVz6Jf3DnPche52ArLw9DSYdG9Y+qIJ784mXW2CSK9/42CLScTCd2FEw5mdRWAPhWoQ+9L9ynDV5Pok+kXLSTlWiX/E6mRCjTVdgjOnGNWP3u8pGPnQw/OVhEM5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz7zL3bIwsPntLrICKuwxg0AyUymej2pJo+CbLeqgOo=;
 b=cWbgQGuxde13kAAEXj6dF85Ut/28uRmxLMwb6tHChFgwbeH5km8IQLACcJNIaxGohNuDqwK64h/pS9vs59V5dM1bOL3ht5pK0wzQX7lQwwwiWqQVEcNZChVJoMH9Of5EnKqeLPM/kXhA+YYq+skEfBVKwSBSt6IWVkNlPVr4zYE5pu053DCgN2jrQTxtg5G1wzVErVnAja/AgmehDxlxbF5MRKY+KtCz3UFTwqBZq+b9dV/jEWfnsnHKzs4FNkwN4o0kun1RtaSYDrg2iaGwvme6TrtxBAWa6Md6x3U3vvDQQTwSE840ko+LdGLKrtLySHJIR606Vo27I4gwox1GaQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 19:51:48 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 19:51:48 +0000
Date: Mon, 13 Jul 2026 20:51:40 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH 1/1] leds: st1202: add hardware-accelerated blink
 support
In-Reply-To: <20260713153713.962DC1F00A3A@smtp.kernel.org>
Message-ID:
 <GV1PR08MB8497264D9FF91843D6F2FE8AC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260713153713.962DC1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <4aed7752-6ce4-75b0-574d-a3a0bf64f532@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VI1PR08MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: 27183037-9740-4081-5fa4-08dee1182c8e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|5072599009|25010399006|37011999003|6090799003|24021099003|51005399006|15080799012|19110799012|8060799015|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bmszdo7SOmMvZj6GjstRrZKoFXzR1yO6FMZ0pW/UxJhtEhB0UC3qbBO2jmze?=
 =?us-ascii?Q?ay3y3ZdJOISBWdZ1TsADPI/mJyDhKzxOZv6wOHdxj8/BrdkRF9tAd8lE45rj?=
 =?us-ascii?Q?0bZLIidW9aKqXiIp4bZq0bEjzweMqMXnpyDn0VB1N0mwQVCZPIRl97Ktb8fF?=
 =?us-ascii?Q?RXJD/QjfKNQ5clX9MdVGhEX3ODMTpb3cyfHYBe+B0d/SjLtMyjlZNNfgwhY3?=
 =?us-ascii?Q?qDlpm/GCViSUzRsROqIBix+jrBZm4Hmo1UDIRbUxNKMtmCJDU/r4xMV+3KMv?=
 =?us-ascii?Q?HYU46/E+cR8P+yfAWlrl5csXa1bddJ1SODi7jk8abSZW6nF2va52xi6AAlsd?=
 =?us-ascii?Q?NS0TNGNykCQvhjh4Ss+hC47VBkTbpW0MC3Unh5Pqm5Z3tGuFQZ+mMy6X0It9?=
 =?us-ascii?Q?zJp1TEe28xDKc2v4gI5Z28rdzmlEfmbX+nbp9axuwp7VKtBr1mFflNfay/yp?=
 =?us-ascii?Q?MjzHlosDAOw4mdS2sCPE548ENTRE+jPRiLx2jAsZxZ0dred8dpBPbuzQL0hX?=
 =?us-ascii?Q?CmH6EF7O6ZusM4pdXplWQkCVSv/EnJ3EA0ctGI9GvpS6QFjUB0G8TD5YbgDv?=
 =?us-ascii?Q?29yoAbioO6fJ2Ph2oTdMLeYHjMi/4idW2XeluJ5+T5gq6Y6AwiT3i56ys1fn?=
 =?us-ascii?Q?JuuXqqKvW/mmbrp+WA2C6kS1NoCRKWvCqdkaHB1q7zijJW2MV0tOIR74pJkp?=
 =?us-ascii?Q?aiamsBbeoU6WdRq29I6h13TXmwt9UEjWHNgDULuJXg6Fn7oq3KiFvJ2RkuoF?=
 =?us-ascii?Q?rgvNLaRLurFKISo/tIyAShGptPQz+c2JeABTiVua1m48n1j6djnlYqoQzbuQ?=
 =?us-ascii?Q?llumWlJWnKqTn2QPNswSnjINDTDjwXe9kF81AFaIvQgWU0DEeq4UChz6eLzw?=
 =?us-ascii?Q?wUx5g+qHaaD49HWulmmt9qXHyRlbu8iuu72C0oUOq7/6kmIw818h9VvEnDV7?=
 =?us-ascii?Q?u0KNoe31rY3KtdUYiLZMLkpY4Mg+M19/pMMI8JEJErf6v9JDdB8QAtggahG0?=
 =?us-ascii?Q?RTZC?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hlZKl3vzTd27CoO8xFyBBCmz7wy21aiyIR3WKUfb8vOXroxH8TDBtHq20Mnp?=
 =?us-ascii?Q?yG5gGiZrEIP+gv9lcqDHVW4UQrUp200IPVbRVL//5YSA93XQbHsHGlbyoICk?=
 =?us-ascii?Q?SExgk1F5R78LBe56m0Cnmmq3J90zwe1L3nBWyTFfbhm1+Hv2Nal2XSDyHvrf?=
 =?us-ascii?Q?wSYQmcDJS0IziVyPopd94wDC2oC3FYtUQqLPtoUrV6Q2eWp5yO4YgELtpv+D?=
 =?us-ascii?Q?kEbccottpQ6BEDh6Zc7tcEcZcCYLg6y9WiFCZ11rWHTkgVaHucjvSBTLzQFd?=
 =?us-ascii?Q?yPrIjB/9gvUX/NeMtcrwy/qkr54kHNbDksO9yHTYjfW1p8xVlQbczj9vzGfB?=
 =?us-ascii?Q?NI7LvDNDAmxsXzplN8wTxIDm4Vym+yzR//bHhQhJu6YgRU0Gs9tD0Nl4ykHs?=
 =?us-ascii?Q?lj6np6OPhGfkjs9nEaNF0Dy3IzO94qXshW5Y51Aux7OSjyWiN9rbMDgw+BJn?=
 =?us-ascii?Q?sdg8jO83VQE7s8ywCMuOAcj6Wq+8ZXqYdr1xZtRy+2Revdc2G9Kh6XTpKmZx?=
 =?us-ascii?Q?Qbm3BFsnPIq6MgV0odk5yVpgDjUmEamOZ9/L71vUJ+Dnc0NjS7jefW/v3F9e?=
 =?us-ascii?Q?52s5XucSs+uwTRaYLN1/rX1t3Gb1568m3/7JlL+3yArNSmw4AnbkgraosnST?=
 =?us-ascii?Q?0X6azPhUAcMVD8v3Bt4Gu8MHKoqDi3I9UgLowxPLpZu5YAuuoYzgGe2c1Z81?=
 =?us-ascii?Q?LGNYC/06sUa7Mbpc41Jncq4t6Vrd25SkNDrFO3QwIAq5f0PHRXc2GFTyFtLr?=
 =?us-ascii?Q?pciHe9x+aZCtAtR1z/qMd6MbhHjZh3mHMxP0wtI2dsdHhIoqgdRiJVdWLqRV?=
 =?us-ascii?Q?aVyvHLKikQFJpWWdbK0dLFdvhlU8DRj+QB44m5+hv8c1I6G5hbZ5dS1xjGDo?=
 =?us-ascii?Q?Pxz5CpRjN1xfPGKZha8q4sOABdpn1eb44Tfi3LN4f4FYZK8QzKWZezMu+kiK?=
 =?us-ascii?Q?W644wwY9QU4RmRKXILY2vTPULanA8EjBdjNxTnWx4b8SIPVBf8OOZfncKFe7?=
 =?us-ascii?Q?ANblI0CgzKzOSQPimB+lkjcLC7f/kIu0UPOhf6CFagL3lejiEUza1skQHede?=
 =?us-ascii?Q?cezjtheZOxriDYvyNj2C3Qo8BhMTKhJgNds72AHfzNGEtW84hMxWpqW2a1CA?=
 =?us-ascii?Q?+WbA+oRXrJQ97xtkR7+l5FI+vstEwoVZKcwvS1bRkrWIjubGNpq6Kg2Hh7cZ?=
 =?us-ascii?Q?JyXg6b8EouqDNGeVsrQqcZDN/dwiwWWgNh5meyiUFYuJaHMG2ME4RTcuXM21?=
 =?us-ascii?Q?1FT2CGyu4QdWQVZxqaig8sf7OGNi8f9i9iTxjTiRDAcgJzRrgm0t6gi9Wn2P?=
 =?us-ascii?Q?3GXMEi8BJkKOVaiquGkX38w9VINjZJX4NgXI02fZI2kuG1uN1aCNaYMkbF1F?=
 =?us-ascii?Q?nwpmgKnwjbhYHt54THOZyv/FkW6g4Ua0sPdjMJlLp/Q6mEVS3+fggkztBpRj?=
 =?us-ascii?Q?RX3FOOjKYW0SPt5oFXnesjIeUSWPPtnt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27183037-9740-4081-5fa4-08dee1182c8e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 19:51:48.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9071-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:dkim,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0CBC74EE56


> New issues:
> - [High] st1202_blink_set() destructively zeroes the PWM pattern 
registers for all other active LED channels, forcing them dark and 
breaking their steady states.

This is an inherent hardware constraint. The LED1202 uses a single global
pattern sequencer with shared timing registers, making it impossible for
two channels to run independent blink configurations simultaneously. When
blink_set() is called, the shared timing is reconfigured for the requested
delays and other channels' PWM slots are set to LED_OFF so they remain
dark rather than outputting unintended values. This behaviour is described
in the commit message.

> - [Medium] Blink brightness is hardcoded to maximum (`U8_MAX`), ignoring 
user-configured levels.

led_cdev->blink_brightness is set inside led_set_software_blink(), which
is the fallback path taken when blink_set() is absent or returns non-zero.
Since st1202_blink_set() returns 0 on success, led_set_software_blink() is
never reached and blink_brightness is not updated by the core before our
callback is invoked. Using it would risk reading 0 or a stale value from
a previous software blink, causing the LED to blink invisibly. U8_MAX is
intentional.

> - [Low] The commit message description is not capitalized, violating LED 
subsystem naming conventions.

Noted, it would be fixed in v2 if it was necessary to send it because of
code changes.
 
> Pre-existing issues:
> - [High] The sleepable st1202_brightness_set() function is incorrectly 
assigned to the non-blocking brightness_set callback.

This is a pre-existing issue outside the scope of this patch and will be
addressed in a follow-up submission.

--
Manuel Fombuena

