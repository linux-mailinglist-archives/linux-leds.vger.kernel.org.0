Return-Path: <linux-leds+bounces-4998-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B341AF90DE
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 12:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 520547B078B
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 10:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929692EFD80;
	Fri,  4 Jul 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="UuunNblr"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66B29A310;
	Fri,  4 Jul 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625834; cv=fail; b=RjCsw0BPOzNU0h/KAqDPxGmw/Fsrs5oFwJ9jIGbPcQKAShBA/qorWCDTSNENztKaj5nwtFEVNAhuBix/vO+nlj1r/jbP+6P4dSMpt6omJJSxvXHyvlU4AurMUQn7DLJr7E8aEZYRRPzoxU8+Fj+BW4EgCmSTNL0W17Pvm9TMJRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625834; c=relaxed/simple;
	bh=sAT9dznk6xdJ8wAHAc16pIqXdlDdQZGF3+mwT24eCvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNOk4RD2pqHG3yO+dFhohfGrGmLqWzzHMwzEIcf4AAoBHj4bMD8Gb79QtGrcizYSXtkdy97xlC/7zBG23wUeYEB74AS8aSTww4YmdBojW1EOrGOZGgJ66/f0oPZ2L5Tt7KFCCUCkprS2KkIRwcU27Vb7D6MLx8M5EWodulRkeg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=UuunNblr; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQB2ZPdU8GQCJ7KTHoKFVF8QyF+l3BvovKPcOw5wL9HH/NaF5mT7Gh/tsMDACRVE7cq7GXHQgT1ej7fQWtRRJEX/TnyxHioCZ/GWw35BMwn3mOtpnXG+lDKClGMrzoJzvsDa7YtJq9PZz9V0P8CbkArzPSrrEFoC68AGG1Fo6IE7s6sXZwi5opDYQS6V0mPb4K3rtSxzNFyzGJLM+HbVuvQ4rz7BBxtFm2UNmhEf4vaHX1Jzx8hAkUob+CUZyIy6QMQ6VdT/bYI25kWf+JeFhdSK2D0A5yU2jbUq+xYVlLzOZNp4RjDnVHPgAPny9MGMHSeMxoq2OhANd3UsgOtCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm4V8Kv3ILDgB/mQRvPIEui+Ti6DBk5Zq4dZWHvn9jI=;
 b=PtrkHuGfooS2glYLDVlk1akPtfFvC8PTr+5yUee9mZkxSI/tPZ8oTnMW2k1I2bpXowg4pU23xbbRT8aS7+5IRESAS66qkCYmCbUbkG21w88dGdEZaohzuZS0b5rlcNuLEQTRYsO8kyH2tlHzBW9sJnl+it8/PYLrxXW+RYWNFYlp+mEItD+pqDOzeMDVZDIn+kPwnlohcCba9VtYBUU5UnQWzYNDbYjhrm4BgZv5Q5rfp02JWHZu6V6ERkcv46N2HgTaP8Y5A/o22+XvRtMiR6lnFMV1XbQNmdHACsxSWiDH9V0mnFXdfC8QeqovpukBl8fRUWG6QoQvF2jrtwD2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm4V8Kv3ILDgB/mQRvPIEui+Ti6DBk5Zq4dZWHvn9jI=;
 b=UuunNblrXjZzszA241j2ZguHC14zkawDJJ+5p64VrwP/ct3UkKzXxxKFEB4ZtvVFOjnC3F5UE5BObA8d3JIcu3xtdFINFd3HEoKUZsBpq6qELrZXPTbDi33b/scngttcfUPFxuocRyQbOlD9LphMgON6Uh/D6Na6dTKSvT06vok=
