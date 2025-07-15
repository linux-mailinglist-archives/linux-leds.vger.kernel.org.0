Return-Path: <linux-leds+bounces-5066-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F7B05049
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jul 2025 06:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41E931887CFD
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jul 2025 04:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBF52D239B;
	Tue, 15 Jul 2025 04:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="pus+atp0"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3425D546;
	Tue, 15 Jul 2025 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554063; cv=fail; b=aQRMrRRSPDcZSdFyVdZ3EE9Vfb8RIsIG++4GxphDhLZvADqbovFMsXLRObaoskBudtS5alSQEbkztVNGsZiwVM1vNg4ECyglf3cb/YF5iHY4uxPZjStFjDzOlFB5rce/lxhIRoncbwMoB/Zgt+CN/ObJGBe0n+yUZ8o6h3SnyI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554063; c=relaxed/simple;
	bh=QOAAYSI5jZnKRVp15Pw1+ekIfEBOEX7FIgHj/b/YkUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Akt65wl1lkF+ZBuRJ9tfry6TRYQqioOENs2++zj1r5+Q0KrnOPuWW5eJCg1WaD5CTAYAgIPYv8I1BrBEPoSjVvCRK6BGQfSMX988RUlqprk/v2/B2Vygqnm7Z+X2VAEsgH5Hb6iFCuCbjSSDgFypC+y6FS/U/EZzDW5UrrPWdFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=pus+atp0; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heV2aqXNjVuu7cxVEoOFzMhf9YiF2GGHvRs+3GjofIdu3YHRX6d5UcZIRIbQjqp3PQyGxB84XG6g1f9UeJZ0uw3q3z+RxY/U7XOUgzW+HxUa/C6X7vNSwQbUKqVJKzdsE/1SjMXf8K5C2VvkXNn+YZX8xMyStHCP2p5mVzPLrArdHubCv8kDLl5+PTIvcRQUYisZvJXLL0gqcIlCJgBtQeuGtTjsKQXm1UnNe5I7fbVLCOYsQzgyEe1cmEBixMDI0rWU+aJFjh0k1JHqwc379XWQzy5Axka2OQNOUBeAcvVixvj4SDumIlOPrLEBqMcMHRxM1Xk8A7/FThj0z0hRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT6Dj1SdT9H2YRcyDh2+gtcz+R5pfwvvnL0vv5sFj8E=;
 b=oe6oJh6bSEWPz6wIwix+r4tfxJUXiyVfpb7j8G/VQteX2YL4FOT8F1x4RgvwAJWLBBWPE3UQMMY2HXCEZmGFzHeF4SuUB9yeuQieWqT+WVG3cof5Ry0VYVck1rHeCid0m30N+XMJHkXNybUrsLpPyHmWSkEigJGo9NH2pMg84GWupHLIkLBMnX+HPQ5J7VC1hdc9ZQDr56eGKxcQSceq7IZA0gP5oNB1uXdjInZORurPAt5VLXaZUv+jSBA807abuG/RHAo4Ld3H6vvtn6v7oet1VH2psHotM6r3GpqgfxlOvWuS9DyLvKAKefsJIGz7N/lLP+EOWXz2BMTaYqaYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT6Dj1SdT9H2YRcyDh2+gtcz+R5pfwvvnL0vv5sFj8E=;
 b=pus+atp0mQc3CGON+EgHUOmlbL8uRZIYc73mKDD5+gtWvilTDoFbGvrSHsV2+XxGIKtvg+9m67boE0VDMLCFVdIDlawM/l0KKzizCiA5QlSL5JRiE4J5/IuOQGQH83bMf5oHWgaFtv/U67s43xgWSh6LJENYF7f8oXVx2iFkId0=
