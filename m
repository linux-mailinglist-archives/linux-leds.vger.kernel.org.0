Return-Path: <linux-leds+bounces-3814-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55702A15A03
	for <lists+linux-leds@lfdr.de>; Sat, 18 Jan 2025 00:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A601B18830C7
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 23:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E27C1DED6A;
	Fri, 17 Jan 2025 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="m6l9xBm5"
X-Original-To: linux-leds@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01olkn2048.outbound.protection.outlook.com [40.92.112.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5C1DE8B7;
	Fri, 17 Jan 2025 23:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.112.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157244; cv=fail; b=DKhxIeH1s+HUGrgjlm25Nj+mB9Gkd955NvSyIfijHye0dL8BFMdfEkx+XoBRfl6irSIpLJ15Juhy//ZrGQQF5GbgM9r4oZVvOCHWMhr9gkS4QwgMEx35TXXpQZAZG0DDdydSeg3RnwKvWxDn+9RrYe8JOaC6DNBI4nxaQzCFdjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157244; c=relaxed/simple;
	bh=hRVn4644dpgs01/+pFm+Kug1oolgFC1dj4b8PExnEKs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hI4bb8+rz/WbCfKIKA0cR6Uw1470T2rwbPK/gun3WDkcYZ76uAECEzCaMdoQcw0ML4D+tXkqxeXMFwiQUv4ehSmUzVUHgv4ShYRIx3K5vHbDEIsZVuI2ob/+tRE8TjplGbjx90aAxPVdkFxjMzT5HwvUp8is9nRe7X3feGAyG6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=m6l9xBm5; arc=fail smtp.client-ip=40.92.112.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcbiUI0CatpKI6bsF3Iiq2Sz6+XEKhCEPy8o1iKth2ciEbhFo2/8CJRZEN4Jvnezc4lkGp+RI92OcaLcRyWLYywTVwi1G6N3sNt08LfdYsnqQ/MC65tfFPgDNX2MrocZ1Go6wVDIeSk4JoOPGkZ1x44egjfSKKbTY7btL5Sm6bAIChl/DRb02Wjo2mCb7V/XhlaVclV2BDje7eQEVoPZEhCE+0V2E4PmHMLnmuhT5388D/YwIe0ig5jqYSas85GFSw6lEj2Jh9VqzaFy0UevOoY8e3khlRVl+mVJAh5E+6jmK4jklWcy/ZbMPtRKO+YGpWJEyx4CkRxc3LAP56pyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZJBY+tRiyU5lRK4Q9axrQ85I7SfOhWcopMeYJcKGDo=;
 b=YmS061Ow3OEOShlbKW4tv05NgsDAm75xYccPwBPyhZeLgGdKP5fpNW2r/pyUQb3wZubo5AkGWzICdBJvcL/Ug42rkjL15Dd54kwOwwJUsb810xiZExpi3qoqLTpomfMP7jUkExRrgwPkgY5kuNyZB64uqwyqoh0JcXE3L6160Q6UNwQPr8s/IQPivlAhjzdjggdpOcisbOXM59oKpA+0KciClt9Fsbn8Qyat9IeYKuIq4gZyYAoGuXNeJvHjHtpOf7gVQlk6MG8PIa5r/KMieVvmnL/9DankeLihW5N4HSo2Vdcj58D+Edg2JZJLD0y7j+GjV2XeBAU2yvj4nz+qqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZJBY+tRiyU5lRK4Q9axrQ85I7SfOhWcopMeYJcKGDo=;
 b=m6l9xBm5YD5tzCqahdp2VfykyHAe+HnZBzWdS86Pv+Nj38c8v5PXyCxnQ38R4Hvqy5DakEyfv8pt8vDSP6VAlAeNGe0LS+FkJtv9jjmBL7JE2pE0kYTAkNzogYJOWS1FC8pvEUz1MamSp4N4hFA9aC7LmF0ABNE7pR52B/nPCv/xh0NcG0SWaUbueS7Rip1pe42H15USemQasrOBKdHT2/QhaVXcZCkFHKL6jS+eiNRGZMDTNxT3L/fHED/Hj4muwhzOW9l+mMdd83rVFBnSddL1l+7Sie1Q7VJ2cK6ukIo7bmcOlPonRcL/MCkuEpmUhWlWMuf240GGhavYjvCPlA==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB4166.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 23:40:35 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 23:40:35 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] leds: leds-st1202: fix NULL pointer access on race condition
Date: Fri, 17 Jan 2025 23:40:27 +0000
Message-ID:
 <CWLP123MB5473583199E0B466E907E2ABC51B2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117234034.670794-1-fombuena@outlook.com>
