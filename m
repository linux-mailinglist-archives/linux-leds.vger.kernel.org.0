Return-Path: <linux-leds+bounces-4806-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB42BADAE63
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 13:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1150A3B467C
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 11:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804162D12EE;
	Mon, 16 Jun 2025 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="b+J9kR2Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793932264AA;
	Mon, 16 Jun 2025 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073142; cv=fail; b=m1MmlL0C34HCpVY59LF/I/VXKtw94b/2sp9jDBTajwEGJcYUslX6od+2wvfoWxQSOQTxRVWYp3DvAqmDIC73GZ9+ZtcgmpqdpGPou3ejH+ql5mXle9r77L/9ZHtZXabKHtThipbVcFHUORz+ZohOc7FWPPxmqr9HIC5vLen7j8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073142; c=relaxed/simple;
	bh=yAogJA8Vw+Fj17BXhX8nSShQFh7DSCt4aCxJ72hUFK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cigLGUreNCgDVmE4IqZVciOa/3L8q46rlMz8w2mHDsZL/XKlBBbWSrSjzoBYidbdul3YsVuQbGClEA51VpcM1LG+OV7FTyyyXfA9lee/gyZtZSGcTU3DeDGfIFtQCzq2SKHPrdvdxN1XWIkzUu1WbVFQBF7DmzTEGCZ+E3wNH4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=b+J9kR2Y; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wq4e0xr5uZAaZiAe2xNZliJCChffiTWUn09ZA637gS+t2eJhtF6jLl/47dR7UYsTFp+7noCehUFfrnMgGp8E0YuHFWnFImuxKXRjGefSxTRChi/giL4b3cD1IlgsYZZ2Of9xI+IHTtmygq7hIyD8SDxp8szZlkYCQwFePFvfoVgPZNGKnzM3BdVrfb5LTVFa293cNgWFy/BSDpPRjaDIRLBzzFCWSOkmy4wuWJ234sKHtwQ/XkIr9xTvThHDwsSvhk4F9p/cEfxAI9XRZ5DI0rDbrpj8x3pyjc11XDvCuS9wKCnwjmEU2pb/xLt0s7RB0vryYg2X+0ywIs+I/GYgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV+4JlI7Z4IzC6UNQ0l1RfnyszJhEcnlIhvMCGy4VZ4=;
 b=YSK1N+QQ6qxCvGOzushv1ujleX1Ghh40VODiyFs14nOIryLol+OePWfp0U1XpvhGt4W9x8hhxR3lBYzz+rpJHJ/nKWgv1a5Gmry2J0kwTIkuxyqanQC/I0WMXsekq7JXpnsift+diGEqZtC0DhoIrfLPDbi0/hzHRple42oOfJknM3DQkaJ5mzaRwokonJ4SiSEebCxBl1QDmrcbxibKt9jP3edvEvNzcAelZwp6ezXMBpw1OW1hOo4sxkwejKxzH7lGj9Y2lB1YFNBtYOPcSk1DWjhsiMM2JYI1HTMGl4qs2jiCR35EqzMfWMPQAFa7hl733m6kX3gs95gOHNvh6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV+4JlI7Z4IzC6UNQ0l1RfnyszJhEcnlIhvMCGy4VZ4=;
 b=b+J9kR2YGYpUZh8JvRkyzX93o0WEw/kPQ2bHIqG/Xb83KZktHIWYWylg7Jp/avwioapbnTw5rK2fOzwJ0ZHN6nufH7l0r04CbJKOtcTcQ6KOLHSb0ItBZ2o20SLpC3vs7fqCQj4mMmML5NcJlz6cwArC9aIm6NL79slU3DaUqs4=
