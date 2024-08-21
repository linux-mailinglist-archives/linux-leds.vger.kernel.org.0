Return-Path: <linux-leds+bounces-2493-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362295923C
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 03:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0FE1F2157B
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 01:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D8482DB;
	Wed, 21 Aug 2024 01:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="lYhC2nBi"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2048.outbound.protection.outlook.com [40.107.117.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF1A55;
	Wed, 21 Aug 2024 01:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724204282; cv=fail; b=qvdil9Mu0hQVPM0zlLns/xO6dGbvXIO4vPT/9vyD1kpESNAfrIGGbKWET2DAlYDMAxmA/zMrLNsa/j4aODv1S9SDGwb6GzMG4efEEztHiGE1N6o7uVJyWjb83ppe6e6tt93ViqxQY1Y98qsgM7UIIcf2HdQLyS8hlVpXDF1df6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724204282; c=relaxed/simple;
	bh=pwyeDVWfre8netSfb7Y4POqrEwnvq8VLnA0r0bxccMc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FvAmTveSNg9vJoZWIbs0/MWvWvPrOPJIPaNpMrPY6oT9SlK8nZ7SlTS2E8jiTGwD+UN+l00SnGMkXcU20mYxQwtH4zhulqHA4DDnm6NNNuE0krYowwBW2KPPvh0kw9wmlr/XM/Z9fRHlam2nc+EGNFdAbH1Gt7xGuL1TddGengs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=lYhC2nBi; arc=fail smtp.client-ip=40.107.117.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rf4tuMbCu+CNPINKeKX6N+wQasUeIqfbVu8TnbX+nX4EAE+oj9q+Epj/S+2pqgW3f3FFYrXqQZx9wykIOXmrCOeGduOO5M7Ei2vGDl08JCheuOeqCIbmSsrIrZQz4B1aAtz/iNDfpnbo/I4gjZLt03tGOL+4SlKVu0pRTHnbkSA7Qj62XwSo2FWmK/Xv7dGsATtJfvIg0BD8AByoaKFT8/0uShw4Y7J5YJQYi9t3s3j9XsmCkX8rYprvSoI/DiBzT1fL3FKNubq3wgBharen8yo1ymm8FM8OgWlocXT0bogrkJlpHJUStVU0dgydpp7YQ5dn7F3M+TfVsGqM47jmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rZoqMTEJVcGAE6+o77bF20cMv7hadusnatBkNKLOO8=;
 b=BYRN0crO3BAXO1AyH1E9bUO7Do9fIplM515fwJR5xOgiqJDOdRWXc9L0ZAG5147w5UMjqDmr9SOu7G7GVMw7I8Ntfo0yNxIZ99FCz+tag0olz084ZHD4Tm21wcYo7BDE5tCMKZVvCsvyOW703iI8QJ+XoQs0MuQL/slEHLBi6gfHcUlIilykGlZaKM8KlQHqdNfdgTYbR1o1uVUTdH95lalu0TZTF+RGRLfn68YwhzomdoHq+PAanohca1Dh2I2RErxKnsFXiWmPbw8bBU4WMt7dJEXQais+BEyAq3BSjd9VdIELwi5PaWrzRpJ1j1Tf0h0BY0HaJcYDdoxN2luxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rZoqMTEJVcGAE6+o77bF20cMv7hadusnatBkNKLOO8=;
 b=lYhC2nBiL6ot238CWP3LXyxZPMfAn88lXE/lT5i0P4U5VTLhLf8h4oxeJLOMboAH5WRVo7t/hyjcevI3WDyZur4VAXl0II/Ps+tr8246Oh6RjFAcDxmZXcBKNq9MOuwwbgPJCHR2D+taCE+BV5iJ1hUwdJPHqzf5rbZXtn+gUr0ugPGi6S9qZU+re4bDTrhMfZmTEvyrxMBrRmuv1yOGyDdCBZByycabnCV6ZQLt0DIIJEjkxBVK5Uf9D285leAm6TXBojlpXk+WvwmyX/XEPlF3Ngy0bGyeet31JR3jngWAJtmdxvVVOQrYyogbIq8Ct+sVR3Qu30qWs/Zj2uowxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB7035.apcprd06.prod.outlook.com (2603:1096:820:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 01:37:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 01:37:53 +0000
From: Huan Yang <link@vivo.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] leds: lp55xx: Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 09:37:25 +0800
Message-ID: <20240821013725.785956-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:3:18::27) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 8214e9f3-fc22-4c00-b12a-08dcc181dff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SKCDgZx33n+Gh5+9yNnatNWHJUTDCqBzKs4ieezEB/HUoj007T3U2kVpiiLY?=
 =?us-ascii?Q?+eb/z7A+n6tI17kTjUB/iXJsVBOpirbtKxh7UKekAouQB3Echc+K+2dJHFre?=
 =?us-ascii?Q?Q9oU9PgYWRPjFQpqbtl4gWHzKqduGHbSuk2kkWcmruBZH23N5auqIN2R8yst?=
 =?us-ascii?Q?5hNRgurMrvredyspviNd7s2W8HNF2fd5Muh7eU87YmnZg3QM5I4UsKGRAa+c?=
 =?us-ascii?Q?CaZYKZBacSe6n7dDHq3H/AMXSGU9/nu0QT5u8jN7chejYJJsvGhjezU8gMIX?=
 =?us-ascii?Q?N3VtGbY4nn6OsMKSLZD3CSDuCJn6uyKuMIFoALiEa48WZwv2KST8S1X+BCxU?=
 =?us-ascii?Q?6UdTTmh2uKXv9/yrPtT+bUIFbrMgVCHbXlwWb5ZVsdChnwvV0f+TRTchqKqT?=
 =?us-ascii?Q?WTwqg0imTRyRmsG6IvwZ7KXoPjTGj/DBWwyuk562joNTegT0rEsvXanwlSH1?=
 =?us-ascii?Q?dnWqDrT04pDZuKuQgfaaqgPaa/hbHzX/akAONbzo7ZhBPPbJB96qODsFn5rj?=
 =?us-ascii?Q?QQc34T5UxfcrNave6Hqnzw6WpmH9pw7g18n64HIHqs0j2pssAl/8MzfMxRYG?=
 =?us-ascii?Q?TIXooXCAKrCRWlF+YLDmupsMw/Q+bje8G6uhX76Qop0YzX/EsvOqVD0uPyWZ?=
 =?us-ascii?Q?W0Zn6hued9w5tBdQ7Ix7ls+0soYmp0jhtuK9oA1CIs5NMmYkAnscUAAW6y7Q?=
 =?us-ascii?Q?nwuo/i7CyEyMbFGj0kvdEYEhET0OnmMIVw36FVqPusdtpTMBSCu1J/cT0be5?=
 =?us-ascii?Q?wOOL6vDRiLuRhYxelYQPnvPp1XkoVcanbJr5ZXE4udxnF2+seDbByMYcik2a?=
 =?us-ascii?Q?Vkf4Kmer7m47ZXzYj+B5uKnk7brWxJYjqBPFCSY4vrB8mEhNx8wSlXx6Zcle?=
 =?us-ascii?Q?BqVAYQV/AP/7Qn+jS4KSyBuCPTzalUHbCTTwjPTMRyJJnDhDSAoZCpd0A4KQ?=
 =?us-ascii?Q?7PJZauENKEL00JBt5QBPdJzoPnp5BNAnJJMfKbgWGZ5K5DRdrEIYpoZM7xWh?=
 =?us-ascii?Q?e4IffFbhtMvzlgum1kCQtdvG7d0MYefjwfvKpqgkhN8wh9k5rOs/xo6e4CG4?=
 =?us-ascii?Q?DhBY+Ib68tGLEwo4GbQ/7zyH9k241wmcMbiiKAMdCmFG42g33PheieWPQ/xu?=
 =?us-ascii?Q?LFNMTbETTx8h3BFeEVJ9QUh1YnNTK2HiTLqYcnALnbIoEVecDnlYD2rf3V1u?=
 =?us-ascii?Q?JvdKtmL98x1Q3j68CMkKp/rkatV/yFlJJPZxPmaO/h2ZSvH5TssY4QJxO0j2?=
 =?us-ascii?Q?2kz1vRytoTPK/cerY5ILyPjSQR1TawJy79fpQuJMdaAMvi38Bir1lYIVqv5H?=
 =?us-ascii?Q?SYRoGIhtUvVIYCYz3jlhP9kX4XGNhhGhMj/j7JqPfOu7fBDARd/quYCzqCrc?=
 =?us-ascii?Q?7GRzYRPPeY34dnyzlNG1UaQw5s9FgsMHjoDQ4yVEihyOCw718Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCdmW4hxSdSQGAQ6lTpn0dlbCX5h5sxS2lPm9ocEU6H35sCH4WKVCXFk/x3N?=
 =?us-ascii?Q?WKKNNS0r72kQJklQy0PDa/GtnCHdozpF0LbKUWprO2csRJpIu+DD4vjQvsty?=
 =?us-ascii?Q?qBlKxR8/Pqz7E0IMf0irV9cRqzvDlUiOBeSiaV3MKugpRBurJu1pqVdIX4LI?=
 =?us-ascii?Q?YO9IMmifA9jP+W3F23fC+xfoty7ewNIIWmz+vU1AxgaenAm3DF2nrh8JBW7x?=
 =?us-ascii?Q?w7UYpE50tPySnbyBP+8Q0rq9SuyhyTby7I4WNNWDaxkTJZhaNY50EgADB7EJ?=
 =?us-ascii?Q?A6ce5PN7BstEQ7eX+gQmZvy4O1MR059ZxJ1n9uqi8lcNIstmTWO9cc5nhdsm?=
 =?us-ascii?Q?6+cHd/uVHi0FBB2VapiThdKnu19PVsglH7V5djcuTBo9zVNwNmC3aP5jMhxm?=
 =?us-ascii?Q?YoRnKZ8f54kJmFNK/yEOpyyvP+yVWk3QvxnjLqZbMdOGn4z3+1QI/j2woCwt?=
 =?us-ascii?Q?A1vT4NHgYNxwKp8D9WOz9hESAN7IcWIAIrSr82zM+yKB1QKGdC57HdbubKy6?=
 =?us-ascii?Q?9RdCndSjsLok2g+yB4WUb3SVbt5aR06wcvp7BaBb5WZdy7GNHwimlO2briSz?=
 =?us-ascii?Q?FXdOokXV1CqGj4aRR16wF+DV0k862UldZzYsPWEizAxOqV2sYze2xQXtkwC6?=
 =?us-ascii?Q?ikA8cp7JwvrH0RyW/Z5eus2huhB5bcy+NDcGGYtkAHkc+TSTlHKHmTMmxlV5?=
 =?us-ascii?Q?F2q/AdVnmavBNUEXfmOwSd8ATbqZLGgIum01eFB9CB0bI/FfIEDgv7sI+v3i?=
 =?us-ascii?Q?TZbd9SNDP2ny79cdXa5IIp3pIBDXWWrqfeaN2/DhsrYMa4kqt6h98reEbXdz?=
 =?us-ascii?Q?/OW+zwbfg3Mz/5EhFzBJ6l++krZCk9B6h+7Tx9lYY1DRXMVrbV6LOeEy+BSb?=
 =?us-ascii?Q?Z50YTSlp+j0w3yww7iXvKvOg7TulJYjlL17pFdgJz5E0hprex9INaj1dY96Y?=
 =?us-ascii?Q?MaoUr2ew/oxxESM7BsySOA7i87VFtgFgJCHy2v1Vrv0pmUKiRlCr42rhsQy4?=
 =?us-ascii?Q?vCv4W4mfFpj/OhJke0lzGVVMflNgKz8sGiYxmI00BgZUfJNntZN+6byIHurU?=
 =?us-ascii?Q?NQQ12U8stIkE+2ql32GjkKuLOtZs3/diY5uXSEi1v+zNP3GG3uz/drXIlkkq?=
 =?us-ascii?Q?2v06hKv1KbR4JIiAYqA9fLkCqTy9BNAeTel7UzzVPF8jQ+NA2proWEc7O3wV?=
 =?us-ascii?Q?7RQGWDIk8DoJe8jacfwT7TNeLuhJs6W/phoBcmJlTh2Re0ctFjXnEFp2awWn?=
 =?us-ascii?Q?fS2U7rI2JN/lJ2Tn87w9ap8WjRg+Gcivfcq6DfuXzWUUYITXpJfy4NLQH9MI?=
 =?us-ascii?Q?CxGv93bChs7D1QeuTUaCiYkaifGXkZTGw6tJcCu4khqVgao+AKXEilI7xzOC?=
 =?us-ascii?Q?Cj3ez25w5n5gogo1i1dL+azrQkG8ZxwcNa9vkdPZsBlnysfVduF8MineieNn?=
 =?us-ascii?Q?nFi4FiYbzVXHKXmP2/s4yEqWaT7RX1GKmG/iAL5uzqrWZbvcRyVnQhDEQkb9?=
 =?us-ascii?Q?bPdKWjBF+McXBfQ0mnPlYh6gO0IZ4PZK/EKUHDxMhroJXxj4txzrcDDqkbBB?=
 =?us-ascii?Q?95JqhvDxQL7wz7BEzBo67SLx9EkovB4BP1C0Px7I?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8214e9f3-fc22-4c00-b12a-08dcc181dff7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 01:37:53.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgU8/JO9ZPmtZCpuS5c9XV4vRF66Y7mDI3OGCCPVZkH/XiTSgA1/i2/W6j+bcGUwZg1g6ASJsS/xnr/5I/LoUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7035

