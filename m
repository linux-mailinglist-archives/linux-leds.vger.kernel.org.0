Return-Path: <linux-leds+bounces-3815-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F79A15A07
	for <lists+linux-leds@lfdr.de>; Sat, 18 Jan 2025 00:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1511883FD4
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 23:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D011DEFD8;
	Fri, 17 Jan 2025 23:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="csQCGSf4"
X-Original-To: linux-leds@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01olkn2023.outbound.protection.outlook.com [40.92.112.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C91DED67;
	Fri, 17 Jan 2025 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.112.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157245; cv=fail; b=GqWQqHs+PoudXrcn5AIMg6KCR/1X6SqSpIbGYQYj41lP2+qyEkMOJLNPze+KgknIgpGC73OOXCsDofUY1wBe6BAQKM8lIJypmHyP9kt47b3+8st0gE+ldF0TOzaiYuI5eVlYIGvu2UueFl+nr11id19HjvG0fS8yu3Qq7tTTzPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157245; c=relaxed/simple;
	bh=CeEs0tEqh2VHiqu0nnNFXcqlyix7Jwj+FjjUb3X6PdA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KiFFpkCJFhXAN6dQRhNjo2hOFKcysaQQNmKVAAs/0IbceMnVjEirZsWBzknOZU+kIERcYn482hxjnox40sNhO5863G83Pw5v1lbZr1MdNMvXzq2D27nGkjzqeHfqRYPryaDVNWzLVkX7IuqgEk3ZINax0EMUUWyPvt3FnKht5j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=csQCGSf4; arc=fail smtp.client-ip=40.92.112.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHWP/Fyr1yhBOpSZRZ5tT6A1bkUp7vkc9gXEWkUQ7LHL6fmfV4vKR8OBth9EC2i4ece94StEmOLb2xXcK7g+ZZl2tyJeOUWiM+QeIF6BLjNs/uVxSj1RhOyMCYnlClPnNrS4usI15HBiBADV7qOB/JJh564lnk0r8VSx1k88O6IjebJZosy+JYJt2TrtKUTbcEK/r40ocntvL6JCiqtWN5PHLYrcnhbapdvtWaxgccxmAxYQzjuKUvi6BMuAnqzy0Vh03PnnoKK2xxgiyyWa6jEHJVDirAt3hn/l17xFMELyyC4eooTVPLVcU3Dbd+nom+x5ORHJ3QiTqFXBw2YEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPY0T2zsvShqqsPZGHaIhc8jpaX8rvAk63Ts2YuoaZk=;
 b=tMIQl6hYrz/Xvi9s1onxwTFq7r6hF9oYWiWTNY/u0bbOJk/vbYoVdXTjC326Tj3jjMM3YDrfBv0ogcvg8OXN//DuTVEtuYYzgPfCVCdVdWYxSy2ORfuZzu+jZMcbBJlt+SlzYDjh5TYH5wBSmAHNQctzznxYDlDoGQj3JcYf5sor/aIfjwqdD8EKvFQ7Z3phN01Dad+4cd6cn3PLefZk7uTnVUQ1klGgHaxl3T2m6muVrPsV+F8T0U4aRUSTELRHQWE17fmzhhpIwSdw/dhJ5A505pqpRUYZ0J9MUhKrXTnkHUfeu+OMfk7eaPHdom5yMvBT2FeDF9aKB4bxDH2BjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPY0T2zsvShqqsPZGHaIhc8jpaX8rvAk63Ts2YuoaZk=;
 b=csQCGSf4rYJQ+YIvmZRiKwokJkHcI2C8b89UWsocD9ImmJ8DYfc73kPFzLfVX7YSBshaULHq8DEx8cYNzNkGIDJq5D07r3ZOFJGwkqIHlAhKmpXSgN7y6gyccKUCG2ZHLuuqZ2GR9MnvrLzI+90tP1rFVaRWtfTjcG7EsoK7vaO2Tb/CAgQYH0rIm7x32/zjY8P1tSFupuLtgnIIQDXsgJ9pcSugqXVP6p7irbEXGMjPRXyF4MBo3HOBljYnTHAxPV8rk4MmWxmgKFXtbZuOHkvOpVXDrrq9HNk0o1ckTjz/EhwGakoOemmTYEB8MxMuEHvfSkzkZhq0RblaaS8BIQ==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB4166.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 23:40:37 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 23:40:37 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] leds: Kconfig: leds-st1202: add select for required LEDS_TRIGGER_PATTERN
