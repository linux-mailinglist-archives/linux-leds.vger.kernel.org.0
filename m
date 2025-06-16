Return-Path: <linux-leds+bounces-4802-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E0ADA9F5
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A92A7A9B40
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 07:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED561FFC74;
	Mon, 16 Jun 2025 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="oL9kyr+r"
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A301E493C;
	Mon, 16 Jun 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060639; cv=fail; b=KkzmVQ2/w5++lnuRtjwVr2ryCXf2WJ39+y/jQx3n5nLDpmNHBLXQlsdFGVGs6ae4AKBjZoTcgqcVdd4xj30tm8dHNTqB3KkAwkM55Gl2kQPKEJUMILtH02ykMdmXxybnZ2sBkM0Ce/F2ipiT8ygXZxtHv+5I3jrRgrJdUrIbBzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060639; c=relaxed/simple;
	bh=yAogJA8Vw+Fj17BXhX8nSShQFh7DSCt4aCxJ72hUFK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fJX88EiC6T6M1k2hy3jngwa2uXZtI7N67DCXqi7T4q9WiP8eVW9IcGlHHkB1rjFH3nMuxOX9ZUMTn5lzoQ3T5ef7OYMSiOYXhvM5xl8zUkt8sGGyS08Oj/c+zOeorEygmrp7enjeo64MT3d16F2uMzmb0dGycFjLHNrq8jPDw0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=oL9kyr+r; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxNTFZp7ndiSkQ83ypDvvS64oe+e87PB7Fn2TjJyll0RBYzcyEbWh1wzLTs2JEeokZ3logCNVhWC5+TS+Ic0Mzy6XGdHxFMg1ldZVvh87wD1sNUrbGs8hnj4RaB+W+L+Es7d4egtRkb8sbsZ3CJTL+ctZG8d6UqODK78HgcJvr9KCRdGFQSvLHneNocFJxmEHeJRf4RrwKhsuTAbFVCqH9VYkvm2I3KKT9eNUZkEToxU63l0So8Pbc4QIKuXhUG1LQnvx9jBwLllg6ojogR5A25yejKoDyZoJ2KfJoXkHnplB7BofLDjnUHDSNVxPJxEIflXbzt5BNQOBK1juveIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV+4JlI7Z4IzC6UNQ0l1RfnyszJhEcnlIhvMCGy4VZ4=;
 b=aHBuKZzijUG0XMlGNfH7ARqlQAWAxRv/mKtmMHJMpMiKxpFFFAoS/EFG7HIZPPXH1E1+BLfISY7Dt6sIj71uW0xi9qhRUbb/S2ZT0N/PgxEgI4AeGQDLeY6B8oCE7zmpAzpnRjjaeg7joWkJYOPTViOqlvsAocPPtvV9+JLZglBf8j6EtjMll2FhzzRMwI+NTHrYz04Dyb4UlaOd4Fc4QtIYAbnpV3sWCEb2QixTZGeH6B/gycQc5nUInbTZzCGsb8d2RZQbHsOjThKkaAhZYTUCwx7EBsrjHYaBLvSWqExTFOgaChBpd8S+zKzmVwJ8S2mCmWvd9jk2JCRcB4spww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV+4JlI7Z4IzC6UNQ0l1RfnyszJhEcnlIhvMCGy4VZ4=;
 b=oL9kyr+rn3v0YbcK3JS1/4qavxCGe3jCK07bOpCzeha1uw0+hq8dvog0tWhLTKk/CGCYIq/1AsBqaOdecqajSvh+RJw7MfKrfTcT5IY1bTpoEDW4hKur+Bjvb2Qlh3WbSrV9NPaOVshratzfpUkW4+659Zhzcuzg7O3gPP7cCqw=
