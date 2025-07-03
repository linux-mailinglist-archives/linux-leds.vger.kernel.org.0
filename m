Return-Path: <linux-leds+bounces-4970-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AB4AF68DC
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 05:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F0D3B55B8
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 03:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB14238C26;
	Thu,  3 Jul 2025 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="XOEMkw6N"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946023185F;
	Thu,  3 Jul 2025 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514790; cv=fail; b=laZ5SVYoZ6uoogZ9TsQFgqBIFUUuUf6PmScLTdmqIYVjT4ZAZSOEPxdorjySBgidrirjisobjG4orj98arFNWKpq7SXolORUtaJRP2/4OoYsawWCzS7qOTkTfWc6pYbS59NKrB1qJI3WOpzUgVpin4R+vPJWjQ573hIVFg2Y7bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514790; c=relaxed/simple;
	bh=mRKibXqpkkmOgBBVYn2Oc1w9k687GQTmABU6vgUX5DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TRIZTmyOGk1H5f0Sp1I3DpAIN4Ox4j+1qgLEsVB6KiWp6LSTvZq1JnNv337a3C2J2+Jd9NTmy96naHUPjIc0S9Om7yRpM49MmZG5ItUluBBuibbtS+V4bW4PZfQr69J05m1RuE5TwUb0XOcl/SiUhfeC7n7FdSl5B/V22qPJuxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=XOEMkw6N; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8AidIASc6d71TroHkS3qcgtZx1HdcHuyZeOq8617lXiw3Q55/lbDoAl2MQrcMsITbVGWL8I03qnuBOQs87/nuXz6kXiEBCHDwHSg4cLkU7PDqkE0gcSFyq9nopur4PwkDPI8D0RshPvV36+pJq9RQw6AwmjBtt6Zr2DmvY3YLKH1RKKZQPxtrdANAppJbZRqARk9G9ivY+ZACm7oUH4q9t28vVLkWtICBVo3WvuDdAPo0BhDULuihR7GqOgo4dxvmLGSGzv4Y5qKPtDmu8rJ295LnTYoc4qtOHhOZVb9uwLvP0738DXXA2IxHVxGuX0b50tvFJzLPtwwX3tKAiftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNx6sohQB/zRLnrJ5R1ue5ZUoo80dlKQhijyuZToC4Q=;
 b=boQXnliHvYey94afCtCSNFEzxD7pV5RADdigXj3kEiG5INESpjoP4k1vsFfLuYjB5azhKGjE4My+BChfTQ1PVs1LjCcDgMaYEvXiumYhXN0qMmeFIZ1GXl5g6MQfE13BvsNQSMnmpXvEAmNiB6Khtge5SYzx7VP0IYHIZs1se3fzD1g59lYuJQlJ3lUJiwNh2MhVXsbF4s25iwT+PmIr1W059Kg66YAj7foIjtI78q9o6VMYd+3fbjHRl0rzWZcC9MdeZNIqfb0+TU60NBSkmPgXRA8E3mN3Tsao+FCpHxaDHkywBgAPqNkOKDWTn8sdC6ulcDknZ2kt0Z0vTcwATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNx6sohQB/zRLnrJ5R1ue5ZUoo80dlKQhijyuZToC4Q=;
 b=XOEMkw6NpH8Ai/uAdYoAI3r78rkMRMuM2kspSvRbySbTZn0QafpjwftETDeheUSNCx9b4tO78WX3H9EEFon/vn2P2LOmOQd2Ksng4VH1afiJ1e/Cdsc6u/D7glKVLXpvTzjYXFsTJo4Lo6MfjyclimiZaqa9kG8dAkE3kquwIgE=
