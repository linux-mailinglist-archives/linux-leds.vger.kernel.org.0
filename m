Return-Path: <linux-leds+bounces-4981-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411BAF6ED8
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 11:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFBA83A11AF
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 09:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B290D2D94AB;
	Thu,  3 Jul 2025 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="vtoegF25"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011342D948A;
	Thu,  3 Jul 2025 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535290; cv=fail; b=TYjsPOOm3vhZ96BgHLjFhElIk6O9ANf1tER9Qp7FK1sBiqsaeeussvOPFmkyqRm9tJLTyhaXwb29iYyJoXGHyKTqK9afO+Ff54R/usQPHZxT1levSNvwEN67lvV0DWwaabzmUF+kJmayetWXoCfKcyGNkZ68PDohs5xm2mtiiCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535290; c=relaxed/simple;
	bh=diIXe8Z1qy247uMNW/+6mK2DGxdNUS1aMpzqQZFFMUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsPhyS3PjFMHKGbzn64r+wGfwKn0A515WDio/ycKFxWx+GcPpvqX+GEJZ8C9ccrVYtU6p3mJoPriInzmAcsSJoSCyrLc7si1jZy1Gp3gFyFlLxK/toLvKMUTIT4A+y/ScEUoP6VUhbb32BblqpP1EbR9jLVGSoT5GSG3BK/gvZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=vtoegF25; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4KcljsBOgC0wpwtFhiKYOxoJH++y3zGQ8hldA9zJqidSzWXWZHlgVeBD1VS7Ylxrwlk/yGh1WXLmMzJjxS5PG8VommlozynCvcoVocWkbxPTB7zRnYa5YAIEZ6OKJOGTz5XrEDHuwRxzO4wXlQcdM8uUkDPGALo5KUSOdmLj4ywv2cPfSiyG5R4HrPAY0R4xcOfzc5Vlgpl6A8Tdy0xlprfUeCTVBdPs+AjwW2Py0noQK2XsAWiOqTA5dT4ozxkCmnZ5o/fesgIVMrpot0pA3fLZtYdoCYnFQ95A4JsiKJu3UBRfTiJs81KNwsBmBaA8mB8mtTQdUz46Xi95hC9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2VbUgBRmOSBL67LpZaNlfVwsOmRrus1isPUVyBDvkU=;
 b=baFtvXy8rFwrKvaXaQx7gk6oJymXm1gYpPcp3r1+aXJXH0H/VpLRxqYrtGUYbw1WHYGh7ZRin4k8lraNag3YTS3O/6o0ts4sTIVUQl1uHwiUYjKUWgLm1R+0r29krGw/3/LWkl6c8BBWDhQkXtLd5gTSC868ZTPTIctQZgG4uReB97NS8e/dKX/60Papzthy9G2g9GfJIvtQ7gT0FxPurekD1QFmegCZuPc8MHSgz8RuLFBvpKbpzDxmK9MNtugKSsFvvvU5y2CaLjEeIt5vM8IpZjreNL91IUwJZMbOHbdBNOLgmJb8Qzia+d8ZcULiBCtKfun+/aiC76thjLhpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2VbUgBRmOSBL67LpZaNlfVwsOmRrus1isPUVyBDvkU=;
 b=vtoegF255C2TUgSbW7P2BqV21O+xyd1y/3ahHXPUAbRmLbo9/KmwJcDQ8HDkI4AGXxYBCoGSxpSEFyP5g4HD8VEeRmEjur2vyv0KrF1Qi08o0FSRWN1xeRFIOKwt9LZ+VRVttCYR1ZufDoObyU8zkN7kiguFkNX6oyGtwZ8gilI=
