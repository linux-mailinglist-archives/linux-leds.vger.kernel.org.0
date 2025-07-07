Return-Path: <linux-leds+bounces-5003-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75850AFA980
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 04:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712E1169CF8
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 02:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC65B1C6FEC;
	Mon,  7 Jul 2025 02:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="Y9DbhobB"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5181AA1F4;
	Mon,  7 Jul 2025 02:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751854089; cv=fail; b=jUZRDeS0WLIcvLemL/1TaxHupJhyezhXaVBgA5XfqxQPyLSlB83ya/hvxA+RZ1QuiNLpmZLsdMRZhtzdwOUDy/C12MYyINdZJhSg7Hsj3HIfTsHrGdAowGJZSh3h4dAYsI0OeVGVMeJEx/plBPAESJVCwAS/IrrX+NuOman4pk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751854089; c=relaxed/simple;
	bh=sAT9dznk6xdJ8wAHAc16pIqXdlDdQZGF3+mwT24eCvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TX82SesCzbIoC88C64E5iETZxQjndQ1xOl0aPHA5HplehuSYqqe5bQml6JNTM6lLo8KLjeQYYrwJI1PHweto4K3nvcv8PZofCyVczgCeyKZXg5iZ5zAtUNdUOQiedB+0z235wY32pD+zKd/AiJnEwAjTvDiBfFmWR7MFkWLR1dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=Y9DbhobB; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVG3NIE9wdyu/elurqBZORDdiqukZ2r2ku0M7O4IsEa1ekfxUlFdCXKbpm9tylSsSPRTKo21hUBbY/XVRrgQkt58vgFdXBOh/rAtJoo5w5sw5DtrN4N5Y03sre8qs/GTWaGG7vWlnYlvvJWhc9YCnGqGOgKhdvxBxY9kHwHf9CLy+v9bmVc3/CoLtkTuRfyLG0kMwIlTQ/ByxOdhAdzay1mpCU9NN4B5F9ZgBFcjTugslmeVoEbqwhKPCtknxso8pshj+04MPJS+USYHTUQEqrFjzP5g+r8k7qbtlXALBoQb1D+MY+/OG7QW5kZU3ciapw8F1v/iYKMNUa7Dl0OI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm4V8Kv3ILDgB/mQRvPIEui+Ti6DBk5Zq4dZWHvn9jI=;
 b=UVRg0WUP0K2Tnmh20GO/vkIX6E+BO+67zYIXI/2dVBYNhpuYpMu9EBRRNJSCfnTIherHlp1XizLziPmntmvBp+t7KOYCJHvEomEbaAsV9PWf5uJfZUqM2llAz5JuS08jz3S1iCV5JWpDhn/pISrhFb3Cx8pp6jubCyQ9rQHqpfEd2A2hicWpJrBpssdBc8pqFkxUp81sQqRtvrk5fxpq0gr/7/1N4slMQB3Kd7IXIMtATIcawFd7fWUZV6wqTaXN/uHl75mX11G/0bnjWTKdDxtd/at4niwlbuGO+A6J1R2vA7IChKizmihAYPuqkEP8jZpMr+zl4emVuoo8IBGFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm4V8Kv3ILDgB/mQRvPIEui+Ti6DBk5Zq4dZWHvn9jI=;
 b=Y9DbhobBMbambLXHzoDVLi1tkhCglUT7MTE0IVSZACCA6NR1lWu4NmoumAssZIxBHLc2kT+CJ9kNFWmZLu/D1JLlUL2xmCBYfGmKM7OzYoV7wc82KHhicnOHqaJnDEbPtOJZWsn6FxhHm1i+kpFBmuhVl1iPgek9Oo86wMv+6+I=