Received: from PA7P264CA0092.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::17)
 by DU5PR02MB10486.eurprd02.prod.outlook.com (2603:10a6:10:51e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:25:37 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:348:cafe::9d) by PA7P264CA0092.outlook.office365.com
 (2603:10a6:102:348::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Mon,
 16 Jun 2025 11:25:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Mon, 16 Jun 2025 11:25:36 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 13:25:36 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 13:25:36 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 0467A20F9;
	Mon, 16 Jun 2025 13:25:36 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 01A9840190D0; Mon, 16 Jun 2025 13:25:35 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Mon, 16 Jun 2025 13:25:34 +0200
Subject: [PATCH v6 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250616-led-fix-v6-1-b9df5b63505d@axis.com>
References: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
In-Reply-To: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|DU5PR02MB10486:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cf9a91-061f-4a9e-fd09-08ddacc88444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEhaZWdqMUNSMHpQRk5rOFBwUmRFNnNCd05PS1hMK2xnNk1wT0s1ZERzZTdQ?=
 =?utf-8?B?N0RlTlJKbno3bFNMQ2EvQXBYZjh3d1ExV3hiZFJURnluQXQyVk5ERUlTcG41?=
 =?utf-8?B?dmpzSWptYWwxWFpteWpBdXQ5VXRZZ0dBL2Q0M2RSb0kvYnJBU1VsRndBYU5Y?=
 =?utf-8?B?OVU0VldOOU53Q0dOenVzanh3S3V1NHI1UDZZOU5LS1VXaXZuRlJHVlJEUUlH?=
 =?utf-8?B?aEFSelZvOGRQL2k0dHpvYUZMZ3lGeER2Q1VTeTE5Lyt3Y3VGOCtXd2xvRDJt?=
 =?utf-8?B?cEpaTG5IeEowWkpjK0hJRGlRanl0K2VRMG12RUpZSGlFdEp5b1BNb2tVWDdi?=
 =?utf-8?B?TkIrOVIxYVFnNlhvTlR0dnhNTlpqWUR0TWdKcnZZazByY3JNZXBjczJxMjJM?=
 =?utf-8?B?NEtaRkIxWVVJSG54ekFhRVVwMndaV24rTEZ4bHl0czNZWUdpdmFOTjUyUVB1?=
 =?utf-8?B?UGN4TnJTcHNvMnhxNWdjQm50MEVoTjZSU29IUUtBRjg2QW1vb01vbHBlenI2?=
 =?utf-8?B?M2RSQmJpUXRleE0ybkw0cW56MmNKWk0vcGZhMEEvczZFTVNwL3gxUWJDQm1i?=
 =?utf-8?B?M3RkbCtmV2ZLOHg3WXdZemVLTmYzdkUzZGtMd0N2V05ITGtzb3VmazQ5ZVZK?=
 =?utf-8?B?eVNHbGdCYWg5M1VMZFgvR1dKK3NiUFZjcUEzUVM0c0lQSTVwZXY0ays3RDkw?=
 =?utf-8?B?Z3Y4NlpTRHVjQVZaYVZHOUtRODZwcFRXUUdDYWg4MmlnMnRSUlpPbmtuVnpj?=
 =?utf-8?B?YWszWmdwcklIT0ZMVG9UYlNxVGo5WSs5QkNNWWdhSHNUMGllUUUwSUpHTnJT?=
 =?utf-8?B?anlSRTdiQzhrTC9Zcms5bCt4aHFzSkVteEowL0VieWkxWWJlWFR4ZVcyNkNw?=
 =?utf-8?B?VDAvSFE4U3RyOXBtM3EzZmV3amNHem4yL1duR1lQSGlsQnFURnVIOTZaOUk2?=
 =?utf-8?B?bXNJN1dYLzNwbm5EVTNwWHNKZ2srNUdUSGRTL2NjbWh5eXhEc0pkQmN2K2dM?=
 =?utf-8?B?c0dxeGYxaWhnREEzTldjbjg2TFJCNlFSSXBHNW9xT1dOWHJ1K3czclR4MmZk?=
 =?utf-8?B?Nk0wdnI3WjNHMmhpK3NBK1hwVWFlaDZDMHZBSGJ1V2pja3pnaTZtMzRLSGox?=
 =?utf-8?B?ekljSm5qNjN3aTVZaCt2ZVEvaGdCa28yeVNYTS9LSjE4K0EvdjhRZEU1NHNV?=
 =?utf-8?B?WnRDQjFDcFRrdmgyM0E3TnlJL1p1SXl5ekVRcmJxSUtmUUl2SEtRWjR3M3Y5?=
 =?utf-8?B?MkJYV0lXU0N2OTV6MFhMUlJ2MEtSRDF4RDQyWlFpZklRSWJkUDF0TUNXTTFY?=
 =?utf-8?B?em5hOGdBb0tKUk41dGQwOU5CVFZqV2xZbFJoN05CNUdpdGRwR3BtUE5xQnNu?=
 =?utf-8?B?bGhYNjFDV21NaFdhbUd2Z1V2bVAxMTl1TWxDV0I4b1M4ZHFWbUx6MXo4aGYx?=
 =?utf-8?B?cUxyOGhhdVlKSzVBK2orUGg0cFRET1RwUFZ2VTFoNkg0RHBPTndqSFQrK1VJ?=
 =?utf-8?B?NEREdlJGR0UxY0NTZWJpbFpNRi9DNzV3SXpnTEFyQW9DYlBvdFpWRzVUM0FU?=
 =?utf-8?B?L01LYnpKN3NaWk5kTGlNNmpTTGhwd3pzY1FtbHlzdE0xcXlMM3RvTUcrOENS?=
 =?utf-8?B?dWNPdFhGQ1lmdEJCbEhnWVZuOHljYk9NUEJhemFCWkwwOEVUbUtEZG9iTXB3?=
 =?utf-8?B?clRZM3RSbWtuNHV3TTJ6bkdiSGM1NFF1SlFrTjRoMXZwNFRKb2dlQVorV0RX?=
 =?utf-8?B?eFlua3hScnliWUx1V2ZyRXZmaHhuTVF2ZTlzU0VUc1R2TVYwT281bjJKQUF5?=
 =?utf-8?B?Uld5T2V6WHlwZmNUQWNlc1ZYd3RjM1NIbGw0ZjZrZTdnelRoR0tmWDZabVZ6?=
 =?utf-8?B?djNDWTE2Y0lML2tTTTBKeXNrZlFEanVpaXN0Q09nNytHbkY4RmdNSkM0Nm45?=
 =?utf-8?B?K3BRc0UyS2VVRWFGOHp1RGk4c3NqRE5PVnN1MkxTdDAvcEg4c2NyK1ZzaFZh?=
 =?utf-8?B?cFp6SHdGaGN3RVo3TFh5N1lka2tpandpODJkWGxZQVpuZHJRSUhVRVpJNy9r?=
 =?utf-8?Q?dv909k?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:25:36.8602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cf9a91-061f-4a9e-fd09-08ddacc88444
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10486

mc_subled used for multi_index needs well defined array indexes,
to guarantee the desired result, use reg for that.

If devicetree child nodes is processed in random or reverse order
you may end up with multi_index "blue green red" instead of the expected
"red green blue".
If user space apps uses multi_index to deduce how to control the leds
they would most likely be broken without this patch if devicetree
processing is reversed (which it appears to be).

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts has reg set
but I don't see how it can have worked without this change.

If reg is not set, an error is returned,
If reg is out of range, an error is returned.
reg within led child nodes starts with 0, to map to the iout in each bank.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 drivers/leds/leds-lp50xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 02cb1565a9fb..344791b6c575 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
+			int multi_index = num_colors;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
@@ -483,8 +484,16 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 				dev_err(priv->dev, "Cannot read color\n");
 				return ret;
 			}
+			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
+			if (ret != 0) {
+				dev_err(priv->dev, "reg must be set\n");
+				return -EINVAL;
+			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
+				dev_err(priv->dev, "reg %i out of range\n", multi_index);
+				return -EINVAL;
+			}
 
-			mc_led_info[num_colors].color_index = color_id;
+			mc_led_info[multi_index].color_index = color_id;
 			num_colors++;
 		}
 

-- 
2.30.2