Received: from AS4P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::14)
 by VI1PR06MB6669.eurprd06.prod.outlook.com (2603:10a6:800:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 09:34:44 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::94) by AS4P190CA0022.outlook.office365.com
 (2603:10a6:20b:5d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 09:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 09:34:43 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 11:34:43 +0200
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
Subject: [PATCH V4 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Thu,  3 Jul 2025 17:34:30 +0800
Message-ID: <20250703093430.229959-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 09:34:43.0257 (UTC) FILETIME=[B4F1F290:01DBEBFD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|VI1PR06MB6669:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 50919313-10da-4dc4-de3a-08ddba14d7bc
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KZQ0fTd5f2aEKdbwKvaklmnwebFmWtwILf6Z5Py0vdqKAseq/V00QUaCoAKy?=
 =?us-ascii?Q?HcP40BEYR2NIhPNz/YablzeLIn/Lw+7qP0YOptZLI4WTtFJUQ/wmZv4ANwOy?=
 =?us-ascii?Q?hzw40BqOshdpkOAu95o3NYPibMPFN6oMixlQE56KrP5LN2XiK3py4LbQAVW1?=
 =?us-ascii?Q?ogysrdPeQcxpVGRZJ2vUMDyylineZSR8Izjf/DuWbPrvAx+qQWwUnhFDhkOP?=
 =?us-ascii?Q?qvev9U1Qf43By0EFW4sghCZS7ZaX2Hf23sQAJvs/Ce3wjeZWvbB2kxTZRBU7?=
 =?us-ascii?Q?phgq6BdMGMkUbDXYzvZDj8Ba2FyjgjioAjkfDK+6FKKLluZF5bv4qLwzks5L?=
 =?us-ascii?Q?7tG2ErSkjyVLASsN6d3REz9wJh7YDcdzUl7vbSFj7uErghSmoa4A38ofGwUg?=
 =?us-ascii?Q?EeXoM6aMSFkayt1+mUppT4OhVwcw08EUdBzPn6iegUJfcIJG+K2nvzW605gB?=
 =?us-ascii?Q?PzsSSxK1T04mty2bX4yKBBBfCarW4UVK4d7NssGhq0SNSKPr1mqByNACoBs8?=
 =?us-ascii?Q?pI1rOpm1bW6reNn+00ZnUWNRNA1YNkC4mAN9NIXozqCwaaFJcntOHNhTUBHC?=
 =?us-ascii?Q?IyIgMXO3OuVOn96XSZKxOC5o1qDrS2PBNJ1NYl4cm2WdeUAKqUYJPnFXEZPJ?=
 =?us-ascii?Q?j2VGLWFIs8q0INWd1SOI/Lf9H34OYLWY9WULJ71BrdW5fzwfApu8hFjO4W0I?=
 =?us-ascii?Q?c5781nqIT04f8v5imphRq5UVokRcJSXN25+zBsa26IILnnaWAe1GG6vp+P9P?=
 =?us-ascii?Q?HoPinXcZNozkykn2yCB8r2juz/ag0p5B4V2arjTjGo4mbKF5nfhOXS8hwEFe?=
 =?us-ascii?Q?yW/mofr+5AB2rC7RxKSF7Gomv96c3RlLKRu8ROUGlJVZLW3X2Efupa5+Zs59?=
 =?us-ascii?Q?aAfoeZiZuSrOVFp3YEz5oW2q8GEnrYI75lSHHCmZ4AOcUG0g64enj9GY/bHQ?=
 =?us-ascii?Q?tnP4WY2jxPPdu3bdCi+UmgIz97DXoUVxYJqiGc2J8CCzcmMevUi4abpQb2O0?=
 =?us-ascii?Q?tGdVy1SBu6bVU89X7wwoUJN0tUlg7JP35mE4cq8CKUw0UH55M23Svfl5YNTg?=
 =?us-ascii?Q?R2KJty/nZhvMLRj1/bVeYc2BbQCPuqZtQRAoDn430b0mpIX/Vr8nPZKRzhh9?=
 =?us-ascii?Q?BSWOZ1Y1uSOi0X2Kt/QmLGW8ewcSi3Fv7GTptkmtWfCzLfp92mVw65LcrOEK?=
 =?us-ascii?Q?OBueeUqKeSFj6J2+wK0IkO1jFEcYpYDxloM3UXmALaBmU90n8ael1JsV+LMv?=
 =?us-ascii?Q?nc6FUwahTOzDHx9CLRy1WZcYZsmlJ/D7WPlkOAXyLkgdbrel4/dRIbCRyllW?=
 =?us-ascii?Q?/08fDFQtxs3grTcRz8hLvHmI0L3mR2zd68FteR++p60kNlEPyKB81VnnYjQ+?=
 =?us-ascii?Q?wPqtSmo8SvMDmdxJN+mnDwmsYOKdNqg3NneWdHiRJssPRVLcg3Rv/wnN8ZKC?=
 =?us-ascii?Q?A4RjOgMd01gStm3wP3JBRQM3Qiu43pvz/hkC/PsEqwFZOQpbrCj0/QBgajBi?=
 =?us-ascii?Q?AwPRRUv0acDbGJ+0/Y4Sa/8ynuHMVDPnunlj6kndV4vb+H3+VLROPmF5Ag?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:34:43.7023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50919313-10da-4dc4-de3a-08ddba14d7bc
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6669

add support for optional GPIO-based enable pin control to PWM LED driver.
some PWM LED chips,e.g.tps92380, have a dedicated enable GPIO, adds the
support to specify such GPIO, activating the pin when LED brightness
is non-zero and deactivating it when off.
tested on imx8mp platform with led driver tps92380.

Link: https://www.ti.com/lit/gpn/tps92380
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


