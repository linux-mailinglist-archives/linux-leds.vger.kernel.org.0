Return-Path: <linux-leds+bounces-4971-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3479AF68E0
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 05:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46320174BCB
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 03:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C623E338;
	Thu,  3 Jul 2025 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="NVSdRcj/"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FEB19A;
	Thu,  3 Jul 2025 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514791; cv=fail; b=qZDjfs7ZFGRypmc0DEVZ3Jj9gNqB2wFh1SguvBD6x8pwylaU/IsVBMg/RpETn5w+lOHrtxlc1sG78LGmxASEEZcPPTzRBhCocH2AGRWKoW7qrVIqYwfakf5AAB8zT4RMlfqf/0NbA67ef7JLHt65twn7kwjDXVT/QrVvdSEKaLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514791; c=relaxed/simple;
	bh=g7IJub6RSHQ12XQClSOZRNZn2rLOLCt80ZB3PgV/VDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2NQBx8e1E2GvsidVd7dPA6EPJVglm523TJLBx9h7b2Ov1aZqCuqgIvg/zEzMXHnXEGrDWHJB1QsmtZGQ5UXr+DJZufvf5C8taj3w8vhKvdC56BtiYV133QHMljFuEbqAH5ekE01Mlz0p5zaZ2p7WOIV4QQt5DZx9qXBgbSkiLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=NVSdRcj/; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU3hbwAJTW370TUapthmdXJ7UgokibskIpk4HD3pX4XrLdtm3vF2qDahP1OdFZbR/TT1pFc/RmR9bmJUHF0WXTv7prlayeVxa4F7bAr8iWr1ttDwY8WoqdoIgL3TmKGeEf3LTcWJEN1gZq2ralhON/YsfDIZt+UStN9e+g4XW3F3qwzHJw2Diou34mmgVtYxyDOemCDyMw+A9vgGpKvtXqSZc5m2sAqqdBenigkCLB9Row2oV1Mo0mb/9akL9oWzNfEW8SM5QFu3aKS03pIDdXK6vfHszQNMVnUvwiRmQW7CAYGlp+LiAdJO6DuW28tV/Q5WP3btZ+CYsrWxUeRK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aED4UraIwEU6CSgEltj8lbU2wtJe5aDx+H9f5aCqVtE=;
 b=tKFoK3u11R9wq8t/q2HESA4LrQVuD0jwIzx1o9jHiyguvPYSUWia9HyYN9MIBdnEmlysZG869nWI+GKBEDmercS18vQTngXlAumKfa18F4EfCwtqlJkFE6S9+xWp7XwL2rhqiddqQbfKnvhmoGsquMqo0v+d4k9YpqvUYjsOMRHF1eToK3rfgODtCjd0aj9yM9MSGwhg1slAwuKa1YrZeDYMUW7yiImISOD9aeRP00nuEhcSv6TOkD/s+OKtgXf2c5okDNqgkeJduHw0WvJB5vvWyCldNSd/dXtQUauF9CkieY4jZE6ProjbAjYpZA6lmjBq/I0PicS1k6BshTAIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aED4UraIwEU6CSgEltj8lbU2wtJe5aDx+H9f5aCqVtE=;
 b=NVSdRcj/KDJ5LyG2ILfPpR8aozGP3OXPthdg+pSuH9mJVnfSp29+G9fG2OcLkUEjyQBHCcVLQb9pHmDfW+rD1yjXTDT6wQVkuUEaWj6gSxK28GyeQXaHJZXRQncJQaOLTwgrOimzcbKdLBd3HIPka9bJ4Gksb3Oc1p+w1tWWgxs=