Date: Fri, 17 Jan 2025 23:40:30 +0000
Message-ID:
 <CWLP123MB547378EEEC657A79F109800FC51B2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117234034.670794-1-fombuena@outlook.com>
References: <20250117234034.670794-1-fombuena@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250117234034.670794-5-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bc8b78-d24c-4c55-a503-08dd375057f0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|461199028|7092599003|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRwLWODQ0HA1nE1uNYP+PA/DeTUsQbSOkhshSDU3B/ga+CS9qFX1+umJuj9F?=
 =?us-ascii?Q?lTnr96PYaA2Am7j7HSUMdpBvYm1cj4DRXnXDPbIHTJKRMupgXvl3ozg0ABPo?=
 =?us-ascii?Q?/UfMxjuXQQkyAQCEJosglvMhgjiMjFDBFUYgSo83FppBcZDgMey5+vI9zmn1?=
 =?us-ascii?Q?d+FUX6CN5XLYsuALng8rGlsaLE7JlgrfOua6c5db3XLE0E2aTtUNcvVeU/Ki?=
 =?us-ascii?Q?v0QL5AFn3tGa4DgQS3bPRa171RmOx+acglPNDPQKCLSTHojMiI/EqkaQ7OYc?=
 =?us-ascii?Q?yAstAaZ6NKkhO+NA72PWT7FTQAo45Z62qo3CXSE35RnlJa8R1Hf6rm+77C3j?=
 =?us-ascii?Q?vk+no8Md6vmFA2waNveT88dV5vYqCMB6PfJJtS26weApVucryJR9GuFO2xbW?=
 =?us-ascii?Q?n10PWFlIvJuxmwfmx/6aBkNo3Pz3S2h7ADx0kmTV6bZ212613640JtSecvPi?=
 =?us-ascii?Q?naboGE5QRvGmgkLbOR0wAXUvcF4CNxaUu320H/y8pbRXo+MEDrdW72TwFVUR?=
 =?us-ascii?Q?AzVMXYU2r2MejMOMSu6QVXA4cKY/gPO/WV9oGT6XQd4EYHcLUDTPHpPMqGHn?=
 =?us-ascii?Q?jRaSpgGhYJUa79eKG6eSI00B+4kYEGTMbiCS6t/JJsOOJ68e7ahRJJ5GBKfy?=
 =?us-ascii?Q?rplnVaDBZgAfYLj1unIYKQZuHH4tEL86dLbZEXlABq6tptg76tBWMKl/ASeN?=
 =?us-ascii?Q?LnXROAgaT0EAtvY2lQTNGDJDSqwJHdzdl4TFGm0Xh+xOdzDM5uTzQBaO8X/K?=
 =?us-ascii?Q?ElR34eANMhHq8qOEN3qvr/YIRSAO+UPcHcLmckrcm4IUOjpfcBeDQ7xtJkq8?=
 =?us-ascii?Q?rbAgMPDLSuNe2lQNF5qLYJ4oqEBzEiEoH9febrYc59nHJCzuPJcGfjAFzpDr?=
 =?us-ascii?Q?rOHzF0SyhdRW6HZfAT8kdZD5VyIDOL/gWrJzqkxTA+NCiV5Jn6t308RKn27i?=
 =?us-ascii?Q?lte5X8vObrtH1VESbfp2A98h72wb2HdTUeciw9uTRo7Ul8d33ewfAr1dLNxV?=
 =?us-ascii?Q?lduWvwDYYsY6YvbD3NFTgQVYvP67x4M42k6z12fwbPLhn/VF59Z85lcRA73m?=
 =?us-ascii?Q?B5qe03b9JB7x1/bWyh8dJS5wEOXazQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E8R47Qo2mw3bKQQVE36+lWnH8HX4PtZpXAqHK8aUj/3TkDEmzrNBHp2inVHN?=
 =?us-ascii?Q?/OdF95b1VX7cWnFHBtKGrvU/Po5r1J/JXNrybYtj/1lUDKk60P6PCzVBh/sF?=
 =?us-ascii?Q?BrIfUTHptLBmJhQA37KBH329icdJjsWar3JfKD+Vc5zCJbx/XhS7/VuxZI3F?=
 =?us-ascii?Q?3g57T9CY6aagFG+P5eKgK8etwzoC/YsBF7ELRxEfjYElaTXExuNOLf4EwXVt?=
 =?us-ascii?Q?jogXtXMwdZPP4u9tc5pIIQES4LqPOs+ql2x5j9HN9Rbs4gCdGF2Ujx7L7D/D?=
 =?us-ascii?Q?JADyD5e423tZDvjnQ6S8PjX7FHmTXo25gXoDhBNNwO2oCV0+7np0PEr8bjk2?=
 =?us-ascii?Q?Zq7rWQmGVf2sTwJMPXWH6qKylcENJ3ciPYBdgQGZM4FL5Rrz7jZkUrGW+yoe?=
 =?us-ascii?Q?S7dPOMnA6HQufdTkKhZ0ni0BBWjU7DewcpoAGbMjGxjD61k/h4aRg5QhAyo1?=
 =?us-ascii?Q?61+1YXsRxouMsuHNVIpt9v+kl8DJ5fb+nvqj4otteizidbQHgjuLzO3nJBWp?=
 =?us-ascii?Q?qfH2y2S6AawL6WTr0q1AS8Hv7h1OOwtCLHLUN6zYvLGOPQLdPXt+zykqy0F8?=
 =?us-ascii?Q?z6QXqFDjxI//P8hqkbCio4hIKkJk2kvkcXNhRSK6827sXnxg7G1SlQgulvgw?=
 =?us-ascii?Q?clyQ1N2uMAOnZCF0cUIIan9yYDWTvwLQ20LCtTaiQeST0Vj4YTF7JgiXb/X5?=
 =?us-ascii?Q?2SkLHBQqbGCfaI5s6aIaPCJ44decqvwnaYsqEvlVWkVR39M9YJ6UQhe93vLi?=
 =?us-ascii?Q?RQjTAV1b0k2VEcK8Zrf78izziUT1jQ15pj96gojygtHm2b3I2owkx6XV7EGd?=
 =?us-ascii?Q?+1fYFbbJngpcmqNQ9dVwSB2/HiRFclQtQNQPKuYi+YKwtqqXeSYMv7WbLwaw?=
 =?us-ascii?Q?se4OJ4y5mKw3q+aO30SGv85/iO+OeWeBa7SsjZNj5hRHBy04ILJNPKSNq8l3?=
 =?us-ascii?Q?lY4Q7pJrARR1UGR+Rqnz210wksDxOZUnfQ06VCRF+5RhjCPRUV2SqRKlh/oN?=
 =?us-ascii?Q?lTmmoqTR+j6ZjvPugN3TJmSFLXpWJttrGxlnQejM+7De6F+XT8P9w7xzHsEm?=
 =?us-ascii?Q?FNW6TwxDNK5JIrJsCeCy8/L5bhtYaltkQhiiEw/DNAGvVYV1jp6EvL2ttXPo?=
 =?us-ascii?Q?aUBFZuR6mdzELTBwASrup/qUaqkM4qCedkqsKAox0ISdZBxPu8tN1QxSbEjT?=
 =?us-ascii?Q?+5k/Cx0EpmJHGeWA/mBOfALnhWRZ2ZoDWSvkB66sSFpnWtXtXRwljBTBG8jU?=
 =?us-ascii?Q?cOpxDoe+HW3PPIuTpb/gnzYicSa0qhjnIcqlYmfmUnIoGcPo929lWKDsaYT4?=
 =?us-ascii?Q?D4s=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bc8b78-d24c-4c55-a503-08dd375057f0
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 23:40:37.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4166

leds-st1202 requires the LED Pattern Trigger (LEDS_TRIGGER_PATTERN), which
is not selected when LED Trigger support is (LEDS_TRIGGERS).

To reproduce this:

- make menuconfig KCONFIG_CONFIG=
- select LEDS_ST1202 dependencies OF, I2C and LEDS_CLASS.
- select LEDS_ST1202
- LEDS_TRIGGERS is selected but LEDS_TRIGGER_PATTERN isn't.

Add select LEDS_TRIGGER_PATTERN to Kconfig to meet the requirement and
indirectly document it as well.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6efd514bfb48..b585548c51cb 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -960,6 +960,7 @@ config LEDS_ST1202
 	depends on I2C
 	depends on OF
 	select LEDS_TRIGGERS
+	select LEDS_TRIGGER_PATTERN
 	help
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
-- 
2.48.1


