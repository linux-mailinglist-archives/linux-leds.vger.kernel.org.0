Return-Path: <linux-leds+bounces-5001-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246DAFA97A
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 04:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E8983B35E3
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 02:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2D71A0BF1;
	Mon,  7 Jul 2025 02:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="PJI91t03"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E0635;
	Mon,  7 Jul 2025 02:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751854086; cv=fail; b=Tw6O0tRqsVpHeKD8RX/OxB+CRignVNfJYIl4lRM79uz3voUiQj/7DN48X9w/MS+IqzcsqyXsxdRgyk/dIUxhRBPvexhUAUQRbVb6GMgYRo5vr9Y/k8BqHU7Px3JIjy/0jPnKHBm2gvUYaY2WJQDDTnuL9nwDiOtS6vAAsx0ICEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751854086; c=relaxed/simple;
	bh=W5uD/9968LP31I2Wx7lkPkZhM66oxB0Ewfyy0LiEJqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nlkbAVVDArx3iuDV29neV8McymKA9kuZimUyaJfLTs9LfXVTqaUU/UX5+KIP4xAIMsRr/jo3Iuhp6nHiB4w6FTO5PIJcnw1F4pem+S1VskqqsqLePcQaAeihxIN70uxGbR/+fPClcHD/UL/I01MZzcFdqYzyDdG6heMCeCNr4Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=PJI91t03; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SanrQWIeJ9B99pbY/0S50PYDgLo5CPpvmmQutDWzbyfJ1RoL3fpzeIzT52lkkfOg4ZihQw1KAEbGSjW+3BWdR4YiQQKrKeCvyraG+rykDmAD1v5af8xZKtgHjQ4u0+8JtQz9+RmDGiybQXuN5rqYn8pD8Ypw37HuGnfJ2EJjabOzBiBIVbbZtqAdPCfLhSCIxCWDTS4+HDW7zCWkrSeAwvnhWXBKu0+VXuHV6lm5fEQIbJHDdKztYjRfU7fS5TTUSeGnbZDAxMkSZbI2IGdXNkrykObye6gx1qUolwm6o0KBv4Wsr8ovVS51Mx0xMgVyKnLvnHDyYqnKZNuZlmyW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thz+TkeRv+JchKqMNuKd1J94aTq4xjwDgFFpbWOsekg=;
 b=UpvzAAbwWBwNohwvhkKoiVfKLY8iNjwX49ZRrhR3Nhn5ebGr05ShVieWFiWUmwb26mEE9HJjk3o0RaP3UFmDG37Me/W9/h/FbabWG1vkVOuRfVj16F4GaT00bg8lLam3WMw/+YEL4GGeb043v0AdJizry+cqQrxZMlVJ8XYHFNNIsp2y9ZhElqUw4QC8NgYTGJVF2MlE4ra7TQlh2auQStnzQ5mLeKf3oHXhsxNa/8iJfWo2j+BF+JWEC+FEkcNKIMpK7Ed06AAPo1qPi3ci1iDpx3kh8Hr6hCTHmOSMsfiZKDOhfdk40rNyCd+8PeUcfECC7rY9J+OkREJQ199jhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thz+TkeRv+JchKqMNuKd1J94aTq4xjwDgFFpbWOsekg=;
 b=PJI91t032OzNzgLL/M6N+RtPtJzAaaKv31zkB/f/+iZ/Sn9Xwd0ZM3sQyaKQ8E96nSPIMquEcNGNzwA/3wXUx3Ynqw3MBvGlHh+6ENkhAH3biN1+mtol/QtWjLzTd6AV/iAanMlRwqZOuCC/82GEHQCxb1/WC0uuNja3wrWsesw=
