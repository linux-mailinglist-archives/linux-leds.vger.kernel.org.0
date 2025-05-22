Return-Path: <linux-leds+bounces-4698-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A1AC0DD4
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 16:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CC917A6075
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 14:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A5728C2A9;
	Thu, 22 May 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Y3+1IS0z"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2961F09B3;
	Thu, 22 May 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923300; cv=fail; b=mzxOHZK9PjQxTXT++8yFW+lTHiJTQpItXVqDvA9tGT1s4l2B2V6sad72cMLUIHPTNpfIhv1ggAOG5V2EGboAMTWVLSYapDDLQzdIwGX2gjqaxLTdFPl03mYPcxwSpyzOEsug4wHoaHFO5OT2Buv/TNiq41H/h5tH9qFLJHR5WpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923300; c=relaxed/simple;
	bh=rpBEWzAMTtwOLzgJONSLm3+B6XKYf8u3EQiAzYtPVas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tUTq1AVj+6kZSV1cAZlbUP5N61LZFakEsn5C8hzozTusUGhJStSbi41Og7aZc5WLfyr7Om6mWRcIrl7CrvaMPLP+mKbuNc5hgCiBysBEUNpq+BgUKCuP/2wZAw6otb4B8rCgBYSchZ1jrUpceQhhckjca3dCyqFcb4SruJcCt88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Y3+1IS0z; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7kMl29MBXw6hUh7A42sVGgPdIVG3sFGZCtX6W3viF7ktLMpOFFHpsijUb+NBRsCVh9Lk87XKGhAQECK9wcCGm0mJUn/YwLybixXvPbRusQFNnXBpedQbzSGhiEo8XCIcU4wGJy2yLA7KKpRlOjUx+Rh2Fb06Nw2BowcgGjDET2k7do0HXdy9TzfBOSj3ZheuZgTG8eCTIp5Z736n/lUMlVOdmBzpurLbtE5H/ZEvQ+qaNuFxuJhRFFdXlZg8K3vMR4y2WaTtKCgDls9sfz+USrnwKmOn9/+lvLTyfCj4Xj8Ajjc7faNp7aSCX43+ki6sWqCx5oyefcE7LzATCNeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St2MUIDS4Ve8WSUS/6sGoU0M7rest9FRet7CC4wN/U8=;
 b=mcuNXPaBUumG1YplbwQIny/JUe0wRdCT0lalqv4qabJQgDFyLPOXc8d/hTH5kHt/uGFgIXj6mX5KBBVFraNS/cjTuFCBgLk27YdZezfMtaIROYA92vU3Pl2pLlmm2UjaoJrj48yaMLXBUItGUcfkroPebxyJmzgxnPZwkZGN9sLQhDz5qS1VzyXwNtJVGeuXonWXnHYzuFu4YUfaMGqigiNKtLI3vpu3ivUZxGGbRFsYQ6Q7wqekzlxxb07cn22Fjc+HrArwaGwklFRfifn530YkfUN7x4DypHETdYRo1frlMJpYUavVQ9YvS6f6XCwSa2lf7SDHTk9MZbJLBLoNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St2MUIDS4Ve8WSUS/6sGoU0M7rest9FRet7CC4wN/U8=;
 b=Y3+1IS0zPLGGTKb2gsGUDFwn1+9QqMM3q8v0skOivez4I/gP+IqriNgqJl+cpOyRyoSq5bRFkx5Dx3/FTc59FjDtIsSTcsy5bA5+dYLmnuk3prX/q6qhuPBFE3JoLhOwGEOj+eSBPl/is/UtcEMdJ5luXZgcLwkdJ9umkOnhMhA=