lp55xx lp55xx_is_extclk_used get, enable clk and
deinit_device disable and unprepare it.

This can use a simplifies helper to cover. And no need to save clk
pointer, this can save a little memory.

Signed-off-by: Huan Yang <link@vivo.com>
Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1 -> v2: remove clk pointer from lp55xx_chip

 drivers/leds/leds-lp55xx-common.c | 15 ++-------------
 drivers/leds/leds-lp55xx-common.h |  1 -
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 29e7142dca72..1bbe170a217b 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -965,24 +965,16 @@ EXPORT_SYMBOL_GPL(lp55xx_update_bits);
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
 
-	chip->clk = clk;
 	return true;
 
 use_internal_clk:
@@ -995,9 +987,6 @@ static void lp55xx_deinit_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
 
-	if (chip->clk)
-		clk_disable_unprepare(chip->clk);
-
 	if (pdata->enable_gpiod)
 		gpiod_set_value(pdata->enable_gpiod, 0);
 }
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 1bb7c559662c..8fd64ec40919 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -193,7 +193,6 @@ struct lp55xx_engine {
  */
 struct lp55xx_chip {
 	struct i2c_client *cl;
-	struct clk *clk;
 	struct lp55xx_platform_data *pdata;
 	struct mutex lock;	/* lock for user-space interface */
 	int num_leds;
-- 
2.45.2


