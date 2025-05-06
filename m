Return-Path: <linux-leds+bounces-4586-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82739AAC18E
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CCCB1BC16DD
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 10:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA34223C4F4;
	Tue,  6 May 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="V2yHBZ8O"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269427586F;
	Tue,  6 May 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527995; cv=fail; b=BXNraquWPVWhBBzKSVtl2Xlgj93LQ/Gmt4ztX3Ixy/LtZzZ+1ZJX88anjGUEXJISqdCdOjahX3O8gsbWW1Gvef9IlR1eR/7IgVUkN/SyTfFOphl7Nddrca0txSAqf9RSZKuELTVBTLA7uqkmaTEr8GDUSHZf/fJ2kUw6PuKlzTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527995; c=relaxed/simple;
	bh=BgU7fx6avCP5yOFINW/nP3Keh8rcU4CjGfPOydaEyMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Xk+FFPArtwsqyK3nGTg+tCTeB7XyooGV9pFOGzhAXskDeTWq3IbJvTVINnN0/KDOMRI+5LU4ANIZOZ8V/OnhUl61aqeLR//3Pworo5ZC1pJGMtnUoPih1TXJunIL+1FPo7rp1ZshyoCGezKrSCd+8+wjP8RlyaTFft0ZYk/GzOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=V2yHBZ8O; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4+uVfF1s3Ze3B7RemKofV3ePQAIRW52BIRq6yu/QDTzsXcz9+3DXgwpYafD6PBK4+EH0zj26p0CwVY8uCitCedgyAiFz3G8k8HmpOSNihdOajn/F1bKEj4G/QjXIZOHIbgyqjiPNZYMLIqopKDH51AvLT5JlIJ4HstbA29/J57huYGWO1qQoYMAjI/0p2rUmJLrasDS1nvnE95LTkSO+3lcfmLKVEQK5mGpR+SkEuUmzK/KzGZjmbLskIiQSGohmk+9t1KSD1c3E/V1oHIuFRSJdUFs1djWJt6lMMEnhk0LzscZAz3Q7d52imqKcEmxb7IjzuIeWofRIPy1s03JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0IwOjjyD0TYbTv7t9EnKZ3XqeyOWtM9KKXP0tGn3aM=;
 b=PiTsnzSh6CxM/VpwaWawKsFrMudPIS1pJZaCbI+TYNFmW1BgOx6viRW9huu9QBjNlX1uIBFtS86InW3qzP1a83O1tXCR1mLV2vI76K6dMp4OLkUUgGMQXixvvIYADsnJKx9z9ejTs4L98Qv/DUFXysxetafXXL0pi5XnGFx4Etfd8D0LRUqcYDFky7REdtPg5slmGYYZmufu7qLqUWhVbwOznDoLXLw7kFXflffAe3tyXBUumbWiY8a9X0pHkTemSc2gcLB0MJSNEaY9sRPzVSRWgddpwpIBNsL5yTfmFKquwfEsKERVu30iMk/X5fHLfFg7KBtLJB/4k0yVF4eiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0IwOjjyD0TYbTv7t9EnKZ3XqeyOWtM9KKXP0tGn3aM=;
 b=V2yHBZ8OXWCvw9xZkvIaKSONqQGGGFe000Y/xVsYPmpd+Nn2oNaFSx4j+YQZUiYTZmHEMGw93mXAQuyg8StL2ad7JygGlRHFW5ChAb3XtmneCmN4XGmHpYh1nZOr8/Bd6YVvsB5ZT9moih6agQhAjwp5029EJRSvCYG6uHExLyw=
