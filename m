Return-Path: <linux-leds+bounces-8155-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCUBEvyBCGo2tAMAu9opvQ
	(envelope-from <linux-leds+bounces-8155-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:41:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A887655C21A
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07E28300A7D8
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D94A26CE2C;
	Sat, 16 May 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="L0XHx+I1"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19010005.outbound.protection.outlook.com [52.103.53.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18213957E;
	Sat, 16 May 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942454; cv=fail; b=rVWV4a2yM1c5xls3b0NlnFA6syR3deITkRjSyXTpjn+HvF6kWI8S8W49bd3HqFfnApSzlpBJXykpwgCaBC4SKgbv8GI/UJzC4NpfQIsotwa7fLrK6xIQcEBqPhnwfLJREFBkcLDmvsCvh001FaVArulxcqRCehdV8fLftvy4zlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942454; c=relaxed/simple;
	bh=qAD2X8qlfIKCWXQkcwlcS80uoJxGRIy9oBW16ELni7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MeIzvRjq00dWxOKmeiv+F+MEifyLfzoQX3pHqBDW84lidX/FJj+WQ1jbjHyo/NC9lnN9F62LYxlF/BEHy4CN5ZMq1qQY9QKQStb2zEvLa08mAprGawBKoaoylTwe2U8oAJJAvkZz6fdMNZl6c6XEye5FYttsbkyKGrxD9fvJ4BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=L0XHx+I1; arc=fail smtp.client-ip=52.103.53.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqJKF4ciZyslz1jEnSLUtYO7x/7UNihGkBz0h6WfkTdfRG9kBBwQzId0dcvu8jb/1FP7V0ioW9YUOATWCka4CvczHusUiPzkVhqylfihGo4ENJUDZuMo5wNibk83Pgr0kzzVnByLUtimeW1FW6t/hdCmZMrHil3lDYfH7R+Eo+eXCzAe9as7aEzPra8pXUVxzYNnyEik2scQc3FrrMPAbgydRsCVxWHvGt3sNQgbslIpeUmAlCs570hCPriFK+SLBMol5cy8Dk+olFvbsF+iDA2pzuR9UC6SrUgoJc0WDb7v9eubyYaFaQw+wnXZNTf5KwbccxQfYJL7XLR4mlhA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW2Xc39MAvnYk3TKXNpIpQmjzwz71UOAOA9Ni8Bb8iU=;
 b=qpY44fPzCgeee/fF8tGbKC4XrvKWas+GtJ9jAx9RNzbiPloQxL0dlVAYTsPCn9zgkHw6wW5LJ+gUORgBJ5dbmFQvNY0tdUe1J8LC5z8NGfrE/SbkBQEEbVkbZs+GjZxdgWK/RR3QkTFEJGvBcJuGbJuKSjXLjytlU/s2NfnJqIdtMhPXnHPkcBt+XGJjGj8//BGJ2z6imP2BmbSOLCoOvoumLo95k4qWW/LOQx+d38fCq0uNbiX4FxgQyIQDqi0hl5cNezIPkercx5I2plwrgnPE+WBZCLIw5bSZ8cEkTw8g8zk3nKaIfgEBS+WnLzQsovGZGrg7edCdz7s4hj9Xag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW2Xc39MAvnYk3TKXNpIpQmjzwz71UOAOA9Ni8Bb8iU=;
 b=L0XHx+I1kNpSNc4+Hzp5cnJvmLXKVvermAyXl3jlqrnMqeOO+sIpEgHv2j0MFYMnXD186LtAgBiTED993bvIHlGyBKbGv81d4GNGgpMvhlkMEkbH/09QBzEpiyzyffSIlt3hWh8CXwbEr/vGzhqg5ARAfGTB7BCzNwtE3NgjDD2mVAUdeliyK4F4tCHDjRoXT5N5rCVpe2WRvYzZ+2lg4NYlb2Y6YLufUebyVnuo2Z4cU+Hg8IEFEseY0KDxsW3r0o1UJ/8DrRvQiMNeBvamE8d33xUmjF0EpUl1njEPL6kSwZz3Nxu2fUd4l/Z/KKJ50CllY4Wga5+2xHW0d/dPpA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0061.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Sat, 16 May 2026 14:40:49 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:40:49 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] leds: st1202: disable channel when brightness is set to zero
Date: Sat, 16 May 2026 15:40:37 +0100
Message-ID:
 <WA0P291MB0385B176D127BDD50A525745C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0077.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::22) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516144037.1651142-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b465826-3eb4-4cb4-f02d-08deb3591f6c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|19110799012|8060799015|41001999006|15080799012|23021999003|55001999006|37011999003|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VZIppj/r9xayA/GpS4CKEFYYbZatpRwO0LjslrkKi/A9J1mpyp0jE0gUBf1d?=
 =?us-ascii?Q?PSsfrS0ES5hAOEj8req7hYS/XwCaZrNdvCN7Fv59nqQd4J5vpgd5PiLPsZqE?=
 =?us-ascii?Q?TPyta76PvvclZoxMwgxyGtisgLzixSYzdVb8JJGv0aFvJOXQps7lkuUkGKfx?=
 =?us-ascii?Q?1WdTY+7UGNX+I5vU3nw5QNNkEeohDWFRl5rvtquibFYNXvfbi+bzw+o0J0tH?=
 =?us-ascii?Q?Lwmp4szkeGV/bhfsOQ1jHegoz6wcGAKXIquLOQvTvIEzYUiXQO72OFoiC0z9?=
 =?us-ascii?Q?p1zO/mmu3k12AsyCYe8a6bdTILARuhg7o8as4RGuTS2gs4gGMXtVL4W5gXVX?=
 =?us-ascii?Q?bspMlBOv9jJ+wHwPkoccIVNsr0NsyKpMwTpdboZGge6bhcfMrhU/HrKg37If?=
 =?us-ascii?Q?umtDI112wRXYsBC/DjEIX85EsrcPxoNM1RtsBW2/KE6bWgu6HutxJ6T5XuUj?=
 =?us-ascii?Q?sYrh3PZvO+YCf8+dMhLmgaIqxuvChoHxWxNEbOsbitdBomKI1e8ECxNmi8Y+?=
 =?us-ascii?Q?WRpm7MX29g/mEHW1Scc1WRnHKfrY041BPM4GmF5QmFiWZB5Dw5rXtDrgxHHj?=
 =?us-ascii?Q?kABzLCvw41j3XXFmVlnDKaVJ6pKk5mlvthhIz2IsuIFJ4n/gnyjepvVp7sV8?=
 =?us-ascii?Q?qQk1W3Ds1l3xdrggPj0e9gxHo69nLWcRSsyMI22QhaheMaktkXtgCc2spLQs?=
 =?us-ascii?Q?ph4CaYSe16bCtKUMEnMWvYXv3ROkBdWmV7L7f90rWEGe99uUe76hNqAB6r38?=
 =?us-ascii?Q?gerdhB/CH+YXeRRU7SwVuaASuNQFtMFmSwsDHMvt6c+ReFi5dDGOg6JJaCAZ?=
 =?us-ascii?Q?wPqRIaxqv4Cu2hs37mfsLFAwjaCQX3zuLqJdXsprbNYmktpPDd1xSCAZDDbw?=
 =?us-ascii?Q?7/HZ7wr4pOMT7ia9H1e1OmHYSxitn9IZ/hFGdZibAnNd8mUBrvgjEaxVTpUw?=
 =?us-ascii?Q?oEXzUtWkV5tqKNXGfGHDolm3GatTMC3ug04RGDnjutwBv/0HlRWR/JwU6EsM?=
 =?us-ascii?Q?BJGFNlwnC8GiWJYPliDJ/cUE3oxFjiVyvJUKFo+LrtK00pM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zAO0E+oPJUU8ghG+09o6Y1EvbcTozR5R+c6ZwK3lqGStmhYa4i9RPKgGWMtO?=
 =?us-ascii?Q?+JtCZn9f6pfkz18DA9N1xs0khCsVM7jJkeNDe2VWIgwKdfAUEMQmHr2pna7t?=
 =?us-ascii?Q?rKcgdHAZaGPL64nfKMr6w+wgRclKdKelXYTuktNu+krq1ZERzeGE21wN9qDG?=
 =?us-ascii?Q?iuXo0NysbqO9KaaWVdqWq1CBw3ZU31frPl3syDmp6vJRDsXyyqlaDXZc5S52?=
 =?us-ascii?Q?gmtDIZhOnqMifJHvSIfMy8B6PRLao/MvcEjrWoPWCE5NNn+BxvuKO8YCy/j0?=
 =?us-ascii?Q?J62T6m3l94/Bzr54CERWl0SQteH0snRwfJmic8d5gULt5Uz+CLuWRoBXGWoU?=
 =?us-ascii?Q?ViOINhuGaCTMxPVCVGPtj3zjdZTsicY/4jxbx6A0rWsDx9QSn68BR5ncLqXW?=
 =?us-ascii?Q?yrWvCzf0s1Q/nGtaFZ2hXNRShujcJVSXUCKd4YL2fB5noJwWU7adVNk8+YHh?=
 =?us-ascii?Q?8pKB1Guz7XBsn4eu7CInBZrjI3pcnh3eKqxAlF09TYzslnTpYufn+ApUQlA6?=
 =?us-ascii?Q?SPYYquFrF34WCFjHGILL29vUCxNZR5wsvXlP/SaXLBD7P593be+nM6Qg9EzH?=
 =?us-ascii?Q?4itq+3v0FTX1UTxhK2RBJEc466Z/It2+caqjBzoOYasS1CeTrKSnRjySInqH?=
 =?us-ascii?Q?WADnIt73aYzq4sgZ1OnLso3gMbzggkyhYvUomZDH+9Iyt7HAYU9PMc1K9HJo?=
 =?us-ascii?Q?3t+AI0j1effhCvMI50mpmA7ywZRyjavTzPqvlZTFH7a5DgxKacFXj2AvNtI+?=
 =?us-ascii?Q?kPL9rR7DQJ6kUKdOIrBO26/uFQjgE5ZY3L/8fDXVoRyJVGdryF4S2xXHbZMO?=
 =?us-ascii?Q?rfGUDQVvcNrvkjQazo3GqPLrJeeza/EfMYHHSOOXHD4XgWERHAO60Po6CdcR?=
 =?us-ascii?Q?y8AIJSbW6M9jx5/rkhoGba+3h0+joMqNrk0jlWvMHI1ojrzt6b6R9BsiHYsP?=
 =?us-ascii?Q?gxIydRcAN5DORy0Uo6Mx7Jr7nKGZKNh/Gv0cGxW57AkIgxZ9HuV+Sc2qM5qb?=
 =?us-ascii?Q?zfDsMr0AU+p246RmuNaqD3Xfa/E3pwalfD7zmvWcnWWo+n20l7ngR7Jk7mv9?=
 =?us-ascii?Q?TygwPqsJ++bk8K+egFZYBSb6WUADUbRVBhB+bO7WPlebo8xj14ZBJj5PoCha?=
 =?us-ascii?Q?nLwZ79dsrjoX2MShehPNzBJwrcL4xhob79wPyhGvPGgfV/0LjVcSDiwElR+H?=
 =?us-ascii?Q?CCTm6e6y1wM2CHJp99H7/V/5sXBja8MMtRMLCia6E2HqwhlVftZcTDXq/FdG?=
 =?us-ascii?Q?uFPLzY75yKwHGV+CpDAXIqoIG5mnf6410nIhYPaxItMhztk9giX0zZnucfpV?=
 =?us-ascii?Q?rGG22lyTaFpj9hksv4irmvbtGQ25xlgC03xvVgS8l3uaEQHWZWdEwJJsjO31?=
 =?us-ascii?Q?DF4xSonpv/pGUdL179wS/xg9PmLyPyKGh985XI5v+9Tl/jpXzKZHXv3KU1r1?=
 =?us-ascii?Q?9CJDhVmjTnibwXjYXVVskDTaBF+xYOCU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b465826-3eb4-4cb4-f02d-08deb3591f6c
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:40:49.6550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0061
X-Rspamd-Queue-Id: A887655C21A
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
	TAGGED_FROM(0.00)[bounces-8155-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index bca2d9a80b63..a3f9057408e1 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,38 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -187,6 +160,39 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
-- 
2.54.0