Received: from DU2PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:10:28e::16)
 by DBAPR02MB6214.eurprd02.prod.outlook.com (2603:10a6:10:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 14:14:55 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::cd) by DU2PR04CA0251.outlook.office365.com
 (2603:10a6:10:28e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Thu,
 22 May 2025 14:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 14:14:55 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 22 May
 2025 16:14:54 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 22 May
 2025 16:14:54 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 22 May 2025 16:14:54 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5997E2F54;
	Thu, 22 May 2025 16:14:54 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 603524034D5F; Thu, 22 May 2025 16:14:54 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Thu, 22 May 2025 16:14:48 +0200
Subject: [PATCH RFC v2 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250522-led-fix-v2-1-652046323ec3@axis.com>
References: <20250522-led-fix-v2-0-652046323ec3@axis.com>
In-Reply-To: <20250522-led-fix-v2-0-652046323ec3@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Johan
 Adolfsson" <johan.adolfsson@axis.com>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|DBAPR02MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: b8188d45-474f-42d6-12ba-08dd993b0724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OThOK21LR3RtSXdubTk1enBtT1RTVyt6TGtuNFRLOWJLMEVVVWN2L1RUY1h3?=
 =?utf-8?B?d2N3NDJRMFNIRUNsK1RCUytsMzc5TmR4UTBYR08vVWYxZFU1NjcwSmtVY0Y1?=
 =?utf-8?B?S2JPeFN0bkIyOGhoc2JsazdRR3pQQ2U5VzhLQWVjSm1BZW0rM3AwWmp2UE9L?=
 =?utf-8?B?b2h6SWQ4ZEJod3Z0K01kaXhXNERiMTlNT0MrRHVCM01ubStvVjczRmhZdmZI?=
 =?utf-8?B?aFZMTnFZM2FlYzliaXNOeEhWMlpxQkRrbm5LYVkyM21IMjQramdVakRVZEw5?=
 =?utf-8?B?bTVmOE9heXF3dG43QzNmSytUUkNLa29NVE5aZUNSODgvSVROTW1ZZkRRYWtN?=
 =?utf-8?B?UU1mMlZkd3VmV1RwY3RJTVlNbnhVNm0relpMVDhQUUNrSVFzNGpzK0UzT3By?=
 =?utf-8?B?SW1JdUl1RXhMUzZrSmZESDAwaFd2bjBpQjlhankvUnhvaFhBTVhvYUs3b0tZ?=
 =?utf-8?B?NFpGQTBmZzJjWHJOdHZhbkcyU3VFeXdHL0pndmZWMHcvU0g2bm1zUGpWbkxh?=
 =?utf-8?B?N08yRkoxcyt4Q3VJUlZteWpDVUdqU3pFRHNieTIvQWlseTU3Y2dtSElzdmtS?=
 =?utf-8?B?dmZOQnJndmlDSWN6cFBWR1gxeFlpdzhISmlLZ2cyRytvNkRPWlc0QWVyTDFp?=
 =?utf-8?B?UGRUTTQvU1hTb1M3MmNkTzJudU1MaUhYT1VRUWZ2bFVSV2hNN01HcHdMY01O?=
 =?utf-8?B?eVdqbDI1K0F5M0dnRGVNN2djdExlQmJBa1Z4YWFXdXF0ZURSTm5yMktKR1M0?=
 =?utf-8?B?MHpsUFJwb2o4R3FyNnQyOXhodjFMbFRENEpqc3lRSEdYMkNKeVpid1dEQ3hy?=
 =?utf-8?B?R1M2MHZhVlpobVlHb3J5NlhHZkplMjZudGk3YlF5RWd3VEN3QVJkdmcrcEVi?=
 =?utf-8?B?eDZVckgzVWZ1aDRPMjgzNnJKRy9xV1BLV2srb2tXUlM3ZDNySy9oN0lTSGRR?=
 =?utf-8?B?eWlzYUx2VG1BRHFkRTJZc2V0QVBFZURjVzNvQWpUOW55eDV6dmhLQXNpY2sv?=
 =?utf-8?B?dFZKYXNFMWpqZjlvM0pDZUlRYnFEOC9CRTZ5ejlISE8vN1Z6S0FpbCt0ejZ3?=
 =?utf-8?B?aFF4T212akphQytFOE5aWEFNc0FQWFZGSnV2MUJHZCtRQ1RyU0JQWkNsZWtM?=
 =?utf-8?B?S25QcW5QbmkyMXR1SEhWTkdrNy9FNkRtQTEyOXFKQ05iTTRMOFUxcUM5d2M1?=
 =?utf-8?B?RWpaeWs3TjJ4YlJmbk8wQ0RYWFFzV1hGZVM5aDk5WmY5dk1VSnJRU3p5Q3ln?=
 =?utf-8?B?Q1F2NVVpUUEzdWRMZW1WeThTdFppcmkyNCtKaCtLRUt0WVdTMzQ0QVcyMXlG?=
 =?utf-8?B?b09ETWhKRXQ1emhtcHJlcWhsSjd1RlIwek5lNjJsUEl4T1B0VGcrVFNreEdV?=
 =?utf-8?B?dndvVk9HTmwwUVNDbVV1RStDeTZLbG51VDhDZzJQRkJkT2xZSDJ3c1A0K2Vw?=
 =?utf-8?B?VXh5M0JZQ1U5MURPcVg0QnVTcldiYXh3bldwTU1JdENlTFBZeUwva2MvT1lS?=
 =?utf-8?B?VldUR1YrcnhmaWc1YXF5Q2V2VWtidXd0cnFCbFdsT0c4U0VkRk5NYWZ1WjF2?=
 =?utf-8?B?ZVJmVnZlcnRVa0lManFlYS9adWl4c0hyWjl4QXA5TW1Od0xQUmRnN1N2cUJJ?=
 =?utf-8?B?czE5RlpqMmJiaFJ3dDlzaTloT2ZzcUFXNVFBMWxQeFlINmc5Q3UydXV3bVpM?=
 =?utf-8?B?V2I3UjAzZE8zK29ERmlaa21YOGE3UjFWUEwvNWN0bkdYYkdETDlnemx1blNl?=
 =?utf-8?B?N0EzWEo0VkJRY2FRODBSdisvd2d0M3YwS0RROFR3bldnU3FhUS9rQ1NvclI5?=
 =?utf-8?B?QmZaOTFmZEFvTk0xRkhDcU5JeFhRVlljeU4xQm5DcEJxVjEvamZOR1ZsSkVN?=
 =?utf-8?B?UFVTT3BwdWR1aG43c3FGdU4zZ2k0encyQnBDTm9kTDdkZVVmYW9wVDdWTjIv?=
 =?utf-8?B?VHkycXNHTHBIbDg5S1FTdlVXV3lpUzRvTUdtL1pibGNDUEdkNnZjS3J5VUxw?=
 =?utf-8?B?OURwUVk0QmU4dm1QZFF4dmJsSmJXMHZHUVp6SDFIZy9ib0xVdHdqWTlZK0lp?=
 =?utf-8?Q?Mhra84?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:14:55.7907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8188d45-474f-42d6-12ba-08dd993b0724
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6214

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


