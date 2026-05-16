Return-Path: <linux-leds+bounces-8156-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFK/AliCCGo2tAMAu9opvQ
	(envelope-from <linux-leds+bounces-8156-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:42:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BC55C257
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E80930054EE
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586CB266B46;
	Sat, 16 May 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nimfZOwB"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013081.outbound.protection.outlook.com [52.103.53.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67413DE42F;
	Sat, 16 May 2026 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942548; cv=fail; b=p2wf+sGoCAorPIp4x+XSuLIGRZsbtcRJcLZeLmFG7LoaXEAGq9D4GaXXeKuqbNFmyVwrI4U2QI9Uni4a2I82YKAVC5eBeqirTKgr3QSZKowh0AuBjTpvxGOcUyX2pW8JzBumAFtj+D9RX4iFQommHNqJMyF7dcnQmA8qm4VAoAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942548; c=relaxed/simple;
	bh=22Qz+xQHyn+cUIbVjgBhmu2IzCiUoouGkTZWvYukaS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pJXxXWg/ZvZzkBCEXymroNMM1AbDRuakXJfXaGceZnTXLTv6QQ1iJaiTw4GvPpVfNC7z0V5qlp2engYKKRxa4CZKO1QxpTzWbL87HEFOjoTOYnYzWCfrJcq5GtH1SeIiKdKEHVnUThDSsJjV9TdyMmoSF5qJopB48/ewJwgMLuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nimfZOwB; arc=fail smtp.client-ip=52.103.53.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5AT9KbBOknZcYyLUiJhi5q4kbkFWMzpvXwInJfWipun4Bfr7/HvgyrYQLlkwSTiwgiHqaWtSNnF2+I1XONo1NzHJ4vaNRkUApjJkXUL12mRL/kOSMdfI9C5qxVbPYl05SPF765q+2/spZseuV9H8s/+nlKFlVMbH5UNXzUN0Cwxn26rb1bqr5zNVwe42cODvwP0twj7HpqXfbbG3KSC/phgI9XF9mMkpPkjS8mRO+056bobYGYOecLd2LorQH4gUQK6Yeyxq79hFYmyFarDbeN+jmW7hHeJJj7/QDHP2hnjTFpYNnRdbEtFgCvSuxn14u6x3xG91bqzWiV1Jk1zfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhrVZZYpPj1JyCMJJzn25XqXhH2NxPT4Cmkw4eFmZ7A=;
 b=sZkTRXu76w5nqisQRMl8COtROgb5nC7TTpfLYeKVIFLCsRLYNMutWB/+BvG2E1qxfTC9S4JHwEEnioNsH1Xfzca+TAlcavBh3n2umW4jIZJXAjnsz9eEz3ZDbMxe7PFQBZJiURmhLAgAMD2JDFsO1I6gxvGEI8aDXh5sjYcbIuzZAQWothKobSb/NrkoPXvfnUCJWT3vOEHbd5MMiokEeBPJ7KP8jLG/XDkrWcfkYi29GMM76Q+vAeAFSNVhQeleBvXiF/F3E3R/Xja/WDrAePwPtrSSw7i7K2GkhkFWZdijoHh66RHf4qO4VO7NL2dtPrO72R0t5h6y9L9C5dyJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhrVZZYpPj1JyCMJJzn25XqXhH2NxPT4Cmkw4eFmZ7A=;
 b=nimfZOwBwYk/x1yJ4bWnzjz/1GM9M2x9U8SUwpk6MRjX2gGr5pCt4/IRrBehJZD7uPR1TPKffO9hxdTp9xP6l/BhkAT4wnxT8QUL8C5aeKyp0bVzs0RjuIUgOon4AroRA/a6sz74NDI/8NeU62Hk0aYU7Na2PUiUe63xpWLS283OBnWmfWASOEoNKin92B6yI7YEIi/KJ1DpjTG9T7Ig8U1YK/39SOA4PDAJF3eLw77YLF3RZbyeWjGLSgLFI0blSG6givf4SLVVmvqMno4Y3NxIPESzhTQcIXy3KJ263K46fx5cRPye14tNzw9Lyz6qUtQmY5YzuJTus8ATN0Cb1g==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0061.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Sat, 16 May 2026 14:42:23 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:42:23 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] leds: st1202: correct and extend hw_pattern documentation
Date: Sat, 16 May 2026 15:42:10 +0100
Message-ID:
 <WA0P291MB03850ECE39A2FD2CC2EC365DC5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516144210.1658363-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0061:EE_
