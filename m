Return-Path: <linux-leds+bounces-8148-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HYuIAyACGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8148-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:32:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F555C15B
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7594C300A4E9
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD77175A7D;
	Sat, 16 May 2026 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Bj8A3NUw"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011032.outbound.protection.outlook.com [52.103.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131430648A;
	Sat, 16 May 2026 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941939; cv=fail; b=pg9o7jurH1o4scsH8CsVMtad/gI57B9DmcydiQIUrDgETChMBNDS719uHSGij0WAGIPEOHqKdRe1Xv94B39LjZMdFSV8q4XLjaEGR4z/upes/RI2M3I8vZrimEZFaP7sUkH42kgCbT5EYlSSR4Lq5DHiT0Dhj/Bj1HrsXs/uxUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941939; c=relaxed/simple;
	bh=A1ALRhZoKAPzyZvP+kDJIuWk6axFqUNc4IAOf5/leOY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eoKhwvkXm8waIzxA/+Xm5ggzXrg0sJrUpIyQ+lNZrmLarnIh7PWiV9VPyTXAyHHMgg/cz8ESYG7U1NGriwmqXX/u853bTM6V8dgZB96RjddjaBeaNtcb4ZIg0FHwGjFJyc0ouiegulwMYD5kJZavUfTgbZWZLxJr4kVaaE4E43Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Bj8A3NUw; arc=fail smtp.client-ip=52.103.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaqYBi9ynz6xb0pKDElCXExowKBQgKahi8nQquDyfj10g9799kyC5SNtda+xjUYQrkaNf8i+1ggxguLRdHXzyc6oM6IsQp/deuvAt8RW8FxxMInIRnj/3wmW+VW/QYp9D6kArcX5RQzMEeJdQ9RLZZy/c3KPMGmhvUSq3xJrqLpEd360+Vf2NtfEPJ2dXFKaVdIJs0bSUx7WTEH2IVD8SgtgNua+35rGTOlDlUEaT+8koacrC0WQ3iOCcaeptMKCodQX7W2uzMF3ee8ylGZDcVRoz1WAopCYiVlGhrYn2d3yAMQoAoL9io6b3uKlSFnmyvvtS7f34LguHpo00Pn1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2Udq71Fx+JyJ5sIJiO+u3uHbO15SuomXlQYDr4c2V0=;
 b=PrZxdVcscdw59kWJRfej91OXQTFirp7GqxbzjSiihZCSfME0IwowLil4MeN6pbvZ2jcC5vI02JNhlbKubt7N54uekcQo9kB7NFWZLHL4JhgLO1Z63gP5D+5J4aOEV76V3YpfnW8GK63E5HLth7l/u/7mCHM/HHXrMCrVGnIzJIp/lvAPpmVWuphs3hBXiUtdT0S4GYHMqsy6inRHw/cNL/zW+72r7X65MTPvqVXV+zYTwtKgRKQXXBtKbs/RV7cQIMIKtX7M0QznwFNl7/1Hmo2WV23MT0MMQprwOSamXzX2UUqC+u6WK/zIfLR7tTXVZB34KFNuArqeHdXH8JxQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2Udq71Fx+JyJ5sIJiO+u3uHbO15SuomXlQYDr4c2V0=;
 b=Bj8A3NUwO4+LxlUixAg/8sHw1EkACBK54j5PuLnqAWtEu+yCbHnmuQeMczsjmTKjS2d9qQ3X7Si6vT2okOeOMU3FonS0eJ4BW7YWHw8SuE58ALU1pkqbgf8KeksMU/Spqorv/voLEP8H4MtlaLBWZ+R05pkTGtLcHEkxtKypz+2F/bhsT1DSuSzjA93A01eeIv8x+krzE621VUViX4TrOUve+SYtRbk0AzF0WqfGdwT0i6fZe4+Gbuna5A1U7BVvpb5CtLagS/nB9ziiPg64rkRRoEbNjWlsbiQjNAGPUQESz4IhbaGuLjhd63Z7pcrdpDAFlXJ+FJ4udOKITRr69g==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0132.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Sat, 16 May 2026 14:32:15 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:32:15 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] leds: st1202: validate pattern input before stopping the sequence
Date: Sat, 16 May 2026 15:32:02 +0100
Message-ID:
 <WA0P291MB0385EBA7004080AD4BBA64A8C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0600.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::20) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143202.1612175-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0132:EE_
