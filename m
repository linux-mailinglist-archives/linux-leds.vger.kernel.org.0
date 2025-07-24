Return-Path: <linux-leds+bounces-5117-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A733EB102BB
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 10:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75B217B4CBD
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45307223327;
	Thu, 24 Jul 2025 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="JvxNyMU0"
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CB1EB19B;
	Thu, 24 Jul 2025 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344155; cv=fail; b=d3i7dwL+LHYlZCAFCQInKuT5GoYnZ5ZE2bvMA/k2l0EAJ1JG/JDQQLxye6Tt12cesFM83SHNywIs+p6FXzgQmPRBmT4B2SVBWJ7pYxA7SERLleXn/JUKnt0q8EiPR8jDMTzDtxMfIyHhXi0FesL1JlVu0jqojyCKBoUw6HjXETw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344155; c=relaxed/simple;
	bh=W0btxIMaajOpVtEsUeRhfcb3iRqu58PFgTooeQo/ES0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=USvbaqtTnnPurFYnUyn3hy6tiou7H3EU2Yr2zyyDkBvVBPhz3zTlwwe7iEEhX2QAE8Ec1vlM6itUo443X3PCmB0DIYLLy4KocETZAoymg7MDGy4gpqvaxLiISubDesF2PeN/F/lg5ULn9VGzOAitJh+avsFlXZb8Z6My1dI/90o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=JvxNyMU0; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldtBEnIW5MP62k4dZHsF7ihE2cI41Etx4aRlStRmmWn3Z4ZFu5XP+KVkohgpvARHE6vl09IapHZGZqpl7sMFTIP4LDv/4nYBHh5Gl6mH4fb1H+qPYJdRKBZ8c18YtkRzyHxp/gRjb7i7TnoDK4VfoBXkoTpI8PmipL7aw23eCZLQabd8rZwiUiRBfLVh5P8oQYS6WWWOZyie4AIgc/jB2yxeN6307+8IH8y/5ufPJ5m9L6nendOeADSYvmRf4HBsC3NPpy/olanCeikrjwm76MADqmniTkYiKe7OSHKSKZ3zEEnx+yOwekUpLRPoIwSYg49cahoJwH/oYqAJbWHC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLtU3TKW1Tm6HTFz+ykGX+GeFVuG++E9Q198bE0J+cs=;
 b=mSHleOLJOTG531C3X5FFxMIoUnMJ0RMR2R0mG3tcVLtEbqjtZWTVPd8aoYvoFmcZip23/AgxVD0ri3YdaM3b7CkA8QinhIBWu6mprQb0N+odVvtnd8vAnCmX5OYhb9GiSZkGdCPEdCUSuFJb5GGiZUofnQPPCKV1UOsukMnlo/SirDjIFRqY4I8vjDAxZ/a8v/5PcudFv17AlXSL+0TWTpsmgsS+f3xjGgDdR8NqveFiOMNk0Re9ueB9Xs7WLA9lTh7gyZ2QyDg+KGTJzOc8Qk3mn3mcsBAOXyOzn9OUARNaLHHXc6CtvoEk+qNr6x9IdijMVIbESHkYAPDQBaKC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLtU3TKW1Tm6HTFz+ykGX+GeFVuG++E9Q198bE0J+cs=;
 b=JvxNyMU0NNlwYKh56so+Ymas9AnI2ixLswlWX/o0PDUCDyCJwotZG7dEsRJJic2vt/IPSJXPOZ9jSBCpTZ8XxTQWpn/D6YCLK9pB9zjd4hIJUSlWj2AZjda/6Q2kNG/luHhTuQtaK6rWshrRXWHoxqZqRc2DAS3aqHC6hlpJ4fo=