Received: from PAYP264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::8)
 by VI0PR06MB9106.eurprd06.prod.outlook.com (2603:10a6:800:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Thu, 3 Jul
 2025 03:53:02 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:102:11e:cafe::16) by PAYP264CA0003.outlook.office365.com
 (2603:10a6:102:11e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 03:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 03:53:02 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.182]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 05:53:01 +0200
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
Subject: [PATCH V3 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Date: Thu,  3 Jul 2025 11:52:55 +0800
Message-ID: <20250703035256.225289-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 03:53:01.0863 (UTC) FILETIME=[F9297B70:01DBEBCD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|VI0PR06MB9106:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a328f0c-600d-43b0-107e-08ddb9e51bcc
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ljfl0uTUd+k9+c8Y1bs4O7khmPx0g3TKeBKdtJPwEXbrEL4bUjfH+0st7cHb?=
 =?us-ascii?Q?JgrOLTUvau1+9sQDM5x+MRxyjeWVf+lMUkAslzqCdAOo4DvjL3VQlrXcHujs?=
 =?us-ascii?Q?g6jlZdgpICExp71sB5T1LfmPu4BStpf2QOM5ZGkCNQbD4mpCdM1DwdGqsV3b?=
 =?us-ascii?Q?pB4B4YB1YO7BTxrU3i8mF2PVznsIu1XSj8aW78pEfZs3P2B6lTxmql1esvas?=
 =?us-ascii?Q?kYgT12HVyWcfWwJ8Y7nMe2lwlpvsE2t38BaD1zCIh2dl5RwGeefix1x/ywvz?=
 =?us-ascii?Q?SA34Vj2SzOVDHpUZtRV4crKjjEPDqu2hSxbTCgDLT8VcPvdttypIgDpxanFt?=
 =?us-ascii?Q?bzg5Dr9PwSa9LlUzbo5AI2SBOUe9QuIIQPg6CZMkm7yOBZPBi0afpK7KCyZv?=
 =?us-ascii?Q?iigECFjJTD6hWUviukyUlm1nH/Wg8DR4aUvFIoDsmwSUn3si34GQFvjt078w?=
 =?us-ascii?Q?ZzDrDGjOYAlTNgR0yUAaSgQmD6zPdjl3dWNsWn/BP6Cvyz9BxTyurUFcO1e3?=
 =?us-ascii?Q?aq6S/HUIVxopsWoBO/5i8D2MjpCsCl1ebrgX1BrLxaDvDz4TGYijugH1lNot?=
 =?us-ascii?Q?i+fJPWMcswQf7VpLwAFCA2+tgfgzIxFaRAYVW3zBg4wwKVhwdXjP4GEszU4E?=
 =?us-ascii?Q?KZ4J56C8/ZZY3h44R6X413eVB5gljDNFBS/LUi1RMmMGqG3NmGxx+Creo6sE?=
 =?us-ascii?Q?3KWvJ0LSRB/cNktCSFXqEusdBon28HnMiaOcWsMUJ1fckKyHSU0p/CIfFNtE?=
 =?us-ascii?Q?MyYpQ3TKaLEbkfpB+XljEc27BdUDAfZKYKKnWkqmzR/tWnMFqhklvxx/47/j?=
 =?us-ascii?Q?kIsWOP5LVhgAMMdLv2hH45kNtLJmJq9UE8mIxCD7O2AEiviyRiYuTBsvVEz8?=
 =?us-ascii?Q?uZlwZnG9/+3VNTSPfuMcE0i68nuN6+Ml0CiGQkv8p1HZRaqTgrqSnsnui5Cb?=
 =?us-ascii?Q?IGBC8bF33zMVG1UbmCsH97nEhH5mytesm4JEUKZqTcODYpJBg4nF6QjimJjq?=
 =?us-ascii?Q?EwmtXGS5Rgri09LyDemOzbmyVXz8tV9vRiz/xGCgp9MwFodFJtopKU9TZs97?=
 =?us-ascii?Q?W2FxezH8MugInCHu9coup5wREBMCB9OUzN+cIyaLgYb8g4R+igQURbOVDG02?=
 =?us-ascii?Q?SlXTlOwKOfzyGPsOqlsEwRSHr7aBDItzqH/4rmZkkRFlu0aQ3U1+ZMILdBbe?=
 =?us-ascii?Q?oQd3hlJ4LOz7o+d8Do9cUlPLodhktQ7Tl9rent9PV4dAJRuU1ZYqxFg/63rT?=
 =?us-ascii?Q?yoUHTkFtwBhWoIlP4x+3xqwd0AovygkM3E7+CDS70CTn2jCQxXPDcOcfGzGW?=
 =?us-ascii?Q?fd+sy26TLybboEHCtjGhy1LhZ191wscLv61LLlo1wTTbxsi39c4lES0ALaT/?=
 =?us-ascii?Q?zoQyUBM4vH++OT4qNzKg3xdVi+tEnQY6MkNgCHtI77pzhK1v76l6T16PP0m/?=
 =?us-ascii?Q?6MOAmKoArSHwe+UOHF3g6LG0TKM9W8AVj35IhiZlXrLVPGMFOhZgGxaK35xS?=
 =?us-ascii?Q?kda3uk2IdRAEXEnqqfPy+VI8G3V52A0y/Gmu?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:53:02.0518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a328f0c-600d-43b0-107e-08ddb9e51bcc
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9106

Some PWM LED chips have a dedicated enable GPIO.
This commit adds the support to specify such GPIO.

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


