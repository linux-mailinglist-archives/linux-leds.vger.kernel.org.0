Return-Path: <linux-leds+bounces-4828-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49586ADC813
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 12:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2493A812B
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 10:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E352C08D3;
	Tue, 17 Jun 2025 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Xeo/mcOW"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC381293C64;
	Tue, 17 Jun 2025 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155847; cv=fail; b=hXZtUP7g7govkFdc1QjGMUTiw/Tw5KWsFZ41q25+Di6vfjYSEN5MWPdb3E7mr7OK0EBLuR/8Vf+uB9ynwWmbW4izLOv/JbEfXIZfVAkDLFLDTTHp5exeUejJZoXL+kefLeUbC6bC2Cfqn+9A/WwqNFj/4k5btVx1HLrfmIs00iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155847; c=relaxed/simple;
	bh=+oynsBGlGBjywA0QO+IenYfWCl+R1hEEizkAbNBlgt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZQyuSZ8Klvm4c4geweZ4olquQRP0ZKpuqqw3S0vWiG8p2mC5HYG+A3M52pJvLg77zHQz7vQQEJ51ASQcnCInRKYPOc5v0yZk6kcLok1FIG/CIHVnTTJIi8k4UkzXDMHIDJaJzMF1U6pt5LG8KowT53U/xw3PUH8WbekBr0cyjJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Xeo/mcOW; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxIa7g9C8nfRMNprXkef4LiWfIb4hpTua+LwV2tXczrXreYeSRx2vqo8b7R/8sdQBT3sW9kJFd2o6LtUvbNcu+fs0HwEDRmiIzrEyG0HQDcsEQifaqo6YC/oloq9zLaaeevSquckjwATmHnSHU4DIoYv13eyPEFy0tpXNtoGjDxPLYF8GlEGIZtzLsYhCdYGe8GOlzrGheL0M/2xXA2D0u6bOuljf3ncIoEmJuphRVsS0oZ1c/2rwjtHKtGpFDG3iBJ6xLkPeC3Te7vPGYLk8tcLfMxjpiiZ8Zgj27KhOvp25J7HXds5ivpufvSe7CEx5QlUbKlswl9eyI/13FtzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB17wCEMybPfIHLGue9bE6nKWYU9wsh83ZzcKMe9+80=;
 b=ZIYNZzDP4S+5SJ26cNSGwcODBS4Haz90Wk2SXULaYKzw50bG9vj0FwC4+Z+3APw8MQl3gluJtvokX52ansJNrETDrlSnXyYHgTCNyIgsPM+9BiNz5G82lr0VImRchUxFalkodYD03ygKSupR6G6qdLMvrPn41OmnWtYDZphXotfUhaP4HlrVo06muaJavsT53+gKwD4LEgFczzKIqOEzV879J5C5vaAhAMTkVfmkdkpAVRYi8wCZfqo4fPiJnFdj5LO5dG0bO+dq3JoU3OxZFwSX7zfIh8FYW1d641tPi85d5ZdMq6vlwL/9VbbGlkHDWB+sfrZpgOaZq2xKrqXZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB17wCEMybPfIHLGue9bE6nKWYU9wsh83ZzcKMe9+80=;
 b=Xeo/mcOWh1h22VLxM6maH54wd5EdXeYzfaJHT8aJQG9DU9VsN7OnJUNEHocZL76iZdYYrdDqzv1Q0TJY/C8MKYjA8ES1UsOp2gxFV2hpR+p/oMWWokJ/2eg+02oNapOR6sbHMrm48BKzOE5EiZFPTbBdw6+XdJ0fkcj1VGcnr+A=
