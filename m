Return-Path: <linux-leds+bounces-4954-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9DAF09BE
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 06:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C626A7AEBF6
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 04:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161B01E6DC5;
	Wed,  2 Jul 2025 04:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="PXXSmGZt"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012036.outbound.protection.outlook.com [52.101.71.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D3E555;
	Wed,  2 Jul 2025 04:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430952; cv=fail; b=bP4MmvhMaCfezD/TanR2C7iPbG+BBXyAjuflRSUPtop5jHLYKh2AwBvnVxG7LtixIUYUVVU98CmE+isUWsYkBxqFlZ+Asu3JQgmFUnS3SSRv69k5WcZ4hRFax2QEKllda2GBTqzaK9UG+znh9D3u9ZFgkAyQzjrXeePS3HNRF6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430952; c=relaxed/simple;
	bh=glAlzF9bYmGufkv0DgSs8k8ajv66D0759jQa5yMzag4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DE0Doj2KuymNTqVIHXMZGyITuxkyGYVrAF0OfumI1VygI42wzg28n/bybEteveLnfZT5T3wRZNCoXAFPGeabzyrNE0TwAHiD4FIJVdqwsidcaTF1YIuIdGSLcCxPPQbgy2KZ1sBj9DHSlCwN8AGDCmM0Cs9fhA/zyFrlQ/nLGqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=PXXSmGZt; arc=fail smtp.client-ip=52.101.71.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYzl/Q//yZB0UUVyaTTr1uAMykyvwP5pz7Q89ftsHwjCsTd0nwedi5sfKY5ehdViy4DhY0GJ2CyNNWWyh0GkD9g2AMKTU50Q8dXfHJEonPIMMFQ8rznUeltJk1sHcCzKNwWdcxWa3rdQejHbYLMW5SKRT0CRkQkfknMZfQLFuc1MgKuMUkI/9NmBwhsLTsZuFl74vC6GqQWtbAaowe/tNUKYnYq9yqGwtyfuUJBUZSvdB/z4tucmkgiWbMBzQLJhNLKYs4623STbFMmH1gq+M6JW9CQi8lneU/dnoAqR+ghzjMA+QHSdXY6mG2uaQ3r4B7KYn7NAvwbOo2HhBsQxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uEP0bjKHqK5kUtAbjkvqLuKNT8hF9LECO62i0g0020=;
 b=di7KubTaKHca5LrK69iqk22Cmc735hvfsF8jNiAVcKlzPqS91CcEMLTf5yTBtVFqx8gIFRj22Sc2IMbV82010EUbfmeFeg84SgByRP+Xg66ZmIZfUlXTJzJjMssh9dkcl4XBnE+B9n+tXFOhADpmA0piuimjMzNmgOinBfhDW6YxVRWmHAgm2JfMxLej7w4vDf0Tu3iVXiLTxHB94Y42qAZrQOYS5/YODRiQIFFgB4f35C7VP7oPuQtFGbtGoCjZBLxAiP4M24rw4XRb4En/GD2gmV83qt8Byqam1RpxKQqb+bVCBnUmcwXskTkbu/nDECDNCBuSSOZsN2c279m77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uEP0bjKHqK5kUtAbjkvqLuKNT8hF9LECO62i0g0020=;
 b=PXXSmGZtanUMoxEFPAE+G0/2FxzJ58a228WNk3wWDnMSoYzVOu65dMEi0jgu3fjU8uo9oDFWBy5ny3UcwFrEU+N6BGyKugSg8QVBkPGwH3WTkGNWOc8vUI0CKjv2zk3rd/HA95E1qoK1zeoumiZ7zIo2F6A73q0AjktrYX946C0=
Received: from DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) by VI2PR06MB9547.eurprd06.prod.outlook.com
 (2603:10a6:800:220::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 04:35:45 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::fb) by DUZPR01CA0300.outlook.office365.com
 (2603:10a6:10:4b7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 04:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 04:35:45 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.182]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 2 Jul 2025 06:35:44 +0200
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
Subject: [PATCH V1 2/2] leds: pwm: Add optional GPIO enable pin support
Date: Wed,  2 Jul 2025 12:35:37 +0800
Message-ID: <20250702043537.220478-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702043537.220478-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250702043537.220478-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 Jul 2025 04:35:45.0027 (UTC) FILETIME=[C6838530:01DBEB0A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|VI2PR06MB9547:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9a5b6d88-8608-466b-f45c-08ddb921e953
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4hbIwx37+V4YSpV8JvDiQSSxstbWtYtYD/hgE7xXn/Se5xp3asHthgAQVCy6?=
 =?us-ascii?Q?71BMdFOJPd6jK/ANm1+QgwqjHMxmAvb8CfhJRaLJdOSqDXat6QdeYVrSXVN7?=
 =?us-ascii?Q?DHzS3Py50xliGFx3j4LBVgwUm7+yjbcTQ3rjqvrrUp5PO6qxafVRKnBkqpHK?=
 =?us-ascii?Q?fbJz8fWH1xhYEXoOKgbA3Mmv+7X4YhDyLhbt1lymaqM+FaAWGU93wcw+LAlp?=
 =?us-ascii?Q?/bjrBp3xHF+OXYd9dJ5tpz1JhoYMhiwIE1+g0qSMgFsDFID0eLAIALZBdg8u?=
 =?us-ascii?Q?7JSek/h+XDDxVKUGPAS3ZTJzfKpusjM52OFPHFjE56R+nEf0o4TTZh7l01Yh?=
 =?us-ascii?Q?uN5hIKe/r9yvzAjVrT7tjs8NcUfNRtJM5qw6mZCwEp2QzuKOrO4mKpqKok47?=
 =?us-ascii?Q?o0bCa3TNv//ZIon90zNDx+F4Y/rpaVtScjgqGpQMejOsRAdQTgQ8E66A2nr5?=
 =?us-ascii?Q?kJEf+vbhteRjgenUizFuTnoqgclytvnL/kKWkIzXO8uSwUmG2cJBdMe9Ekja?=
 =?us-ascii?Q?mkiq2dOAumlSrCceG92sRLVIm9pXDr+4nW3x3sepFMJP972Q/KjCWteyrkua?=
 =?us-ascii?Q?a4tTaq9P/cVRCTFCybjbI7sRFK4f9oN7gPCqu/7Q4+GxLY2ccg9BAE5NmPHt?=
 =?us-ascii?Q?MT659CPMEtLT+g2fDSpUBFOOdnJIeX+eqzSVnbvPh+G7i6PC0P49ZQaUVlm5?=
 =?us-ascii?Q?CiM7/u77PZCMqDXhGlrk60dowy2Q9cNvFK184yiNp8z6g++E3brPLx8F2uVI?=
 =?us-ascii?Q?AUt9IVu4FGoX+pcUJ3ogvA6pob3dYwN+1P72qs+YUrRTleb6E/iyJk9564rg?=
 =?us-ascii?Q?8b3qvttkKIetK8wbNI5FAvl1szb5zSzhHADaccMGRy0SStPbesqb6fW5EetW?=
 =?us-ascii?Q?Rayod7IYGA0uRI7VYdxT3HJE3BrkveaM894ppsTFHlMGnwjOR/84ko047cG6?=
 =?us-ascii?Q?Kd500NCe/c7FYhXv4ogMvlUgPWyCl0ocm0FLsSiyi+q5ieiWQ7Ot4aaSmYkv?=
 =?us-ascii?Q?zljDAdZVQnfwkGikwViNu8fJtFqsL+I3VHRw0y1W4A3FVlv/xvR3nJDv1skW?=
 =?us-ascii?Q?R05xQ0LpxYEP0MCTbeEKkfb3rqswofzeJPKFbrLQMaVA4zeC9lCYuNlgAf0a?=
 =?us-ascii?Q?XzCFgjnvDypAh3C2wKmwbgIgw21Qev2XCRK0g0Q/zWBr1h2vkMJgky9nLYrs?=
 =?us-ascii?Q?Ql+UL7EoAUvXLiH0WyLRYONpw0BRYZ/Cr5IISBiM7Ssj07NEk0poHellk9N/?=
 =?us-ascii?Q?SkjowJYDiwXenoWWsy/zbnZqGGDvoUFyyy6d0pueEqRNMxbmt+vFBBtuasn4?=
 =?us-ascii?Q?4lrlobHV+5wmqFOk3ij0PDJgniVaYrXOt01/mn7iWmWJG9rmQHdz9/w8Kztu?=
 =?us-ascii?Q?wOpZt0FlZNhnFaHI5qes3fEwvRH5JmLfTAqeJCj8CMEpizsM0Ol0w8lXqOO7?=
 =?us-ascii?Q?WQZ2oCM3+dqWnjDgt75dIbRN+HUY27qrs2iudVXJx8MhMaUFzDmZhJTwj/PW?=
 =?us-ascii?Q?LD7Q95Ul2dHHfzG820NtlAgDSya+XYyN3n4/?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 04:35:45.4742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5b6d88-8608-466b-f45c-08ddb921e953
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9547

add support for optional GPIO-based enable pin control to PWM LED driver.
some PWM LED chips have a dedicated enable GPIO. This commit adds the
support to specify such GPIO, activating the pin when LED brightness
is non-zero and deactivating it when off.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index c73134e7b9514..2b8d746d9d7f4 100644
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
@@ -132,6 +137,11 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		break;
 	}
 
+	led_data->enable_gpio =
+		devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
+	gpiod_direction_output(led_data->enable_gpio,
+			       !!led_data->cdev.brightness);
+
 	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret) {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
-- 
2.43.0