Received: from AM0PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:208:55::38)
 by AM9PR02MB7060.eurprd02.prod.outlook.com (2603:10a6:20b:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.12; Tue, 6 May
 2025 10:39:50 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:208:55:cafe::9e) by AM0PR04CA0133.outlook.office365.com
 (2603:10a6:208:55::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Tue,
 6 May 2025 10:39:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.3 via Frontend Transport; Tue, 6 May 2025 10:39:50 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 12:39:50 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 6 May 2025 12:39:50 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 0858C747;
	Tue,  6 May 2025 12:39:50 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 0156F402A5E1; Tue,  6 May 2025 12:39:49 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Tue, 6 May 2025 12:39:32 +0200
Subject: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
X-B4-Tracking: v=1; b=H4sIAOPmGWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3ZzUFN20zApdExOTtCRTExNTC5NEJaDqgqJUoDDYpOjY2loAhkZ
 AxFkAAAA=
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Johan
 Adolfsson" <johan.adolfsson@axis.com>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|AM9PR02MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1a31f6-316c-4c53-ed62-08dd8c8a549b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akhXTTl6V2lucEJHL3g4SHAyTkNwN2pKamlzRE56Yk5jcjBPSHI2L1U4L0g1?=
 =?utf-8?B?TlhnY1FWMzNvcUcxMk5vZitMVHdIcnJ3TGVNVy9ZUzg5cFo4YWxBSStTMVo3?=
 =?utf-8?B?MzRVZjF2aVlUWGc5NTBCQ2NZbmdZYTFEK0xnSndmR0xGYlN6aVdLWGNzd3Vj?=
 =?utf-8?B?QU5ud3JNWWdKQjBaM0VPc2JpbkRvNldwS0tsQTk5NTRiS1IvOGNURHV4cE9Q?=
 =?utf-8?B?Y2N6aXVJSkticzJLZGVyTkY2Y2draEdtZVY1UURKYUt1T1hGczYwOTlsWGFO?=
 =?utf-8?B?QlpXNDlQa3l0RzB3N0JBN0Z3K292WnJuVzNvOTQxOFZEWEpjYnZXSHp1MGN1?=
 =?utf-8?B?b2g2TlYwR0RMelNIT29uRHhPeTQ5Q2xiaFcwSGlUODV0aFJCcDVGYUt2WDdP?=
 =?utf-8?B?SDh5anJwdVlKMGQ4Y01xakk5THBDQno4cDhPcnlJU1BGN3VYTERBWXRWUTgz?=
 =?utf-8?B?ZTdhWm1NNzVoMUE1ZmU1b1I5RFVTSWtEMkt5ZU0zQklQRmhOTFppSDFNWXhL?=
 =?utf-8?B?NVR5eWVzZHhGTjdrTTRsM3NZMkFhTUxNckUvUXh0WTI1ZVFXcmhDNUtGSEtC?=
 =?utf-8?B?bW1BYlFCb0ptdzdnZjNiRkRVV3lHVWdMdURNb0RKSVQzL3d6OXJybGo0SWJM?=
 =?utf-8?B?U3ZxNmIzQ2E1TnRoMWMvcUU0RUFPS1VRdGtITkQ3cGJZUWEySWlmTHZFRk1D?=
 =?utf-8?B?ZkIwMUtLWGlleER2Z3VGRXZUcWhkMDI0ZkhsWEZWNnpaS3JkV0ZVdTdIQW4w?=
 =?utf-8?B?aDVSVk1xWGVhTXFZd0V3UWhTSkVoYlN4eDUwNGlPT1Vrc3FtUE9jMDFPN2t3?=
 =?utf-8?B?V01ScUhpK2huNVIwdkcrRGMvL05iWXJYTHdBeWxUeExmTzRneUpZS2srMzA2?=
 =?utf-8?B?dG92S0NQTWNBU29MN1NPS0MxVkRhdndURi91YXkyeWJQbWRQZEc1VElIcXA3?=
 =?utf-8?B?SWtSS2dMT0V6TDBLenFPYkhOWmRReE9EZzlORDZqMWxQMkkyYkhaUVBBQWZw?=
 =?utf-8?B?REJWSm5HZWtnRjFGMkNRK0JvM1lmVTN1RWE1MllwVkhhTXZkRkRRTElZZG4w?=
 =?utf-8?B?MXRlZnl0bENjNDEyVHE0UE5LYmwwZi94R0xPQ1BveUZQWWxFM2MyYkRKTmlo?=
 =?utf-8?B?ZXZHVWo5RzBEd08zeFV1bkx3UnN1cW5QWnkrYVFiZzFLRlhyWEJTY0ZTc2Rs?=
 =?utf-8?B?RzF1RHhNcnMyL0piTktXN2hxZ1V3Sks4UU85MG1YZ0s5V1RqM2lwSHJEbHBk?=
 =?utf-8?B?YW9hN2c2ZmlLN080UzZiVjhPSFBzU3JER2FYUEI1RFIyRDVTRnRzamxhNWFJ?=
 =?utf-8?B?MVM4UldnMy9pR3k5aFdmNlErT0JRN242WEI1bE1Hb3UzU1owcDMrMzZjWlI4?=
 =?utf-8?B?dG84NkVha1Evc1dvZis5R0VRcFhMakRmTVR5dVU5SGJrVjBVZDF5NEZmdDEr?=
 =?utf-8?B?U29TQkp0OUN5OExMODc4NDhWRWZhREtMTWxBc1JzMHliWTUreVFSSlk4cTg2?=
 =?utf-8?B?WjFtdW5ISWZZUG9RMUdaYUUzZDdZR3Voa1lqMUg3Nk5kWkJrRUVCRE5nKzQz?=
 =?utf-8?B?NjVUM3pNaG1OSlRYTnZjSkZmY1NDNCtEUmJFREcwMWwxTCtQMmhqaWhRQ094?=
 =?utf-8?B?Q09JQTFvZjk1SHdEeEhJMkJOK0pLb3R1NUlBTkRnVE5oYXNDb3NBY3UyYlFj?=
 =?utf-8?B?OG9mUjdDVmRHZElSNU1lNTFlNXBQNlVYNXNsb0QwYVhHY1ZXY0lRamNlRjE3?=
 =?utf-8?B?T1QwYzR6Mm1oU1p1MFRLZjQxRnMrUnNBU2REaFBhRWYwWlRPR05FQzRsTXlH?=
 =?utf-8?B?VlpqRDJ5QlhPR1l6UXVnc0JQeGE5VHRZOE9nR3BSZFBFVzRWcm5KdldIV0Jx?=
 =?utf-8?B?TDlhcnhYUncyMFcyTkV3b1RRV0NIbFV4QlZadXhpTWM5Q2IxYU5UZlQ1Slda?=
 =?utf-8?B?NHhEdS8zRXd5NUZscExWWk80Nk9vc0h5WGxqOGdRUlpneVdrMy9BcmNJZlBo?=
 =?utf-8?B?M09UcG01WVY1SnJkdVdVbk1VVU9nTy9RZEpjUDRoR0IzNmdKemlVaUZ0bmRt?=
 =?utf-8?Q?aXX/lV?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:39:50.8945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1a31f6-316c-4c53-ed62-08dd8c8a549b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7060

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

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
Since devicetree nodes are (sometimes?) processed in reverse order,
support reg as the actual multi_index index so yo get well defined
color order presented in the multi_index file.
Not sure if reusing reg for this is the correct way or if another
property such as "multi_index" or similar should be used instead.
Looks like reg is used for similar things at least.
Or should the whole "reverse the devicetree" problem be fixed instead?
---
 drivers/leds/leds-lp50xx.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 02cb1565a9fb..48db024081f5 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
+			int multi_index = num_colors;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
@@ -483,8 +484,15 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 				dev_err(priv->dev, "Cannot read color\n");
 				return ret;
 			}
+			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
+			if (ret) {
+				multi_index = num_colors;
+			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
+				dev_warn(priv->dev, "reg %i out of range\n", multi_index);
+				multi_index = num_colors;
+			}
 
-			mc_led_info[num_colors].color_index = color_id;
+			mc_led_info[multi_index].color_index = color_id;
 			num_colors++;
 		}
 

---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


