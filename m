Return-Path: <linux-leds+bounces-6159-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB0C6271F
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 06:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0FCB923E7F
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 05:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F4830DD2E;
	Mon, 17 Nov 2025 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="MXbg/Sum"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168251DDC2B;
	Mon, 17 Nov 2025 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358321; cv=fail; b=VbRWHrgmAZmqIb+xlV74bbiCd9oyctgJYxMNZTLc2haOrwqXsMx8kvlJYNHmj21Wy9PGhobXb0DR8LSMdSP6IdoGiizcm3e7Vq83RbJSr+FTFm/X1QSGSorbpfjt5h03x3667z7aFbvfCKP1ZQeQKhJMctBjBST6sgNPPcSPBUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358321; c=relaxed/simple;
	bh=x73daAYdta9cFHukPD0qcKNwi06gMzwdEOE/Vxycai8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gU5y2ZO3QCQNka0XXHiPpjzecgf3LEL/OENbJIgOg4MBqWo9QUDFYdT4z0NUUZxkfyfN8xSSfEKukNzPg0KeLCUKj9ABsHWdAG92KxPULW/vro+5I/bSadeR/zOFGpEYAyqEJ+K1MoK4i3ECZFyUD+E0jWYFqfCWUhZs3aKNawU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=MXbg/Sum; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnaGQ9wF7oexbzkduNRA1Ir6FL/47AJPFM+L1fmF5hN83tkk6uFWayXsPB3O/hixCay3qJFWz1iXg9VRxlvU1E3fLF5HYfkJtW/UY/qHj9aY7Zzcnk016kifB5Rs03XRVVReHgr7x24MFoB3PNGmSBT7kRyaIXRY9tlI8gun+6iUkYMFoqCErt3jTjtxjVlCttQK5CI1qMq7TFuZiNJjzO9hqd6ic7efO2WoOH94xzNU90SIr7e9JDTb9Bnd8lVyhbneHyzTnJEzNgZrUmkVp0ZDq7KC0AnTY4beFYtZalRpWvEnAX51WRrE/ag4NaUrBMoOgMraK4roq+owQHCZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM12JDWBMCpaadZ9ex+6flIbhRi33p3cI8pTg42btHM=;
 b=RjdBmPGH0fBPfVsTodHIHcaiPlFmWx0zCe4y8OjTO/TuVYjhrcScV+v6fNF8A//6yS+wpbdqZeTfORD/xtaBSQyhZaASFulYIDdJE9aFqY7dL+Qrv99QtFPuO4hJGIecEqm/eeoFsqgdp8nR6VhfGhMimeT6cHWi5fW57oLmdFeKr3rEnUzMCMv2XFnSqJpYJvEn7UTMdjYUu9QiDpnnmGHi/y8Lan/OIuS1+Qk0aokrCAeDcy7DCzDvR5+chxce7GfVSljJ+fGurC9T57Lp35KJ1QIeZTQzlXtBl6XPGohqqMRgGkWr+goE6fTlgfBglWBTXUKuyC8N3s0dk2OP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM12JDWBMCpaadZ9ex+6flIbhRi33p3cI8pTg42btHM=;
 b=MXbg/SumKNShsOO+l7ZJ+UcemheZnD2mCD54UE1IIbAQk4/bTZ1uCjylTsDQyqnM+i50YHguH5daKcwfwWWTlfPA0LZIvyODqRMd0uuNdQ8m/sFw6lg2/uKUKp8Vxs2+hqL/5GrQQcvz4fZ8mOx+yxvdiFfxuDVveeccWv4VCP8=