X-MS-Office365-Filtering-Correlation-Id: a2959735-8143-4f1e-8e00-08deb357ecc1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|8060799015|23021999003|15080799012|41001999006|51005399006|24021099003|37011999003|55001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dpzsh+6q/gP740j6mOoIuQQ+NCt8cABk1AaRKhxOHq8yu+ScB45OCss4+jwh?=
 =?us-ascii?Q?2xCVoeC+17C+TAg4n+9lIMmQrfJl9+ln7QOHy22yAeOtQtnE5yCQ/n61tgrN?=
 =?us-ascii?Q?6QOIsP52PrOxZm5LHmgZz89URls36zItvpDDkBbLmkz9O1EaIK+YTvzK2Smo?=
 =?us-ascii?Q?bS69BE2JzZNYQWYxCyDfvuU57dgUNR7cjRHVgMmG7nuHNftJI0S1Ne+Aln52?=
 =?us-ascii?Q?l4ZOqG0ZM97dTZiWcltzY3YTHYs1z0FcynAKAz/u6PHrzxfpO6pIMErEBSe4?=
 =?us-ascii?Q?5XfTb8Lr6m3v/QnRx2KrCWpwfS2rTxt06logtGbMHO1PA1ojqdw/EAGQYwRI?=
 =?us-ascii?Q?h1ynwaZio1ilqZc4COWctjlwUCVtWTeHfYg1DYY2x/rUhV8uXfhugnWDpYL+?=
 =?us-ascii?Q?lgU0BnAE5R+eB8scStygkhLYRZPBvzfXD8kySaIg3HPFBhzViSGrtgqD2O2H?=
 =?us-ascii?Q?9EtgBOqkfK2xjqJRwLXjYVHyEnXfi2cV4OuhgHfcokp/5eM4B0inMjcBdelz?=
 =?us-ascii?Q?uMfZS++lpwdDHsG6kgqgLklsowekC0xfooQuNXyFujpA34HFp4Gy7EXwrnCI?=
 =?us-ascii?Q?pZ1KLBsb/PixsELc+evfHLeyKmuNEavmhD3exgP3sU6ETF3W8oM0eTAAcPvp?=
 =?us-ascii?Q?mkYYN7fiaxkvDCn0iSOucgk/WakbcdS1SAqwmiRUQ6oZqDn4J+GJRg2YbnzE?=
 =?us-ascii?Q?T6hX8JT8T2rvA7JYXP4s5xwson0r1wXD8hTYmsGZYF+jmv+2qBFyK6lVNNly?=
 =?us-ascii?Q?uKpn93qAeAGGvZ6qtwPO0ea624M0q/IuIZtnbHBDm26QV9MLz1pHoKQ9nqyQ?=
 =?us-ascii?Q?CCN7otczBUQ9VRWC4sGk4S+2IlppiEP3984K3wklhqtlIkVf6MyBnS3wlE7s?=
 =?us-ascii?Q?3QRMubEHaUKqsGawlyxaT+VUAtNF12XuHK3kknIfcR2zIWyaApqSwaoRofdM?=
 =?us-ascii?Q?g7Sbd/LbQFBkz3/xEcCxFCFhgKf3/pNHi5F2nAO5Ackly4Kagjh4QE9AvuiI?=
 =?us-ascii?Q?/ajKwMINQncEStEb22yzYrlcVA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F20uGmXgOYOxMLX1Uvj+gxwoj3rMpP7zahLmhwOHFonhgevfTo0w/jjZsVGG?=
 =?us-ascii?Q?UNMCFudaQ1fj5qx/6Y+QrRsUalDvUwoScn9byR2+37kQNc00MdYOIa1iB//c?=
 =?us-ascii?Q?ieZCUinP9qNa9UCvKBVa5ft08Sh6R3e8II9aVmpLM85BLpo7uZgcBCddwGIV?=
 =?us-ascii?Q?rbB7ilYTYumhVnFILR/jOFKkZCq30BFCVCkOKZ1lpYqMvPH+B9tdlXRFcKMZ?=
 =?us-ascii?Q?txQUanM6FXQKcUdcYZh9w6n2EMMHX4OwqIdwBdiq8V1cBLALJhytJa3CdExX?=
 =?us-ascii?Q?7i3sZTGmt47BuwDhu+EGfLvjiHyhyi7Y49oFxvbb8fHYmKIYSJqsh79saHe5?=
 =?us-ascii?Q?x7UtYsLqc/zNmiiwC28lUiJhYVFbqvu66MFaH1/GpWpKVn7cso7vg9DCujN2?=
 =?us-ascii?Q?iJ7lXrsr08RvdogLIn6pXe6rNZxOj6sRUgeB9HUCiEJEToPTKy+0k13aYbLo?=
 =?us-ascii?Q?I5XLUgxlbPSJ9udhJtHsxT89CCKa/6XZkFtrJvRqSyriXVYY20ZOD+JlaEyP?=
 =?us-ascii?Q?bi5C7LKCTCZmFGE533OI4b8vFYqN/RC18jRkdsJNzJti6e9vgM9reOBbZ+tL?=
 =?us-ascii?Q?Ab5FpeIGBnj9pA1o01bwHKqP6hXEgN5hDmo56kHaf44UN6JA1Kc21rQhtILX?=
 =?us-ascii?Q?7c5Vautd+5P5cC5BwNpH8QkABOJrfoBL1CO715SPuauwD9vuMGNVJtn5qOY9?=
 =?us-ascii?Q?X3FFebPiwetGXEaeD2gDYqohLBl4qgEo7bUoY4sGcGGAWOeEw5G3baZRSvSy?=
 =?us-ascii?Q?f++G3yMxJwctkIKpqB10lepyDDhr5PYSfrhnc1idr3ljIf3ylwCj089YfK0p?=
 =?us-ascii?Q?RdHadWX13zQXGa2AcZRYzq/m5CRfjW1LE/Vqm2i2sTIY/jAYbFBZ6Tn9aZYY?=
 =?us-ascii?Q?tSPh3krLHerzzYujgHM1TN7Duyypg8JnPcV1nMazYlMBEufi8QlOTzKehJYq?=
 =?us-ascii?Q?2Hxkq9eXl0ca2n51b1Hxh9rKyzFbHdIoE5qz5HJTts9KZJuFDBE/deOmbDBC?=
 =?us-ascii?Q?Y8ecy25EZ1L3AyFBkWp5in4OJCzE78+lAu3AKA/XLbxLo8t7zIazmc8X5BcK?=
 =?us-ascii?Q?+t60QnKasLSb+GOaTGk4sD8TVXSI00jZGe7zAyk/kYnczP2Es/s2QiBwSFKz?=
 =?us-ascii?Q?LP6zvB72LMgfvGHfiZId3oPouidCka+mNS1lVq9ZyPQOUeGZ4foQi111kty3?=
 =?us-ascii?Q?/FHWHyWW5+KLXBBYXlX5DtcEE44Da1w4B0bLuPXYr6kwEaDcSxq5sWMELcYb?=
 =?us-ascii?Q?tBaLG2Fho/XDCfPYxwBe3agqhbAslv3DXJQaFYuIsN847pCgNkBAZRyuTFBl?=
 =?us-ascii?Q?YE634IYrIk98CkfqaZB/TeFdK1eWSCKP1MUS6XBGmxqDEUZobVc9pVwn9gOh?=
 =?us-ascii?Q?zI4+QNiJw0NIidhoJMyhJdzaOADMuwi9eW0AyYgsQKOoIGnCrNLXvJbmcJek?=
 =?us-ascii?Q?5tDaue4Ny8iOPql+5qn1ocyv0jpGE5hX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2959735-8143-4f1e-8e00-08deb357ecc1
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:32:15.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0132
X-Rspamd-Queue-Id: 222F555C15B
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
	TAGGED_FROM(0.00)[bounces-8148-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

Input validation for pattern duration is performed inside the write
loop, after the pattern sequence has already been stopped. If
validation fails mid-loop the chip is left with the sequence stopped
and partially written pattern data, with no recovery.

Move all input validation before the mutex and before any hardware
interaction, so an invalid input leaves the chip state unchanged.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 28e3f1e2314c..5f4238181057 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -228,6 +228,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+			return -EINVAL;
+	}
+
 	guard(mutex)(&chip->lock);
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
@@ -235,10 +241,6 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 		return ret;
 
 	for (int patt = 0; patt < len; patt++) {
-		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
-				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-			return -EINVAL;
-
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
 		if (ret != 0)
 			return ret;
-- 
2.54.0