X-MS-Office365-Filtering-Correlation-Id: aa01a826-d3fd-4ef5-550c-08deb3595746
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|19110799012|8060799015|41001999006|15080799012|23021999003|55001999006|16051099003|37011999003|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TgYzzICp+lDbu6WKZkT8Axt9wuj8elhFmf1wSeKCPWMzuASzzFFpu8h0vk1D?=
 =?us-ascii?Q?JcIg9YxGXP3F7z8z7M3zd+Y5UhUhQ+B7eXlUDjU9vjtGDCRSlQP4Q4WeU0cY?=
 =?us-ascii?Q?YMuFzvOxJmXBgVuou6X2U5Wuk72e9ScgquUnT5EAV3Cw9mJ1zOJuHf0wko+G?=
 =?us-ascii?Q?P9jPUddNzNy8x5AWKBAlOjAJgBUDPSXw/2qsw/X6uYQP0vPi/V7CaG0L5R2m?=
 =?us-ascii?Q?xYQgwZ0kSnRmk4toNbXkSCg1wT1vAW4fDs1jvUkGOO/6FvbKvJVPsNwMoW8N?=
 =?us-ascii?Q?I/GScUPtN/gawfIG2fta8AQMlduxdm/7YS4FtDQidovnt69CIiHWGGhDg4n/?=
 =?us-ascii?Q?41DkH1SFB7uYClKj89VHrmrjREFRIgO2xdJc4/jw8RbpilmKnDrO1sysv2zS?=
 =?us-ascii?Q?BTI1FSgcmc694nqu3PMxC57HZlPDO5ATfVqYO2yP8JDO0/bHRyaU/c04uYLG?=
 =?us-ascii?Q?IjRfSjvFE3b5sMV/8VbkQhr3mmx5dTZ7e+fcfo8cvrZ7OzZaFSeqB7p5XegN?=
 =?us-ascii?Q?5oiPSAH5ozvYcZMplQbxy5kPITOxj6Msgj2I2j/m37cr19oKHCaHLXjrHp1j?=
 =?us-ascii?Q?5Nn1vV/J90zo5easir63xBZ3yweJtlXvNcBLfMrses45piTnb24YJFEo/nUT?=
 =?us-ascii?Q?l/ZXh/jpgtUtYmPjz7fYZ8fTN4ljSt8oGAwY++Zsr6xgzy6zuF/Agy+sriIo?=
 =?us-ascii?Q?4PIiijujMQByoH8wUVoriZ+hAdSTlx6u8TU/T7SJ/rpk9BA6IXbIt0Ztw9Mw?=
 =?us-ascii?Q?3f6ohGlb8NpvzCyv7Lh3PtXEs6ZvlNs5xsPXNr9XEefCA/D06PtR8hCR5SGc?=
 =?us-ascii?Q?DtU+Grac2cGFjIkLJaWj/eOE/dIPpX3fhqwGw7n6oieS5wqPZPAD8Dt7q3cK?=
 =?us-ascii?Q?rnvDiZvKZphc3v+EIbFv/8RqGBAiD6BswJwn/uQmEIcGGEO1Xo0u69QbpxRJ?=
 =?us-ascii?Q?uSBut7FRR9vvkAOMSDHIuX1WHYX/auKBBR4mAJg4drjbLAVuMSZWKua/B1Er?=
 =?us-ascii?Q?Fgb+QfBchr/Wrn6PhgEgt4X0tt+DCYr8XoOxaTE+u0jEyiYl5nvICj/f2uQ6?=
 =?us-ascii?Q?jUAchanL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ywyd0y+Pc8tYo7p7ascVyP7dfy+TqFTZLkI6p/v0B3XauhZvURvtYOR7UDLC?=
 =?us-ascii?Q?NtqNHUVbVRjHxiEJmEpQ2nvbkef0KGrb+37gk4KZj7/chetHngEQG392gqFB?=
 =?us-ascii?Q?81Fs5Ch+9uxO76BCY7+Fxyebhq81ipSlhTGun+QQ339L6wawK3P89eLmkVnU?=
 =?us-ascii?Q?SurY08f6gM7fMDk2r//Yv/APSwdRsWFI0L01q5Yas/KXy9T1cFX+8r8Jf5cf?=
 =?us-ascii?Q?rwihFaO+bSoYs8moEV2bSpP8MFRJrcRDGYO5NcACOQQiA6q0/RSbAO+R64pV?=
 =?us-ascii?Q?9Rnx5z6SmkUFHLmwU7feuHFkw32CT9ToD6Fcbu4UFYUnjc7cgIKrpAlE2XFF?=
 =?us-ascii?Q?WPH5gJUuGGMcItWgWhB0PVXbuJ6lH/9H+fihNtXs1c45h38+CYqOMWHp8Oks?=
 =?us-ascii?Q?SC3/xczEAAnvMVfAnoHiVm5i7fG0UfF1pnleRZKQiL7ZnUT/az6mCbu9915i?=
 =?us-ascii?Q?ZPfSmX67sejlbTZa4E/eVA04Tb+MTzyUqWU3N2rpBSxXKXbjFzGcd8nie9gh?=
 =?us-ascii?Q?Uk+1Z60GM/bg6ZrdXtIsviNOQxucQWE79pBNJSIaoHUWyUyWG+NsMJnJ0uQc?=
 =?us-ascii?Q?2/H47mza1WGA325eQFQoULb5hyN2HOrMjEZ1L9/L3KLkp8Qo4efHeCXWjeKI?=
 =?us-ascii?Q?rLypYlth8cNqmHNjskBE4f0WwLTV/RX2KAZP4jSDkOKISUUdUDbDX0f14kEA?=
 =?us-ascii?Q?KCBwizWkyPUxsa8/ZYcTfLfgAWifZiYY64oRdv8ugx86ewUsExGiZ/mU0KP/?=
 =?us-ascii?Q?7K5zbhcxYjqrbyAdPBKevSuMRgIeU83Csgk5QkYTRMGseW10ilwgLjY6cv9D?=
 =?us-ascii?Q?y4tQz3bAaWqt1U3YzvsVORne7Vp8wUoA6+iIXcrOWyZ0t2E8V/edVfHT/WU1?=
 =?us-ascii?Q?2vdsB9qfkrX/gaD8oHx3CzZwX/AHfzBqBkHHPe0T+9+/9a2JOC59cjWM6Wre?=
 =?us-ascii?Q?tdfYhSFUqoyxZc5sscSAuE9k5bMTp+qcRYbtGEQUTMFx3CDDmdJJeA5jGExQ?=
 =?us-ascii?Q?TPZaM6rYW5I/2h3sYME4CU7Ze/TaMKSjKp5y+ZDIcBV0asMyq7UUPciarVU5?=
 =?us-ascii?Q?efDtbhTAYPPu6rJYnwfkagbsGaXlsUSf46tLWsMfI4MrPFW5Aih92OLOBlFc?=
 =?us-ascii?Q?/PxoW1WwSGEr680fXmwC2KGJUj2rsRF2F3j1/AJCctyz/WZT0OGJvqxhMcDN?=
 =?us-ascii?Q?5fjlaoXKDFLAFHTHS3lHthxjwQ8Rbo5x7ZkFheY0+vt8xEFZgq4OtVy0WaXm?=
 =?us-ascii?Q?5SnUTO4TmAjaYXiGKCGRrgfFjGlUzcSwfkKXQ75nXuCa36UXIe7B2Yd9fHTH?=
 =?us-ascii?Q?PgIYRorlHZezA7Eaur+WaIiuEF5ZPZZ8yYRbI5LFIu5ig89d+p5/TPLgxD2S?=
 =?us-ascii?Q?3dvr+gU/sKu70bKA/qMWov1/+Jq2L4ENePz+hAkhEkOX0+WyS9nZurfCs8FV?=
 =?us-ascii?Q?EcrIy1a7D7e8k+AuEVue6qZKKFqzztWR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa01a826-d3fd-4ef5-550c-08deb3595746
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:42:23.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0061
X-Rspamd-Queue-Id: 9C2BC55C257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8156-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

Fix the repeat section: -1 is a valid value meaning infinite repeat,
as accepted by the ledtrig-pattern sysfs interface; only 0 and values
below -1 are rejected. The previous text incorrectly stated all negative
numbers were invalid. Also remove the redundant trailing sentence since
the behaviour is now covered inline.

Add the brightness range (0-255) to the hw_pattern section, which was
previously undocumented.

Fixes: b1816b22381b (Documentation:leds: Add leds-st1202.rst)
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index a2353549469e..ed32eb3a27d4 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -16,6 +16,7 @@ in terms of PWM duty-cycle and duration (ms).
 To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
+- Brightness range: 0-255
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
@@ -26,9 +27,7 @@ The format of the hardware pattern values should be:
 ----------------------------
 
 Specify a pattern repeat number, which is common for all channels.
-Default is 1; negative numbers and 0 are invalid.
+Default is 1. Writing 0 is invalid. Writing -1 or 255 repeats the
+pattern indefinitely.
 
 This file will always return the originally written repeat number.
-
-When the 255 value is written to it, all patterns will repeat
-indefinitely.
-- 
2.54.0