Received: from PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::14)
 by DU4PR06MB10070.eurprd06.prod.outlook.com (2603:10a6:10:5d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:43:50 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:100:19:cafe::49) by PR0P264CA0098.outlook.office365.com
 (2603:10a6:100:19::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 10:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.1 via Frontend Transport; Fri, 4 Jul 2025 10:43:50 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 4 Jul 2025 12:43:49 +0200
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
Subject: [PATCH V5 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Fri,  4 Jul 2025 18:43:38 +0800
Message-ID: <20250704104338.46546-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704104338.46546-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250704104338.46546-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Jul 2025 10:43:49.0626 (UTC) FILETIME=[86C965A0:01DBECD0]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|DU4PR06MB10070:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7965414a-c0e6-4f04-e7d2-08ddbae7a988
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T33uuJgtuQi3Doo1MA1qA7O42whyVmWt1caIcN8QFflU5qrjT/hr0j/z5vHA?=
 =?us-ascii?Q?re7uqBNwEm+QKk0z54e4wN1fZrFaD2dcIXH/Iqt6G8Qyu1J37zwiZwz/2M0j?=
 =?us-ascii?Q?vB5mYWCK5U4gQy+VMGIsFX3x3aaYrzxj4zDdAmGtLHX+tYgmDt8k129JI64Y?=
 =?us-ascii?Q?7uR0t0FpYSoi2jLWLZvJvNjB63gWCKkiibBYmC0bkPQ9iHZwfA9vAEv9J+9B?=
 =?us-ascii?Q?/Bv3RN5Ln9V1bGGqCQ1st8woFJyUHHZD3clVXyIMW1c40J+7Kf6b2I6MxMMR?=
 =?us-ascii?Q?3bNxQsL0tuwNyOEta13o7hSRaR5bxCZUI/DW01+HbyT94b34zQIrc2YSGp25?=
 =?us-ascii?Q?B/SJkBlTcHtc9eqtr5c8CbEr1u6khl7bBw7p6nEnRRemMpvypzHkS3lWUP75?=
 =?us-ascii?Q?k2+MRw4+dzMPWH082xWLEKGV3/4Qc7EIKswKjWhlsCoC1lk1Fo269nTkc3dG?=
 =?us-ascii?Q?WBrY+CF8FaV9lRsSghsv6dVhUdGMFGbInCUEWVzsPl5xtMvAa0Dzmebj3IDE?=
 =?us-ascii?Q?/ut5LuYzB6VCHvrHukjH8Ju3Fs0GPamqq34RdH7WXsYXYwT1TtpGY/yY960B?=
 =?us-ascii?Q?IpPToVSrcF41a3q7c9YR1n4LOEbO2pLiK902OQd9JasKfrbJe+aKk4bm7Q3T?=
 =?us-ascii?Q?DukhC7Qq3r5TnyVKPBIAAZeHyOXEXLRajucSZcW3fUnV47Mo4K7f0WA9AfGD?=
 =?us-ascii?Q?UL45zaFJcQxHWvXjv7UqTm9p1hSTBCXIeiJqg1J7y5Cw0SSD/9CNTrdMD8dJ?=
 =?us-ascii?Q?0Mw0bubvcB02vJVdq8H9L9hWBfzyfAqymKbdlte7aMn0vCqCMz5tfATKUQUC?=
 =?us-ascii?Q?+QDiZilwo+eYlspvKeE0gvQoRenAA2iqRu8RLETB3qzQb7PITJv9ghw0NVAG?=
 =?us-ascii?Q?tMU/ZLqkENA1qrJT1GCEk7swqFcwLdAIYcDABY0t4L1MXLf2tsbSoyD20RMK?=
 =?us-ascii?Q?U96yW1Jhb+mfiqkW+cjyPSjCDEBGuwo1yPAh8sFeL2BswY+FtCc6YCaYlYpk?=
 =?us-ascii?Q?iUXbtyABnYAu3Xg8m+Bs1DsBsVgmrwbL3LEcQ+N22Kabo9OpsNMCdGCeL3KM?=
 =?us-ascii?Q?ZhBlaS6Cx6p+QTKsScVPb271B86BLDe4ECAkdZ7753oqYu/ZWhk7BrcPRoXn?=
 =?us-ascii?Q?9X6O+3InrdHOIjhLm8ipomQHKSZEOYyKPrqe5Az2cECjOMXAmkJrVch5ismW?=
 =?us-ascii?Q?gsbyVd17leKKnZJ3ORxDhPNAI3+TShNhS5TLncM1lQ0XxQFcwxMiZFmuBY5B?=
 =?us-ascii?Q?BTgYVj6vUtM8VZL8YYS2KMDE/2/gXClEuIIunCcuw/Ev5CN/K1AZhGPwQuIP?=
 =?us-ascii?Q?Jq8oAJYHaCF3+rEHeQaEVDdnHa1pw743lNn9Mf5LuOdZpBoh0FML97IVZG8K?=
 =?us-ascii?Q?VgMGARNO56/AFYX+x5F2bY4ZthKE2luoOECknKnpZ5gR4JmFdBvO0dR6FDu1?=
 =?us-ascii?Q?Gb8OFLJkuAsi15aHLLZ8HKtuS014Nq0o2uSxISO2XDkYU8aV0GT4oPV0J2ml?=
 =?us-ascii?Q?gL224nj/YuXE77s0zqb0XMAZ9qmiZDHQbuY4?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:43:50.0046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7965414a-c0e6-4f04-e7d2-08ddbae7a988
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10070

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


