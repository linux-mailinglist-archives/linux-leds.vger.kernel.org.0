Return-Path: <linux-leds+bounces-4980-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89433AF6ED3
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 11:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27FCB4E7819
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3982E2D77FF;
	Thu,  3 Jul 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="KhAWfuQT"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF82D23B0;
	Thu,  3 Jul 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535286; cv=fail; b=Fhl9xaJ0VIWgm5Iu4GOu89NI2cq3PeVP5vXWX086SPLgzammg0LtL9Sb0toFO9pt1FVs4GhzJxOqLMky1AKNlx/UgVBzKm+Io8pQzu9pYcpz4aF0tm/WcKC4ZvtRdzdsT/eRBk0qCgfaiOu7kst2lXJeS5X3gWFsFGLwcGhrDzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535286; c=relaxed/simple;
	bh=g22LyTxh/ed54YX4M05+ONegfh95sMqe5bnfWmRWPjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QQhTnc1Xl982IOHPjRLKc6pde7zwHK0eezqvHbesI5O+vPqpl3ZvBRtdDjJ8Xz26txVRKW4n3BgrO0NdJIQx0Adf+xL53eqM2pKy58U23vzIShqNy0f0diUeGw2fF3hWnAmFXC8F9ExLkENN4Xhh4r/LvfXnhtpGQBtp6ULr6ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=KhAWfuQT; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXJxSwplD+VUSTnfL+bFjII0Rfw44wJV81wNqckLQSW55bZo2PFvLaNNNlNtrlcTrvIIrKc2/nZXnt5HbPUc+uhfcyEvmCeYnKimTkWsWZq3kmEDVWHM5L/rcBRaO5JMMAutTqjcU8+vMwnbQ65OgAAepoWw8tlTKk2T2SXYbobhXbx1f7IsIbLznynRKxGLRRM9GXPegNmbwlraR4ynIByVhZeGRkY2b1grO7+y9ENxKTx4LiMn1vHZorEiuuES+N7cVYXfCUh3llkIc3RjnH7Wk8ByoNl6aRFQkpjjUukSbB4onIkjo2FbteTIrwD2djiE3nVO1NIh7GZc1Q4Sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87y330Bmtst1DnTMvjV2i4rTmWQdLEc06KMnxLkfxg8=;
 b=wa29BOTaxItzKkQpM5bpQ4hVu+4YeSO4e8Zi0AwNkjCWCv9KI8AXyiByLggHJkoOyfWNYmloqeLkJ8DLtJ57jTDzPzI5OSQK35QXF2PNrcaKBMXr6ljQGKCz/dYCIlQ6xZP/GsdY2o5K3qFevNQSma8qcvAj++zSl5b4G3q7tiuGc2JNyiiFXcBIC4FmFq5qtXg3uK2r12WRBAMaix2dNyTX2xFhVF7PHVq+ChK2G63Bublyk4ty2h+Klg4kPp9RCn2G8zg1AFLgIFidMU3WNb8FC7l+kkZ/PHGT875zJqSaW5BdI6ZxN8ugHF2HY9zEmWD0MYsc/YSOUlzQtZ0/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87y330Bmtst1DnTMvjV2i4rTmWQdLEc06KMnxLkfxg8=;
 b=KhAWfuQT6lnfSPwh6QbEEcjvQ7f6/v+jQaDZdjKvUIcWDa60MWD+kunRg1B7Z/Ecs6Ik7KJVJdSVuLVqRiT9/J5ShPPn6HWOwbc/Pcq4y4j0Dbh1xSTeh2Id17A1E0ZXo8PIzlPxzYWQ8GQOL5noZhaRaXPajxgoqw1eYxqAp2I=
