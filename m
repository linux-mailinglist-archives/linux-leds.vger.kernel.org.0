Return-Path: <linux-leds+bounces-3812-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A57A159FF
	for <lists+linux-leds@lfdr.de>; Sat, 18 Jan 2025 00:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC90F7A2FD4
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 23:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD0D1DE4FF;
	Fri, 17 Jan 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HJyf2aKA"
X-Original-To: linux-leds@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01olkn2023.outbound.protection.outlook.com [40.92.112.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3C1DDC0F;
	Fri, 17 Jan 2025 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.112.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157241; cv=fail; b=r43AhhurPkiG8+1WT+gXhDi0GAy/84OL1JQT4vAzsVy8ssVTNerBRq2BF/c24HcJEXiFdpd0j4ALnaJYFASuBh/8eCMdyjx3aOOOg9nWB5vJ33E0c1NI2xtPvLFGfyFq4I9CnlydUKByKa6b208o6XmszK/+Ah2VQxxD8oTLC7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157241; c=relaxed/simple;
	bh=WiG2bX6V1A0y46pxpoCSREfSI8ZkVt1LrWNMcECe918=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G/WyVC5oFWq16ttEleDw2yM/ajFLivTfxmpcdJqYoXEVkSN6s2g7MjRhsesJBnteN1XvejnI/7pc4YJjVwIfZ7ZmksAW5NyYXbJ9+6Jf8G/t6LGqC+aDQUHUJabo7nt7fozNpKDVjJrxZsfZenMxd+92bgiqKi0GZWLvJ10V13k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HJyf2aKA; arc=fail smtp.client-ip=40.92.112.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIWBLo6dOop/ojLahJuCsCbvteSyR+xohrglGZ7ZEpal+0GXza7DANoZ5PtQ2wu475bl0RUOuSObeW72JNoWOd8is9vOsa6k+98Yr+kC4s757bCXDhDaWtmRFgkOVmk0iYEfqhsk+VaLnX0i1RYIiO5gv9vdSO7WeB4v0PUmU1t1vkxsLjUqfsdTIANHfEVHX5PKSLxNBjJ1GbwhfZkg4cxqkJw5QDWCmpgm8glPgXQFAanoo8wg3awORy36xgPOGskO8sK05eMDAGzndIGHJQx1bzYF+et/Wrf2yGCKQDD/yePMfVPV+N2OnJev7PeOStrbOGCQFmBn0Y3qlHLK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AzLQwmGaXuUyhKvYIvXIoJlxmpHxgvilNBqAEC+Ix8=;
 b=FxHeUk2HO7DzNMDa8z+rH9ikBppDnY3LWLJ80F9n/gXQ8WHyZGZUGIkk36l09nsudOGTy28vhuGA7p7IHE+O57Tqx1tQXaUwuRq8Ls0MzelZ3ezMm2pZw7p08MujJOJwcBaRmWIGkGTNpuuirXQuosiuvX+AZaWDNltLhxlOeBxqSU4IxpxpbM50ewJ09EXiH6dvmjpjU04hb5SGhTjAhBVGPVbfsodfzgDY1zcC+ZD/+vRbBbpR+Hc/qczKMVc0RpTuPx8Kocmdu+Ar5hKOpadWzS6m6o4qmNDlNdvVQV+l72wshyoaU9I0/0wwqSiRZX9Nbsh3MM08elnSEkm91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AzLQwmGaXuUyhKvYIvXIoJlxmpHxgvilNBqAEC+Ix8=;
 b=HJyf2aKAQpA/tK+Kv6jM4KBmADdB3MuX839BR2RKjCtRCKh7JMRQdIm+NFW/WqDA3OK23feVlODB5FVkA8oFUuV2xHvvPgvC6JYW0c4VMwhuDi00b67XT0xBOIn59L/SF+0uf5dBwDtAaSAEIHNctfGIOF3l+jX28TQeLeYkVpbztjFVcG2/9qGMcSYbTsH43RDBBgXidloecF1oOqlpF0O87tUbaJnc+fwoI1fFwA+nJg8HIs05Vy+6/E27Byp3TBlErYFkv6r09uwFmC8nT0ct4RB53SACVdnWMEdU/hDMDSWbjLP4eibE3IMPV6Wxyr7gV5XXiKIoTC+aL94/Bw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB4166.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 23:40:36 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 23:40:36 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] leds: leds-st1202: initialize hardware before DT node child operations
