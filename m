Return-Path: <linux-leds+bounces-4707-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11BAC2663
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 17:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62D6B3ADBB3
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB76B22155B;
	Fri, 23 May 2025 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="k3iVTxmR"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900D21B9E5;
	Fri, 23 May 2025 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014002; cv=fail; b=kLR37ggMDyyNajc5bLBS3g7o7Rv+MR+DxKNJ1SQyCs/2bOb+RsM6AsmDDGXsBf0fx6Sa6dxYKeOW8uD4c2mk54kSTczHTzhg/UARx5RtFoNXk4ak76QXImzEi3DWOProMg9ksuB/47gT15QdZRtdbtaAgM03QbpWtQuhh2W0LX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014002; c=relaxed/simple;
	bh=rpBEWzAMTtwOLzgJONSLm3+B6XKYf8u3EQiAzYtPVas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qXYMrO1LddoRodnaAVQr3dt7uEFy8C1NqebfOMbJSDooV0cRs4ygHQ4hymtIQey//mcbzZSq5JsaMVpSDI9C91urv9JKKV0XN9KUKEG/NmHVa7T0h2YP/QuGYsUuOj7FsVpl8obgZqmOU+lilXzTHcyv3TkZ8fuDqe0UvOqQFAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=k3iVTxmR; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMPrn4fWcL5HuXbey4Uck0K0ptel7nqSkRkMnLGAapVcPNOjgzA2KYV6xWCcxqknFW66TCSYUVV/0oX65iliZdqyFTdAgtuNQEUv3N71MZeT8ntsOGDHIIff1kjuga2OmaEEEfq4xS+6JyfsgJhjIj5FKSa/UOtTEv6UDFmF2f55i0dMMmLA9yZEwV9PW5zbEZfP8QFrefyMGhD4XoJT98eDwpvjm2ejMq+/yjApxxG4IdfVSiz5/YLo80Ezkkq0dGDv9T8KiamSc88t4Qp8r7G6rOGp28O/28DXp/oXoDRHeD9Pu8pg16Hg2LddRho7dnSiO9kyxc9uV1Nqh4L4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St2MUIDS4Ve8WSUS/6sGoU0M7rest9FRet7CC4wN/U8=;
 b=NR0rdewPcWdQQ7i4260JYpwDZdaje9mrtM+6fC8Bkb87GVH+mjE/SnLcAT5UoDONsQOYeCOrAhNolyq2ykXi05d5wErxcLIwnPQZ2s/V/jKndcMAoBq1wrrVVHZGtRRihvFoEw5dNuX0mfOIq1UEwF7NaNKjFup/oLz6RYXj8xm4+dt1Rpud2Sc1c+entoseiFdv8sy4YR1yl9DeSiVE9ggc0BttXPQFjLKNDxjvNSsvg17ZSRFi7698MQsvVFnvhTPeM40rJUL8vYFlM/edkniAMTV6zuy0TBqiZ9JJcYtDwPiif9t/CgSM235CIH2ncJeb5ZBFyVZHeFmv+AUgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St2MUIDS4Ve8WSUS/6sGoU0M7rest9FRet7CC4wN/U8=;
 b=k3iVTxmR6MI9JMOKJ6c5ha1nk8jH+UVRjQ0uAt6aBpokL72HTkzQ2uG+Ytyg8sHmSbzq5oQHzTHPNteMNqUg0TY+r1XPi/OvSz1S4LPDxC+aQtWR0g67F7B1VNJu47FxQlyURwErX6/A5YWqosb18DouRxNvBL/pcR+7rM4/BGE=
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by DB4PR02MB9310.eurprd02.prod.outlook.com
 (2603:10a6:10:3fe::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 15:26:36 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::92) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 23 May 2025 15:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 23 May 2025 15:26:36 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 23 May
 2025 17:26:35 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 23 May 2025 17:26:35 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 61A183145;
	Fri, 23 May 2025 17:26:35 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 5BCE54033C86; Fri, 23 May 2025 17:26:35 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Fri, 23 May 2025 17:26:27 +0200
