Return-Path: <linux-leds+bounces-5064-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E5B05046
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jul 2025 06:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB06188D3E2
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jul 2025 04:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935AD2C3277;
	Tue, 15 Jul 2025 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="g0w5dBd1"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93325D55D;
	Tue, 15 Jul 2025 04:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554062; cv=fail; b=sODQgP0nR85QK5OxBH/6Q0hj9gPDwQ/v2hZnBvvKd7CN1XwSmgL+r276dWYAuaQnUnfn8cfLhybTWpZVuZXd3vXQaJKMg8sXE4SweKlCBuHsWXI0uSO7uHK7TgH94Y/y/HXHDFuZBelZDsSqEcIXxWZV89vUV+DklpUhTYb1HVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554062; c=relaxed/simple;
	bh=C+J0cEKMopRWZbnFggQn9O7G3ByoUWrl0EJ1ATxzzp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gMXAafR8z+/oeGPi7iEHbHbYTg0hptTG7L/jo2BAw4Nc8g5mhZCNbldpmF0P0m9AwqSdecR/2pS4wdQrTAk1HY2RumvwwJ33B86ihA0WrQhsgVLSdtDAGgErZe3388nOcheKoZBJ16Rva7e1qHZ0EEIFn4iTkDRYsXZuquppuaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=g0w5dBd1; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LI3vBVLqoiCK5VSf/je/b3gnDkKAi/Xf7Pl8mLYvsf+10wPvTs0e98E13YLVgejsE+5pG8IUlgBh9R2B7BPEaL74wPGtaaB1QQLOSAWWCo12n/lo5DUOMt7DFvvJ/Xsjj7o7V2LvYFjtZayw3syR4k9zOa393T5Pk4nenKhFANt50JKwwapG1FkNL5iKMH9pA6etA3jUEZdx6KNKGJHo2ceOvdW/aF2wnaIMBpfggebIiYMSlzaB8RZYmkG7GujVvFtk6SgiTMrRmJzwRFvqEcpMIwYFJFMVeldzTCG83yVm45kvi80dztVnRHhvFWfusvZ5XWHxdYrLu5FNRV+V2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPWBvx0jdygPRw4B15xLPokUuRjjfovgbOyv++j2e/U=;
 b=Q/rlAYbQhaOaol8PStLx1i60nGtb5mS6F660xBQ5nKGIPbH+8/iaYIo3pZYezTu+8pQFtnTrbysHtPTyHJmd4upjgBOoLeKWfKSPN5f24LZCepltBxcH/DyW5qaSpiCxwkMruBGIb38yT4N1rPaWfzMTxBYey3BiYKjKJcnLWqtxo/6rxKPIPLWD04sNv2olhBj0x0kW3TevAm1/1gApafYE/tjZKCKmpApKP6Ds3G4J48xEIY23D0vZVQKnmBO/6Cu/PwsvIdBbvdwxNDyQjx7J+XUWGJyrR108VF9n6ZLLqt3DtqdYBLxlVM1QZzpQnG7RVMUs1Naw0QSpLe4/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPWBvx0jdygPRw4B15xLPokUuRjjfovgbOyv++j2e/U=;
 b=g0w5dBd1MWOIuohwCIiFpchxC3SlXYC29WEQasKg9j2/0xH7REc0FUX7GROntOMWQ9wBek1JEBDZOk/4TZtm5tlwAIz3a5Ck22PigFf3bTkiIspfWb99gfyjFSKoHAG1MsfVJ9+ETUSxv0MZdwiZ6zAwINvTeY55z+abARrM/nw=
