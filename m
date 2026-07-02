Return-Path: <linux-leds+bounces-8877-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMxeMAjfRmqIewsAu9opvQ
	(envelope-from <linux-leds+bounces-8877-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 23:58:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60F6FD1B6
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 23:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=eDcBnpxy;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8877-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8877-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D66D3029785
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 21:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A38239901C;
	Thu,  2 Jul 2026 21:58:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013087.outbound.protection.outlook.com [52.103.35.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011763B4404
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 21:58:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783029510; cv=fail; b=PD89N62j0EeORYPETwUC5TYCB/hqZbgZXlY99x6sr2jgQAlyqcTb96Nnlt68O0ARwUV/iv+wzowKjL4sO/i0FXPG6f+O4DJmsqwAzyqGUAFFjXmHUIHxMKKYSumjxowngBYLmN71LYXrVAdEAvLS2RR+UT5PfscQMTGaZaGuj6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783029510; c=relaxed/simple;
	bh=hHHjCCe7v8U7uO+vjohUNnK4lJmzC/MdW5gaX1cZXnY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=ma3qgno6vHBlGodWexfJ+F3OU38ewsZ0sBX5RD46zZRVw1GRYkwC7mefYDhyvCgMABHBqcml+gdZrmInAJTaPCwfRDJZP1v7oA+UEDEdwVq4WZwu8tqd1kQQzmICS4tE+x0kyL1DTNXMCn4HpRUYDTOrLFKW4lOSWs+UuScI6ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eDcBnpxy; arc=fail smtp.client-ip=52.103.35.87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIUW2Ux5JainOIU+BnEseolMfwwn9NhjWkwGifDVIrRh7HfB44oAoM9rSvPWZ0gMO79j4Esgba7jqee4Nka12m4OWkERaFL1GDgkHM3+PY/lj/opVwDsDR97OmJr9eX4tdG0tGuL0uUsMF4HNDzNhk3Ua6j/OirwuRGsZ98TVb/G1jTegSkkQbRYtwstPqhPS+pr6s6OlezrHrHYYECN41ZSJ24CeqL4CbAAOwPHgpDqNN/rUqEn+ZobpQhTphj8+QWKLBiIYKd261tvVNx4ylUxd4KtNS1V9v11mbFwuixgIpt05Gxk/eku+OyryKAUQvFNIYLZrBpp/YPriqw+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0g78/pwkxCIyoLcafkqtmxcVgQccTE+gI9W8wlr/bA=;
 b=xrlBu5J/pGfPBvRJi3EiQSXOG9vTe65Bjb5AvzrK4KHKjVVgJ4SdWydSYDJUTbOELcnTgIq+iCtVTgZ7wB5w+/hGcY97wdMgfOiFuls2F9Lf6SPxQCz6oIrDAnBzIwWw5ARhKYOZyctolFLazTrG0Jb5o+ZT7oPb+seJuuHj2rMqXXwr0k8j1QvAfvQkowwfjdTHLVRJF55Q2OU5/E4lFNgtAUSYlhGyQofYaYLkvzLCuCW5Dpx+AWe/o8AhTxSYopuYfpzIMu9LwTFpHGG7SYWDwrq9fzFiBN3z/boLy9Ph3gEfTq6XRPLDYDGd4A+dBr0Z4xNI1Vl+rfdMU8H9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0g78/pwkxCIyoLcafkqtmxcVgQccTE+gI9W8wlr/bA=;
 b=eDcBnpxy5giqAgLJW2CF+AqBcXlXfOIyV/mcSb9VPKr0pztOFmvDbRoLrWAWho1WoLdgWBoboLZG7HYGmmHxIskhuBryPoNBECEXrc0GcGbWYxsPLlgEtu06pavmt6qQLCwdnfUsvyuUrPpLhoTL21KhcTlgmNSaXBIjTZXSsf8CmXTVDhMCnw3qbA4z8o9IRCJ8zBtPjn72uwjdqjMgFsHDIlQpIwhhN9wYo+QuV9juwuMv3HKUgLnhka7T239ahv8Uoxh0evR96FM2J+pnyWhQw43A/EGzgqVO2y8TTXIaMSaxXz/dhTTV4kCtTGG8sft/5UIXjBSY2SKSgBdknA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA6PR08MB11285.eurprd08.prod.outlook.com (2603:10a6:102:513::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 21:58:26 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 21:58:26 +0000
Date: Thu, 2 Jul 2026 22:58:18 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 6/9] leds: st1202: fix brightness having no effect
 while pattern mode is active
In-Reply-To: <20260702175604.AF84D1F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB849719BB7EAE723EF9D723D6C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB849785BF89E2291C387E1AF4C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702175604.AF84D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0564.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <d9d35b7b-06be-f641-3f58-6c67ecef17f4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA6PR08MB11285:EE_
X-MS-Office365-Filtering-Correlation-Id: 04116a2c-1c93-457f-08ed-08ded8850ac3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|4140399003|37011999003|5072599009|15080799012|23021999003|12121999013|41001999006|19110799012|6090799003|8060799015|24021099003|3412199025|440099028|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HgUnCM49905rnE+BMvh2EUl5fZC3q4IRW2ez9lbXmoLfv0+9Y0Z2uO/y9nT2?=
 =?us-ascii?Q?3dzJEsNmD4fWu96dfjdQ/9dGiX1Amjhw/H7IlDZrtFm3VvZldmnt/a7wdCWf?=
 =?us-ascii?Q?7DHqbJuk9pEvJeLvIuj2enBKSYoKEKTcxubyasKqBvrRSrpcNjfJgYcZ3Zcm?=
 =?us-ascii?Q?XTrKcaQjRapxhbD9Ktg+VshC6zAoIDyaGg6F3eq5NBJcIvXq9Plgph4cmzFk?=
 =?us-ascii?Q?QMkoQahssg7nJpWu7mh84ya8mVoIdTaug1bxEcLW90z16ArkdjIGfXiN2hDQ?=
 =?us-ascii?Q?9d/fK1guoP5xM4jH3RDi71/pzZLu131BKJ7gxtCLEUVUW3Wl5c/BMGNzXdF5?=
 =?us-ascii?Q?ga/UGUf3ovjtcXncWQP66s6uqyoGDFtEL0+bocrsGBhQyQZKQ1YrhyGkwyx5?=
 =?us-ascii?Q?/a+JcD00vNl2d0gYovLqUrCxHRrzpTiWMo4Vu6FJrg+lMq01AKaObQ4h/z7w?=
 =?us-ascii?Q?4y5S8CFoglUEYwZMjM2W/uTJdV93zJ6fOa/cvfSLeNUk3cplUD0z6TCaWu56?=
 =?us-ascii?Q?nbEHQf4S7noE4sj1FNDBtCd/8dZsUrV52TtECcbP8PvAsHjvsFvxaUwG0SEN?=
 =?us-ascii?Q?aultsM4HunpQWwJKueF0ZLU4bNzgbM6Np6M2StwCNCEFFkV5XKAoFbs9ndhm?=
 =?us-ascii?Q?eHVk7cSX1/K1CUz82P75O1bMmzdWIEpDmp810fIwL1nenkCqtP5wZj7vaU8w?=
 =?us-ascii?Q?nqiZr6SNLYTk6YnldcgcGPc8QRR4zY3WNmm9ee03BpPlIH7LCnzl60joy+Yv?=
 =?us-ascii?Q?AIFIWR94U75Vjne1WIMLkS2PCyiPJHe5EIzOydG8aZj3FZS0X3feSnFB0NhJ?=
 =?us-ascii?Q?EaeA/0oVNaQ1RE2rmGmoCt/H1bnS4ZegPQJA3U8d1ntfqHOKNpld/CgnvW0o?=
 =?us-ascii?Q?+2KgPYBZ3NrRjOb0B0mE6sBOw3a9Gr2a5GVWOZkbAmnvx0i6IoYGsM9SS1Ut?=
 =?us-ascii?Q?2hH2VFDkYuMNO9uUgvyZU/qMfZ7/JV7MhOWrbVY4tNXiA0z/HQsrTCgCQsmk?=
 =?us-ascii?Q?FR3WTX+tSMr5gKw3pgOzP17DzDTyzVDmIRBKyjiyPVRHUNdGT4YIazl+dgti?=
 =?us-ascii?Q?Grghe8Cf?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TpiPip88C87r0cwlkuzBLMkwwNZl3vYSPSgHGZmcEEnLjtkGqYptAI6LpqaE?=
 =?us-ascii?Q?eVTz6TPwwY5OMbDH9bOrt4Egsmx5KndfO4bHBHRvyDNFdAz8QQq4XN/FbjBT?=
 =?us-ascii?Q?+Gc+5YlhesZmK1BoztTsJvvYIlrw8+gL69G+JFOrStR4PqT41Xy2yb2S1H5R?=
 =?us-ascii?Q?yDb3irOjRujmC8ktp+iNC3pni26N5xUmGOUn5ZopTwHKaSugT9808auTEMdA?=
 =?us-ascii?Q?pDHK6f5/NSB4YcVbMKuB6fNioOHfr4G6FqEYuNIDp5wZeoN7uDBU/rJQSKh1?=
 =?us-ascii?Q?MwkiIsRI1o8L1YE0x3U/0TWi6IEcksB+JIdgM1M2OTmY5VcYP8ltj9adogxd?=
 =?us-ascii?Q?yTCYf+zTMoYk3CRD5GkR18YllBBrXp5bAr7qVgY2Zake1y2C9H5j0aUudj/n?=
 =?us-ascii?Q?zSEQ8FoY4zCfVhvsV+RoqKv7YlPL/z9tfQ81fcf2DSes0QXiQye7u8d+dngJ?=
 =?us-ascii?Q?aPqU95EbFvxFDvXE1EQ5pwhZzV44J3X5PYo9ExIQ5LV5DWGuEoyi1c7Asjj8?=
 =?us-ascii?Q?dHp3HZeKwT7P1fAAc4qC8G/nZmzN9XcPiBUjbTgz4F/45O3nS94ATQ5r1J1Z?=
 =?us-ascii?Q?YhOFX/w6PVFt+N/0hLQTBEH0kQoc2FMpC8LqC78qwtkbEyxw0qs8lvN/9DDf?=
 =?us-ascii?Q?/PrwAqPbwf+DQozkAP5k6m2sz5mPUQMyU7BHuMb+1kP3gfqMqn5FUAYy49SH?=
 =?us-ascii?Q?uSAKssm0x10ALp8FB2tOFzjyWa4JR8ModDBQFoAdGzxB6BfGEiKcGavu9l2/?=
 =?us-ascii?Q?1B/k9A4wfmu7z5J6D8ET2c1eNN4LrgYR2C+loAgUYSZyPsdLtFRpaaChh5kX?=
 =?us-ascii?Q?DdLiNSGSdXfy8Mask+1eroKo52CMSOnJ1AzV4bgO2n7KrM/jOIrlzyNd/6oN?=
 =?us-ascii?Q?BD9xoP2hlmXyEV7cybgmxWXDxJGSQg1+ccbucAIL1cgZGOxo+MMpcXijlres?=
 =?us-ascii?Q?tBz7ksM2fS4yrULmkD/U3GY3++NrP+yq+VtvrJb69L5rjfeXNiCfz+KEoZiQ?=
 =?us-ascii?Q?oYUwg+58veO9G4ZzGRq8fjKUAbZyRvjzxsZyb5T2zgK18NsIBCjb9AQarDT3?=
 =?us-ascii?Q?q3Pk334WpgkciERqIJW1nZoGjL03NJ/BV97wg8NuBpFl+a+qUKAJXg9erdXq?=
 =?us-ascii?Q?br9t87kedMclUZqYAnD01pa/nzOgQodmD/ClRWoottGqa5G+6QYF9gIBghtY?=
 =?us-ascii?Q?nsJBSL7k0HfwgdrPX6AGqtdJH7CPiOtZGrJ9ZaA/5OFBVbmKCT6Kriiod6Jq?=
 =?us-ascii?Q?L55uDVY9BebKy4Ihjecbsn+lQLFYlbZFqQJ699mO/GMg8AR8g3voub+4aLZ9?=
 =?us-ascii?Q?NJtjbS0VoQ7HnRY1kVdLuf2nDwpwnglGX02TCK4ve18i0qhHTv9o+jbhnP31?=
 =?us-ascii?Q?kqWXPT25iIP4ZsOY6iACVKlLj35/RpXQG4PvYvu8klKvdbAby2fCY/vl55Wp?=
 =?us-ascii?Q?3f1E5Y//gb8XM9fO6glXce5mDLpOk15U?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04116a2c-1c93-457f-08ed-08ded8850ac3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 21:58:26.0443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11285
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8877-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:dkim,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A60F6FD1B6

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> New issues:
> - [Medium] The newly added loop in `st1202_brightness_set` ignores I2C error returns, continuing blindly on bus failures.
> 
> [Severity: Medium]
> Is it safe to ignore the return value of st1202_pwm_pattern_write() here?
> 
> If an I2C transaction fails (e.g., due to a temporary bus error), this loop
> does not break and unconditionally attempts all 8 iterations. Because the
> underlying st1202_write_reg() internally calls dev_err() on failure, a
> single bus error will cause 16 consecutive error messages to flood the
> kernel log, while pointlessly blocking to attempt writes that are
> guaranteed to fail.
> 
> Should the loop check the return value and abort early on failure?

Intentional. A transient I2C error on one slot does not
guarantee subsequent writes will also fail. Breaking early would leave
remaining PWM slots unwritten unnecessarily, putting the channel in a
partially updated state. brightness_set() is a void callback and
cannot propagate errors regardless, and st1202_write_reg() already
logs each individual failure via dev_err().

--
Manuel Fombuena

