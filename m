Return-Path: <linux-leds+bounces-2486-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F62958432
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 12:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1204C1C21878
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC8D18CBF3;
	Tue, 20 Aug 2024 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Qmuc6Qor"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2053.outbound.protection.outlook.com [40.107.117.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419018D62F;
	Tue, 20 Aug 2024 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149229; cv=fail; b=KHGEjIQztXla4d3ptD+9KL9u4tDH/2KNeU5YP+tBqn0sMxJ36V+PZ82/pe8uVfmCSicYafdfyf83WcA4yj1QHFQO2J/w5zzSJDxPwfgYmVKUn2AU3FCN4DJyONznsF7VHmmLMEB+xoryu+FTXwNleXiI6yGhbbjmJjKOolJxWFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149229; c=relaxed/simple;
	bh=nL6OHRYPcLr2Y6otklwW908GnoGGfGioxlYheQ4sYmY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=m7KB6dqTSvtWAqutw8jn4QbXSQZDtPwBNUKg2SNWBYAzTPPw7YtphZ1avFylctzczBWpFF1EkDATiHPmhQxLrzVP5ypfFVDWLJGIrzpWx9Hrt57lv+KLDgVunO4ir0zWID6XcC7J6WPXrjf8PWeelJ/He9eOernlznQ8Do1uXZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Qmuc6Qor; arc=fail smtp.client-ip=40.107.117.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa+J07OH9WEZdJfHg9sOW+lFzj3vSDSyBXc2O+V904YO5royJxmS+VhuddxNpUiVPsQDynxqUo2MZzOvgukE7fjtlTtMEJSvjB3Mmn2y2yDo+p4Gw52bKgj9jj8aEH1uJitACBqbLTmhskMaS5GR90l2dUvwyn+Spdw1HKpO2P5qPYp43U7uW8FpC6/pmcADddU+Uf9eMMwOh8wcAzM2ZhiWO6OkS5+sKd/Mz5bHWtMgORAm0Lov+BYgVeeIZXiB6VbM7uybXiXJvx0rE5dOUPRqxPyPJSDf+/YFTwYuLSI9ZWumwOrjnM/Og1pIf7ZfRPMbhZvVHITuV1cohYIqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEXX/6ex7T2tW9r7Lg2tScuvPzUmpjWPmkvzZQsjHmc=;
 b=V9sBoHIq9ECXvgDO4lQ4B9u+Vt4P5zR9lTcDtKol/nLYZ9lLKBNc4nzdlBfzsdq7tHoASJ/hlA4n0J+Layn7/upXTbZdR/grdPvjJxAbWfvveyPXMZhhr1Ttz3CEYwaivcqdbKwKcPVvli6rvJbByJbkwVPbOesZKOO8yIYHV5vgywz3Rb/Q4LOKW3c5VUNM5BvxUk0iJaVGyB+TUIxdS6X5ij2/B7BtY4jp4SAoEvKN3mEL5Yc6PBDladloUS21AEUM0NyX9epQON16R28mqyQY1/+QqnPowKgP8rXRl+Nycj5jlFk9gOpE6zFHRtfCBZtbJ2fG0qnwLo/Z2Ij06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEXX/6ex7T2tW9r7Lg2tScuvPzUmpjWPmkvzZQsjHmc=;
 b=Qmuc6QorEQPRNXumuQhUPVCDFEUr50M5nKrY+P2NYmtB+1k/KVJOL2KxFM44XLpFGTuXTiJJvdrZDSR2Su5KqJNFKcswxVX6FtD9ZoIslXgwbfR4oNdZWvHtCeKdpDjUBNQcwTOtp315eCaIsYH/rLel440qD8xFuty/wIG4aqUgpLGWv6+Bf737Xfa7t6bEjqjuuN5GlEkP062cEgp39v2ZNdiEx9fnn87TA6iB0/N6TgjQHgKI011KJVke4zZIgyb8cPHOmC32aED4nIaKGoGdth/Nc0ba5WMJGww/ySOpmsT3QafYJgk4z0AjXmAQ/ZxRQhcZnipWkUfolHdqBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6486.apcprd06.prod.outlook.com (2603:1096:101:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:20:21 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 10:20:21 +0000
From: Huan Yang <link@vivo.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH] leds: lp55xx: Use devm_clk_get_enabled() helpers
Date: Tue, 20 Aug 2024 18:20:06 +0800
Message-ID: <20240820102006.128840-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cd97fd-6b0c-4c9e-fc8f-08dcc101b256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VOTjtBdoZ3Ovg7zQ0AWrpbDyjqH1lLqqs9tiBtcae+k6E7LH0pIIovu17bIW?=
 =?us-ascii?Q?Us5g5OM5sw7/qyc9wamWtJOAxNx4b5DUQmyeSZM53J4F1SsGyt0jg89EH2xG?=
 =?us-ascii?Q?LRZ5M6uD3moMx9WwBacBoktMbZZlgp6YMG4ITOovkTHod6UhG0IskJiBRdrL?=
 =?us-ascii?Q?nqaxeXHToMH2jHkn7QqfR8JpMovhL9FTzGNBC/8f5blySfO/h1EdUdVHADuV?=
 =?us-ascii?Q?CkVxvXPVrXyAjdthuaaFvlLbgI45/aQ5dDIwvXn5zpLDn/DUGML7bjEe3YXT?=
 =?us-ascii?Q?TnIva+HT0yoHn4M93Mjo1ee7Vj5ZE+15yCLvabP/vc5+Hi6NDCkAjDyYhqVY?=
 =?us-ascii?Q?fHMIuCIKw2haxjio+y/TS8zzrYoN84/Tu+sThavGXg+ttMJqx/FBW/+Cgnkt?=
 =?us-ascii?Q?8HuFAMZemqxjx29T+20N/pQ/0XRXmwMm+fDjJcHXVxghH3kV9AY+kGPQx5Ra?=
 =?us-ascii?Q?f3n4z5ta842Y3jRM9lFbvOyyLNwc+sQy/nLUNseDn10tYuL3TeYFB4i4tRVl?=
 =?us-ascii?Q?iRLxPma4D/pV3mT0j5b5/nz4Y5ekjHKfmPxTUDl6i86pXzcYkEZjI21LBeRp?=
 =?us-ascii?Q?yXAiSb2PZeupycWzwbVeRgcBrvZCSG+UGG7/3wm21BLgwwQal8Pg6nHp1aKN?=
 =?us-ascii?Q?X37pIdeWwVg6J+5MaBzI1uKk+pkdBzXi6oVL6Uop2ZthVix9FpTDYsyEwuEb?=
 =?us-ascii?Q?rXG7PbZU8KrjY0gFQ1yN3cl+rIGaXZjX2vtnlsgvSFfPsyiOG8mJiIGePaxK?=
 =?us-ascii?Q?U64bR37Fz6Rl1a70VazGWsYuSIB/gdfjq4qsy1wbFdVazzcINWR4Be8UHI22?=
 =?us-ascii?Q?4vkjMOqcZtZHrtc8E3fQ8FbhNd/O+5wFg/mqaFdhmrMepUG/XvytY3OEIf9L?=
 =?us-ascii?Q?cYM/yX+uw0RdyNQryBua3hX9THdAx4SC2fuIG9VHnIIbINJHwqdanEl/rc+l?=
 =?us-ascii?Q?tIPl6vtI+hhrfFP36NtsYnHffLB25DbZJ5ueFZizyi9ZisNCKEf+JkRxHwTA?=
 =?us-ascii?Q?QD8/o3bTWqaL43JwcWwJTg1AX0/WnY4QQCnRBLT689UIx4a7AUcLrnwFWMCe?=
 =?us-ascii?Q?nEMN0cg3lYbqBbN5FD1bc9ZfB3cgGn/1BdZNW4o15yObkJwvpUsTqpJz9Lyy?=
 =?us-ascii?Q?WXyPmBQo9eB3/43l79RI+qW6A6z2m6pXrRZegCEJmtZ4yn0Ih+j1mR/+A/Dq?=
 =?us-ascii?Q?2cweKAPQpf44bzvXY6/9GQjxb95b2UDFl+8x7mh05cMNurKvFXfyToQHIgOS?=
 =?us-ascii?Q?j8n9r42SbKBKkbYSnKD5janACza6J1Sx/2Iv3FMpq/O8TXZ45dOYU+DSWC0V?=
 =?us-ascii?Q?PXyveT+e+FlGpM4hfQPAt/6J6ZzLRZMKQFm+xZMoTOVQvyNpPbkVD4PMe3Hy?=
 =?us-ascii?Q?nKgx0mTs3kS2oJ9X8M89zOYmfMLMyIe16fJjtqZrvDA0Q3q8TQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qASJDLmQZxWdbn/7ARIunT2l9vwPUHhNAcSaSsVQy+ERzGohteUehBqDTpjZ?=
 =?us-ascii?Q?/pTyv5lP5jwYpuo4H9Yiq5U0/FChINbfmSAXUchRP3CA++zhlia+bVKsh7Ze?=
 =?us-ascii?Q?5hNDoz93BVdGBj2i+15GrUsUNxG9nW26KUtqUQOuVjBMJuqXO0TVxtFCbFd7?=
 =?us-ascii?Q?i+9ztLq/SPUTg0/IR3A6RnK8sJYyW5sPh91px+XEDa+J8g25O6A4ulgv2kNt?=
 =?us-ascii?Q?tUmuaX/8RCsifxPZRyxjQSP8SkYNaOx3N/3dUytb2zRySsv4tNj/928ny4aP?=
 =?us-ascii?Q?9DxLc13ldPR4DF+8903OLA14Jx/oh54WN8gYRXTRrspR2XcGC7hRKYN9UEGp?=
 =?us-ascii?Q?AB+louDVvrN8F+4O0loYwVwmFAKK91PIuK8CFzaz9/KANbVo9tlbtjjeOJxQ?=
 =?us-ascii?Q?xgMmdvCp0FMNF2FTZwduZoZzz6KAYipfLZQFI+LsjaBY3QOVbvRV/Y3qhNcS?=
 =?us-ascii?Q?uy/OPTufXgaVQyu9cg6oNDa3LK8CoGqRyT5dJlzbKzyus687/QeedqALet9l?=
 =?us-ascii?Q?G3C51GLi5j1HIDw9EiLHrUiW6H+B1FjmtYQEDbN8HbHGFBC+KhfomwIxgamp?=
 =?us-ascii?Q?uZfGSX7lKYWKA78xnDqazFoN7dL+GKKHspwvwOcbIvJISqeuRShVFPqIw48/?=
 =?us-ascii?Q?7n8W0Zep3Iox/PbhxtB/Eo5lDoo7/a8yZuyZwpipvT05wkZtw3IiqKNEX3Pi?=
 =?us-ascii?Q?Bj/wvul8sSEcXjyNkDZZx86ZV1R8f4TnKQJCLDFitAw8pxVgdArks/8IH34U?=
 =?us-ascii?Q?mlZPaPp8gwASj4wmrzRDb4MRrqhvMpojrtnq1o0MavfdJMZCoGOawnxnUWqz?=
 =?us-ascii?Q?lqYQuINqeXoB0eSwZru+JuFmAIqS5H3gULpd0wocOyOkqWd03s/bXX2KTwGj?=
 =?us-ascii?Q?9yrW++OpCmcRft98/vFjH1Feuui46GvmmplTdbau9sShDdeSAPxcJ5J2/l+F?=
 =?us-ascii?Q?jaToQurzESc0dYnyWGGeL3gMUB04UahBTII2Cet4aG6GgHOwS7267JWcCNGZ?=
 =?us-ascii?Q?mgKbiipXdXCalOgIdFKfIHicHio54yQwsO/gA1RCDygSUq83O5CpxJ8i3qBF?=
 =?us-ascii?Q?lSHb9/aiI+vgPKPx3hpbiiu+TkUR1lbXgUfGNs5qKdHcRxP9mQk0HMJAJRem?=
 =?us-ascii?Q?boz7V9/e9ZWLWCyIjpK+G74URo/B8ajkXskOMKmHJBv0eXOxfaldo4NLe+XV?=
 =?us-ascii?Q?NWkPz++SsqEIyJK1Hw7cfFUtbz9N5pMRPhOVvzfQsHDpjt/sMU/cU+dUgDgn?=
 =?us-ascii?Q?7N2IE62Auh53L4XCU2WsKICYzkRR9uXzHq2IzxRZedmQyVjxIHiquSlbBdan?=
 =?us-ascii?Q?sSKfLEOAALXvBjvuBQfmsLQy8PY4IVY3BQMtAtUOJxhNWQin078sIi+IXdoZ?=
 =?us-ascii?Q?RWfQGSrgEKFktaFS3q2Ir0LhRfbFe56uU9uhwuW6n8QO56kqBWq7fooGUvNV?=
 =?us-ascii?Q?6s6S4mAz1xoPt65lHBM0fLPfC77/4XSGs2u2ofRyGPfRkSo1F1+lLR7Kg707?=
 =?us-ascii?Q?5UkvegF8hk+ZW2fWLlYAWlzsKdgfxg0X3KeFcZuUAE5UGduzvqKxZKaJ52TE?=
 =?us-ascii?Q?Kk9ZV4SXqEctRgIhdCm3gLtJVm6e2xQfdW6C38n8?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cd97fd-6b0c-4c9e-fc8f-08dcc101b256
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:20:21.2554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sH+n1YgR9eeI9Z/QaBEO0cM3yjK3SV9Gs4HoGmZLDbeWV20OJkjMMXf2MDhWhP85X+WajnPYB2zx+vRTO1Y2fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6486