Received: from DB8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:110::16)
 by GV2PR06MB10036.eurprd06.prod.outlook.com (2603:10a6:150:2ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:07:59 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::c3) by DB8PR04CA0006.outlook.office365.com
 (2603:10a6:10:110::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 02:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 02:07:58 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 7 Jul 2025 04:07:57 +0200
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
Subject: [PATCH V6 0/2] leds: pwm: Add optional GPIO enable pin support
Date: Mon,  7 Jul 2025 10:07:50 +0800
Message-ID: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jul 2025 02:07:57.0552 (UTC) FILETIME=[F526F700:01DBEEE3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|GV2PR06MB10036:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eace8904-6863-4ab4-6d7a-08ddbcfb1810
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7qAIKyUb9dmDvq6JMJd7S/e0+nrA/vXBnUzuNM7PcoeibSO7yFNwUtvKXLcr?=
 =?us-ascii?Q?vYcuaRgMtwiLzZytR/akRafkpLBl5H2rW6GhQOo4uyLuo4SO1ThYpJ6qt3ea?=
 =?us-ascii?Q?8dDmrBymyjFRECd8I69CqgVVPGmG7pmDDDGijvri8ChhA20wBs97Qw5vTeys?=
 =?us-ascii?Q?EI32rPNBtF9miWvFlGNfudslY4IPTZefpdKIfDZko/GmSIgzPj1ZDMc3KNu2?=
 =?us-ascii?Q?RKWH0IQ3jf1ETqEfOwUF0pxAOhcYzaQVwpzE6DftZ/xGS529h3R1Y1Tvj+2t?=
 =?us-ascii?Q?QQaKyWNLzrTwg2oBTGi5EXW0oX25D+Z+e3Bm9qBSnDqwSLSuIt/yXwYg687B?=
 =?us-ascii?Q?soP/kOmNLn3xrgw6Z+oDvXxdpDkinmNwj7rddWY+cUrhNOi52aiGpiCciTdz?=
 =?us-ascii?Q?HycYhGg9/oORre/5cEOIDOVoX3h4xq8vSz4K09AvI4pee9TeilFsURS46cWg?=
 =?us-ascii?Q?teyNEa5AyjcBxO5+3toBgaNoLNj3IEwZU/G1kcn7naeW3Y+MGvVD/FpDHz8N?=
 =?us-ascii?Q?X1lQkC0NM8NZ4brrRzHtvNrJYwsyiHJF5hrNweWYorm6FnIiOHwUd0N3foqO?=
 =?us-ascii?Q?lr0rEzPp4+Pd1VMTDcH78TKpk3Ks8PQWsRyY2xYovlAcFJx+hz/+xNd9tfDA?=
 =?us-ascii?Q?hRpX/yuZJ1KmzVOgHMp69P3leSkzVod79UTz2GK5Qu9t1/hBLe1iRQKrzQ0g?=
 =?us-ascii?Q?TKKQESnz5j13MrnrObCNoqr9bAbknjs9SvF+SsHWpvT1EXCTGIAdc0/V4rIC?=
 =?us-ascii?Q?qgmy6k4zBX3BzK278cXbarugvcUkYGxhIVgLTBX4msPt44lDjUlrv90rVf+B?=
 =?us-ascii?Q?pGMBJlAN1eMA8s1eO3/4pZtyrT9SqxT+66DfPm0k5JW0W7SKEOuymPVzZFTK?=
 =?us-ascii?Q?hbj51vEDF+n085+gLjFuOkUgSMNMjvaUTI2iAK2rT+hUw6nM7J9Y32gysztc?=
 =?us-ascii?Q?l+bUGm8UlwVvUf/jrL52VHUXSwA8U/IFUKsuIwIVTBPrnKChrkiEhHIsthyH?=
 =?us-ascii?Q?vi3cK3SLyzqeo9egIRzKcteAQJ+lZ2xlhH93QSk6Uvg9GqW4f/UZHIax6tF1?=
 =?us-ascii?Q?+dPMUEUq87uX6pd9lBuZEcTuDxOjKqEVudqcWpGvtK2C+6ACk8gqHEK7cZo9?=
 =?us-ascii?Q?3ezrGV7qVHt2rDdcSKXRENIu9zX7WFy6p1MhWJH+Y5GHd5E3uoVYFZhxRuZ3?=
 =?us-ascii?Q?DxG3SAps8uBKGsS0U+CvkPrTBYOp0KQ09CeUlb8tnYzpzHUwQzZEMfemUl2R?=
 =?us-ascii?Q?tl/Oh0AB2VlVaOu8w6sVUjC9HgG35Yv4okcS5A+lM4CqBuYrFX/NIpI8/7Ar?=
 =?us-ascii?Q?j2U3cPM8uZmuyf4gFgaFh/2vmgTTjkv4d24/hhqqYJmqL1bd1zQUTe3IrzVI?=
 =?us-ascii?Q?uNAD2qjWj8Dd0P4K5jJM9CRvuTGrSWPssYO0f+W4ZrC/8pZ29zGFdvfcH7t3?=
 =?us-ascii?Q?0QnBQ39nDRcnoaQFY6J9nDFqtt0L4LK1BNl6cedrZdMbzCWJOxYlGLfAn+jz?=
 =?us-ascii?Q?iDSqJXiRTZqs7tS2kU2lHKKXZhR3CEfA4SIN?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:07:58.1549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eace8904-6863-4ab4-6d7a-08ddbcfb1810
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10036

Add support for an optional GPIO enable pin to the PWM LED driver.
Some LED controllers require an additional enable GPIO to be enabled
on the device before PWM control can take effect.

Testing:
- Tested on i.MX8MP EVK board with TPS92380 LED backlight driver
- Verified GPIO enable/disable functionality works correctly
- Confirmed both GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW polarities
  work properly


Device tree configuration used for testing:

	backlight_keypad: backlight-keypad {
		compatible = "pwm-leds";

		led {
			color = <LED_COLOR_ID_WHITE>;
			enable-gpios = <&pca6416 11 GPIO_ACTIVE_HIGH>;
			function = LED_FUNCTION_KBD_BACKLIGHT;
			max-brightness = <100>;
			pwms = <&pwm3 0 2500 0>;
		};
	};

Changes in V6:
- Collected Reviewed-by from Krzysztof Kozlowski on 1/2 patch. (Thanks!)

Changes in V5:
- Reword commit message add TPS92380 and LT3743 LED driver chips

Changes in V4:
- Reword commit message to specify the LED driver chip TPS92380
- Add tested device tree configuration to cover letter

Changes in V3:
- fix make dt_binding_check failed on check leds-pwm.yaml

LI Qingwu (2):
  dt-bindings: leds: pwm: add enable-gpios property
  leds: pwm: Add optional GPIO enable pin support

 .../devicetree/bindings/leds/leds-pwm.yaml    |  7 ++++++
 drivers/leds/leds-pwm.c                       | 22 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.43.0


