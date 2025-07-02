Return-Path: <linux-leds+bounces-4957-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C799FAF147C
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 13:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54198168F78
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 11:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC54267AED;
	Wed,  2 Jul 2025 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="pk5VD1vg"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414A266EFB;
	Wed,  2 Jul 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456895; cv=fail; b=HPcNzqgxLT/57eRcZjR/0mwE9IjWN3j5Ju8U+HQVKRCWhisutSFobzycEM+jepJxDJUVLWHb2OkATZ1yM5XaRMkjlTQAEkqT1nMroapyXmMmGxZCe0xqOVyRPgyxTp43kR8uMtQnvMYJ6kLlMDnyCdH1dgPVs3jShHeErvjBY9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456895; c=relaxed/simple;
	bh=g7IJub6RSHQ12XQClSOZRNZn2rLOLCt80ZB3PgV/VDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NvmO+xy6RCPEsrC+8nNyAluF0GKkL4NCyuxrPiQD6ijRGZEDyga3b9docKIfXVgXl6y+WtClkVcIBXWeNr5y/wjCHo5LdGautj6JwjXSmd1xnfpWzIXxi9ML6pHIYi1eLdvcepsU2ANfiXGnCyCmfDkyodjnzd1jVfJ6d/F0yBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=pk5VD1vg; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msj0gk+uMCZsoJ83VVif8cRUwrCtqlWEv9+EPmyn4lcL1exBqgRuVwNW0u4rJRR9Wekx7ZKDmIvwSPobDKpwhO3NcpGvj55vE01Q4pzQ2DZa+DUAJO+599/z4kix+zKawBZPzG5SYUKC98plzkTaFrO2YdO62/GAj6f3MVzv2OWO6JJwnwj4fASFa28bffGP8MeOBc4H6gV3DQgO9E/YpzAc2v2eoqOAz/PdSfCPhw5VDfcBDbjA0bAnWSAc1i8/5kuB8yapybFw2PtMMpHbmTzkrgRtJC4Hq29B76suwvdJbjRRy6GLTK0l58hISFOyDvpAAuWb/RNMSxjQPk2DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aED4UraIwEU6CSgEltj8lbU2wtJe5aDx+H9f5aCqVtE=;
 b=t5dNC4JaO1Z3xHbV9bTFgFI/cDLWsWO50wfbLli+J2n4aqLIuOBEO5jqyggm28ZubcQsf5jqqsgdhEqgY8M9A8lWT0sZBKf2ra8BVFR+4eAM4QMMtVqvVQ2OjVAnhQKt140NIy4Nj9Qog1982q484m2jSk/+xz8TVNzYdBLK4MGNy5MHmmZArTTL7vIjn2KtksqkO0sHbU0HV3t4D/A5/znewJ8DZnWD6n+g5zrAVnnzvL6UOyC0a8xTZNMxWfTcojEPB9wAU2E0HCNRmCdF6C0Bd/E/q9oArIq18D/c54hexkh5y+7Q96L4lsDG/43zOLPxfhyH4au6u49My7brJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aED4UraIwEU6CSgEltj8lbU2wtJe5aDx+H9f5aCqVtE=;
 b=pk5VD1vgTGuF8VmbcniJ3kBV/rdr/DZU9pNX/VD/x8hvde4Nu3q9MvsKBofZHb7mflCISVM4PZQ2mG3vNW+Ie71GdZ48aYbHlJBohPcG1Eu7hww5B1z7ZViGqmPWE3TJDNgqydnY/VIM3BkcBWvnhodx27cRNti2J1CYumsyl7w=