lp55xx lp55xx_is_extclk_used get, enable clk and
deinit_device disable and unprepare it.

This can use a simplifies helper to cover.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/leds/leds-lp55xx-common.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 29e7142dca72..76dc62a3bd45 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -965,21 +965,14 @@ EXPORT_SYMBOL_GPL(lp55xx_update_bits);
 bool lp55xx_is_extclk_used(struct lp55xx_chip *chip)
 {
 	struct clk *clk;
-	int err;
 
-	clk = devm_clk_get(&chip->cl->dev, "32k_clk");
+	clk = devm_clk_get_enabled(&chip->cl->dev, "32k_clk");
 	if (IS_ERR(clk))
 		goto use_internal_clk;
 
-	err = clk_prepare_enable(clk);
-	if (err)
+	if (clk_get_rate(clk) != LP55XX_CLK_32K)
 		goto use_internal_clk;
 
-	if (clk_get_rate(clk) != LP55XX_CLK_32K) {
-		clk_disable_unprepare(clk);
-		goto use_internal_clk;
-	}
-
 	dev_info(&chip->cl->dev, "%dHz external clock used\n",	LP55XX_CLK_32K);
 
 	chip->clk = clk;
@@ -995,9 +988,6 @@ static void lp55xx_deinit_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
 
-	if (chip->clk)
-		clk_disable_unprepare(chip->clk);
-
 	if (pdata->enable_gpiod)
 		gpiod_set_value(pdata->enable_gpiod, 0);
 }
-- 
2.45.2