References: <20250117234034.670794-1-fombuena@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250117234034.670794-2-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aeb4c58-3ac2-48fe-190e-08dd3750570f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|461199028|7092599003|19110799003|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3w3+uQYrle/2JveI0Jj+3ylESe6jclehD8IXTKeFLO9B4Sn1qcDKKS2koLZM?=
 =?us-ascii?Q?49vhGACk9rE5yYYg0OJ4dC9anHlhYJUux3FvKUrR0GkDY7U6MEYv1dQcvphQ?=
 =?us-ascii?Q?kCD3zmD8fLsZbDjFl/RDYIbTQPTNPUd/A/pKFlEL0Hmytge5fpDAt8GlQ2H2?=
 =?us-ascii?Q?Qbt5mO/vUrGYgQQ3KIzRHPLtLefqWPpuSB1DRaTXEnXbhM6S3JgLDdWDo9Wm?=
 =?us-ascii?Q?Aqx2Pu/n+FpctWlg2j37TwTpZvA23QEKUUAqtzw7cHExk8dP4bhWlUObaBMC?=
 =?us-ascii?Q?x7o8TKCWAvu9xhsvXCmLe4gGG/FJneRxVM84RzMFG5rTz4smhfoawg9maaoA?=
 =?us-ascii?Q?Ez5Xm0J9mFz3SKLGkcSUDKNXODQMTMqKWVnQaWMP0cFBjKyBAVOjIJPIRcYL?=
 =?us-ascii?Q?XYs/Jio7Ut1zisgX2KLph9O8FENb8HHBDDPuJNm0UruFVM7O2AUYND9CWjki?=
 =?us-ascii?Q?u0d07Ogot0i0yqyz7EvFq6//cpx1pzjEF3d2aoCBcSeBXXBJeVVIDZoO3Q9f?=
 =?us-ascii?Q?l5+0nzKezloe5qnqTjvJF0wUl7weiS/VH/cHrNpHgno39wS5chcTOAyIqXoF?=
 =?us-ascii?Q?kmza+1SaleyQYf3rqb36gwFqfgzSyIzfAL+5xL/M0qrjoI0lpR6lcTbcMCtq?=
 =?us-ascii?Q?LLwZg54E7ccR6rCWaoFKA56WFtC/1Neh/9VdfhzNE1luaM6mxmbEsSJbQ+sO?=
 =?us-ascii?Q?ngweb8N+jz93g5Cz9ndV8UKtzRYaA7ByYEbf35aJz018wPUqB7LkZ6yknNzQ?=
 =?us-ascii?Q?GwT5JdStgQppEv/TwhGpMCzuaQKEZzm4tEfauxLOOA661IvThEaTG99pNL2d?=
 =?us-ascii?Q?TY02DEF9xg7xazbYxwVzDiOREwX+760nS21l7FM2YPYTz+goI0QoDpod1fCi?=
 =?us-ascii?Q?jVQsyaT6m4tcyCNNvN1CzFl5LobifOcxiZBKESMuqVxz92LJkoK39jSIWzDI?=
 =?us-ascii?Q?4Z6L+twUAbwlDd8lAlKOCBL3szUtjnpixWU9jA2MQ4kSvNZZz69B5qmD5L2D?=
 =?us-ascii?Q?FwDi/91QK2NdYnmJJ4wz5zh7KZ4tnunZKE+QPUMz1Hw7cMvkGNxN9XME941k?=
 =?us-ascii?Q?mw3jB/3BSSnXMncodiWlrPvvgpa9A542SU5fYmj0nNWbRKlpsz8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FfAGB24K3WJf6Nf5h6R8i0LzWDXirnTmBnTWVNCNdhj+ph0iE4M6TxGIGFsq?=
 =?us-ascii?Q?d/gHJuSStMdtuk6j0ERZxVFRWFqQ18irrm/ij2aFsRGAsiJc6yjbZJroICk6?=
 =?us-ascii?Q?xfsD1YnjceoN3TAztDx04G1UmdCdrewns8VEnaE3j12XPz1UDUzc5IA+gV+M?=
 =?us-ascii?Q?6YcolQNCvGrXnnUqrge4SQ3ScHyzmdbNVAP7WAX0Qq10cP2DS6v7N9mSUWRR?=
 =?us-ascii?Q?xvSCnrUtGZ8mK6TlhClpWWenOqY08UDAf9164ifQ4yLZGIQOKKyZG4oUHedc?=
 =?us-ascii?Q?YR8VV4iVeVhpdvK8Ra6qa1MW82n8+yQZfD0Ta4Ec2nLT05cFO9HUdzT9TV9h?=
 =?us-ascii?Q?BIzQ+HXYGjW7y+IwrL03iJznjWATWYBV6X24DPoExeTw8uCTiqcHOzzA82n0?=
 =?us-ascii?Q?dPWXQqsIbWjP2UIOg92vk962gwk/kNRmdPG6iB4IYHJEL3IZzhhzM9dTTQNv?=
 =?us-ascii?Q?EOtrxvkFgfNlr8houVleGD3gBVF6tkg7/WWZN1iyzoBt+ZTa7mS1xyYks5l/?=
 =?us-ascii?Q?CzbEVG5olFGdz97Bh0mBYa8GlrKwfEhgOynp6aEDfgi+qnw2eeuE1Yl+kzxE?=
 =?us-ascii?Q?oIy6ihJzBpRY17+Rjn8tWJ5KWykhPiKg8tOxN4qcXWNBtqRH2iTtd1QTrel1?=
 =?us-ascii?Q?9jYsFexIN6InuEXMQ3jRG+wlGFdkkQsauJXfjEAwawnSXyKRVknMgQFJAlPp?=
 =?us-ascii?Q?bLxojMf1rRdZ5Rg8JqEgyiBwuYdExw9imqAZyO9gBkkp9jF7Eyh8ZD1I+9+R?=
 =?us-ascii?Q?lxm59qVWoYt2g3k89Y+utNW3FZ9+rzDp1+tZipjWheLWzn4BHy6BTjdHKP2J?=
 =?us-ascii?Q?MokjfPcV8ls88Drm+trxU6OblZOO5N8fGM7UT07wl/w13SkM4PBGbwrY/Svi?=
 =?us-ascii?Q?/B46um/NLX7YFE0oO4j7F22u7HAW2GJk4bxyzIjdw0tsyuneA+5avJFtx4hX?=
 =?us-ascii?Q?/Jm85+Vj+PnNtcgJByjUGX1McJNM+9oylLC3/qSFajy4i8b07OX1BBKgudUa?=
 =?us-ascii?Q?8vS8a8v1ZWh4VGV6Q9232+utGl98O1297/p/hCSUDhn2oke8p59uPQp2jQdt?=
 =?us-ascii?Q?9EX9Kg3SOvL6WT8IeHSkK29SypEcDOUBdDSV8xpl07TSdWOrFZF/cW0cAFQw?=
 =?us-ascii?Q?FJQieGx/gQTZJmI0rscmDoLTKYWgRZ0WNhHmlcjztUCs7aiFmTpuBwqBppbs?=
 =?us-ascii?Q?+6M6mwHFgTRLclRYMW2YnuKrjFZLiSQ2AWBr2t/SI9G23CMnj8+57Ccxbpib?=
 =?us-ascii?Q?gCUUC1s5RPGvW8ZRsQ2fwpohigfI4pIhlgFaotzWEEwymlNZ7lOJApJtM6Nr?=
 =?us-ascii?Q?f9g=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aeb4c58-3ac2-48fe-190e-08dd3750570f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 23:40:35.7113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4166