Received: from DUZPR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::14) by AM9PR06MB8002.eurprd06.prod.outlook.com
 (2603:10a6:20b:388::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:45:15 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::c) by DUZPR01CA0046.outlook.office365.com
 (2603:10a6:10:469::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 05:45:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:45:14 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 06:45:13 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qing-wu.Li@leica-geosystems.com.cn,
	liqind@163.com
Subject: [PATCH V10 2/3] leds: pwm: Add optional GPIO enable pin support
Date: Mon, 17 Nov 2025 05:45:09 +0000
Message-ID: <20251117054511.730246-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 05:45:13.0944 (UTC) FILETIME=[58634580:01DC5785]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AM9PR06MB8002:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7980b86-d746-40ce-1ef6-08de259c7b80
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BNaVnVucmGoDzk05tjgTDCpHNxRb0ch7CYfyNQMwhnNZ3MLjiep/cToq8x1h?=
 =?us-ascii?Q?7cCjBvA0XE07srUmEKEQBylOq2qelzUfgysLd1AkgMXfl67W98hUzQKTXtAl?=
 =?us-ascii?Q?KJfiR+2EFipyebRcP/dFX4d2Yf43emjhg6i4HhC0zi/twDck1pe+TZSjoc7l?=
 =?us-ascii?Q?bUNunomJr9i/QJtwtqkOGGpt67A8yUzv+wt8Y6hd7vzmrTMW/QT+vgbhAqUe?=
 =?us-ascii?Q?kC962g3NWi3dy2YJwpfO2huWvZjjCNrz5mx1otNPkNZfMhB3r7ipKd9vO1vq?=
 =?us-ascii?Q?kpTnR/Et46XPFu8X/kc14PpLt08YMfHWpxrOUrQ6Hi7xL4q0meACcvSiXB+X?=
 =?us-ascii?Q?G2vgR+8FQb2uQeDTjtKx1v/wpnycaJQCPmSgT8ArXdOMV7SnvjglNbILf4aA?=
 =?us-ascii?Q?p2l7AHKn8SNgeyof/mwmv0YldMgwT8k4CvVRogjUMZnusIn3OCOkGNkIwA+n?=
 =?us-ascii?Q?Cvr/t2rAN2epymAWqRFaP4EOTR/kQeNuFRBzcJx4y8k1/zMLI9TW6ZYqnM7g?=
 =?us-ascii?Q?eeQTUFRsLzl2zqMipaU54RGa2qqCYGVzviHtskHkQTOetU5Vdw/fNvfSg1vb?=
 =?us-ascii?Q?QMX5IvgZuec7xCaR1/NtDEHPPHhXg8K8lVCi991NVKiQKcCLYjajAPtalKzy?=
 =?us-ascii?Q?Ci+ZnOCA0z1+fLbYmoLy/pWKeYTiilAqu25BHlybhvTQ9WnnYhUsXxwq5Mg+?=
 =?us-ascii?Q?ik6CLnFJuxgSQimVHkc8lGJge8c5M5VcL8vp0E3rG2tQzOvgCzMH0W5la4er?=
 =?us-ascii?Q?OvKxA5AbGoLPTZdLClKIuZ3gYB7bx6751csbJTfpHxyuUYJhJOUAMFbAZnEn?=
 =?us-ascii?Q?1DP86c2Pp5Cu5j6ILUOMwHdpiLwxO7fPCz8Qs7APT8KXjFeFKHUQRbeG8V/w?=
 =?us-ascii?Q?gkyXPLm4iGpi08kGx/DGWXTdNy1HXf7aqUGOKafaxwP+UCHGDTVfJHS6POmt?=
 =?us-ascii?Q?wH+SwyQcX0R8G1vV+aGZ3EZzILm5y6LRVpygTleK/RYgyJmJV2tgvfy0fhlK?=
 =?us-ascii?Q?1sxwXfILTCQgkaHb6+nCvRROvzorqAo/pbI18Cb6Hmt6ia2iMRzd9fi/oMCR?=
 =?us-ascii?Q?1/mqYQ/Oh+j4bY3WXxsya+7StZHlFUSXR6E42og1/OoeyRwudPp3vQZEZK1z?=
 =?us-ascii?Q?vm8Pgfr9inibWUMLq8dTX7W58iTn9PnmixgaPgh4md6I5kCkx8EFKt1zYtDk?=
 =?us-ascii?Q?Gn/lwEk5lDlr2mRcanxbNZ5eZW7Q+ra68NThEhhARVpQUccWb0DaYzmGchdC?=
 =?us-ascii?Q?k87i9G1vfrorEl+I8lSJHE4I1fodiM+IECmubtfnuI+MT80t4FEAtle4Vln4?=
 =?us-ascii?Q?er8IeUvRHMkBh7DBN18BIxblH6ZCWPeN1eqPbfF+dfwC1MPHxbJP/sOLFjdI?=
 =?us-ascii?Q?tLo7C+9Q6JCyzpffynZ8N6nhtQgov8OvsewrfEhWtuqYAK7UzPqOspgi4kHd?=
 =?us-ascii?Q?Pu7saRkhHVf6gj++pTBD6Jt0vfFKKqd0dZMRaRxZCfr+EWimHJlJ5FdKua0Y?=
 =?us-ascii?Q?Wcr9RiESgFtnHrrEHXTDUWvIjwrpPZ61beB2nig4agjjbBVIdafNaFEl8497?=
 =?us-ascii?Q?oBjNhtKv4nfAoeFo9zU=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:45:14.8866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7980b86-d746-40ce-1ef6-08de259c7b80
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8002

Add support for optional GPIO-based enable pin control to PWM LED driver.
Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Implement support for such
GPIO control through the "enable-gpios" device tree property, activating
the pin when LED brightness is non-zero and deactivating it when off.

Tested on i.MX8MP EVK with TPS92380 LED driver chip

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index c73134e7b951..dac96d91e6bf 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -9,6 +9,7 @@
  * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
@@ -26,6 +27,7 @@ struct led_pwm {
 };
 
 struct led_pwm_data {
+	struct gpio_desc	*enable_gpio;
 	struct led_classdev	cdev;
 	struct pwm_device	*pwm;
 	struct pwm_state	pwmstate;
@@ -51,6 +53,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	if (led_dat->active_low)
 		duty = led_dat->pwmstate.period - duty;
 
+	gpiod_set_value_cansleep(led_dat->enable_gpio, !!brightness);
+
 	led_dat->pwmstate.duty_cycle = duty;
 	/*
 	 * Disabling a PWM doesn't guarantee that it emits the inactive level.
@@ -132,6 +136,21 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		break;
 	}
 
+	/*
+	 * Claim the GPIO as GPIOD_ASIS and set the value
+	 * later on to honor the different default states
+	 */
+	led_data->enable_gpio = devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
+	if (IS_ERR(led_data->enable_gpio)) {
+		if (PTR_ERR(led_data->enable_gpio) == -ENOENT)
+			/* Enable GPIO is optional */
+			led_data->enable_gpio = NULL;
+		else
+			return PTR_ERR(led_data->enable_gpio);
+	}
+
+	gpiod_direction_output(led_data->enable_gpio, !!led_data->cdev.brightness);
+
 	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret) {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
-- 
2.43.0


