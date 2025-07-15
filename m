Return-Path: <linux-leds+bounces-5065-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB96B05044
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jul 2025 06:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5454A3256
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jul 2025 04:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F752D130B;
	Tue, 15 Jul 2025 04:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="dtj8bpFB"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012020.outbound.protection.outlook.com [52.101.71.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7272580CB;
	Tue, 15 Jul 2025 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554063; cv=fail; b=cXup3r4eTta9H5I+YQVylFSeP+HiUZWgpA1TyNgQ27Eluz7H97BbaVE2py9PDbyQkzfHX+pN0lH7fzNqrInZ2bKBYa2WJZcfYwrLuB4JxRO+xtBcShlHCmaLkQWk+Z9Wz0+qBiuhvQEnurC0wKIn+XZxObplO3q6CRQsHrzC5ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554063; c=relaxed/simple;
	bh=jV9Qrlv+kojY9EUEURLZOmcSDFM2k7iY0jM5AU6crbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmWWb75RfnQn5/4ya8BHVkAgJVnirfLvYj7/MeGv+v0LevS9b6SuXqM90J9faAUz9jdNVJR3xAJUWqI8G1Hi5vw45nVpzPW53SPB5aI9UoSVhAJKdZL42bWd7lVDoSqqBcdQLd/+XjgCGu/9qWL5GvWzKM0WvjuZWKW/ImANC6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=dtj8bpFB; arc=fail smtp.client-ip=52.101.71.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWAtAXRs5udHy9dVRwkmNDTOxn0rehTtA8G/GUJAPXwKHD7wsRA3PHh32ycX3+hH9MOpi5TviPeBw9ylYplhaNITgwANpcnJsUxzDPlRAyb5oQRjdifhpiV9BjIAsbQnM1qNBsnzpWsWEHLpYs6hQJoCColWmQIzsVnUI1t0Sd8elQekL/pvee9v5OusCqdxR6VUzhNdIK1/gWW7m9lCa2yzx2iwhgc247j2VfDRe8nS6F5MEl/Wv6gfSTSsrt2bYwrhCIp3J/957GuM23HuvfE4RsEuqtaUHHoMpJf6hP920JkRSzM2jMRJhzKVg1BtPa+JWwc0PAsyk7CTDrzCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GruQWUhe0UydPcgK6d+U5/oClWiNvlFga4hqVFNWwC0=;
 b=jdaGxMzexU9ypFYABn42voivXOAxBsmYsdYQWZMXlDfzR9Co0OAdD5tnGkROvBB1OLKafnd0MPFUqR3jPRVSfE2/AOre2BFBc7mrm2l1ttksueYW9QfHes9DuxIkLvk8Qc05KRny4AWO05P1vJWZp4DXwGCxnhhIiG0Swl+FODR2Ry79dJRXPf9wb5PSNHEY4GNf22Q5mICf9xo4gAPEVrfR3bW215yP1eCnJa+rHhnsbtD9Xcs0M5RcTAwXGUHjHYIew8BuIut77SuQ4BiM4fBSkmTxJ7Qd2MlEDwOfOWSb7oD7v2wetcS2n8kBXTgW0EhJguSfcwqg0EiHt0D+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GruQWUhe0UydPcgK6d+U5/oClWiNvlFga4hqVFNWwC0=;
 b=dtj8bpFB/00awt8WnzGc2zuZbe5Uj6/aYV5dABZ2GssqPoex/Ug/OBAxYvdWa8cilDlvO22prXgNn786G2t4cNTAWrg46dNcAtbCvazqTBYKaWHlrZeEsxKCzQsNhjp4wqGNwiz0zUmA0AkCSg+ng4xTWQumbI9gJJqMQchx0GE=
Received: from DU2P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::12)
 by PA1PR06MB9286.eurprd06.prod.outlook.com (2603:10a6:102:457::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 04:34:16 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::e4) by DU2P251CA0001.outlook.office365.com
 (2603:10a6:10:230::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Tue,
 15 Jul 2025 04:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 04:34:16 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.15]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 15 Jul 2025 06:34:15 +0200
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
Subject: [PATCH V7 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Tue, 15 Jul 2025 12:34:05 +0800
Message-ID: <20250715043405.6281-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715043405.6281-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250715043405.6281-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2025 04:34:15.0924 (UTC) FILETIME=[B8C63B40:01DBF541]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|PA1PR06MB9286:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eac933ce-9dc4-4c27-d4d2-08ddc358db9b
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XPlgEsXSZMD/W4hu19TXBSwSdK15ZBfZBiDzjiCNZuPcfC6+uj5WzyYJDdoZ?=
 =?us-ascii?Q?pBBwN7QPZOFHL9XZNOZOR1L0nQVFnOlmVy8KiMvsbJ/+qY8/BFOeqrt90tWG?=
 =?us-ascii?Q?seKEPqK8osnU1M0V7bZSI70xzbs5Q0Dt3jpsqNChKlCaf42qeJVq99ZdDtpg?=
 =?us-ascii?Q?lFLxjLvH9wH3XKb2jTcoyssFdJizmyx3+6IhEtE5txtziKALkdyFHBeTmg5i?=
 =?us-ascii?Q?3AaLwjFU6oNFYv4hUoF/OmgMM6E9SQrKVbqKgTMau0LQpk5jPKfe+xq1nCc3?=
 =?us-ascii?Q?LvGnTwJFTYaHf+SVqZdoFL1etY7iJwRhvgwSgWNHzsI+SN40lgPNFsfGwdsP?=
 =?us-ascii?Q?vej0ERnMCR5qV6i8slQn7hPmwIo7tZ8CK2bvy7pg5/HvyCIbdnV24d+1FOsd?=
 =?us-ascii?Q?//XXClsnV/MQxGOSyL/tryCfEsu8RfoSXizlFEYUterVPbZyUWzckq0ZSuGW?=
 =?us-ascii?Q?5imDs4XJ0AeZn5qyfpgC8EN1TCIGmkYdjUbWi6cEkQeLPOoYtmzHCD9WMC79?=
 =?us-ascii?Q?6+c4TX3wgGSgdoEcvYbnvlTIr7QkvqFvOBPaQjaTdfZA2QDXQzr9T1Q8v0Wz?=
 =?us-ascii?Q?NMz6A+tM4mfj9XQp1MLNymt9oVe/Hz2V9XDto2xN/OWe1J8qGG5tzXSgUvlI?=
 =?us-ascii?Q?I5bDc2DtnO0bbA3+eoW1tCz56YUsIBY2HG29inwSGdFiD6KYUKUMdl3sPRgU?=
 =?us-ascii?Q?mrkiNaeG/LudxwZgh4MTodMamQlytnNFbuua9z21/DvGlPDAKOefvNs4rViT?=
 =?us-ascii?Q?gKofz4F2MN0KdJ3ewpqk7+18TfCd9D5uBlY7Zy0kD0YUgGQdiFvgEABojZ0C?=
 =?us-ascii?Q?QGH86pNCwybaNnFpD9m1vzWGGMb1EBxvcEm6xc1ysF7kDNIEpjaNc++bg82u?=
 =?us-ascii?Q?37KtS/y4EBkboF7y5Dg2Dz8zptZOP6S7gtW82J08WgrqFhTaBIx4JwLnm5tA?=
 =?us-ascii?Q?LpFuZbcNFeBaX3jUD1sqfT0XVPMzVwkMfIsYiIwMEFBWU94t9ch8G4WGJb+O?=
 =?us-ascii?Q?P+euPFae4DwCxigKe99O7GwxyrnmA/fjPBOOrXNPM4w6SG5SUvtp5RI7kefD?=
 =?us-ascii?Q?i4RaoC/3BDtfQlfjn5EM6ZPnVF6krDsClTugp6kwtGClavXykWJX4dwZyea/?=
 =?us-ascii?Q?5JIzvWFTvf06k6ODa8VWlyuRhxJc0eO6zfY7s4im5FZKTyJUyCsgTmvg8WEZ?=
 =?us-ascii?Q?u14dmqTa0a2XEUFzVPQUYw1tHMX1Mao3dso/H2T8KVOX5qU0fwzihJM2r+9X?=
 =?us-ascii?Q?RQw7zo+A6arPbmCQpRRv+0+U8RCekd+WJN6P0zyb3/XqREkDP9iTM0SXv6cK?=
 =?us-ascii?Q?4fZ44Pif9nlDbrc1UWTkEPTWhKu0dk3x1vcs5t7XUGwyhofk+ka4pOXZ8t48?=
 =?us-ascii?Q?quJsdP/hvtMRH9GKDXueRkJZRBXrUsqXEaYlmvp6fQOQnXV/l2CQQMy88VGd?=
 =?us-ascii?Q?emFUux+iuDHSDbCyiQv4Ks22X+8e1EW8PvSa1Wn6QPsGG0i2qkUjAh+xrncS?=
 =?us-ascii?Q?P6wwLHpDqa4YllJqOAXYB1xn97L9YVREWeVQ?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 04:34:16.3840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eac933ce-9dc4-4c27-d4d2-08ddc358db9b
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9286

Add support for optional GPIO-based enable pin control to PWM LED driver.
Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Implement support for such
GPIO control through the "enable-gpios" device tree property, activating
the pin when LED brightness is non-zero and deactivating it when off.

Tested on i.MX8MP EVK with TPS92380 LED driver chip

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index c73134e7b9514..a9f2662c966ad 100644
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
@@ -132,6 +137,24 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		break;
 	}
 
+	/*
+	 * Claim the GPIO as GPIOD_ASIS and set the value
+	 * later on to honor the different default states
+	 */
+	led_data->enable_gpio =
+		devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
+
+	if (IS_ERR(led_data->enable_gpio)) {
+		if (PTR_ERR(led_data->enable_gpio) == -ENOENT)
+			/* Enable GPIO is optional */
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