st1202_dt_init() calls devm_led_classdev_register_ext() before the
internal data structures are properly setup, so the leds become visible
to user space while being partially initialized, leading to a window
where trying to access them causes a NULL pointer access.

This change moves devm_led_classdev_register_ext() to the last thing to
happen during initialization to eliminate it.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b691c4886993..e894b3f9a0f4 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -261,8 +261,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
 	int err, reg;
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
-		struct led_init_data init_data = {};
-
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err)
 			return dev_err_probe(dev, err, "Invalid register\n");
@@ -276,15 +274,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
-
-		init_data.fwnode = led->fwnode;
-		init_data.devicename = "st1202";
-		init_data.default_label = ":";
-
-		err = devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
-		if (err < 0)
-			return dev_err_probe(dev, err, "Failed to register LED class device\n");
-
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
@@ -368,6 +357,7 @@ static int st1202_probe(struct i2c_client *client)
 		return ret;
 
 	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
+		struct led_init_data init_data = {};
 		led = &chip->leds[i];
 		led->chip = chip;
 		led->led_num = i;
@@ -384,6 +374,15 @@ static int st1202_probe(struct i2c_client *client)
 		if (ret < 0)
 			return dev_err_probe(&client->dev, ret,
 					"Failed to clear LED pattern\n");
+
+		init_data.fwnode = led->fwnode;
+		init_data.devicename = "st1202";
+		init_data.default_label = ":";
+
+		ret = devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &init_data);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					"Failed to register LED class device\n");
 	}
 
 	return 0;
-- 
2.48.1


