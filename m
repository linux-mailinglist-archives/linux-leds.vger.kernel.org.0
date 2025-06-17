Return-Path: <linux-leds+bounces-4826-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 952FCADC80F
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 12:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1C516CE2F
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 10:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36B1291C13;
	Tue, 17 Jun 2025 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="cdkKjN97"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012060.outbound.protection.outlook.com [52.101.71.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11424216E2A;
	Tue, 17 Jun 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155846; cv=fail; b=usN+zspGdw2Ht3l3T0i7esE2NK1v8CvYkgUi0jXWZoRSpz7P04RkCvscQPwUFnS/0C4t10uwtJmAtlQPApYkX1za8e/NT1jWAUZuTvz+q6kuquAz8as3yfN6hbck9PfLcbu2ij2xio3PGc13pzR7qlP7d+iM5FRTzxcno8hL9gU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155846; c=relaxed/simple;
	bh=zSBCmZH2vxcHGgdqFfBALqcoYNOaTn0v9/CUCN+n/Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oIQtDfPrd0iv2XkJIsmvSx84kMGS7pyrDkNLL+cpAAOCkOqNEbt4ouSNZgLlqdXz6EdexmwZLnvvd71aIjL5P+qD08KmoT6In9gNaGYzr56neZLrH+SwPqF4irixRDkXb7tIlASNmWh2JQko1VkUmgWQr40miLdjjKX2f3Qx/9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=cdkKjN97; arc=fail smtp.client-ip=52.101.71.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUtlZvUqGjK0kEUfud1HaNNNq60bOqzVHM6yRQS/husNOPOpA2IygQKc/NEZO1PJxT/uYN5FGczGHV27MEx30iLvRwvNzK7DySlv0ISLDSRzl+vWH1OtFlu7dEM3b+OAWzPchF1s+SmSur5CC/V70ptbob3HvsBc+Ip8mQjCqwA1sceCVkzukEA8DGCUCp2XCAERaNC1vKiLtP2ieKkrPSuSCDffb7XWtNkrSEUTYseka9GMf5XEEK8Xuv+X0N1rh1DkS7gxMy6YOsG6QIHBhrkMnD8qCzxzavgkEt2Fu/EE7/us3IU13v/cVZHw628fgQj3NeX3TgU7JUDbmXuIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekA463wGXDLjl33aKQP7+7BuiKijAtkzQnkBYiudE8w=;
 b=S3vayBJFBP3X7ibVmd3EHEnTnbk6uGZe5yzvstv7FzDu/DmgDwh+fAheXYDeUIu5iBBgoZZMcC+VcL92DjkMfd72GsJV7gM+ASmq5edWEtQCK+9R8lfnMaw0t/Sqwf8qb6zCIPS5q7QCS2jEU0qk4jEAgv4CCZfCg2p/xibGPZfcADyVUZoyupgSwX383EAoWsQAcg/JOmCPhpOjCfS9QlPvzbS5U4zY8Jj054yTbRRuzl2wwx6Qn4QGGaNcfApSUZO+fU2LnWhweU4qN8M9ON4hmXB2600GqScmu7LrA15CoqwGygZ0VWlbDAqPqkRI3GORZ7T4ws9W8pMx4hsEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekA463wGXDLjl33aKQP7+7BuiKijAtkzQnkBYiudE8w=;
 b=cdkKjN97TpyUDOQeVrHI8lyRXhUFggBICodEb1J1iy/fNTFN1DTGwFVOplheQxY78viSXiZgGDONP8QUngzeCs47mZLOql79TTyQVXDHblpwsGMgyKtUzptm31dYXtWNvw7VKrLmrB2PJBGvQJmwj2iM4EilsXIH0aQa1sTqkc8=
Received: from AM9P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::26)
 by PAXPR02MB7296.eurprd02.prod.outlook.com (2603:10a6:102:1bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 17 Jun
 2025 10:24:01 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::30) by AM9P193CA0021.outlook.office365.com
 (2603:10a6:20b:21e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Tue,
 17 Jun 2025 10:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 10:24:01 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 17 Jun
 2025 12:23:55 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 17 Jun
 2025 12:23:55 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 17 Jun 2025 12:23:55 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7E5D8278A;
	Tue, 17 Jun 2025 12:23:55 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 6E9034033836; Tue, 17 Jun 2025 12:23:55 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Tue, 17 Jun 2025 12:23:55 +0200
Subject: [PATCH v7 2/2] dt-bindings: leds: lp50xx: Document child reg, fix
 example
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250617-led-fix-v7-2-cdbe8efc88fa@axis.com>
References: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
In-Reply-To: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, Jacek Anaszewski
	<jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Johan Adolfsson <johan.adolfsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A793:EE_|PAXPR02MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: b9650365-27b5-45b8-3b5a-08ddad8913fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TE9yTWE5Ui80dWhPTHE1SVI5QnA5SWJkYzJTc3VQVGNkYnZxQWIrU1hNWVhO?=
 =?utf-8?B?bmM4ejduRStBWThVQUtjcnJhb3N0OExJVWhWKzBNVTBVdjI0YVJOY3FrN1Zz?=
 =?utf-8?B?YU1GNXpOa0tqZjNkeWxubGM0UWhYRHRqdE14aGprQTBVMForZThpSWxpd0xL?=
 =?utf-8?B?OVJmZGxxelFmbk1HY3loQkFQYlNnMkNPcTZsbnFKUDd2aEpSRDdCaWwvSERP?=
 =?utf-8?B?bXR4WFZScktZbG54WDdlRGNMRDZVQk82akg4Ry9LeXpmem1HaWhUbEZZdE8z?=
 =?utf-8?B?d2ZIZFArTTFsUm9TWkNKcjI3SmVKSDR2WGxrZ1ZzdFhyelpyVG9DZGR2Y1Vk?=
 =?utf-8?B?K0d5MHVzWHZrd0IyVXRQdnZTbmlGYWtYNURpL0F5Q29QcE9yMzdnS3RDSVJU?=
 =?utf-8?B?YWVZTnd4cWVmVGJqK1MyTUR2Q01LWmEvRmZMeUNuQXF0eWFrMHJoS2xNMnY2?=
 =?utf-8?B?WVE1VUtmV1VPLzNoMGVJUFc0aVZsdi9sKzRqWHRteDNnMVdQNTR4UVFIMDFK?=
 =?utf-8?B?bHNOWC9iYkk1emptR0lWa25lQ1E2UHhFQ1RMU0JNK0tXTEZIaUhza3lzUEdp?=
 =?utf-8?B?M3B5MHBnK0NNb2hCZVpRdGtQbENUQnlyY0hyM1hDdmJOV0RQMnphbVFGTmhn?=
 =?utf-8?B?TWxHRG1YRXdHbTdxRXZwNlBYZ1c1dUVvYW0xYWlTNGN2TVk2S0JFbjVmUlZL?=
 =?utf-8?B?d2RTQndEb0VkL1lZN3FmUXB1UXdCU3RHOUl6dDJZdDFuU0FJcm5HamxYUHlz?=
 =?utf-8?B?V210UHF1eDVwYmRPN1EyNmw2Z2UxK3B3SnBCN1N3NEVsa3RPUlZGODBWZlRi?=
 =?utf-8?B?bGhBem9Gdms1c0k4bVBBZ2ljOS9SRGFCb2IvSXZHeCtEd2srSWxCYkdsY3JW?=
 =?utf-8?B?bWRKQlVnV0l5bEEzRi8xaUlMeEtnbjVZQk8rWU9RS2YwMUN6cVgwdzVTaTZD?=
 =?utf-8?B?b1I0UXRkTFdrQ3FreU5SNzIydVJDaWRKMmRndXliTEJNb0xJMVV4OXhDVytl?=
 =?utf-8?B?QnBVd3Y2NEZWWHhPYW1Ea1o0L3g3aU1JWjloY3VDNUxxRG5Tc3hsZUtweVll?=
 =?utf-8?B?cDNlM0JCaVN6VFFucnBsZWpuZXhvanh3bmVxUjF1dzdrNXlzYlRCc3pOMUNu?=
 =?utf-8?B?QVNaalJCWSthanpFb3h0OFhIaUpVR0tUSmhSWC91VXJvRE9yc01mSDNRcm1O?=
 =?utf-8?B?aDBrbitVN2hka3NBTUl6TTJEdWZBSHhkQ0VuTVV6MXhVc0s1MDEwcGczaTFa?=
 =?utf-8?B?T1A5c3NnL241WXpyT2crVTErMHBmVU5xZzV6Y2ROVWFLRHl5Zmk4VWRWTjJj?=
 =?utf-8?B?eFNRcmlnNW1FRTVndzFOcTYyZ3dYYWhLNzJ3VEdyOWhYUVRLWlNvYXF2UDdz?=
 =?utf-8?B?V2RXN3N5aXhadDRVSm1FYkRHQTNsSjVvUXNYc0FIdy8rcTROTXNOMC92dTJ5?=
 =?utf-8?B?bjVXL1pLbm9wNmlIdG0xKzN6VVRMR0JLQmkzM0xRb1k5WTlJTlVYUnBmWHFz?=
 =?utf-8?B?cFI2V3kxYTEyZGRKRFFKT3NIaDA5TXhYMVNxTU0za1kzdWZOVVZQOWVPL1Bk?=
 =?utf-8?B?bW5rV3hQSTQ0am5yWlVpVXpNdlB1dzZjeFhBeENqaVNJYzBsTUkxTEphdG81?=
 =?utf-8?B?ZXlKcWRVK3ZkSWNsVzFhS3dTK0t4OWdKVmRrSmJXOFFwb1VwTTVTWlE4S0p1?=
 =?utf-8?B?OW5kQ2NzbmhacG1abWxoK0d3UDFSNHVUdFlNMWt3emkvREp3bjNaUXphK1Bv?=
 =?utf-8?B?TWNqN3ZHNm5xall0RWxHVmYwdEQyMVVxendJd2lPdzlnVVZXcmkvZWNvbEN6?=
 =?utf-8?B?UHNGS0gxQ09aeHozTzRBc1lMMGE4RkZRNlYvOXo0dTMvT3lCMks4TUFmRFZh?=
 =?utf-8?B?c24yUG00SkQyUkRrTXNuTld3S0RlRzlHVXI0ejNmN3NlNDlxQlV6TDJKOEZi?=
 =?utf-8?B?UjNhWmNXbFhNMDQwQUswNlZWTGpMQ1E0VUFrd2d3bWlIdkJES0FIc0F2eUt0?=
 =?utf-8?B?cjFkRm9QeTk2MU1idmo3eUZUK28xajZWR1F1eFNqcnExbm55Vy93Z29adGsx?=
 =?utf-8?Q?CN754V?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:24:01.3532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9650365-27b5-45b8-3b5a-08ddad8913fd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7296

The led child reg node is the index within the bank, document that
and update the example accordingly.
The reg property in child node is limited to 0-2 since there are 3 leds
per bank, previous value in example was speculative.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml         | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 402c25424525..23f809906ba7 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -81,7 +81,12 @@ patternProperties:
 
         properties:
           reg:
-            maxItems: 1
+            items:
+              - minimum: 0
+                maximum: 2
+
+            description:
+              This property denotes the index within the LED bank.
 
         required:
           - reg
@@ -138,18 +143,18 @@ examples:
                 color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_STANDBY;
 
-                led@3 {
-                    reg = <0x3>;
+                led@0 {
+                    reg = <0x0>;
                     color = <LED_COLOR_ID_RED>;
                 };
 
-                led@4 {
-                    reg = <0x4>;
+                led@1 {
+                    reg = <0x1>;
                     color = <LED_COLOR_ID_GREEN>;
                 };
 
-                led@5 {
-                    reg = <0x5>;
+                led@2 {
+                    reg = <0x2>;
                     color = <LED_COLOR_ID_BLUE>;
                 };
             };

-- 
2.30.2