Subject: [PATCH RFC v3 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250523-led-fix-v3-1-86d2690d2698@axis.com>
References: <20250523-led-fix-v3-0-86d2690d2698@axis.com>
In-Reply-To: <20250523-led-fix-v3-0-86d2690d2698@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|DB4PR02MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: d433f45f-306d-4ddb-b0e1-08dd9a0e3520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjlXbkxaeVQ3c3YweE0ybTZyY25JWXQ5Rk4yeFI5dVVUQ0d1SWlEdmlOSVRn?=
 =?utf-8?B?TWI4Z1JwT3N2THRxVnNVeFgzdTluK204eG9Id2x5amZkK1FjbEhLalBZdnZP?=
 =?utf-8?B?UjlSV2w0NnZNSnhjWi96a0xBQXp2MjBwRVdHM2lkRHhNWlU0VHA3Uk5nT2ZU?=
 =?utf-8?B?VXp4aFdpUlordlNzWWg2NlZGaTBocFlMcXk0RkpNbytkOU1FL3U1UG92cUxZ?=
 =?utf-8?B?R1FINW9tS00ya1FENmIzZENPeGZzdTJNTEpoOFRBQVluckNzUGhKWEVIci9l?=
 =?utf-8?B?MDFwdmtrVDlKcHkyRjlPb3VYVnJoRWtyUnp0Nmk2cmpMZVpZOEZvNFNpKzdW?=
 =?utf-8?B?RGxKeDBFMXJHbHJISXpZMHRuWGdiTlg1bjZraXV2TEZ2aGllRCs3NEpaUVIw?=
 =?utf-8?B?Mnd0blBlSUFWUGpRMDlNTTd1T2lEbGhDTDJQbHZ5QStNd05oOU5SNEFNRUlu?=
 =?utf-8?B?UVVnUVkwVi8xRzB6K2YrbEtJd3ZpWTVhMm9hc3kzTm5YZVZZSG9pcGNYb1ZQ?=
 =?utf-8?B?TEhtd3pxMWFVQWt4aW5uRGNOTWRzNnoxQzFldjBhT0xOUUhlTHF0Z3RaRWJx?=
 =?utf-8?B?SE1sS3Zxb1JSYTFOeTQyeDN2Y1NmODI4ZTR4M2JGOHpseEp6RTdyTEJtOVJQ?=
 =?utf-8?B?NWp4d1pNOWxvVlIzVlUzc1lJS3VNZTdtZmxDT1VwNnhxSTJHcmNIbktORTF0?=
 =?utf-8?B?RHJLUTdTQ3VlR2hPSG52QlV4dHlMWVhveTZVWTZTVm55VGt1cU5IVXlHY3Ur?=
 =?utf-8?B?dFIxb2R1cElUc0F5b0NDMTNXWGV3bVlBc1VXRVNSdkFOd0ZuM2NjYytXZWs1?=
 =?utf-8?B?WHJyYXJQQXZDejduRU9NNTRSTWNnT2wrWmpJdjdaRkRCS1I5dXRScE41T3p6?=
 =?utf-8?B?U1J5M3h0SS9EUlhmMURVcktOTkZiWWpLYTkrOVYwbnhQRU9wVllSejFsZXlv?=
 =?utf-8?B?empXczFqcStXSW5CNlRRbEFLWDNLaUQ4R3p1SjA0ZDdvd2cyTWRxSXVHRENj?=
 =?utf-8?B?TmVBYVlBYUJJMnNBU0ZNOE40NEdQS0d6cGswM1c3MUNsY3hCdTJXVGMxSUJq?=
 =?utf-8?B?MExoSURYcGNwbGJHNkFkMG1LK1VQZ0Q1YmZHek52ODNQZkIyb2t2aHdraHMw?=
 =?utf-8?B?QUxadnUzN1ZVSVRGM1ZaT3grdzBEWnlTYTF0TkJ4MG52SGk1bU9FWDN0QzJh?=
 =?utf-8?B?VlNjdVdHaXZFTzR0TmlxYnJyNkJPL0lidDVsdTlBcUlORjYwdFlzTFhQM1lt?=
 =?utf-8?B?L2V1Mk4xcXJUMHZZR1NqNC8xZEJ5V3lrVldRZG1aVERKVUY4NE5jWkRoUk9U?=
 =?utf-8?B?bHcwR3ZEZFpsVVllUTFoTWZoTUZsakl2OXRvdml5MEhKZWJXUGNZMkJVYkN3?=
 =?utf-8?B?bWFicGh1SHZLU0VQZXFQNHJRZFRxWFE2UVZYVUQzUlFRRWhsSGl0Ulo0dVZY?=
 =?utf-8?B?c1NlV21wT3I3bjRwWHM1T0NFRFFJU3VvTUwwYW1nVWJpR05CdVdQVHBzSE1O?=
 =?utf-8?B?UDZVVlBPd0dvZnk2UU9GOWJrQndSeDdYSVFSYUtkeVNPZVdCczQ3YVREbEtl?=
 =?utf-8?B?SU9pWHE1dDJwbksybWpmcm53REtYd2JZZk50a1FjOTUzTytlMC90L2JJM2NX?=
 =?utf-8?B?UDc4SmoyUEF4dWc3NE5weGE5S014aUFUeVdvaFE3MGhPNGNuWDlKR0krbC9q?=
 =?utf-8?B?UEt6dmswYTNBOEgzaXhNb2xISSsrdFZDcVcrVUx1TlhvL1lKSWFkOEFDaUM2?=
 =?utf-8?B?VEszdUhVVi9SKzZhMGllejVPSUM3N0gyOEYxaEtnMzhnc0tlUjdUQklWTE1m?=
 =?utf-8?B?bDFuc0dLYTR2NUFkazY3bExIOG5qN1pObTJNdWFKSkc3Y2w5NXBJeUpKbzlY?=
 =?utf-8?B?aDBkN2JMN3huQkh3T2J4WHEraWJvbnVaUndDR0ZqczNwbk1JWWdnUTNFL0sw?=
 =?utf-8?B?cURMNURaUE8xbzVKbDdORWFhQnc1bVEyaFRqalJoOFV1SGpWRlU5MnBUTE1j?=
 =?utf-8?B?c0pqNU9PUDFwTnNHdU1mY0Y2T1p6VDJkeTZLOFdOdXFyejdOa0VFai9mZHE1?=
 =?utf-8?Q?KhM2y7?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 15:26:36.7535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d433f45f-306d-4ddb-b0e1-08dd9a0e3520
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9310

mc_subled used for multi_index needs well defined array indexes,
to guarantee the desired result, optionally use reg for that.

If devicetree child nodes is processed in random or reverse order
you may end up with multi_index "blue green red" instead of the expected
"red green blue".
If user space apps uses multi_index to deduce how to control the leds
they would most likely be broken without this patch if devicetree
processing is reversed (which it appears to be).

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts has reg set
but I don't see how it can have worked without this change.

If reg is not set, the previous behavior is kept, index will be in
the order nodes are processed.
If reg is out of range, an error is returned.
reg within led child nodes starts with 0, to map to the iout in each bank.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 drivers/leds/leds-lp50xx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 02cb1565a9fb..8067aaa916bf 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
+			int multi_index = num_colors;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
@@ -483,8 +484,13 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 				dev_err(priv->dev, "Cannot read color\n");
 				return ret;
 			}
+			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
+			if (ret == 0 && multi_index >= LP50XX_LEDS_PER_MODULE) {
+				dev_err(priv->dev, "reg %i out of range\n", multi_index);
+				return -EINVAL;
+			}
 
-			mc_led_info[num_colors].color_index = color_id;
+			mc_led_info[multi_index].color_index = color_id;
 			num_colors++;
 		}
 

-- 
2.30.2


