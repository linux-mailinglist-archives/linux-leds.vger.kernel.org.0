Return-Path: <linux-leds+bounces-8918-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PJrXNWeXR2oObwAAu9opvQ
	(envelope-from <linux-leds+bounces-8918-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:05:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47879701978
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:05:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=ZjEv+rtN;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8918-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8918-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B967D30C0735
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 10:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4893B27E3;
	Fri,  3 Jul 2026 10:56:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011030.outbound.protection.outlook.com [52.103.32.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF73B2D1A
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 10:56:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076191; cv=fail; b=B4A2tP9dZcGVVcbNoSXPFjUvdbe/LibXwshF6vEhD9uHxhK2sZj1w+/ndSsZn+jL5n8lgv5H1JLzYVxn3lYK9VEQHl8v8QF1vy/2oYT250l6CSQFuC50MQx4RUvVG9YRdvDrnJlJv8qGVX56ZM+P1KZkVYoev3FGBZc6CiYl/dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076191; c=relaxed/simple;
	bh=JMgDC9kcTSY6i04JPViGA8Eq6HHdQ4mG2Zp8LM973tA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=GXm1bDoh3UEQRcwHxZUFFblGMN3W7zanJSNOu+zE1L9F+Q1qzzMwbtErp+7B833Lw2htQpJDybL4FnmEPVhznT9VGp3FMigc7mhL63kfm/uYEcjO1+ZJIWnFZbtUD7AvqSOE0awvu3Lx2HrDtOg+57EqZfBlrFmjcWoa/es7GQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZjEv+rtN; arc=fail smtp.client-ip=52.103.32.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUDx/uRIDgX1D1c7mokRX3W1cf1GzJhUT4Jj+OlEl5vRPMGh3dYWm7DFfx+BTG3rA+dLRCUCV7V+PRBvZ4bvuGTs8+OB8zvnmZ8AlosdU6Erwb2a+eOTKjL4RcB6aEvjJFottmwcjIjndqP2bEBdkmAKfIcXrOsZN9KDuWhLqLy208IvBZ7C0sg1j6ON45cKmgHfPL5qDGFFo/wS9GXX03/aMP9Udf02Oc9Y756bXoqjKkLKlz1XVx0NU9lls+s7KiWbr/Rm3MtGm9Y+96c8S/fumt5ev31x8PGf4FSCDO+PoOvHumh9hJDWNLGGETsfqKpAfmTitvTps8IA78Ph2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwgvJVLvv9rPvE0I0twSuyNX9smn6aICucIAxIgbvhQ=;
 b=U1RXrzWmLOWSBkx4kE5EMQPqiNP+2oetaVrvm3YwQucJgo88Sgqo4ErlGBj5P/U/tf94t+7uzwU3v6HGgYydGks07jQYRWReWe5kSjXvAvIBC971tkXD78BQbeO5G9WJdwXEQiZWVxnIX5sQhPge1Bowotoe1TnroPXA8V5dUlT4oUJR+/ri1pXnkWb9TJPAgVkoJscmWdnE9uFe0r3NZscxxJ6GpclIPaUeSusKu2pUFzr1jVcAtCzj+BxDRnnk/fSwh1vPQZT6LIdvx46qVYyzWSfSCJF8h8CuOeIjRkrk2s2qFET1drPXFzPRltt3+V85JIp+oL+yWkY1+Wie+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwgvJVLvv9rPvE0I0twSuyNX9smn6aICucIAxIgbvhQ=;
 b=ZjEv+rtNieljdpUoP54Lx14JJwswAZDxhtB5sCJpu4/u4EgXRzDSqaWUQAmyqVkH2moPa2Dqpe8iaLKBt0tCX6j+K10vi2zM4lG2OUyFYE9dOXMLrhUhrSKFlu3ZD4rKRMzSXAP9pEpOmrOYghBVQJ8hdr8irNNBpGvINYlzbgMSwGcvkYTPRunAgdJOmLSVA9ROfrKhziDXWkQBqSArk8Brs3OID1cR59MXsX7kQ2txWgCUezFg86MzBItS69oTMK9q2A7wEDLOXTUYMSGy36t9fXfhJGJJKck6Z7hsx/gdzP7r3e/jKCe2TyiCo/0JrURBIJ6aBgBeVZ1jpTX+Rg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7463.eurprd08.prod.outlook.com (2603:10a6:10:356::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:56:27 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:56:27 +0000
Date: Fri, 3 Jul 2026 11:56:20 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 4/9] leds: st1202: set all pattern PWM slots to full
 after clearing pattern
In-Reply-To: <20260702224811.005581F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB84975D64224966F880966A80C5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB849732C162CFE9E2C525AC16C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702224811.005581F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <6be7ed43-996f-55db-f9f7-f1ada407468d@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 039421f8-f221-4c21-1485-08ded8f1bb48
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|25010399006|5072599009|37011999003|2604032031799003|24021099003|6090799003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VNQtZFgt0M+qP9AF3k0O3ylR5ZPOjkKA5USQrUlXdEhVQnf4AOH8zLBSnjDV?=
 =?us-ascii?Q?BIGWME0VCoWLiJ9yxDmt2uYvBOS2pyn+nceo+jlett7KmW6eambKG9jDs4NT?=
 =?us-ascii?Q?YehUgjfNl17akg+Tg2A7U3fW4oxaekFFHe3Q+llRuXuLhT+U1DrEj1cJoagq?=
 =?us-ascii?Q?w00wqR3wcUC/MXj04E93p2UVIJEugRt6dAufuPBFH2l9YLGzm3qE0rUNyheN?=
 =?us-ascii?Q?aH3cJusN1K4NnnUVLuOdTfl6STEs0m1zscGrdgE5878BC6siSbcZwVWYmZdS?=
 =?us-ascii?Q?k385f/Gd6rojFd7qHaf7mPubFtpg/azB2boI905cwXZTkgeRG1eLJThqPh1m?=
 =?us-ascii?Q?w1L8uH7rlSPQErlfjdDbq66B4Wg5ohDFLXmzKQFCoCEQGPlFTCVIC+L0PEfn?=
 =?us-ascii?Q?L0hKELRGkPMpY8q46m3u92+1F8QgW8k+RzRaPjZ3g2B3s0RR1xuWZoXxpw9M?=
 =?us-ascii?Q?b4d3wn/kOXWPcfG3Duxrqwcn+cYjOVpvsJO2HHQMv1BSSMway8lhVgZavXiN?=
 =?us-ascii?Q?bQ5JHBDLXBFmtzfyOZ3UlkTKqYs47EFOu3m54QB5qbjy9vf5vBHkHXzfHLRJ?=
 =?us-ascii?Q?hyrf/abgDnY86JPur6Xr4v5vHVjH+NhpcdJHgnfJAwKc65WThPFbXOz+SSqA?=
 =?us-ascii?Q?+1QVxUSdFjqj8FowlshiAzrXYbOSPI9b0DOjkmBZozJPM5hMudBUt9sgBhjB?=
 =?us-ascii?Q?RbhEhZ7CAgJO9p1kr9FZBb8tezNyZMm6wTuy5KYqBm1dcjuZ1fhInnXa2VAs?=
 =?us-ascii?Q?mhukTvd7GAVvsfC0n0q9NaWLQMutShJFuxHlsAEKf8HXrPDIyZ/l2+oQ8AyL?=
 =?us-ascii?Q?UbWGqeVOtEbkzDQxI34tWQDImb8JWe9cEgGI6q8TrP7Hq0uhojIGp+om5yo8?=
 =?us-ascii?Q?KZH4r/D/XARG5w/mCUqclmY3N+4OqN4ySwIw8vIoD/2Ylr1YOpKNSbZye2p3?=
 =?us-ascii?Q?ZHUR0cMx4DuoIubPoEDZvLZ6VOv9SfZMU7J3Hwkp6vilADP+isLajHBip4+j?=
 =?us-ascii?Q?Xf7YE8Vn1/qlIMNko7bNR5g7JCIJNU7lxqQ0xjQMF/o1lpE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Splj31lxAEb7Ab1fRhngN5ILWDLtiqu4DYUDIjIx3tieuH99MgVDmWZEQnL+?=
 =?us-ascii?Q?B+5PYFYSqcB+jcmrITXLwFwUgISbdjdBEFaDKsbp28j/KRJsTQzev23D/Obt?=
 =?us-ascii?Q?LoA6raCrmoAqZynrMOk3cQasPJW2GvecuJKdMdAhLLXLUBGzWQbczVc6h9qz?=
 =?us-ascii?Q?9H+H2B3wI4xartPsxGD4DGpNteSxkpRC2nZMLq/5eBAuvXgohbel7KCI0MsA?=
 =?us-ascii?Q?YMYePB9nl6+Cvn8GSpRq8meXpUgYciYd7OdNpV8VjerGYoQ88fAIUNkyXl/v?=
 =?us-ascii?Q?NOb2Mq8Wo7+hEPZbXN9pgaa8SybviA575J48cp0rxrt8cRgTK5BTgwU352yD?=
 =?us-ascii?Q?PmlyPRunfWUJRkdYpsTEUAGWUHLQ8ULXdM4h3lSBhAadC+32EgLQQrXfFyD0?=
 =?us-ascii?Q?1ZZSEsrpoQDblhTMaeNxlRmaP2yxXGH4lhbsfu2YEem4rUvzhIARBL2SRh9j?=
 =?us-ascii?Q?j23U6t+iKZxpev8fofWbiOYctvjyAV70GpdLu/ZoMuEYyFRGa7DLsCOM4gdy?=
 =?us-ascii?Q?UDXaSbK7JiFAb03djiG494sQil0aJnj/dV1J8onM3WoTEKYBg+S1iYHXr6wH?=
 =?us-ascii?Q?TPZ3wINaFPAxm/g+Wn5qVav4XZ/pVfJP/X8P7gSDEO7Gj9qqgyqgxgfAr/S+?=
 =?us-ascii?Q?hNJjEIFQSzuDr9O9FKEuSSrZ59rIb18Y0aDoWc4PV+KXau9YuerbDqKUGbre?=
 =?us-ascii?Q?G0gKlC5eb7hVfFw0OFTkMmP/LmcndXw8qEmyleBhLraeV5MX3EMqDuS5AMAq?=
 =?us-ascii?Q?2azcarog+jaf4FHk/IflqVto1o0BuWX2RV3yap29rsOt88K2tItdRvbn4nwd?=
 =?us-ascii?Q?FcLHciiLZGYF4amEHkPtQbH9Ep/gNEDpABD2QIHd7DJ5FnOeQG+ruqzzhsmK?=
 =?us-ascii?Q?nNlzkHcVJRNmp5B+L6e82l1MIha+aZoxekJrS3aIIAUzZiEO6dyEVkBaNxxE?=
 =?us-ascii?Q?aHzB5IN2FzS3YsX4wP9SGYH/Fer+MsQ+BNmpBcB6oodRxQ0JOSsJ4203+4UJ?=
 =?us-ascii?Q?rj/jiNqOTHwaUkYlPNUHzVVwPqhx0xt7MeHO7dhcWL6GX2OrVWNo/dHMsdzA?=
 =?us-ascii?Q?2jD4o0MnXko+DmOBnuWcub3z1hE7Ffobn2iuvDpV4NTDz3WC3UwwgHGFlxsM?=
 =?us-ascii?Q?DEFSzEg22akMMpLICiCRb4gAnEeOOoiDgfBgVKxN+upQbxCH3FSdBv4OFiM/?=
 =?us-ascii?Q?wv6JAl+/pAaFrYTZTOBDCGt1TgFg0vNR0yRoMJbxze2lG3NsaPf9c0KqWzVl?=
 =?us-ascii?Q?t9sgij57JfkqveAvMu7NPghzFGgj2cOxFBQifm8Y5//NJPUmU4kTDJHo2bZU?=
 =?us-ascii?Q?FGXNXY4GRPnxBsgzlK/y52FSNQU1ohz/qYQZQhcqpHsIiSfTNPcDwFkyAPT2?=
 =?us-ascii?Q?8yQNjbiGETSHeERMwR9LfoTvpALDiGtR9a+GCy3nlnV22JEG72fW09wrA3b6?=
 =?us-ascii?Q?eCD3gSYhUeKqt0HkHejEFeKR/eU7WBzh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039421f8-f221-4c21-1485-08ded8f1bb48
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:56:27.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7463
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
	TAGGED_FROM(0.00)[bounces-8918-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47879701978

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> New issues:
> - [High] Trailing unused pattern slots retain 100% duty cycle configurations, causing unintended maximum brightness flashes during shorter sequences.
> 
> Pre-existing issues:
> - [Critical] The driver assigns a sleeping function to the non-blocking `brightness_set` callback, causing kernel panics in atomic contexts.
> - [High] Single-channel pattern operations uncontrollably zero out shared pattern durations, breaking active patterns on all other LEDs.
> - [High] Pattern brightness values are written to 12-bit registers without scaling, causing extremely dim LED patterns.
> - [High] The `brightness_set_blocking` callback fails to update the brightness level.

The comment about trailing slots retaining 100% duty cycle is a
consequence of the pre-existing issue where st1202_led_pattern_set()
does not zero trailing slots when len < ST1202_MAX_PATTERNS. The root
fix is outside the scope of this series and will be addressed in a
follow-up submission.

The remaining comments are pre-existing issues outside the scope of
this patch and will be addressed in a follow-up submission.

--
Manuel Fombuena

