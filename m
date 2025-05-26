Return-Path: <linux-leds+bounces-4711-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F55AC41D8
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 16:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D953A2905
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 14:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1107820C47B;
	Mon, 26 May 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="mPzvatbl"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D73594E;
	Mon, 26 May 2025 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271251; cv=fail; b=e5Ab7NmmyQlCbcwII44g/mqqxyezJorHqKEvcmzmd86pplc+X8P5fNI/E8T/eLNRlZPEpM9cOG3X4Up0jxGvPS8oLiL5H3BhBpDM8Q5Xq0LmCT1C1GtLrQ5/p63tW5pQjBhL1km5Kam2EJ8TsU+XGCfRjE34e+W1TJ+clMgGvPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271251; c=relaxed/simple;
	bh=rpBEWzAMTtwOLzgJONSLm3+B6XKYf8u3EQiAzYtPVas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZmvME3S7ZWpRhynvY/CrToYEHPJt8rGRd6GDW8JLMqH9pz78X9lPiirg2idMuw05FwDo2qGbJurVbgWaxke68ErBphANkZq96bvC3HJHFqmA2iWRZME3U3J+ivXM7nrhCIdATLCXWNJ3fVsNdaFvW+B9i6vRxVw/IKV1jdomD9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=mPzvatbl; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWBfEoUswBV1oKvxUWJBMUJr30OO+u/TYanHbgi4Ri7Ez4upAK2N7OTUiFmCYekm3hopsV2liStxB5b/e/+eEqbzeXj8WbsxzFRX1EcILYhXWXM5uDvgh7jZgl/AZFrCSTzXhSEYdEuy1hU9YfaySN0h/r0b5ENnJHaajwMJVZ28MMO1iQuAcwECR8pGDZT4RZuRgBoWW2UGfNIsTkxcUZpBV7np30e/MJkiAnTjQUiNDXrxEEQ+IEWz/u3jyZlc5Wu256bA1lZUNVWF7d/W3eznNJN0ytmgS2AIUPC3xU6anEgjZhkHHrZxrAppcnr+EhNRWspo+lGrDtWYFttQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St2MUIDS4Ve8WSUS/6sGoU0M7rest9FRet7CC4wN/U8=;
 b=ey2TqNZhZawr+10nWzLl+8auMIf1rZjp3sjLNVQ7y7xrArDLJFVZsRqtw6ulitIHAavklkgWLpSW1HOCwVvm8RjVtBB6wMhWA5cNZWNVR6jZoJu6fp0PEYlE5r9YD+JbuRDj/3AZ9Lr+nMvnLpGKiEemSCTz0mVHqyFsfcaqDi+Mz2NotPlsBBarlL8WEWQp/WSDxvb05xaYQGpjbSn/Z4cug1yNUyoHEZYmWLZx7A9hS1dyXLwFETVOy+Qn7Btv6k+1ZwgpFbZi64gno+A8jZae2/210o4bXdnslpOwC3V/0Wntc5PWQ/oH+VojpYFWUY8eOH+oqQnQDTS8Js2tlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St2MUIDS4Ve8WSUS/6sGoU0M7rest9FRet7CC4wN/U8=;
 b=mPzvatblmVW5wFtiq9bqzd+8LiL3wsyd0esrZNX7oqEa9eI1b//nOswv3L3uYVuXFiNJy3NjsdZBZ9iJap0v5DdUlTkvvv3wEsuKC6mccsCD6dgyhaFH77wOwpP2vFARYzONWGtXh18A2yKx/uVqIjTDoZLz7gz0q4YORTAS7yI=
