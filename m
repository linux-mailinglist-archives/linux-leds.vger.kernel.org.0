Return-Path: <linux-leds+bounces-5119-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F613B102A8
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 10:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 860A0AC5C65
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 08:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34393272E4C;
	Thu, 24 Jul 2025 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="tk7/7LQx"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158EC273D86;
	Thu, 24 Jul 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344161; cv=fail; b=Vp73SxAc6rXA3dXiWYIfRcvkHYdCAiiT0sIV4GW13/V7O76EwR+Zv3fLN+0nbMIth4zmXBDv1fhZmsktogZzErn1JDYY5rVhhxAHo7lZE83Z6eUrLTLWjeerE20rTaBd/m1W8rrapndgxRGOuWIaPoU+E7cO9ULZYcDT6wqKPvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344161; c=relaxed/simple;
	bh=fwSizUpSkqsnZx5PqQ/dxN4Pdii1OKCwjFrF7t2a6dQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oC6/ahfNoIiNUjoDOniwv08PtUXps5huZqUOEmjdLBuc5gzEAG5AnDBRRuSfTS8Aad7BI6MlPXCIQvwvHv+yybTUnb6hl/fXKXgrA6Vz3f64+neuP8LLnbUhZbVg1W2J9pYboOMJ3+8wopaogmHEOzVnm/92JqW4AykIzsfbdlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=tk7/7LQx; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9KgkdYE8qFTgRqC3xX+ax20RsmlmMbt2BqXaNByRZnj+YvPIYtKJtxjTxVVHWNhLqRuagBZsBKpzZxYXXsiPrGKLwq1SeB98Y6Lq6Po3g0teBMYTk/Jjn/H1+b/H5QjMjnHZraj1YfELCRAevdZC28ECg0UTlNMqW/GkS64LMs0oXiJyLblWwtxh4yS5Tj0C3j6nPhfZzgfRYr2v1CgOOJ2ylmq55vCOEIR1eNVzfvhMx9uR5xJaXV7dgTTRp851i449WXvzAkNQ6uUCDCLKDG2nMfdaY3/vfPt0f/FIJLKBCtCEFHG5FyoVyvDtBcDc9u7Kh3ydtmAvYjorRczlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnCNIOfn1E2adG2rM9z752G9+Fco4Niri/25c0/8rM8=;
 b=ZOrqjVGcWZItgUF7/Ia+xyJHjOM3dLJsdqk4fLshrpJV8uvGHTlNF59IoMnOMrWGh4CX8Jk5SbevClMPeCwcpBje5rRgT9/RuufH4wNC9XznsVe5jAyvs60eJUwCOEvu+qXjuPBnxFmSjPK82MNWAtr6JbtGwgbK6GOZGlQPp+62XhFNTh0IYsZEmKWfwpMmRmUi3FOmdGgjf1nhP3F3WP+Q0VV1MD4JrXbijEHDcKsQRs4JktR41L551I4khrsMOkEo/IELQ3q24Tyif6SzSrEeZpUwZpFh10kcTvrkS54Xl7rBmdGrGcFYGpNyJ4O7jyW6LEUWpBil8fcDRoNO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnCNIOfn1E2adG2rM9z752G9+Fco4Niri/25c0/8rM8=;
 b=tk7/7LQxTvXqoG6OFmvagliIeUsPh9LDZ22WNGL7PIyWe+ahD3bzJ1TT+lOzY3mgaBe6O5QTdMDUfDZtYX6zxf5uisUSqR068adPtUee7bR30SQg9gMvztkuvKHDw4x1V8jSKD4a3dSYMaT6PwhM1GMDQIZkQdHUcc72ZN2zX0Y=
