Return-Path: <linux-leds+bounces-5990-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF11C3416A
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 07:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4DB04E2E60
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 06:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0FA2C3251;
	Wed,  5 Nov 2025 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="R2kWOY+C"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89E2C027A;
	Wed,  5 Nov 2025 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762325423; cv=fail; b=t6TmlfqFrus7uyspoxW3uCZXNc2TWh8ScxgUvwxAgXwbFWJqgG498W405ABdgYJi5AubiTNd9dtlCtVfTp3mRtSud20+W5uCs+YSru5lfp8JHoNxIDhuqzP2EselM/XT++rntELVNEVpBp+O6tQWCY4C9jAjeKR6VUoxyynJBa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762325423; c=relaxed/simple;
	bh=GumTw6GVHkU+laOTyC7CJLfMaA2bvFh9fgFPFLSWmXk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVkN3kmn8VZK3hZeLAm5y20FCYr6XJosCnh7LqO+xyU+yXA1DIOiTr920GBpTsjJM9ctbDy3/UWBsoyK+WWzCpshVL8r+eqEDBt87RksSaXaAOv1tYnZLtrQ0IJzrbUMsgajsoqhqwIqBQUtw3jGo+olHu4tEyirWLMKncfD47o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=R2kWOY+C; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgMmTaEn6ddu/TNncG9q7/nmaFl7wbbkyyiKPyVxrEWmIkw/WXwhlVjZk4K2t2uyV4azA8eC8V7Kxact2cIZ5kH7u4LrzKg4PCaZBQ+w4geFcI289RRt3u9V2Xi8IsZoCTKvH7CUEqsB0HI3vAppVT/iIDfqTBEUbg1WyB+1+JXOZIsWlQOJPwWjM//aLtzG4Fu85E5ZKR9uhLdyPHbp4pB5Qo6jDojzHEDqbsK3jiY1d0b6optgsNKLJjzNCAfUwCRdeTyR+7tf5ekwj5he+A10TA/dEmZmGcHbeO/pKbGN2pLRiF2T06Zxqw1pNhLBmTpi408Vw71vQyLJvdj+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SvqE/oYKrcSALO4fP7PqS4qRyp+CRUAVY1R4Gh2mIw=;
 b=LT8t6+qrbPBoi4zlPKk36Z+qEqn9SomaLJZpqZlAv6fojND2G3qcnmcs2sIT9ENLDFxd1d7fowmCjf14fnXvZU9q+Iyedmf/n5p3mvwwrvFqbdwLBVEuSTXB786lUT8Y39YIayibPJcS0CDvAyiS8zi4AyKD4GjHVHUlgevJP/4hozZIkmLQ0m+L0ukdD6Sz3Nf/QgHwZSVElT9I0E/MfralE37qJ9fjo1vd2p63shFLwiV8ZHl9f/Lb8IUoxtVIBLRUbZeCT/PddfCF65W+wLoAWoJ6MjLoBNIaIbjZWeCw64wBMRXi8xZr/2M7Jh1eWqNJhFGlTiAKsCxg501mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SvqE/oYKrcSALO4fP7PqS4qRyp+CRUAVY1R4Gh2mIw=;
 b=R2kWOY+COOxw9YkShBiY4wLXuhzRqT6TtDSYtlQ8m5vL8CFiNR6qfcDT6RT2MB0Z+12oKRgseLf/LfVN+5P1BS27lqDUux6nDoraeCxswGOfPizZ3+FTXRtdbOeyW6FdwuL5FRP6VZ1xB0lbqNqa4o2kRBXcPZ9aasZ5D53wVZM=
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by DB3PR06MB9922.eurprd06.prod.outlook.com
 (2603:10a6:10:5c6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 06:50:16 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::88) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 06:51:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 06:50:16 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 5 Nov 2025 07:50:15 +0100
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
Subject: [PATCH V9 2/3] leds: pwm: Add optional GPIO enable pin support
Date: Wed,  5 Nov 2025 06:50:11 +0000
Message-ID: <20251105065012.88796-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105065012.88796-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251105065012.88796-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Nov 2025 06:50:15.0078 (UTC) FILETIME=[70B01460:01DC4E20]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|DB3PR06MB9922:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5880764-bb4b-4d22-60e1-08de1c379442
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6qTli/6Qt5iy682RhDfbpXw+XaVS4F3vzPoxBsRksylw7dSNcw5wLXFQO76D?=
 =?us-ascii?Q?AERITXQTWh6/0SKDf1vPTsd1tNsGVGRiV6scfEm7rHLyBNmI6Yr8RWloGopc?=
 =?us-ascii?Q?BX/Fo9KnxmhkJX6yu0dBu17WPR01fwX2tz8cHZJ5I67UrtlYmJYRIzsWxhjd?=
 =?us-ascii?Q?R2LSB2UurNQNhHDiijCr+X1zMqsed1cXlC+Ju8/IERiGb20C7DsNElbt7CMm?=
 =?us-ascii?Q?D9slCfn9scgUINwfwQxDVs/BUrUr0qrXa+CjZhsb2EkjrZXx+N+4UyGzkIKk?=
 =?us-ascii?Q?oF1GzkKqJnGe70dWrLEQscruYbgP/eu2nLa25Npbaqf5UszBTnXKWhWy0kEc?=
 =?us-ascii?Q?beS2EhYNUkEaaMEZ8QzTZ1lQbG1rSANMbgLK5Beiy1ohaSAQCXbJIfAZUT0c?=
 =?us-ascii?Q?SEcGfCgSBF5WEMtlUAuVgrp/Y9/R3BjkwKIddxND7Z6cYJzOijav1XcOnMEv?=
 =?us-ascii?Q?o6dBlV+I452gpKLBfDztfYEDpN5IoT8PWwKhXRTRDJoPTpVuWXxoMWSpRtUt?=
 =?us-ascii?Q?TzO7udZiut/4ofnLtoTRXYWyPWO5ftWzo29+KI4KSDOUUnMaefqv7eu/i9Al?=
 =?us-ascii?Q?nIgPen61AwdSUM9JCfTprXgVALHtg3v5m4G7lAglXJWFkbk3f4GR8iIck0vn?=
 =?us-ascii?Q?8R6GyBpqIek+JNgP9h9fInI9NWTXpLoLe2p/yC3gpNVK1riECxg3U7vAiobn?=
 =?us-ascii?Q?a4JC0tArYTFSSipkaTnBE+0ktScyUbAGNj913L6lHqOUYkFwd+g8WWuwPouh?=
 =?us-ascii?Q?Bch2njR5YxJHfWacg79m/rT7OUk4QmJoobyqdKbLeLmQkaYJFVr6tcrEPNMS?=
 =?us-ascii?Q?CS4Gpj2OkIQCdIKGSg2rP89/H9n3lBhYbVQiwil1JUgV9CxzBuRXAhTA8S3r?=
 =?us-ascii?Q?C9VDsAGOz8lOnsH/N60Fctgnv5OyRG72sk7PcNPqjjQFpr/hy+z6mmn+Lpfx?=
 =?us-ascii?Q?1PBSXvDsDuf+x4VCloszlWT3oDjpDUiJEdAQ2IPW9VqalyIllgl71P8CbPaF?=
 =?us-ascii?Q?KNF0eh5sEW7n6SdwAtHCLKMiAK0yDQgWmimH3XDoy7ASdtcTDW+WgNanUCjV?=
 =?us-ascii?Q?jDyVTCOVuUb2yJp015sqJCEIQpWvYRv68RQDVFKDmIzk2TSGYXp0rXNDOzX8?=
 =?us-ascii?Q?MIRLGwZS7Acs1fB3Ldbte33n0muH/sSvHOQ6YgVedPuR6zvVzOWTeTfYWpTN?=
 =?us-ascii?Q?TB/FVkBpMMMwo/kJlVFRmIo0iBH4vgh+bmfeb7YtmthVS3le35fD4KAEO6eg?=
 =?us-ascii?Q?r+m2xG4aZkMXhoXWvp8GIB6thYyO8DsAfiZGF2DbuSqGusPcypfFSC0/OIVM?=
 =?us-ascii?Q?840lKdHuqzopYQH0guiPPnlUqQH0HUsiZ5EdnXy6ugBpxh47hmx1//hG1MMs?=
 =?us-ascii?Q?Wq8wOSKXAOJVIUJcTi8G24tGVRj356NeCEFenbZEQY/+/5u9VDSm6uTnI1yW?=
 =?us-ascii?Q?EBfcDRFVYpmmHAkVoyD4jxY6EDRykRbkAp6NzamGxN7eFlGiiDf7pmAzd5YC?=
 =?us-ascii?Q?vpfuiycrAxZX9pkCGSMq1Xhrq1xcNzskIf8Ej/i5EfmvKgVz8Ql3aUCpGd3a?=
 =?us-ascii?Q?GzXfwmY1ygDLXvwNAd8=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 06:50:16.7942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5880764-bb4b-4d22-60e1-08de1c379442
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR06MB9922

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
index c73134e7b951..aa9e14d912bf 100644
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
 
+	gpiod_set_value_cansleep(led_dat->enable_gpio,  !!brightness);
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