Received: from AS4P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::11)
 by VI0PR06MB9422.eurprd06.prod.outlook.com (2603:10a6:800:23c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 09:34:38 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::c8) by AS4P251CA0021.outlook.office365.com
 (2603:10a6:20b:5d3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Thu,
 3 Jul 2025 09:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 09:34:36 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 11:34:35 +0200
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
Subject: [PATCH V4 0/2] leds: pwm: Add optional GPIO enable pin support
Date: Thu,  3 Jul 2025 17:34:28 +0800
Message-ID: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 09:34:36.0211 (UTC) FILETIME=[B0BED030:01DBEBFD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|VI0PR06MB9422:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db9640ec-4059-42f7-cd2a-08ddba14d390
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rB6Ehq6fSLl4uz6GKNVew5a+C1SgJb84zeNklm/ZDtuQ3edfrVb6JgKEoYfm?=
 =?us-ascii?Q?z2R5bhUJuq8Yuz9VVybwWdXdnRqSjWOAblk4wPUITl3kVUp6LwNOCEq3GR1A?=
 =?us-ascii?Q?WJwi/1fGqtuqQsbVaNo9ulzGCsq2UFC00ItgDR/nFM48UzhBE6RQnErwZrMW?=
 =?us-ascii?Q?a9mAFQY7pqWj3Ii1zqSW/qEg8gR1MlLS3H6WzwAHcT3Uj5OKr6/H6+8A3nQ4?=
 =?us-ascii?Q?/owII2B0enVPvrV5HpmG7uoNhbwKcj3S++I4EaVOwYqeDwtCPrE8yk0Sgrqu?=
 =?us-ascii?Q?eKLn2o5aEGZ5xSIq9Tyglu0yOGi1VHJ74rIHWpcAV7qM2C4FxHP/UErDlykt?=
 =?us-ascii?Q?L/s98ZfbSagvEj39TiDYyTZGM1hyKhZfwzXna2O+ffci38l80706QBpnEPlF?=
 =?us-ascii?Q?/b6Sh+P22rU1pdWpYrCcGQ3+SJBI5M4Mr5uxpvju8Or70UTx87QU2QI0/t+7?=
 =?us-ascii?Q?sHP8O8uqOj/Vhcm49/PHSzma1YTORfd7Eks3DydmEfaxolLvzmWbe/dTUEZE?=
 =?us-ascii?Q?eClWH8sMQLgPrmGlADXuLtOQ/XKzZRbIaZvrP6eDeyxVzZ//qihNDX1RFajl?=
 =?us-ascii?Q?zQOpVWHQ54/0SxHaxNBrGg7Y8s/+7K2BtiEUrLECG4UotCAIQKbaz5oaFoCu?=
 =?us-ascii?Q?w9mfcxukB+4VD92FXv34GG9W4uGT0NYOSizPOOnipYgJ5GNJE0iUSa9DzMfg?=
 =?us-ascii?Q?WYgxXzTV/r6zJoWL8uuUkuvhB7yARHI8xjlIXpIZg6o7LgyBVl4q2n17+KaJ?=
 =?us-ascii?Q?+2amScLJ3E6/N+BD5oQ6tsDyNPsQxs351Dl6Mgw4seK2nrid5FMon6gccr3M?=
 =?us-ascii?Q?ZeVYTGu5x0wWvkf+BtXRjV0DTH1V0I3sFQiX8IZadEUxmZkXoHiG7IlFjki9?=
 =?us-ascii?Q?fHVPn7PraMq1dESusQLCqdDn9dlsQSqMjYAlErMoHdxZEVH2bk6GjWFM15CB?=
 =?us-ascii?Q?idSsKPV+YMOxBi2o9o8NcKqay7WLTVSGL8oSPTehhIgYmEqb9K5nzXy+ua39?=
 =?us-ascii?Q?8/CamuJo835X5QA4UtT7x2AH4qvMIGUSdv/zVtgkIF+uaoLsg7XlujLRl1E1?=
 =?us-ascii?Q?zFvbOahtA1l0l4A0I2mvRCFN4gkW14j/eOLy87yAJzIE8T4cLXu7HTB0iW1s?=
 =?us-ascii?Q?1lMwBculeoA6z6pp3Rcp3pNzE0P2vtt9euIPhwv69q5hhodcuvN0tqPgqvGf?=
 =?us-ascii?Q?UrV87cS6vsrLl8RfTPDPXGPfgxaFE3GnPqmh3or26ahjrM8vRrjNpH6qGWY6?=
 =?us-ascii?Q?fBhw80fYOSY5MAP2lvJFBKdAMKmdu0L+ERAbvhsrl/UyVYpwLS4weMpmwQaJ?=
 =?us-ascii?Q?4UUiwGUC10Wnlqd5E2iSSi+4NIPMeqP/Q2Sh345PTUroz/kPUWgL+/9ddIUY?=
 =?us-ascii?Q?/+jdf8U6C/WeuxSENKnfXjFWhME7RYXhpDyOdP/k+/sdiR5Iijf+vJyZ+QBd?=
 =?us-ascii?Q?c+qQGn+pA4AtUC3WUFmYSqeB8Nv3pc5mJVOtAUMW5hvOFIwEMr/fd1DiSExv?=
 =?us-ascii?Q?ePLAiuvlT+ACHXuhSZlWP4zcYmkhWXFj22I5?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:34:36.7057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9640ec-4059-42f7-cd2a-08ddba14d390
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9422

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