Received: from AM6P194CA0056.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::33)
 by AM8PR06MB7746.eurprd06.prod.outlook.com (2603:10a6:20b:36a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 03:53:05 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:209:84:cafe::f5) by AM6P194CA0056.outlook.office365.com
 (2603:10a6:209:84::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 03:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 03:53:05 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.182]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 05:53:04 +0200
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing-wu.Li@leica-geosystems.com.cn
Cc: bsp-development.geo@leica-geosystems.com
Subject: [PATCH V3 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Thu,  3 Jul 2025 11:52:56 +0800
Message-ID: <20250703035256.225289-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703035256.225289-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250703035256.225289-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 03:53:04.0644 (UTC) FILETIME=[FAD1D440:01DBEBCD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|AM8PR06MB7746:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d83e3c9-2b14-4442-ca92-08ddb9e51da1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WuwjKygT16ScjHHtXi9r5vUhh6Q1kzJkjbWXlZVnPQIH81uKJFm3oCGk3asA?=
 =?us-ascii?Q?EzZeux4G3+4kOr5qhYGKVo5vYuGh5I8d7L4yFneFNuhLH2S46xf5jg23FltD?=
 =?us-ascii?Q?NkFA5HFL6PRPhscg70hYUlxWPjjIBLmbqUrsSyEtmRDOSCk3D964h527XcQH?=
 =?us-ascii?Q?j7pFYWuzEyGEHZKc49m1iXg0rTIwnLj2j/Sb+9oKTDuB3E3VTv4STjNmq06T?=
 =?us-ascii?Q?vA3r2+XtQU8UKMyvl9x3EDkIKhTQjlVdA+MkM6+T1Kmy61GODVeHwZTdEgk1?=
 =?us-ascii?Q?+unPGbwjGcWpc5TXRIgQHRExSiG7eyRQuhStjY0d3OI53ZbqeXXkTTlDuavH?=
 =?us-ascii?Q?eoxa2jaswf9wGLVzHScCToFpNrOkm8KtDAWmdzMg+xZ46bpEbIwlz+OX9KMw?=
 =?us-ascii?Q?rtRkx984AbN3vVoAm+43uA848IKFgo9KgIXKpa4VtwRC5pzMFFkRgztJ9HK1?=
 =?us-ascii?Q?EY+uqsfNIdyjW6pqhELDG6Fj/X5aRV7fUbJtwosWvsTV08ouVTi2BxIXdu3K?=
 =?us-ascii?Q?jcZZqQwvvSP3Bznc6MOsVVup4mgMuPopSe4WpNyIhwtHXUlynQxSTDK3Go90?=
 =?us-ascii?Q?JJDkfMobGaAI2ic7wMiDUAWxk/zzXkEcOLHX+XDVhC7/kFpSvNZDhieQvqBB?=
 =?us-ascii?Q?IfRsinXBm9GIQaHpBaPagNMi7MSYwGUZnqB/FnfLt+txRnSs2yUshKVWM5MA?=
 =?us-ascii?Q?sQg1+QkJ1iL/pAQYnxvJJW+23tC2/CxhfLkbvok0EvzUVskzMuErTyN/4jF3?=
 =?us-ascii?Q?+yycAdJf2N9DTo8a25Ex1A2LeI4L3FYHy50d8r9kVu6lqMpRw2peOpf4KikT?=
 =?us-ascii?Q?Nf2/wVltVB0YKRiFSBrwnceuJZi2bxYWnBUOV2WMZ15F/W83b2CUVUBkSgPN?=
 =?us-ascii?Q?PLxgj5y35VUdTmGLz520NbXqcE8npFm8dRJl1g3VLuQozZqgcaHwu6KiU1AC?=
 =?us-ascii?Q?aI41xD892WfoTw6UhDp/fA3/XRt0ElZiMpAq8eXiLYM1G6OiyX4lqTVhqj+0?=
 =?us-ascii?Q?VthJtsPwu9Ai7NbdSIlBDYMQYJsXPlBbv69mM0LLDGa0k2k5fBiVgSxJCHSb?=
 =?us-ascii?Q?+kXHMn0VbS+PTuQf9x84vRhUkc5G8GDFEaeyDEOy3lMg2UBEEFkwqVgY0wNm?=
 =?us-ascii?Q?s2badBXb9bMuKhyvanCRr9pcKH1O0T/hX0qE2IWiQ2hHPM1TM2AStUuc50Pb?=
 =?us-ascii?Q?nIyN1wIpQ8GYmZv14CCGuvkEiK9LGkShYMqm8A96OU/sa6pSTj0ogk0liPcG?=
 =?us-ascii?Q?G4GRUUen3aeZSPdzKpmDrMa/+NK4Rt3mX6Pi+9reo+ABLSgNT0K4OVzx3ivG?=
 =?us-ascii?Q?LRVVStcjiwBueSoDTI9RAG3W8AObsJnnWqeJZy6AgpqqrN4L0ugP77eCOPAH?=
 =?us-ascii?Q?T8fn14gMizK/wL0oO2P9X+Y43VyWu/kKwNBafr+VyUOWpU2083d2wQ36U7uk?=
 =?us-ascii?Q?IYVpadecLhHRATZnufi/ADhCCFr8dlb6acx1bkyPwDpzti5pSmpLMRbk6Jj+?=
 =?us-ascii?Q?RhBjKPDUDY6s192jRypB829VMieIsTuDwCEe?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:53:05.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d83e3c9-2b14-4442-ca92-08ddb9e51da1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7746

add support for optional GPIO-based enable pin control to PWM LED driver.
some PWM LED chips have a dedicated enable GPIO. This commit adds the
support to specify such GPIO, activating the pin when LED brightness
is non-zero and deactivating it when off.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index c73134e7b9514..1397149464b35 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/pwm.h>
 #include <linux/slab.h>
+#include <linux/gpio/consumer.h>
 
 struct led_pwm {
 	const char	*name;
@@ -29,6 +30,7 @@ struct led_pwm_data {
 	struct led_classdev	cdev;
 	struct pwm_device	*pwm;
 	struct pwm_state	pwmstate;
+	struct gpio_desc	*enable_gpio;
 	unsigned int		active_low;
 };
 
@@ -51,6 +53,9 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	if (led_dat->active_low)
 		duty = led_dat->pwmstate.period - duty;
 
+	gpiod_set_value_cansleep(led_dat->enable_gpio,
+				 brightness == LED_OFF ? 0 : 1);
+
 	led_dat->pwmstate.duty_cycle = duty;
 	/*
 	 * Disabling a PWM doesn't guarantee that it emits the inactive level.
@@ -132,6 +137,23 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		break;
 	}
 
+	/* Claim the GPIO as ASIS and set the value
+	 * later on to honor the different default states
+	 */
+	led_data->enable_gpio =
+		devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
+
+	/* enable_gpio is optional */
+	if (IS_ERR(led_data->enable_gpio)) {
+		if (PTR_ERR(led_data->enable_gpio) == -ENOENT)
+			led_data->enable_gpio = NULL;
+		else
+			return PTR_ERR(led_data->enable_gpio);
+	}
+
+	gpiod_direction_output(led_data->enable_gpio,
+			       !!led_data->cdev.brightness);
+
 	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret) {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
-- 
2.43.0