Received: from AS4P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::18)
 by VI1PR02MB6397.eurprd02.prod.outlook.com (2603:10a6:800:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 14:54:05 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::b8) by AS4P250CA0027.outlook.office365.com
 (2603:10a6:20b:5e3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Mon,
 26 May 2025 14:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 14:54:05 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 26 May
 2025 16:54:04 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 26 May
 2025 16:54:04 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 26 May 2025 16:54:04 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 24F2B2CCB;
	Mon, 26 May 2025 16:54:04 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 1FD7040364CC; Mon, 26 May 2025 16:54:04 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Mon, 26 May 2025 16:54:00 +0200
Subject: [PATCH RFC v4 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-led-fix-v4-1-33345f6c4a78@axis.com>
References: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
In-Reply-To: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|VI1PR02MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: c64b4ebf-a00a-4c8b-7672-08dd9c652942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnptUmNScWJtRjA0NnNZMVdWd2RIb214bFZKd2RVQ3VhUTYyaTZzL1NZdFgw?=
 =?utf-8?B?SSthY0Q5YXFVcHh0SFdkS0dYK1ZzbHM5bnpub1FPVXNEdXkvbHUzMkl2MVM1?=
 =?utf-8?B?RVdKdjVHVlFka2IvenBRQjlQelcrelBuaDcrdGY2L1JCdDF5YVdGREtMdGw3?=
 =?utf-8?B?RVo3TVVrK0loVGRDenlvMjcvaWljaTRpdzdrUFFBVWw0ZWNpRjMwcFRQRkFN?=
 =?utf-8?B?MVZzREtwL2dVU2EyVmRoVk9ObG14eEluWGhSRG12MlBQZy9pcWduWmFmRGVO?=
 =?utf-8?B?OE00ZzNTTGVhZUVLOUltZzBnamMxWTVwYjI1bmRjNVdVenFySlZIZlF6RGpp?=
 =?utf-8?B?d2MrODZXVmwxa3c0TmRBZU4zc0p3elBibzc1T2kwMUFOR3UrK0QwNTE4Vjkz?=
 =?utf-8?B?bzArSzJMVHJDSWRJWnNrWlhnT2YvbDBLT0Fzcld6M2JudzlTUnFjbXhvclkz?=
 =?utf-8?B?TDJTVk5CWjlZUzcrUWVKUHdKdlJqTXYrVkVTbm5SMzFqUSt1bitVa1N5NGRW?=
 =?utf-8?B?eGJpbDhqejVyWHhnVGNrNFZtN0xEUkNLazFoR2w2eVNPYXhMdVBrcTdkUFlI?=
 =?utf-8?B?YW93SjNjUVpMOVVENi9hSy9lMnZHanpDd25RSXJPN3dqaFBGaVNrR1AzeHVE?=
 =?utf-8?B?ZVBPYWxvOVJoc1dqNXYyWTc4djJMWXJUOWlQbTIyZERZRGJnWjZBY2Frb2d3?=
 =?utf-8?B?ZSs0Z1pFSm9XSTNiTjFEb0t6a3VuTldoYWNpODFpRW5HcnNrSUNsOEpjQ1J4?=
 =?utf-8?B?bTRwYnd0blRKRjN2QVRwNHdTL08zR1VBYnJWTzJLM0xxQmN6K0NxQy9rT0to?=
 =?utf-8?B?K1Vmb1JrQUVGdncxUTFMNCtMcHY1d3hpZkg1Uml6djNhN2MzdS9yb1pUMTk0?=
 =?utf-8?B?REp0YU9UVTlDNUxFSG9uVTB1cTVWRU5Sb0lJbzlSSWlOZTQrQi9RNllrSlpr?=
 =?utf-8?B?RjdjREhDNjV5N3prVkpMK1FULzUxNC9hQ0lsMTdZZjY2ZVVhNlFoUzdUTFVX?=
 =?utf-8?B?TE9ZN3lIamhkT1l3aVdsL2ZCNC9pZHlOUk1lY3BsSi84b3lpelZYVlpyYUZ2?=
 =?utf-8?B?Y1dFUWVGRUZYQXY1VWtnNnlvbnQyMFMrUkNXQVFvMXJrVXJEcnMzdHdBQjhX?=
 =?utf-8?B?S3RMQysrOHBsdUpRL2U2L1B4OTd3L1RXQzhONEdKTmNjcjFNcGZRamtBMEVB?=
 =?utf-8?B?ZlNGUnh3bUlkaE5qL1RybmJnVzR1Unk4YWVkajQ1a0xtazAybW9rU3k0Y0xt?=
 =?utf-8?B?ZnJjTlh0dFdKTTM1NG1Yc3B0M3VnWFlURFRnSVVaM3hDNkdzN2UvV2svUjdr?=
 =?utf-8?B?TXIwQksyYThzYVpRRFpRS1RqREttb09pRTViNXl1bmxwT1ZqTWErZGp3cmd6?=
 =?utf-8?B?eWZrakdjTkZ2Qi9WaEZuMlFERmJJYk9Od2tLLzl1bmZOMDRsK0t4N0VyRFdK?=
 =?utf-8?B?bVhGMWtWa29MbzRnYzlxbldiMFNuWnAzL2c0Y3lJYkJSRnpNVG1vZnRoOFNR?=
 =?utf-8?B?Q0dScmpnQ3lyMEJzSlRod1praWl1YUtCL3EyVzZrOVRWaGpLSThScFl5VHFE?=
 =?utf-8?B?MnpVT3lBbFFaSVJzVktONTBwT2hVelo1TG5ZT1JEbDBWMDlJdnd5RDhKdnNN?=
 =?utf-8?B?SzB3U0JqZ2J0dnpUU1docCtzeURlaDJkOVAxdjB5akxWWW9Xcms0bUM3UjF3?=
 =?utf-8?B?NEx1UmhHVTFETS9BMDVTMVV5N0ZZOWx3RW9sbmpORUdCVXp6U212aGxRdVpE?=
 =?utf-8?B?V1R5S1ZpanBzNG9BRk4zcWZkSm1YWDN2S1R5MWdXNE5kNWFMdWQxOG5ZcjZH?=
 =?utf-8?B?NzBaM0swaGZSMTlpMEhQQjhhL29zL0R0ZTFrMWJybGF5NkF3eWEybjJ1SnNU?=
 =?utf-8?B?ckNNWXBzZFNtZVZJaUw4cXlVejBsUU9iUGtISWF2VTVPZGhVUW9oQTdCRmVt?=
 =?utf-8?B?L0lCTW9lamR2QngyWkVPVnA1cDBlcndRYXhBOWtEbnIybU5CbHhyekFZL3Vi?=
 =?utf-8?B?SDR5bitwaG1WbWY3K2JqNG5YK256SmRnRUJOODAyVllBVnpRalRPWTBFYWZM?=
 =?utf-8?Q?If9TON?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:54:05.3901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64b4ebf-a00a-4c8b-7672-08dd9c652942
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6397

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