Received: from DB8PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:10:110::13)
 by DB9PR06MB8041.eurprd06.prod.outlook.com (2603:10a6:10:295::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 02:08:05 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::be) by DB8PR04CA0003.outlook.office365.com
 (2603:10a6:10:110::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 02:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 02:08:04 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 7 Jul 2025 04:08:03 +0200
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
Subject: [PATCH V6 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Mon,  7 Jul 2025 10:07:52 +0800
Message-ID: <20250707020752.713372-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jul 2025 02:08:04.0349 (UTC) FILETIME=[F9341AD0:01DBEEE3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DB9PR06MB8041:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e483e033-0464-4458-4068-08ddbcfb1c0f
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wsS1Wc9CEcZu5/ASSN7qMLbzQd16NRxRpwyOIdjAKC7tndf0dMDC95FeTsxp?=
 =?us-ascii?Q?jK4GDqVjPPGLsWxjLGACvcVzWNT8m/KxbnboLcwtHFIVxm0JKIhiyePJXPwj?=
 =?us-ascii?Q?t1uZQUJnvU4DcgQaGbsZPlgIGAttqoIXQSXJTZqGZSIRS17LhBt5XOW/E5Zk?=
 =?us-ascii?Q?FP0K0OwqyO/2uesNZ5iSl3BHidz0iZA8PsZ4Ah405CYIOqcLmNvEhfYOsBxH?=
 =?us-ascii?Q?RXULZQtdt6SD5jO5Q7aQwNZjzVXIQVOrjvannFeIsyD0PnDm16WCfYqVMvR0?=
 =?us-ascii?Q?wpI5yuQ/fhfOiwMdhjNOdfPvqMicBXrfyokNEYqfQ37MXhY3s4TuhIarJta1?=
 =?us-ascii?Q?EHCIKLzaTKu7LmoW988fx9XvuzCubo/q8/j2aAJkgRFe70JyBV1uotuI+oKB?=
 =?us-ascii?Q?azq7Hejkgl6y5OGyuGnRxufvGGmRPuuztdyxo7/HEfycmQM/URAr31NXMUG7?=
 =?us-ascii?Q?P18EQYU7oy8m2ICEVtEADi7QfPn5eF1m2Clc8fmyjrOjlar6qqXKjaNJTFsr?=
 =?us-ascii?Q?y6IfeuM+J5f3BLzCg03mTS+7k979MQPTb6YqcclO6urQhq76IE8UpTnHBj2K?=
 =?us-ascii?Q?uTnGxATFYkWZckOSyzILlvfGP9ueP+NfWA9jxxAkv+oj7FBfQMHi5IeMYgeh?=
 =?us-ascii?Q?40yO8wAUkcaYA078s0PWja3X52zHrXJAAMd0zZD4dGhB7LP7tgweJoMdo/CQ?=
 =?us-ascii?Q?YYXEs4mrSP3jwh3/AzsR7CKXgy1jIx7g8yDt0iQruTRNiMgDeKOI5nsqipHY?=
 =?us-ascii?Q?61lPp6sfPBLUUzgqYBR/OkQ7KvyEKxU5c1qWajJs/AR4JyTektm6R02LaH0F?=
 =?us-ascii?Q?1J3GJOlcZQdK4WREJ2K0TWqVXeIn026B+kyv4nPERKfjAqpSF2oCgxFJhWOR?=
 =?us-ascii?Q?FU+NVZo189svVhRzWxRktCZhOQYYh2xz97qaZzkJc7nQBS/QiJONjpyKl1bj?=
 =?us-ascii?Q?QDSGIfePkaOb7Qc70onv6hFNUgAkzCCPcEKQAZo6X6WTB4XxFa047+QYAMfz?=
 =?us-ascii?Q?iRaxsc2yGt3xhlwBvVS8mCW0JxbeedBtxucamcOR0FaLFZfq8UBAYDhmbG7W?=
 =?us-ascii?Q?lTFJFiAYnx6sH8Zt1WO9Wl+lynX7BfudtDPOBvbMJPKPi1+IfpBCM8kYjIbm?=
 =?us-ascii?Q?v8RUk2sXwb0jm3LflcyVXc7UMhHwxGocVomzDFRnpRHciM8YNjh3FqJwuPws?=
 =?us-ascii?Q?O4G3FjUNkgNm4wToNcGP9ET9Z1t6pXpjBvWVlPsW3U0c4whzpc59mnnaBLiD?=
 =?us-ascii?Q?BbKkkjDO0mD3+dlAcnEsXyb+Kt6rbJQtK4GKQ8Uyw8ODO5brvaa1mgu9Kxxb?=
 =?us-ascii?Q?BOvQmhA0vAMFClwmlHBGLB/tAnqtlRVURHFieioLfXbvhm4I7tzfb4rTiQuj?=
 =?us-ascii?Q?IKUkSftJtEbFBQ/o2QiIplQxeRjuNlr7CFgebE/kFy3FEdNQ3irXHT0DHWNO?=
 =?us-ascii?Q?GTgFCv5IfdyBX7oINlXv+82vGhLczbhHtoYUsJuJ/RIN2p+7TFeyWhrnxqFQ?=
 =?us-ascii?Q?lwcDvgYr69DvcVH6Fn5NzOYLIqOjWYsnbJkk?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:08:04.8581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e483e033-0464-4458-4068-08ddbcfb1c0f
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8041

Add support for optional GPIO-based enable pin control to PWM LED driver.
Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Implement support for such
GPIO control through the "enable-gpios" device tree property, activating
the pin when LED brightness is non-zero and deactivating it when off.

Tested on i.MX8MP EVK with TPS92380 LED driver chip.

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