Received: from DB8PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:10:120::24)
 by VI0PR06MB9544.eurprd06.prod.outlook.com (2603:10a6:800:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 04:34:15 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::a6) by DB8PR06CA0050.outlook.office365.com
 (2603:10a6:10:120::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 04:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 04:34:13 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.15]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 15 Jul 2025 06:34:12 +0200
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
Cc: bsp-development.geo@leica-geosystems.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V7 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Date: Tue, 15 Jul 2025 12:34:04 +0800
Message-ID: <20250715043405.6281-2-Qing-wu.Li@leica-geosystems.com.cn>
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
X-OriginalArrivalTime: 15 Jul 2025 04:34:13.0127 (UTC) FILETIME=[B71B7170:01DBF541]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|VI0PR06MB9544:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d063791e-3c99-4b74-964f-08ddc358d9f3
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wgcFxlNcC4CYQdXVX6vdOTIC1b5qcFnGuBL2Gy8LhhD8AGMD/c1S21fsWIkZ?=
 =?us-ascii?Q?tnLVWdVZVnjiIFxKAtmoTDvxJsJjebUGOt0LhSOnvCUNGKy510xk+n6ZEswU?=
 =?us-ascii?Q?sDglSS69O83OLzgOqMIU6y76OPWTTg2r2+V+ew4MFFCkCfYflMKz+1tH9dKE?=
 =?us-ascii?Q?ZxLMmZqOO0UFMazp+fb7biAJeId2fNiHT9lidkHRAPecIfkrTHIj0/IEqhBZ?=
 =?us-ascii?Q?zBDKrtIKTyuc8WJ4NQVt5RVDCOT2vHtZpE7uEZrvSH1qusDAXPmrOA2xeHY+?=
 =?us-ascii?Q?Jq9ft+HVTL7kVmF1qOLzkcCfosZGIVytpKrZmZ7uDkVchIVYWgKT8siukQ5I?=
 =?us-ascii?Q?NugohqRP6p/KQMxYZzXF1ynhuSOtdJl6furXuu5zEGKs5Q4cTqlGzz0OHdRK?=
 =?us-ascii?Q?gK7XZ8suuu2fiLRxUE2dY6Sj/WlIP9G4E1MyBjI3dEqxFgsb5b+TEEh2N+KG?=
 =?us-ascii?Q?4cpBkHhReFK35EQfKXPbz0UuFfjsLNSfIo2gZI6Lusq2/kxS6GxxDqxfdVMJ?=
 =?us-ascii?Q?G+AMP8AWPbdblFWMZX0/kwwZqdQEQjV3J2SkGh/zIDDcGFCiNGQW7G9SWS25?=
 =?us-ascii?Q?MfkaSXaE67Hc0+AHoihABCHmvh3x4PtQ/6d/xp7QUZF5+BzML+rZaPz7Rcem?=
 =?us-ascii?Q?232l4MTftZUoNI5ULZtdUPziuXwQbm0VYyStUheHZgbLw1iTZNffCClsSSe0?=
 =?us-ascii?Q?s40uMW/FjgXAKcCmu8o5xD1S/QAqBEXdrMrEnoGLOJPRwSE0bzf0pkdqrfX7?=
 =?us-ascii?Q?WyskMU0XvJhWZs7n5tJ59x8Yg5ZYiVNaP1zCWt0nLwVZP+01eJ36frz/PEz/?=
 =?us-ascii?Q?9Ir5tjdIPxipWj3l4YHP2YRFEcvpf9x+F7Zjy/9ELZrUW24/k4XnfuHtUOZX?=
 =?us-ascii?Q?HNWu4MQnFEru0J49n/NnUIM/h29UKDGaD36Bls0gJh1QCoBZHkY79hrK96Lf?=
 =?us-ascii?Q?cwp14Vwnbbe1otw9VMyKyfDNVcgKjz4HUsLvV9ZunCiPyRBnhwFFNpKeReuM?=
 =?us-ascii?Q?UABswSqeq/HQLog53+TeWxseyfn0BG0IGNRmat8/ZkEZFS6txTJ4lCOKbeFL?=
 =?us-ascii?Q?jlL2Xz83bYuw+nfV2xVz/gZSDp7IzQmTzgn12Cv3DMfgKmkfgmvygWjbd9RU?=
 =?us-ascii?Q?YfITEPvKizFnZ9iq1sczxMTbHeAjyvpGQ/iKPzAnXR5wDXGbQimxqEJ3OuNQ?=
 =?us-ascii?Q?VbNxjiNFJEiXIgYiaaaZPXDfBPMhefv8VL8dPOqMb4/XvFIGSx0O8CQWibfs?=
 =?us-ascii?Q?u/x6rUwDZQ3gSlJieZSDsGoUTIXaAIuqa4FAO/k+YLb4M6Cfo74EBVcbdAFy?=
 =?us-ascii?Q?lLX5PIyy6PfLbXDF7mj7dZumFy9bhdGtFhCRNXiZWWrGa0EPJaajkXk85Nga?=
 =?us-ascii?Q?L8mWbJOZtpg47jYIiirb5Mn+HKd3MORKY0V910HxunE89A8KPFwFSZatsuX1?=
 =?us-ascii?Q?QYe4b89Zq/gXtRxEnF+I49WIM0eUBqwf0JaaDXlSr3XVfS8rCiJVIY+Zr+47?=
 =?us-ascii?Q?TV+4VYrjrjuIA4doVuAfdr/ZhEpiNqa4nfUa?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 04:34:13.6145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d063791e-3c99-4b74-964f-08ddc358d9f3
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9544

Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Add this property to allow
device trees to specify such GPIO, which will be controlled
automatically by the driver based on the LED brightness state.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 61b97e8bc36d0..6c4fcefbe25f9 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -40,6 +40,13 @@ patternProperties:
           initialization. If the option is not set then max brightness is used.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      enable-gpios:
+        description:
+          GPIO for LED hardware enable control. Set active when brightness is
+          non-zero and inactive when brightness is zero.
+          The GPIO default state follows the "default-state" property.
+        maxItems: 1
+
     required:
       - pwms
       - max-brightness
-- 
2.43.0