Received: from DUZP191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::18)
 by VI0PR06MB9511.eurprd06.prod.outlook.com (2603:10a6:800:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:48:09 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ed) by DUZP191CA0040.outlook.office365.com
 (2603:10a6:10:4f8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 11:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 11:48:07 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.182]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 2 Jul 2025 13:48:06 +0200
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
Subject: [PATCH V2 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Wed,  2 Jul 2025 19:47:59 +0800
Message-ID: <20250702114759.223925-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702114759.223925-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250702114759.223925-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 Jul 2025 11:48:06.0869 (UTC) FILETIME=[2D0E7850:01DBEB47]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|VI0PR06MB9511:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 63cc262a-1064-488b-af62-08ddb95e4ff2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2rHVR8/JGKyt/xX8nhvuXLXO/k6SQDYZ1jIXVlp18ky+1BfnUIDp7C3l9nq?=
 =?us-ascii?Q?JLBKMvLrQkMxpdcrnqC8p8DxUcscAWSfOwqGWBUfg+erQlmNeujsun8JpJ1J?=
 =?us-ascii?Q?1bHfu0Yc9ovM0Y8yQWSXL/qYckwDLeMYOpoDCZmSHi0sJgKlXs4dHQgGuXyr?=
 =?us-ascii?Q?Uqqi7eZ9CGzWK0AyHi8Sa1Obl4fID9FJ78In9GIMlFH4B8SOYNiW0r7hsCgU?=
 =?us-ascii?Q?crxum0JsVAbS91lGboF64CWikRZf+TtIwQL+l0kys99ivd/m2dGnQHMgZ7j4?=
 =?us-ascii?Q?xAHIsPoP9gwY645UdK/SVLAay1cQNSucig98L5hTNi3h41w9zjekNAipNV6x?=
 =?us-ascii?Q?MX+iQnV++lz+r+FUkx3GTDzFplNVKc6GPI3yvIGYLui2RF5lA24llj35kw3P?=
 =?us-ascii?Q?QnqbibUl2Pg7vcO3vDdtPVnwwyLyA7BBUiLljObCIuQGSlCklEgqtlWMJnzg?=
 =?us-ascii?Q?f1K44RujyPk5wzxuZXQzNZvhzGo2xYDuNK3Q/Weun8O6PVFVPRS6slG1ciua?=
 =?us-ascii?Q?jTSH+iRmnAs+wg73cNqGhhp1On1M6k75Lp0QTLtuYOt+IBz66reXOd2eMvQU?=
 =?us-ascii?Q?SbvOiSNWkRH/phkczk2pDVRfGKIBP6paG2PZ6s6hrpV9m0kNq6O3VYyTb3y9?=
 =?us-ascii?Q?AcUS8tfWa986JFRZOuTwIXM09KUZhqIab1TkuFuSf2YWx15uG1XSAPGm0Jmq?=
 =?us-ascii?Q?sYBEORO3MMXmUpaflWa42yFAxvpdc+S3zfo7Rd7eB312kATatd4HYtTbBBVU?=
 =?us-ascii?Q?inDx6Ijkc6/lGno5zK31xB22Z461BMpmCh7x/+lRcWuhd0Q3ffrC1mteVLQW?=
 =?us-ascii?Q?tF9CnnxBsfITEuGk+Njd067n1YaHBgk+sNpmYNKbP2VMorYtE6OF98/tUioQ?=
 =?us-ascii?Q?53t2mBU0/ABQ16F9TSVC6chAWU/U8VtBQAVeGpQLk1Rp2/d4L6Iwh4yOQN7Z?=
 =?us-ascii?Q?rjV8eJQlVfkDdyiSsCFf1swQ9eVG1rnZ+AR5ZZURkL/s+jpFH/Lf7SGJzzZ3?=
 =?us-ascii?Q?/f+aPaSHqjoW9chRxoj9XOxAc8oGDNs6zkJHH2OUgSgZijgzVeMHSTv1TC9b?=
 =?us-ascii?Q?rFoDv2u1GWhf/Plr6sstO5qQ/nx4rxNCrJoZTFITGf5IhY7otwJ3e/wEZGOl?=
 =?us-ascii?Q?bPZl2FdFH/NISW/gyp+VUR5QrEasRtC7KSeTU6HX5/BTiUJoQFXqF6sz3/XD?=
 =?us-ascii?Q?pUtv1qgnLKRNd6t6Hhty2E+/W3GsAWdI62p86kttTZ+AQefIcFj6B0D1KIF8?=
 =?us-ascii?Q?81k2y33eBqO9tFVJm5di27IqriVKR1HVZm2a/vVVIFBY8F+ZtL9zA3VMc0/p?=
 =?us-ascii?Q?+pj7rypmPa4aLsHpfb+Ey2MkIgiVyixLAvpzHUIp3BXsSfv9VuruMAxWEtJj?=
 =?us-ascii?Q?CMvhCTTgBAaKVQekFMwANv0I7s4vSdoMcKLe6Ehr15tokJf+oepQvLSDbAGQ?=
 =?us-ascii?Q?Ff8wBn4BhOeHJNBTbBOM7g50y2ycvAIuCTm3cn1EV7Fzckjb6H8B9fpQXY9f?=
 =?us-ascii?Q?b4LiJF4FRI9mKPzcAwb4M2p0sLocKfn3Myn5?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:48:07.4480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cc262a-1064-488b-af62-08ddb95e4ff2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9511

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