Received: from AM9P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::26)
 by VI1PR02MB5854.eurprd02.prod.outlook.com (2603:10a6:803:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:23:59 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::f7) by AM9P193CA0021.outlook.office365.com
 (2603:10a6:20b:21e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Tue,
 17 Jun 2025 10:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 10:23:58 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 17 Jun
 2025 12:23:55 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 17 Jun 2025 12:23:55 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6F8D0226D;
	Tue, 17 Jun 2025 12:23:55 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 674CA4034D5F; Tue, 17 Jun 2025 12:23:55 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Tue, 17 Jun 2025 12:23:54 +0200
Subject: [PATCH v7 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250617-led-fix-v7-1-cdbe8efc88fa@axis.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A793:EE_|VI1PR02MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df42d36-eab4-46ed-6e6b-08ddad891208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXU1K3laeVJoSlJHdFU4WUtJY1JLNVU0b3BJenNJdkN6WU1xN005Q0RZQTRP?=
 =?utf-8?B?RHVMakRqK1NmQ2FqMm8rMnNGVXRnR1MwM3YvMzFheVVkWWc3TVVJdVJKYlpa?=
 =?utf-8?B?bDJGcDRPSndIZjZ3UW5xQ0MxaGdCREdWTUVhTFRUamw1OXpRdlNKWmUvMHJ0?=
 =?utf-8?B?NG5jTWdFamhYczRyWkt5dHFNWGdlSVE5aTFiWHR0WG5FSTg0ZENIRkJWazNY?=
 =?utf-8?B?d1JGRVR5aDhFdlR4WDBtKzJmSlBIc3JBVEIyMHdqWmg1bDQ5ZUJjN1E5d1VJ?=
 =?utf-8?B?MFY3cXpZZVJqUm5rY2phS2Q1L1kzVVFaYnZuKzYva0M1Rk5kOGw1SEF5OXIy?=
 =?utf-8?B?OENzUkdzeTQ5VENOTS92NndiWjN5UTVVY3dDUUJoSkNFNzVaYmF5bGVPajBH?=
 =?utf-8?B?NDM1SEdMaE44THRiMnB0UFJVM1oyb3R1ckMycXJYcHpDejU1REFQM3pPSEI1?=
 =?utf-8?B?a1dtSURSSW1UUUdQblo5M01JWXB1bDJ2MnpCMjU4dmFRUDFIZXk4WVVkVWx5?=
 =?utf-8?B?d1ZyVTRIU2FLWlZvV3lUekxuVzNrOHlHQVpKc2lVcUpNVzdQYm1IVXJGdEFU?=
 =?utf-8?B?QWd1YjNqVGFnaGNxcGM0cUQ3K1JTdUdNTEw0RmZYTEJZV3BaUlhSTmhOU0JZ?=
 =?utf-8?B?VW9SRUZGbUlvSnhOY0puUTF1aTdDdVFZYmY1T2tidGs2cTBFQVdkVXhBNXla?=
 =?utf-8?B?YXhQSG82SGtYaWlhU1E2SGxYdTF3OXl1OEh4QVRFaTl5MUNEOWdEeDEyWWZY?=
 =?utf-8?B?ajVDUmdCM1YyVnZwWDNEcUg3U3N2NCtXMjFxN0hoamVZZm1LQjFtd3NQcGpw?=
 =?utf-8?B?emVWTmtJVDNaREIzWDNoaExVYjhXZTBQZ2FNa09ib0N2NEh1cWNGV2IwV2FR?=
 =?utf-8?B?TVdwTHlOMVFwWHBhTFlKTE5zWm5xMjFnUFVDTDY5SHV1OFM4RzhnbUpiZkRr?=
 =?utf-8?B?MXFBRytoekVRdnNHczRPbU1KWG1oOU01ZEhMa29CNUJsVUZtMitOR2tXWllX?=
 =?utf-8?B?a3QrOWRjL1E3UmprSnlxOW0ySlFOQkVYbkZIL3B2Vm5kaXUvUXdhTXlCbFQz?=
 =?utf-8?B?V09VZzlIN3FROTFta3dwWlg5ZWozcGtOVERZTEg2N2JwWWJvL0RWWmk5OHRY?=
 =?utf-8?B?VlBUSklpck1SMnZEK3IzcXN0TjJWZ0dDYnp4VW5TemZrZ2FEdGxROHMwbXdS?=
 =?utf-8?B?VFVyNDN3bXpGSHpjdWZHU2tGMXpXbENmSUY2eDduaWRtZDAyRzB4ZVJQd3hV?=
 =?utf-8?B?K2U4UGtYSC91Y2NNRGJManRWU3IrMlRxNDN0VFVkSWxYc0YxTDk4Qmk2TU9M?=
 =?utf-8?B?Umg3bFJtY0VXVndpOWN6Zy9GWndKRTN1QWxtYUFjZk1PbUhJZGl0VkgyckFI?=
 =?utf-8?B?U0FrQmxtbmNBVUxIMFh6MGlnTlBxN2tFUkx5YXladk5BOVYvemROazJyUGc1?=
 =?utf-8?B?L240S2pHMXhJQ2YwNlArWldaNTFGcU1idWpGaGdhQVhFdFZHN1NiaHlJK3Fn?=
 =?utf-8?B?UC9UQVc0ZVRjdmsyQ3VrbzV1R05LRUhPbG9hWnJkMDJyQ09PZlNNM0VURGlZ?=
 =?utf-8?B?NStsYzlYbUFUS1gvTEdkQWh5SXBHSjd0d0s3b080cG5nQ2t3UktlQ01maW5u?=
 =?utf-8?B?SlFuQk5scHBOaStqQUNYR2trNUF0Y1BnbElhbzBXMFZCcXg5SnA1Q2lUbm1U?=
 =?utf-8?B?aVRzMFhoYzduTmd3VzkySnN2V0FGZWJOZ3lOamJ5bkMyazZWSUlIbCtjaDJ1?=
 =?utf-8?B?b210cTFTRm1OeHhZSmhRT1B0QThpRlRqQ3QzbUdlSkZpQ0lSbnVGaUF3OTBS?=
 =?utf-8?B?dUZJaU5RUEFHYmthSW5ZRzlQVElHa1dHRFZxaUpSZ0dnb29xdHc2T0pJUjJ3?=
 =?utf-8?B?eGhaSG02M2dUT3hRMFN0aGtPZGl5SGY3akdwN0FFZWs3aVZBRnFmRHFUZW5T?=
 =?utf-8?B?WUs0aW93V2o0Z3k4WEkvcUgyQmwwcFFqU2lhZGVIT2owbHN1UTdLM25KY01w?=
 =?utf-8?B?djloVUxDdExtSXJKcHpFcEt3UUxWWllQSCtmRXlCYTZWc1pOT0hmNU1iaHdk?=
 =?utf-8?Q?0bsLuH?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:23:58.0719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df42d36-eab4-46ed-6e6b-08ddad891208
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5854

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
index 02cb1565a9fb..94f8ef6b482c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
+			int multi_index;
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