Received: from PAZP264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::8)
 by VI1PR06MB6479.eurprd06.prod.outlook.com (2603:10a6:800:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 08:02:32 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::7f) by PAZP264CA0046.outlook.office365.com
 (2603:10a6:102:1fc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 08:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 08:02:32 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.42]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 24 Jul 2025 10:02:31 +0200
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
Subject: [PATCH V8 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Thu, 24 Jul 2025 16:02:21 +0800
Message-ID: <20250724080221.7562-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Jul 2025 08:02:31.0691 (UTC) FILETIME=[4E8CB5B0:01DBFC71]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|VI1PR06MB6479:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd495326-da11-45a5-54b5-08ddca887156
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T5vJklXhIsQk/w3m3iCU4e84MgqB2KJaEzY1OKL0E/txh4N8rG4Jp32t+Eyx?=
 =?us-ascii?Q?A0+DyC9Z+As3e6nWBU0jAyKnMU8mp0vW4lbSBgmOz/9671c4+gr6Nb4jXgDx?=
 =?us-ascii?Q?ylH6QJ2BQTjgmXPAqphPCJbAmxlH4erN2iQyThl2fcHVyu+kONXpj+d9NONr?=
 =?us-ascii?Q?Kn2jWJLDYhcssrXduuE/FoBNxO38WA+RT5gcRgLhc8jBvnqFHxeCTo45jLFH?=
 =?us-ascii?Q?2JeUatlhJX9em7coUQV8EkH5kq1eMNHurCgjPCJaXIItioETk/C3LqsYp5n0?=
 =?us-ascii?Q?udAYjYAqmL+X8vReGrqUdonjXJXqgT/DljIpCKusnOjKii64KbCowHjID4dZ?=
 =?us-ascii?Q?Oh03T8LWAUHciF0gqPOur7vGMeiI+VzmFSAgghMmYhgsABei5lFiF5PbfEMF?=
 =?us-ascii?Q?W8xXrWcEC6h2ClW+a1QbaRI7I5OvorJQLx48haIJBMFwkPv+5xgqhh0uYt6J?=
 =?us-ascii?Q?0bXLGMJqHXxfBYHpq5wQYwEl7OI8YHHCoDhQYn9yPmC1KpkA+GO/9aAsuUXo?=
 =?us-ascii?Q?mveKMG5zdAwOnsbwCiYQ8UsGppQfFkTxNwCMJ03AJ39hZ+hALsiKzkUSJGUN?=
 =?us-ascii?Q?WWkDOb2Xm/vvAjBwELfA6WJz8Qw8dclOpwhvVp2EfSjshkdrLiXqrtaFZJ4K?=
 =?us-ascii?Q?NbdNvIUTyP5hURna5u82++EsPuBHQB0fNaODbqDZ2ghfs99ugtXAuvrwUrqG?=
 =?us-ascii?Q?QGvg8aHr+vcK/MGH656/Het2/Dts+/+47VPphP0BJE8K9pn/DemVrG+oqa43?=
 =?us-ascii?Q?Qz8awuY6KFgTRgsKdvyLngY+oV/Ax+bm4C59vqfq9AKjrHnUMe2xeKebUh/v?=
 =?us-ascii?Q?scNpFTyLmDip8Idcm7Jf6nYja9K3VmQPvTHM8owHzHeHniiU7pgexUb1DzEI?=
 =?us-ascii?Q?mSjC/mPG3cRAWTX6YZ6MJRj7zpYskD9HFs31X8wkP3BxzBWrra4pD0Ib1Djx?=
 =?us-ascii?Q?d4jvSGMFi2fj2IjmuIFM0mbHqg/gMSLHfwHUw550dhWoYDQy4qixDRyFpTCE?=
 =?us-ascii?Q?x/LRRQsuiDKYFzgblsaFBIqJgvpJuRRDKhWynz1cF5nAuuWgwNdtCORr7UvL?=
 =?us-ascii?Q?/+DCEc3pkcAX/AoiGBOVdrGy6u2yzHktu2NCfxfarCFNa9BdyJzT/Ixw5uPh?=
 =?us-ascii?Q?sewm+lPxEAsThrsHQcISpeAEZiLJUug702uW1ud+MeKxbJ8hmITELyFDCOca?=
 =?us-ascii?Q?ocYB+H/QDF4TlHpEf3fdUOFbUcIyvTtPQn4IkUE/dveI7lj6AoXJhc/Zxcwn?=
 =?us-ascii?Q?vzoSelr1cfcJMFFQslU5yWAU/qR/+VerljTbVQWq8p6SZKMto3EKuyctsndN?=
 =?us-ascii?Q?I1BYTKMYbAIWhvRPakr8flokSpdJiFGiqxFzLOUfLk0SrCQbb43kNVf9eDxO?=
 =?us-ascii?Q?bFmznTs64wofJQBf3D9U1M8+SmWfZ4nShuEbgYHvQUV43/yOaUDCRQXjfs12?=
 =?us-ascii?Q?DmwZ6DYPLSmNXoLQ0pJwENimWf5Y7vHzaFAagc0etlo5Uu0KE7gAZQXmFJkj?=
 =?us-ascii?Q?fJ6sFcQ7+QxxuhOwgSugsLxYw0D1y0i5H7b6?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 08:02:32.1372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd495326-da11-45a5-54b5-08ddca887156
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6479

Add support for optional GPIO-based enable pin control to PWM LED driver.
Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Implement support for such
GPIO control through the "enable-gpios" device tree property, activating
the pin when LED brightness is non-zero and deactivating it when off.

Tested on i.MX8MP EVK with TPS92380 LED driver chip

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index c73134e7b9514..08a1f735166ad 100644
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
 
@@ -51,6 +53,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	if (led_dat->active_low)
 		duty = led_dat->pwmstate.period - duty;
 
+	gpiod_set_value_cansleep(led_dat->enable_gpio, brightness == LED_OFF ? 0 : 1);
+
 	led_dat->pwmstate.duty_cycle = duty;
 	/*
 	 * Disabling a PWM doesn't guarantee that it emits the inactive level.
@@ -132,6 +136,22 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		break;
 	}
 
+	/*
+	 * Claim the GPIO as GPIOD_ASIS and set the value
+	 * later on to honor the different default states
+	 */
+	led_data->enable_gpio = devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
+
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


