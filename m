Return-Path: <linux-leds+bounces-2502-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249895AAC9
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 04:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4EE9283858
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 02:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CEDD53C;
	Thu, 22 Aug 2024 02:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="JrLK1L6t"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2085.outbound.protection.outlook.com [40.107.255.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0F848C;
	Thu, 22 Aug 2024 02:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724292238; cv=fail; b=qdDzPUEY0zNBx2V3FWpe3vqeZWGC3BHZ3uTcasTBGUL+eiCsP43HWKkxkZWLQJ5G3u2l78IMXhZtBDzoPVENZqe3oRSOMFuocJNBl5NG3eSQ9XK91zmdq1wrBV9vqpIi9rOBq7JzaUedWXCbX4+9wBQALHLQmoTvGwHnawr6QkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724292238; c=relaxed/simple;
	bh=IqIsAwZFSTr4EfZaOcg0cnrOryCV99C68eun7+AG6Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Sh/9Kn4qLVk86BCdYmCinQyJ3XAnkLqTy4HmjM1FVU3upt4HamkwCDqFZgOiFswAt8aqJQLNdNDQMK9sc+fFIS+VnPyOcMdTPhQnmViD3xkgtfTbmKOoxjBVgL3EaTnJMsrdeZzg6+hxTpc5ZXhmyzT9oAuYoNevumugl4TuR9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=JrLK1L6t; arc=fail smtp.client-ip=40.107.255.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neMTov5f6ZjJ3fJH0+S7c4CLfUawyvprueHxwxzonD8LRx/6Ffgc6LBn3g+G4GUYOtSnt/3+RJfjnyXsf+uWZIYSSrkDlmDjUM/tLzx2JA9xiA90pReZHXXlH7Cl+jBH2vmiEwUrXnDIADYbePg0/8IplguuL84NPP79RykNr/xNDne5gJHm+QX0afQMqAmeanOpwHsIjbcIanpKuRwuqVjTEQPHiJvXxy9EUFPzz+jlHVNj0PZoMP15aaf0WlZJG6Gq2aEw1yxsR0KWAeREV0QZ4ztDPVRn1OvbehocD3HoxKiVLeGzJqs2XibWpEogvlA/QHrYQ4k2gSV4O52akA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkZ5WSeLdmXgyiBMEch19wpYdBot8KNgdvqL+PeQJdM=;
 b=WrPM/3TF8cCUJpapepCM/2i4eqA+1j9O7/LIUgyWy9GisQRRqqNkyKIzs08oqv+mHB5WfkrfyxVhi0xE4BjRw5XxSEAkRXXby4N1VbXUshuf5qHdsR/Gbza8tPSkVaKJCKVW2uZcwOn+6pyRvvqhWvEcQXOUEbabMlA/+VOuLzkTouHNkGYHPQpuLlfbpqdP+HxrCh4xH4zmHGhhJoXdRPPY6uds4AFl+Svz0ZzxXUfNfAa1wJ6c9rHnR8jg2PLgChfXv5J4iDEsFfW3RgZPNUz8slh13s+9WTVn9UpKDbH3jrgOSyxafXGKcP6/O9QUBfkThITyt0nkX1K7YATh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkZ5WSeLdmXgyiBMEch19wpYdBot8KNgdvqL+PeQJdM=;
 b=JrLK1L6tCYjykraFwRcqy5771HZKaSKEgX63eThnkoFDmk2M213djo+rQAGPNrguelveccGyLsAUkSUPN2QJyQAqIGGohODPxDaHuiLJV22A37L5tJUzs9K6ERIodfWOB7oSO8+3/5wqj80nOe7Jq48WocpknImSLF2RkoFhzvTY1uddFemlG9C1lBuBrtCVH8Jz/dnnmpO2RWjkqtnjdzR0/Y4HkRGzpHVsKiiUlFnMGwCGHmlw8CVgpn7/ZlfW3qK2DaR+Z3LEPNUhFfDWQ7YRg0a7pIeC0SLY5vbsjhYx3wXcRiZDBmUbtcHEY/nlcZAIO/Yargfirt3TBDPr4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR0601MB5654.apcprd06.prod.outlook.com (2603:1096:820:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 02:03:50 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 02:03:49 +0000
From: Huan Yang <link@vivo.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v3] leds: lp55xx: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 10:03:39 +0800
Message-ID: <20240822020339.474715-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR0601MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d04e65-bf49-458a-eaa8-08dcc24eaa1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VHWN/K4NhE7uk3xvGo0nEuDMJm0P+6cHZ7fqDE3JeJDnzfSra3W59Su0kvG3?=
 =?us-ascii?Q?3r3QbVb3NPfhUrx5d8Jgv7aOi/+hFt8hePhKXVdEk8tMMK4UI4pkL0hdyQsr?=
 =?us-ascii?Q?ilzCpKsmqVqqh+D9kqJGa04fsdnMTlvqvupg7LgKybMy64CfLg1Dlf7izcOn?=
 =?us-ascii?Q?qm6rTikBomkYlxpaTBu4WfaVDFkJlnYbIztkchKQj7ifaX2oRn0lwPyYHNiv?=
 =?us-ascii?Q?nuPvX9ECyyTE/L34NEeIT256ezyOZc0oHp0rZV2T7oBa4bFiMfy4mtTrmu3Q?=
 =?us-ascii?Q?BjCUud5GguziGz/GBwJIDV0114UUX5UFsD3OiM/DkQ8NKEjW05gPPzbbVqKB?=
 =?us-ascii?Q?HLcIUJdf9WIlo+xuSY1Lk5t/0nu1PFWhG3D3qpsIn+8XTTzPdL8XsOiVxzto?=
 =?us-ascii?Q?ofi1Ahxko+gqnFOyhn3ZnJXA2qRHG2n3ZrHlp6Q7Mtugh4JtUckm9zdPqHur?=
 =?us-ascii?Q?4gaW4z1HOWnUOQdi8OIlIMSXjk9t24kcg58qtQW/NIdAcX7tkIoQ/7bwHD81?=
 =?us-ascii?Q?4xelwesod+GDjy9ndW1z2uM5EF6b6Kyj29cUMji31VugQDQWiK2atiLuIlcn?=
 =?us-ascii?Q?e40yx/qjLtlxZcvERWrbB3NPStxh8sDYsCeGwJBJN5+kQPNSj0EiEQGJoVuV?=
 =?us-ascii?Q?1q+9oRplUOrb8V8H1nC7yd+LQNRb9FY5QXqJwSBzO45zuTnm3iOp8IfZXr+8?=
 =?us-ascii?Q?wq4B2zAFsYuHdfh/Lkiewo9BVVsdd6+P+puPi0nuToKB1tB2bP3pqv6JaXoT?=
 =?us-ascii?Q?Sasdq0wPlZhKn/1wdahhrCcwgDvx//kI3SjaDYwh9tMv9UE2y3Lt/y2e3Td/?=
 =?us-ascii?Q?c9MA57XD3fNSxSDVhaM7W0gg29maPek5M2sh/YMK/jaT6rUcDXgj+x/vGfPr?=
 =?us-ascii?Q?qW2Ye81DERMLDkk0CLt94uExnKdWRLQXt+pa7UhBEje/6EKz2tv/0Fj59EOD?=
 =?us-ascii?Q?e4eZqrVZFK4uhfNlEyvTCUMTAZDlE2VojXKBOFFHFRo7Ma9VJWEFv62rHs1T?=
 =?us-ascii?Q?7qACpE0zENk7VtEMeypt7EMoZ+teh8wSz5Jf3AH3nbQfMONeY5FMZkkVfEGv?=
 =?us-ascii?Q?p6AHy1RuXEkZ1NJjgfSZEvXEfKe5HEWCJlRB923kgZJZ+++PoCh2lMZmdaF1?=
 =?us-ascii?Q?8KyN3QBzGW62G0cct5yjHrsnibmkBStrfrCmOJdO88719soYuvjeKQtPiJB9?=
 =?us-ascii?Q?JFVSEs+bxwhkud9a8f14DBhCXe5wIvp4/t0aggkNfr+tIIi4SCqEmm2c4MmE?=
 =?us-ascii?Q?9NjskStDVwC1mDqCYuWKFgUcozStGa1Gj+tkwF2dKQBp9MZh01lOrixG4FTF?=
 =?us-ascii?Q?ZyWyd4Z28fx+1DcGEwzd27imGfl1I7tpGfkCPGjCUpvaY+SbgorWJlgjSmtD?=
 =?us-ascii?Q?8zg58dpI1+zdFGpvKgS+GIYu61jHpNNipx6lQgvyBcdtCRgQ5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bLcEcBaF3MwgsDfvaUYRG8cyewlldgg0uAjTiPQ5tADmunAVWdfXX089Xqlf?=
 =?us-ascii?Q?5ZZjvBYZmuo8CheXG+BzT0kr4VlmLyN+0904M5mMw9n/IWddzzuXbKsk5AsN?=
 =?us-ascii?Q?vaUae2jh5JsXB5k21sv4fzLBvGSQn1SyBAOfvLKWg2KyBi/BkykEIiNH/PMm?=
 =?us-ascii?Q?e+1lf9nIg+d6ohlItql9cQYpEDkeMSG63sI1/mhdjzKh4Xnkqd/PIYupQiB4?=
 =?us-ascii?Q?ma1qhVjzKuzsauSS3Q4M6WAhJz0GD24VS9/QTqH3vRYDTBXSjDd/Q04Om4SR?=
 =?us-ascii?Q?+3GxGyl+dnG8Ed2gHx2HB4COuE8DjoJ2Wo0NVWzlBxrn+cDL2YMIdMVEgGL5?=
 =?us-ascii?Q?8ggFXjbNaQQou0eiSULWVmVX8wCpij+Lwa4L5mpYOIGL17d4NCztAfcieRup?=
 =?us-ascii?Q?Pg7lvyisSv5r7GJBQK2XdcOtm1tjuDlu7KBhXwtH+UrPoZWBHIub91mTJxrq?=
 =?us-ascii?Q?Mr/RfE1lw8pqeW4lfnIyklkL7QHWar8D2wD+tjF1VEPwP1PXfKvTFcrKHd0U?=
 =?us-ascii?Q?sOOlQhLJiXR56jzVN5Keg4+SfMpJEDdM6ryNg2rztkz2wR11SZRmrFVn5iSq?=
 =?us-ascii?Q?jq3XqQtvnexVOtNLe+LNnL4tht+cJRWm0qr6kZ3rDPiMNDbHQ0LIN3g0vmuo?=
 =?us-ascii?Q?ZYZqXDIXahD9+lpEX9YfGtoLkaCqZa4doHp68YlLSvRTr+zxkgXR7dbcO/dd?=
 =?us-ascii?Q?VvCrw+D3JBJ02Bc+iJafUOa+Cmoz31jwsXsDsKsNiyrLs+mJZYy577Mm4Edo?=
 =?us-ascii?Q?GvhS1o0mZvm+U5nCXq2p1ZKzHuCR+WhpZzPVF6nLuBtQSa80zvuBONOLFTyt?=
 =?us-ascii?Q?22l+WEP/yTchiwfGs3f48SJksBanK1LAWyIxrX5AuDvH+yjqLFyqtvmxB9fe?=
 =?us-ascii?Q?iAKi+wSl6La22sKo51dVGOF+CUJEYZbcFN8MLyTl12os/9HfWOAPCsZe7h1K?=
 =?us-ascii?Q?xYR0xUPqBHqmnWQAPVOJ5zBLJFVmgGSe0SVJA1CRamimA5g62N9HhADrlgYX?=
 =?us-ascii?Q?DqSUPUEULOq6r4LnjYU9yjkZlsfLBqh02R3rYwCHHTJ1WsB11a2OLgISTkIa?=
 =?us-ascii?Q?D6F2B/Kgxkv+sa7lzZ1sgmQ2FPRrypWt1eZCae4nlQHrCSz7pIkOgVqVS0f0?=
 =?us-ascii?Q?kn20TNKSilQ6dyaFvnsvLzN8OEfD3VpEzzQyzjnGHOTstThoa8fEIBEqCCWN?=
 =?us-ascii?Q?WR7T4Bg3paP7dyYQ7OmCp+AR8ITK/1W0VmP2Bw0i7bRCY306+RNXypiVba7u?=
 =?us-ascii?Q?/QKq/e/vPP7QSLYCGqFC55ZaRXw7e/uR24o/uj/je4Nb1IYXqLzJ9KbOgnNX?=
 =?us-ascii?Q?J2yUVwo6PPAT1rFCRtA4hWikrnNgxdzrSJt51W04rWQPTSwVG0cxbAf7P+cz?=
 =?us-ascii?Q?e/9RWxT9vrrM0EyCP89MYdZxESamqeDNgi2oV/S0owXc5uPoKHeA5UVSDzei?=
 =?us-ascii?Q?6VkGLN1+q1hYWs0VQEiUyNMmFs0nw9Lx7AGkulVYlMwSxDoG5QEIDgyb4wax?=
 =?us-ascii?Q?CPK0om8RaEFzh8tIWNLM661rViStXpcvPpSkI0bR2Ok5NIJwdiMAJOI42j2E?=
 =?us-ascii?Q?Wj/KP1kPZaRVBBcZZPjLOY/Vx0cx5+dXWwoht8uG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d04e65-bf49-458a-eaa8-08dcc24eaa1f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:03:49.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHV4RwZTq4l0701B3AB6rVaQrd1ZR1Fn2sVwx2dhLaE2Ujy5gXkTyVpaN/vFy8FEPFxPK1un8HQC86YFCeaQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5654

lp55xx lp55xx_is_extclk_used get, enable clk and
deinit_device disable and unprepare it.

This can use a simplifies helper to cover. And no need to save clk
pointer, this can save a little memory.

Signed-off-by: Huan Yang <link@vivo.com>
---
v2 -> v3: remove unneccessary suggested tag.
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


