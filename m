Return-Path: <linux-leds+bounces-8923-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D2nINCyZR2qZbwAAu9opvQ
	(envelope-from <linux-leds+bounces-8923-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:12:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1D701AE9
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:12:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=WX1+lbXE;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8923-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8923-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F3AA30078FC
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45DA37BE7E;
	Fri,  3 Jul 2026 11:02:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011038.outbound.protection.outlook.com [52.103.39.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D453B47F9
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 11:02:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076553; cv=fail; b=WnjjqGaZ0f6WkaQIhQZRV8pIjB16v2nrlMgYAfseGn0hQwadQVx19lk+OMMsTIKElN0S0+WMrt/oEbqWGFyhSRyF+qMLJCR4dEYPt59ukz9V8FdDtzvhgqV4W4onEYv1Lw+q0N/JzyP7z3pGJ5FzR6NGC22hMKO6Ms5KRjf5+AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076553; c=relaxed/simple;
	bh=N+vdBAzc/vnlnBE511Xc4s+qEyI0cSvK4jWCXO2iWHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=JW1N1nJyef83GQX+LMFK2QFla/m9G0Ukqfu15RGCeXAcvJHjaVFJKC50wrJAtv8pCL8MAT2wH4hHLPd1GPynto1w4HD6FfSgnX+go5Un30uGLA2tDO037/Jz9lO0ZlN+Pgg/GJ0Cmxem4rk+v6zwsukReFLVkbiQ0VZACJfEhPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WX1+lbXE; arc=fail smtp.client-ip=52.103.39.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/Y5q9OzNgT5a53syijZww05Xu0SlkMs0UbOKDZxEM6J3+t57mJFKph4YwWt2iPjNep6k53ldl/rSIt6GP7QXLBbTHsrwPkEokxqk3ZqioeVHfjklnbjaK21d7St6xBPEYbN1BU+cvjKuSYyb8NYviFEjb4ZbqETVUv/TmyUFnOU2Csc19jUWHKv+MFKHSPz3ZPllZPS0wO5Sok+Jgw9abhre13Uibwr3WfUevShHg+eZlNuhrE3n4NFXA9RkGlYHLuQJ95jgfpS6eV+d2NVaBGwuM7wjLJFeghkvRQnegUbLG8LezZ/2akY2HEuPycyPKrWmUgxihK+VBVKS+JyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+vdBAzc/vnlnBE511Xc4s+qEyI0cSvK4jWCXO2iWHo=;
 b=gM/A9QdvrEmKEkN8z/HfN/cWdlYpakU/PR9+Nr/IP33j/aVC/h0aL1NEw3nRCKa98Hc+oyLI1heOO24E0eqHvNNe31VgehSx3wn0bTidZkSzovugEuFkoD3Sx4or93Eeg1c73kDsAtbtCp+Rg43ecyRpIrrg9ErVj4VNwchG3bXtfCK2KVzcTVlRRt4ennVnbTqtwy8ZF1AbHREOBNRU4qnN0UctHKS/M26x0tbe4n7oT0BXIpTB+iRW3PxkJ6Urk6oL8YljZeu47ewlejAlVDlDtDj2FRSjzNGY/kD5RqBFxwYqQ9kr4yGs7HV/Djmca/lGp/0J+PoxYYD2hMWcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+vdBAzc/vnlnBE511Xc4s+qEyI0cSvK4jWCXO2iWHo=;
 b=WX1+lbXEHCwnzAzPCujte5b4Fr+zWZDrdfI2eMLMK0WAhoUamtNgbJ05ORL4sUnkAobUwbnrpREOmq1trMQnJioudoT610CGIfUFOEsr0HLDKJUffc+wEYswbU85mStTimMHNol1SMIDDZGW9KFpJfuDx8YEJcLZQ1ZeBlWrxIWxu0k/Z+Naei24JNN26a/bLGe5H03GrfqjFrvp4DcE0Wh5+OCQm/U5S1Z/x2r8QyZa4oL2/sg3clAenfZEK9Pjr5+FACD2fH/YFkeu6KMAcEyngx6ToDObntjiiKMVvZEkqXHQooKlyowDLm+ZO2RnT+KEOvTpWRzMeOClS8F7WQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VE1PR08MB5630.eurprd08.prod.outlook.com (2603:10a6:800:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 11:02:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 11:02:28 +0000
Date: Fri, 3 Jul 2026 12:02:20 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v7 9/9] leds: st1202: correct and extend hw_pattern
 documentation
In-Reply-To: <20260702225817.10B861F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB849734E9341EBAC34E5E45BEC5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB8497B2FB4F5AC4B142790CE5C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702225817.10B861F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <7886ceea-721c-7641-a0fc-6d6899774171@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VE1PR08MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: fe388c9b-0bed-4741-c4eb-08ded8f2924f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|6090799003|24021099003|19110799012|8060799015|37011999003|15080799012|2604032031799003|25010399006|23021999003|5072599009|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ENT2oU9ftm0MuuhyFPUCOYOWGC42/s7oUXmhmeYUHDW6bsM+mvMiGbWii8wj?=
 =?us-ascii?Q?MRnlmoufIyT5gX++yPhC6k+vsVTPhtCxLjhkau8DyiBeuaNYZ7vv9R2Xwgwk?=
 =?us-ascii?Q?YQPMzGGaayXU03gIpy/MfKXeDQWfKsRKTcxjpBhIpUPQDgQfDLoEyBcQjNIn?=
 =?us-ascii?Q?kNUYVqydQhLBd9Nj/ZZhorvHB3+3CYIlkYkXesR53iULMmS32jjefpwiiR6P?=
 =?us-ascii?Q?50Tf9Mr3cNONeAO+I4dDt2nz2wHk+3IEDgfQ7Xc7jxVN3PWH4yTf0Z7REWjP?=
 =?us-ascii?Q?VTWbgJ1uI8u7g2Eie2TijTva94n0gd5HECj88KToq6JKWtQm5kG0nVFeDFnu?=
 =?us-ascii?Q?sJWhb/JFUtKcudEiV8ItTTRavWMPGRxFNQ9xzHUsrOXiE54op4YUWk7Vl3FQ?=
 =?us-ascii?Q?2g37ursFE/w07n1FfM2cx5ikXRsYW39x6HAkbUMxQfPYW2YpMGv9WG9Yiesn?=
 =?us-ascii?Q?MUiAcalas22NqzDnZDL/Xg7B2RjFJ+jro4jZlt37qLkxLS79KPDf/GTtGEWy?=
 =?us-ascii?Q?xv2O9LFXAh6kjhuD3y/sls4pGpOlof5vxcWLo/Y0wEj99Lqo9MvcZg35b6UU?=
 =?us-ascii?Q?WY3xD6d1VI93YtOprot49HwMcGB8pP6fGYvmLrnkZgUOVFj2OVBw+Zv1dlZg?=
 =?us-ascii?Q?AP1RFwThTeIVt/BcbAr/+OvOAdwTE3PQOX5lagwlVjLeLI/M8arMbDH5N8Vc?=
 =?us-ascii?Q?SGFgFNq1iGWukXT+46Ov0YWeOrBaK0Pm/zNDAILJOccc4aWpRXeEge8SCnh5?=
 =?us-ascii?Q?I2g3V7KG9SaYBx+eJiORSiZoJ2YpiDImQMGZzge7FvNl98XHWAeJK4WNiiRm?=
 =?us-ascii?Q?YorOUFN5HLVix6rOO97ZmQboG0GNwXq+ifodj5iHv2nURIxFeKx7MKObP64c?=
 =?us-ascii?Q?VhkmcYiS0LjtKk0vuVYUhR3VCA+hc4Fo6XasAUazOSV9V1G2ZhwS44PpOfHa?=
 =?us-ascii?Q?+OLgWKeRHNJ8koJiPMxYUSICpT3g+tOkwyiC/Z0+qdPDU3F2GUa+HByl8MwV?=
 =?us-ascii?Q?PGY5twm4ZY0TpnzTtxEEyIR2YY9+xW9IbK2i8HO7B9lqQmk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SlkcYDYCYShnfd72Chnpu57Mr/o3It+4Bxtu9Hj+PjNZ5YHXQnUCELASWCpr?=
 =?us-ascii?Q?dqDFdaWVOjRRRlJwCy/GHqc5WvJS2w6HpwhcgTNbKZf3zrK1ihWFNbnsUVea?=
 =?us-ascii?Q?Q+a12SLSIprH9Oyg/UZRsxBi/6e7Oc3fsAzN6y5vfqIsp/6zvQmoSi+5wf1I?=
 =?us-ascii?Q?1jOhUqxcQ6tvknlJw+5Ke0L32AyXrKqInuVP/ZYgJpLdEz/dZS8hphtOIG9s?=
 =?us-ascii?Q?UBVniPi7dDmieylat/C3y841AlN0iR+HSJaDKwaVMQAln1DhUw63qoW63QYl?=
 =?us-ascii?Q?Sp2isTALaI2BJWZkOOZ9sPXnmXm05zAaiod4bq/24Io0CU4AZBbBpZAUbel8?=
 =?us-ascii?Q?aqY9df9M/fe8o1/U3Jh68MeTeirlpnXV2B4uDc3+sk+aOqeuB2tbiU0DyxNQ?=
 =?us-ascii?Q?+bmr7A99ZfzwFys128mKo14DvWYdk6/g1ZOj2s+68KIMvxeMXy7ItOKrp9jJ?=
 =?us-ascii?Q?b7KkXXUvGWHsX3XKS9XNJNa3SvACjatF31LrRanryRHu1QsT/zfKcDpkZ+VZ?=
 =?us-ascii?Q?/mEIc+yBaTAlhtkqwjstytx6PCjqEmqx39Y8LOuMBe6WN38Ecsh+mHDVP8l6?=
 =?us-ascii?Q?HGMKlAz9w6o8pQvu27RZrUohnUWCaqBw2iMLOw8SvBW+24DWtJtoNzXVgNSm?=
 =?us-ascii?Q?sLsyh3AnN+gY7OOTIlTYXI+TAf6odpCFbZEE70615Pmm76Kkh110+ee+8S0p?=
 =?us-ascii?Q?w7iHEZgk18MYcv7Hn8qqVhVOQRrwfDweQJIh7+JpRQ/PuOLK8YXE7/RDmpaI?=
 =?us-ascii?Q?gTF0sHrXvVgVlCIokMH9/74cxrs4AVO+feS8vaA8yXQaN9GKMLQW8UQsX/wc?=
 =?us-ascii?Q?BsWnbo2LPGYKd0k6e6JotUQ+O2yc0gJ1LKDfJ3+0Ebzfuc9uBvxkD5/xALuK?=
 =?us-ascii?Q?0pZEk3qO03cw9n1+JZKiMKc9XHvAKT8/Qs+pdnYLshRnfH9om8MauQkDG93T?=
 =?us-ascii?Q?XaIf5PpPUj9DI1CjFu9inJtxj/p1nWf30luA3dItI4NGBKh1c3n4BqZJLUl9?=
 =?us-ascii?Q?Maqlhe/hRs5yoS7pbvvCShpd7iqjHLi8mOhNgc4OeuUvF2e6xG2l9zQPEaEA?=
 =?us-ascii?Q?dCDTQIOmiGuCiXYrOA8qsW7kIQwAZ4YzTESUpMI06cG4f/Pwix5O4lWuug1r?=
 =?us-ascii?Q?zCAIAO4Lfi/UnUFBYUSu0JVSKIut8E6SNN+/jwioNKBf7UfK3ddXlaDIUPcu?=
 =?us-ascii?Q?TwmSeqPwmSHFeILO6GHpq/wXKhT/32WIrQa9Iq5nKNtBnS76I+LtGFHD2ifG?=
 =?us-ascii?Q?lHj9oeZDY2OyL5nShZD/ipXQIn970cPCvgT4CaA89edB48eia1N11ek2cHd1?=
 =?us-ascii?Q?TbGTdR8gsjmkKolX1wCeKE9iszNrKjbuzGUvP3k2OETiIunFLiV1Wnr2uvvK?=
 =?us-ascii?Q?J/DjBeGIOMxntUMP+owi0I53WUc2lACGH2MkFWPdV1KrpzBtMpaeHjgyfilE?=
 =?us-ascii?Q?ZH5ju/CjcqQtDPHiTIwf8VPdmYHFKWUp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe388c9b-0bed-4741-c4eb-08ded8f2924f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:02:28.6736
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8923-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 7BE1D701AE9

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] Hardware pattern brightness values are not scaled to the 12-bit PWM range, resulting in extremely dim patterns. The documentation update masks this bug by incorrectly blessing the 0-255 range.
> - [High] The driver lacks bounds checking for the `repeat` count, leading to silent integer truncation. The documentation update inappropriately enshrines this hardware artifact, breaking API consistency.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