Received: from AM0PR10CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::16)
 by DBBPR02MB10603.eurprd02.prod.outlook.com (2603:10a6:10:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:57:11 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::88) by AM0PR10CA0036.outlook.office365.com
 (2603:10a6:20b:150::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Mon,
 16 Jun 2025 07:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 07:57:11 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 09:57:10 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 09:57:10 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 11B3D2139;
	Mon, 16 Jun 2025 09:57:10 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 0E46640190D0; Mon, 16 Jun 2025 09:57:10 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Mon, 16 Jun 2025 09:57:08 +0200
Subject: [PATCH v5 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250616-led-fix-v5-1-f59c740831ab@axis.com>
References: <20250616-led-fix-v5-0-f59c740831ab@axis.com>
In-Reply-To: <20250616-led-fix-v5-0-f59c740831ab@axis.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|DBBPR02MB10603:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e01426-a12d-45d7-1d34-08ddacab663c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXVZbHJmaHNIT1N5RlZoY25mMUM3ZkMwMDJpMEt2NXlDRVBjUWNjR1V6UzFk?=
 =?utf-8?B?K3k5VzJ6MmZQQzNrTkN0MzlZdW9YR0JzTnFYK1hscmxvbmtja0VBTHVjak5z?=
 =?utf-8?B?aEdIaHo2SHZneXFSMTNZQUNpaEhBcnViOVdML0IwRVQ3WjhSS1dSbmtQVVRv?=
 =?utf-8?B?RHdKN2R6U2xNd1ZjUythVHd6eDkra2pJY2xJN3c5V0lvWjkzREVjQk9IUEhX?=
 =?utf-8?B?SzdaUDNTRHF3bnVGYU1lcW4yQlJoQ2dwRm5aUUVMeTJpY0ZzUzV5SU1mMmhX?=
 =?utf-8?B?d2pIVzJYbGt3RTFweXczWjFqNkQ5UDBZaENkTVN0enVKbG0xZG5jNDBoQklU?=
 =?utf-8?B?aW9uOXFqcTNlaWVHYXZGM0VNa1hiOVV1VDhueXA3d1VRV0xCd05rYkFUdHFB?=
 =?utf-8?B?UWJnclhYSHR4UzI4YS92eFF3aGNZVWVMbytUMUF4Tnd4MlBLV3BuL1dHb1RW?=
 =?utf-8?B?c2hjOUhGL1lNOEg1anhncnlvWTRKMTFVTlVoczhIbHNqY2tJU3cwZW1vYnVa?=
 =?utf-8?B?QXdJWFNHY3hYdmxTQ21YUThicllGdFZnNHZaZm9rUFlXNmhNcHVVRGtXRGF5?=
 =?utf-8?B?TVc0N3FTVHdpRDdLUXpsR3k0cWJxc2hjaDl4ZDhNZmNpK2ozVERiTEE4VHdE?=
 =?utf-8?B?anhkdHJVMFp2S1h2YmNHNzZqb0dOajRUbTRacU9lS3N2Mk5BRFFGbjYvQmZm?=
 =?utf-8?B?TE1sS3V0Rkx1eG1yK251aDVmejNiZWZXeXoxNTJHVTdwN0J6SC9oc25DWVpD?=
 =?utf-8?B?d0dKbVhmbk9uYUhDeFQ4aHpKOXlKa3E0THBqbElVaE0vek5PejQ2R0dOUVFT?=
 =?utf-8?B?Q1NqVEo3ZnVSQks4Mll2K0VBT28zVDdGdUxyVUtldWJCNGo4ZnhvYTlTV1ph?=
 =?utf-8?B?WnMwWXdmdGs2bmsvWklxK0dYamVrSVRNN3FJZEt3YzVBQ3JjbEJJN0xqRkpO?=
 =?utf-8?B?Rm9hK3pjTW9xS1JySTdmd0t5emVTK2ZrZ3Z0THlva3JDaDV2NEN3eHphbk9j?=
 =?utf-8?B?Y0dib09mVkExNWY1R3JQUU5DdzBtTHV5dndzczJ0Ly9tK2xpTi9kRlA1dzJH?=
 =?utf-8?B?cXIzMFhmemdjQTR6dTN1U1hqL0hGQU5Eemh5RVNsUUdNa0FwMWFic0kwaXd4?=
 =?utf-8?B?ZDEyL2V0b1NrQXN4c1FwSTlmaEFtSW9ER0Qwb2ZFZjQ1QmtscVBPQVU1dk5M?=
 =?utf-8?B?Q3ZJNjRRNHJJdHdLWmNjenRYSXNOVU1ZaDFhWm1rVkxHYy8zY0k0LzBjSjJo?=
 =?utf-8?B?MmdKQ0FzQkt4L294NXJVbTJ2a2FzalYvWHRuUkZQQVB5YTNZTzNYWFhZY2da?=
 =?utf-8?B?Z1FyNm9BT1FxTnlTbkNpVWpabG1zZUdOZXRLNkRGRVRyT0VTaFhMbWlPNVgw?=
 =?utf-8?B?TjA1L1RqUjh0OTVBUWRWZ0t5YXc1MnRhNnF0UkNkcmM5QUFKeUVvRG1Zcmp4?=
 =?utf-8?B?V09TYUpRMGtDKzdZQUdYZG9JV0ZmNkNMN3Y2anA5S0dIM2htaHUyQU0wbFBm?=
 =?utf-8?B?YkF5bUdZU0ljc3lScmNyMFdCT0hENlh6MkVqY0VBeDBwcTBLUjZTVlRjQ1hq?=
 =?utf-8?B?OGhjR0tOYTVEc1R2Vms0WWFReERVVjVsVFJpcDM1b2xjeS93d0NGYnoxM29D?=
 =?utf-8?B?OGdpZU5QM0NwT3JQOXFmYW44NWdKZ2xWd0dJRFV0MHFBT3VEdXVqUlFoS3Z0?=
 =?utf-8?B?cXJuRUFSZGVZQnZINVVoSVEvSzA1SitFajBSdzBDU1p5VGRNRnY4cVN0QzlX?=
 =?utf-8?B?azdLRXpma1ZHT3FaSGFhUHhmVHdYZkxZN3VIZWh6Ulk5ZWwyQUdxNXJEUXlG?=
 =?utf-8?B?OXVOUUtSaUVUMU5wWDFsaGk3WmJyWDdwM0k5enMrV2w2UENGTzAzVWNHRjV1?=
 =?utf-8?B?cTgzQ3gvYXMwZzNmcHRiaVBuK2FmTTJOTDVUQllnUG9EdHB6Wksrc3VPemVP?=
 =?utf-8?B?bkJCalJBR0FrTkpJUnpzUll6cjZRaFhHdWxjT2FrR3M5Z0RTdFNGWCs0RGhU?=
 =?utf-8?B?cEhIaW9VbTUyMURUaHlLem9SZFloVlk4TnFHM1FRbVJ2VUxBVDBDZmtrS09p?=
 =?utf-8?Q?ULJ9vv?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:57:11.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e01426-a12d-45d7-1d34-08ddacab663c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10603

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