Received: from DU7P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::8) by
 DU4PR06MB10095.eurprd06.prod.outlook.com (2603:10a6:10:5ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 04:34:12 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::90) by DU7P195CA0013.outlook.office365.com
 (2603:10a6:10:54d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Tue,
 15 Jul 2025 04:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 04:34:10 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.15]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 15 Jul 2025 06:34:09 +0200
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
Subject: [PATCH V7 0/2] leds: pwm: Add optional GPIO enable pin support
Date: Tue, 15 Jul 2025 12:34:03 +0800
Message-ID: <20250715043405.6281-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2025 04:34:10.0127 (UTC) FILETIME=[B551ADF0:01DBF541]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|DU4PR06MB10095:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ceab3e14-edd5-4023-1a8c-08ddc358d834
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1FWXdxZNUm9LXkWVqa6L1nTSPILmt9yj4i7k9rDVcU1al9XEk3c2fck9bUNo?=
 =?us-ascii?Q?MtdpR0+K9x8f4sL2nIhtLLV5OFwihgu0JyZEs7E8Dw79UbBPDuXr1RBQv81u?=
 =?us-ascii?Q?O4+Mly+GR1vTexglqhYMSWOcRuucaUpft+aQCCyvNgxGW6BhLVYZzr+J1rci?=
 =?us-ascii?Q?1guaqfaTzXpJ8R8rkERAhOjzcCnue6LgbS60Eat0+VfAVSC/kb5eew+dE6cT?=
 =?us-ascii?Q?7eTunll9kjHTKuVLbylSYyjwP/I4YVMbl5JYPnd1mjG/eb0cpQEPwz2h7o+d?=
 =?us-ascii?Q?fO9lYD9KexYMqeGBHdrxX8w+Z1Vqb+J1LhywPy9zX9i43lbOnnbib2UnNmBJ?=
 =?us-ascii?Q?tL3GmJudOzNgyfVX5vuHRUl8swM8W3Mq1UJxXmjdcMMMm7hDTYoFokMlDJay?=
 =?us-ascii?Q?qk9CAIDB8ojzpQsICMSOU8KuCoJbirzcNXvFlSMyIWDPZ02lCclYPjPhr1DL?=
 =?us-ascii?Q?fNl9hU/eLTTNG5wa5VogFTm/XX7gH7jQOA0hYQtpFKxJVFa+TSNOVLP/Qwos?=
 =?us-ascii?Q?kAQVhMVsMUgOH9La0d6W2FKF87Grfzxjn6pXpZPmhKSPI3Mx3alx3Cx5Oakp?=
 =?us-ascii?Q?bPFkV0OyJQCSzpaiI52/phk4RaQE5b2zowgduhp1qhuIw40rALjCid27le5M?=
 =?us-ascii?Q?cQ/IU0+XCLo+KSUSikWhxDIR4kH6jS/srfQCIF/FCnOFbGo9/qre4ycIRU1J?=
 =?us-ascii?Q?scgcjhNQ3zKMh/t08HUNGejaK7s3tLwL9hCm6prA5uuAdwA+BvWzLf+Xplid?=
 =?us-ascii?Q?fbNt/zw/fmeyo2Uznffofcd0CmKbO+0gW2bSnWgIEDa/UqrlM6iC9pWqXBnO?=
 =?us-ascii?Q?MU++cGeeKDdAUwkzrW9gb17GyP0i83sAz4VaKqInwVs9NXvaODijpJNdFZ7K?=
 =?us-ascii?Q?Ge90cNkxPuezr7OlR8vpk9rFbAnxbyFu7+eVB+cIa3A0IXEbwEsRHIsiwGSj?=
 =?us-ascii?Q?C36GTFTJRYsCvih2uTYSdp1rnTQ2+eFr0iTWc/rJfeVMx8IZ3Kwp76QFCU2H?=
 =?us-ascii?Q?FABL/2sABz91hednjhdnktx3XKOW7aOT1ZEtssC2LTsxQiUKXCJQTzfUlFFo?=
 =?us-ascii?Q?tszl4TMQn5dkqMCVNFP0Xt8wHcG6JCEzS6OYNBNsu+IOZt9EoNAM44bplnY8?=
 =?us-ascii?Q?9vwB6QA+bny2lo0mK+0y3LXWys8LA0E9UMmLoJYvlECpQm2j0Ync/iSH263M?=
 =?us-ascii?Q?xT/t74cHfVay/wTmVQky3PatjN2Tuf2naWOl+gDzhPkCWqT4M//iJMKM9hCx?=
 =?us-ascii?Q?e2jVZqwaE0rwvuOZVDzhOazjvQXn1IHLQ30BXcqzCFmJytj61aCIppSjrpsZ?=
 =?us-ascii?Q?DTzatefc/JBKF+IFrNBtr2nhMpO/EJK2tFGKlPYa9yVhWW9Mbz6R9vhr9Vqx?=
 =?us-ascii?Q?zzedCA1jrTSvvetduWi2Frfhw82o0VH7bOHnEf7uYtJiqdVo+U4s1Pt+i6HY?=
 =?us-ascii?Q?XpcUl8CiPYPeRnzKsdS2df9RP8B+s513ZehM/YAL8seKRRjaqcPth/znnPPo?=
 =?us-ascii?Q?m4wgi9rOeh6r+uKGlUi9tDvCpG5VRfHK44OX?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 04:34:10.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceab3e14-edd5-4023-1a8c-08ddc358d834
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10095

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

Changes in V7:
- Format comment to match kernel style according to inputs from Lee Jones.


LI Qingwu (2):
  dt-bindings: leds: pwm: Add enable-gpios property
  leds: pwm: Add optional GPIO enable pin support

 .../devicetree/bindings/leds/leds-pwm.yaml    |  7 ++++++
 drivers/leds/leds-pwm.c                       | 23 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.43.0