Date: Fri, 17 Jan 2025 23:40:28 +0000
Message-ID:
 <CWLP123MB54732B78DDB3CC67F2544A7AC51B2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117234034.670794-1-fombuena@outlook.com>
References: <20250117234034.670794-1-fombuena@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250117234034.670794-3-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0da065-8a19-48aa-9756-08dd3750575b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|461199028|7092599003|19110799003|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rxFKtT9T6rqjXSgjFdRCgN58ns+H4yI8moh+1jQ1nYHinyeMkgngY6HDDEP/?=
 =?us-ascii?Q?wVwprTzv4HA8HcsTkAZ0/lG3HK1pdSWrMDyPLUNuyayQWS3wJINAhJ46JQ4e?=
 =?us-ascii?Q?MRvJ/Vdcyq9r1hOJ7ciw6Kt+kKY21KdnIUh1MsTLv0002ZaGGy97EENMAjQy?=
 =?us-ascii?Q?S/cThPqimpF81M8RR6kfK8sia7fEqVRovX7TPl0OI+lQniB+kFWHFbc9eGnJ?=
 =?us-ascii?Q?HxLNWbI6ktDAb1KOUIsaVY4DsJxcwftpU8lLnVwLl3fVmXmhlTHnic3QUcgs?=
 =?us-ascii?Q?hv0xakJokIosPWtTNFES6WfTixtchm27a0PQylynK5KoJKjSQ5kE/JUJ2m2e?=
 =?us-ascii?Q?9rA5oRnjqebMgsfdNiGHAUeOI1Qhk8TgVzdszvU23boyj2JgOs6TiLQvZt7M?=
 =?us-ascii?Q?Qiq7ER1i/TEkDYr8vjIsrXuLezoMvfvJIk6fU755qmurVFL0NOwSO9Ae6yN7?=
 =?us-ascii?Q?jZn98Ba0aNoaR0sZGOYu46PuEGuWfsuKLpgw8fGoAJB7xwrzkqWwcI2biZ0g?=
 =?us-ascii?Q?zp2ok5ugJ1fMTM35iL5Q55L6derhWNCj6Gsv8S2+mPee9i+wasm616xq7e8z?=
 =?us-ascii?Q?LCQi8sljDq5ljor5LFEYjt1Qt6UOXdr1MWGYTlMcmM3r9KbIxGZHB3uWLjZ4?=
 =?us-ascii?Q?r20U6ZTWyl0zghxlEMKB5l+eUAwN95hOiCbuJf0vu+rg/qHUQPudPH3ng/N7?=
 =?us-ascii?Q?HeVDEcSp85xy/xptftiraDlVkB/KEz8atvrH2gfGrAq4M4KWHMNhv2qdpd6F?=
 =?us-ascii?Q?J8YHHhJW50YYdwrNpB0a4svBRCj3s2llYlFid/Qd0b8Pc3Y5VC8CVkeqfciJ?=
 =?us-ascii?Q?68k6ZZPyLXsUfjRARluZrMO1dK4IzOnQwXpOquHeviHgQs/y7pUjfJgxAoIu?=
 =?us-ascii?Q?OCVK+6hNAsmbgBOrTWGvwHSubmlRUl0PMZEdeFMn/I95YwejocuT/ancEr7+?=
 =?us-ascii?Q?NKiX02Wogtfpfo18VBUXiVWTGwlP6yeAjF0vC2mXZIarvFnxf1NTi1eC+1j4?=
 =?us-ascii?Q?fZSNmk06MbhzTJPW8hS+38snApnhwz6rX7HA33g82z+GwoQg/Oas7oxpJdHK?=
 =?us-ascii?Q?8hcp0mlkgNaxEMcerC/ZhJb65DAk7oFBOpjXTJrsPk/kPEKWC+w=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Plu6dk84rbKaPxDKPM3A4MmO9jG3+K3HJqVH10a0vVC3WiBlEkyDKwhNxDW?=
 =?us-ascii?Q?uP4of55oAPOqy6ngDn1AGVTjN2QDaJcvX5bN237BmiBGdwf7wa97MwYAyWxJ?=
 =?us-ascii?Q?QMwm69uXWXbeM+ABTYbIDBPzFGaSoVYTf2leUskA7JDxwrQwRPSyGch4O3zf?=
 =?us-ascii?Q?kGbzMTCRxBGKceb+da6vpSpKnc9WMdxanalK5osBOl8rFMcbA5+fdwNi/nnS?=
 =?us-ascii?Q?tY817wsz1mA0NIOeXl1poUuaeBhO1rd74bAw1zt8YtiU5nukBvFqMwI+o6qm?=
 =?us-ascii?Q?aK9PPmPP/a6VZTtjXrwhQ8s6UqjvpIy/AQJhYIQw0Pbw0yLIJf2Qwvcq33iE?=
 =?us-ascii?Q?7FXUepWp5tM3sn3FVNMvwYdisoFE/HG3AhtD4fI/kX+8nDvBuugsFCMRhX97?=
 =?us-ascii?Q?K49Mg9A7al+UXVwwbaV/RYon9w640uVduhdBkl4ya4KBkMJmV48DSxOSHXZ9?=
 =?us-ascii?Q?bjnQri8egKvKf12retdJOl1OZYePN+iV/9wgnCYG0m+sft/r5hLesxco8gtc?=
 =?us-ascii?Q?VPDuOmmW8DGs90JUtj+HvyIebXlDh0uTeTEu1VMgrKNY6uSEDOHvEtuG8xsY?=
 =?us-ascii?Q?Bsz4RKEZB/NionZflTagiAcFk6m3+39vzrfKYof1MxuTvYY2096KjJ20cXO9?=
 =?us-ascii?Q?/eFQOq2i3xkuZmf+oFsHbUD/DkpAz2JmvlMxw+xyNxGBM6YsGiA6bUab5qv0?=
 =?us-ascii?Q?Xm8bQ51f0mjxWM5slqEcqMufmU8Nt+cunHT9fpsgZcQSIF4ow/n8fd/VLCJo?=
 =?us-ascii?Q?rFbKRqh+vU3/QJgYsDBeWaNh+9B9l8BF4mAmcLVXsvUS7hylM//yihT5MIkL?=
 =?us-ascii?Q?AJ2RS9Bhs+2blCLaer17IM3U0PV2vxKLeuRAiZr9ZP1GUnP5lnFecIno56al?=
 =?us-ascii?Q?pXo2aG5EKWipR1OtpX/Ln908qIjNRVBirsljATW20dM+2Zp/B2ayUq7T5riG?=
 =?us-ascii?Q?gesNd3hb6lXmrj4V7YX8rz5wXI5qMXeVtpSpjQ6iWD60cq7Up8AfxECg9y3B?=
 =?us-ascii?Q?LNV40PF1scCwNsvo6/xd0wfpByM7tI/FMHUJhJx9yX2hKP0xoQkRNR0GvTIJ?=
 =?us-ascii?Q?6h1+pTap7/969tO4Tiwa7y/gZWgiM7qwpJvDedK0qkERvQFNYPg2EiNXu2mt?=
 =?us-ascii?Q?9C8P/ohkr1v9sjt7y3/XQHCfHpkIJOazhLsUJa982Lt2Za1CJPaCfJJBK4Za?=
 =?us-ascii?Q?QsrbDOjAdQLrxu/6lQVl51fv9HuWddf4Fu6GMnxL0wNM6TJRt8TR/mJot/8z?=
 =?us-ascii?Q?2UbyopGZqwyqlaie9OcEGQqrvslRMKLI4ViOEb8S3nCE/5qoUu8oWQZFHgc5?=
 =?us-ascii?Q?DSE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0da065-8a19-48aa-9756-08dd3750575b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 23:40:36.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4166

Arguably, there are more chances of errors occurring during the
initialization of the hardware, so this should complete successfully
before the DT node childreen are initialized.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index e894b3f9a0f4..927874f20839 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -348,11 +348,11 @@ static int st1202_probe(struct i2c_client *client)
 	devm_mutex_init(&client->dev, &chip->lock);
 	chip->client = client;
 
-	ret = st1202_dt_init(chip);
+	ret = st1202_setup(chip);
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_setup(chip);
+	ret = st1202_dt_init(chip);
 	if (ret < 0)
 		return ret;
 
-- 
2.48.1