Received: from AM0PR06CA0081.eurprd06.prod.outlook.com (2603:10a6:208:fa::22)
 by VI1PR06MB8736.eurprd06.prod.outlook.com (2603:10a6:800:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 24 Jul
 2025 08:02:27 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::3c) by AM0PR06CA0081.outlook.office365.com
 (2603:10a6:208:fa::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 08:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 08:02:26 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.42]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 24 Jul 2025 10:02:26 +0200
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
Subject: [PATCH V8 0/2] leds: pwm: Add optional GPIO enable pin support
Date: Thu, 24 Jul 2025 16:02:19 +0800
Message-ID: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Jul 2025 08:02:26.0285 (UTC) FILETIME=[4B53D1D0:01DBFC71]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70F:EE_|VI1PR06MB8736:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 17ef5a08-2e06-4d8f-f337-08ddca886e1a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BuzPpARGj5VjmQlcfT+ykjoar18N97ZHEdMQ4ikn5SQzSBeg+f447mWLSjsl?=
 =?us-ascii?Q?BToDqIqIelI2F+tUMl9UY2ghAb80EpWMWbskB06p64SZIQDFv0R9G+m+4zTk?=
 =?us-ascii?Q?rpE8EROu1DwuMjrc4ScCgxCAznN33On5FdQDbqj8z1tsThHfbQwxv8oKCg07?=
 =?us-ascii?Q?9bzVReDliW9QQGkYYXJC4DIMei4tw8ixpQ+RfU54iPEb/BoC6n9WEhZ5OV0d?=
 =?us-ascii?Q?OS0Ti98drYuil7FrF6cwXF7sMMPjsMOHgtUGNt91c3nnDfdt6/T8V8htmV+c?=
 =?us-ascii?Q?2HWnOA9j7d7ONcrfDULGcPA9DHl7nY+oqLZZ2oD2/GtxJUqGcj3/35UO9Tqq?=
 =?us-ascii?Q?q3d1H4TOoxTrUWZza783hOp5BqAWqINmXqHSom/dmq2SVCi4XujWTnv61DaF?=
 =?us-ascii?Q?LW5ihz7yqyHynmfw9sZMxsj2oNu7aVqlB83vU1JA+4Zr2hCqtj0PT9MFcDEK?=
 =?us-ascii?Q?PtJeUBF4WLEwtf2DDygLW0ulf5ot7rCz2Kd9Dy1LNlYVKzbqMHB421+q7jDo?=
 =?us-ascii?Q?YyCYglIruFP2oeH3DQw/OmciZpAYYvRvYTBpR6Ck3fT6522dYaku7qFs5/GB?=
 =?us-ascii?Q?kf7c1bS6EbGmdlAIWxAt5ioe8n6tM+NPuPBJsA/vKMeZ0mBeRJWqPvXGMsYF?=
 =?us-ascii?Q?zwdgFBVWHP6fIQv/4+Ro91u7POYYF2TzTcWz929p8uYSdlqPHcYL3hho7l5w?=
 =?us-ascii?Q?EBhcForb+9foRL8AT6PZLLeRm8hHHainEyePTdH8QpS76aeL/7omU6eQiIZK?=
 =?us-ascii?Q?ylLuMUqWP/vjMPZolvxvcAN5S4bO72NYoLLiVJwFFd7myJwFrfCxI6iIc527?=
 =?us-ascii?Q?ZJwcSFvu0AEX2S93FkILWqLiOdQzIcj/h0sUWuOyOUeJPJK36QbsXhtUUExP?=
 =?us-ascii?Q?U7X2YSMlbrfuil5AOmYLer8RP2eMo9po7K3cnmpNnr/U6Z5v73fUAFIwp46+?=
 =?us-ascii?Q?yqyLH19xOylLP23XWE/PbWKw/KR6i2iHOjnmHNVTKfuztZnTjv1Itz9SNYG+?=
 =?us-ascii?Q?ynNU6W/7vMawEz4t4TkJovB/3cCEZuvVlacOPt3Gk9hAIG94RQJ+DyN2Y7yh?=
 =?us-ascii?Q?ni3AJU42qMoJXuWtJQ7xoOHV1ZuBcqqpaxP1OPu60Eh880o4m+sicADgNgI/?=
 =?us-ascii?Q?bxDBVA0GzdDb33J2zK0Nxi1BF+g05/fnjX6PkdjMWa+Hy/NrHUi/7iN3NKPh?=
 =?us-ascii?Q?4nypYe1mgcGia25Vc04wRa/bBbOYtMoOn+Y/HiKhv8/p6Yu3+iB2VonYJdhV?=
 =?us-ascii?Q?SOctmbwcElY2XqGqWrFAWiRMS8InZ+A9DP/m2GMjFSBzosgG6HJ4EdQCkXA7?=
 =?us-ascii?Q?uyzyhjMRhmGxFFVcw76VO5ZpbBwqIOiNTesQc/CNe9DMoyz1lGHOTSxgj8Jc?=
 =?us-ascii?Q?ONyaqPfzUxnOuz5e0gQ+EkI5jZqwuXocxu6HpC/NFKokjjF7dg7dzZPCIXeY?=
 =?us-ascii?Q?rlOk9op55rkLhlfRY/ZjLOdKbt8XtB27OrBVtX2hhsz5JoCz96sWkyt6uwP7?=
 =?us-ascii?Q?sv0Nwd+WLf8M+/FW6Ovsc4G9u2eBlgrh0TJx?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 08:02:26.7040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ef5a08-2e06-4d8f-f337-08ddca886e1a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8736

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

Changes in V8:
- Format to one line according the review comments from Lee Jones.

LI Qingwu (2):
  dt-bindings: leds: pwm: Add enable-gpios property
  leds: pwm: Add optional GPIO enable pin support

 .../devicetree/bindings/leds/leds-pwm.yaml    |  7 +++++++
 drivers/leds/leds-pwm.c                       | 20 +++++++++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.43.0


