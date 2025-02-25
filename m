Return-Path: <linux-leds+bounces-4080-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66343A44F73
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 23:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04A518980C0
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 22:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF92212F94;
	Tue, 25 Feb 2025 22:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pB4SOnOx"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazolkn19011036.outbound.protection.outlook.com [52.103.38.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A16213236;
	Tue, 25 Feb 2025 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520882; cv=fail; b=odliM+geGjZhWijSv8qLT7jn57vV0J6Pt/BpsvBSYcRan0YwFdJ9EHxyd9fJHs7ocBHOEK5jaLlA4PqG46Cn+nhuMWuCqUzUcmPLcIuoJ4zgtyaaoOMK4NnS2XguLwiCl1UR8JZZFldc9tzDm+4PA6zftnm99HSQ3FSlVQqRBIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520882; c=relaxed/simple;
	bh=kr2NHX9o1C7nQwSoORh+te0bhmu1Wty/zZFNt0Phg7g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=btkDVse4lIom162BQYoH8833CP/ph4xMbNzkALZlricwqSq2DFOSvZBVGa9PPheh6WDXzAuJvK032eskD6rZFjleImMjLF4bx9ENqxH+PMCgA739kCl+DANSXM5ZYx5VW+923MDEEbQ0o0BHvJFEVcFfD/wPJunbFQaSohbXw9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pB4SOnOx; arc=fail smtp.client-ip=52.103.38.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMkqG9NQoU5QUyttPr0lp2IRhwoAATp48EdsV9ZRRWLCZIJaw2g+cBiSzZrxcImbduVNGqnBUNps4a4Yrh/wdp+pz9Jh+M0sIPfEP/8sGGG9uaaP2/CeJtjuJHrRZNpGLhv3AK/Kbz/QwFaW48ASItLPa6jrdUeO88HRuon3F3LEIJmPjJim3z1xXehfJeLAEa719IamW8/fIryfk5x443VDNNQbxT3H+epXEvHoKieyTqR9y9qvH0cAuqCGsq/s7ClvOEtL/x5uPK3hOyj7Y8DG5yf7RSyFktL/MXAEESpNZTpS6ddo7rAFtl73ejx282uS8tKXv54gIYCJqRZ/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qVtR9i+ovpPwlA6WooSZ3XHnOw81g43ueWtmISCFJE=;
 b=XNY/97CMgw9uuOtMRGaYLTg3oTVC9577oUYCvUqs67zur+Gss8Bjx/CGgC/mGSWNWiCrbSPpL36vzSLdQjMWmdJMP/DW2UeIn//WDyKtIm7y7xfW6QQF3yYfLTwpQV0BLxWE2N88iNyfUauEDmlRZaDEKZaNxCRfmGIdQttEML4hRh9YVNnsFDhU6prFtSSLhKLZx5oUk+CcMOc1HtpXO56DIb4vWjA5K0z0mhwXjkKDGxw2PyHa7ifnVKPOP2TSmL9CYShXoZtoVsBOw+AJwfRSsIjuKnhFwHSVuDMSLZDbNJqFmSoZLiX+1p4aGMLpETpmuv7gNgZQCdzjZGoWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qVtR9i+ovpPwlA6WooSZ3XHnOw81g43ueWtmISCFJE=;
 b=pB4SOnOxbo3lQ9Ywhh+MBmAMv93TWPFtO1CWmeRdg9WUIP+aGDLvT4MLkURnzHPrfYGEwZYwWzXhni9W4+yBYzoMTBjksQS86xyylXDoyMcSvl1gARG3Vm6QduCWZpPRwgKoM7b6J9ZLs5adXdHSXcIcyNX8WGZaw9OC0bOz5QBz9zPuj/FAtP3lm6VHWJzSyaDopgdoN9FkfDimBgVvrOiRnWVnkhnT8jpZCr89+MoExJbe3hnCDZmLVvHJG9hO99beiPLRdXydlf6DgJV1kGgR/qI7zfiyw8ylQLut9RwkjFIrhx06lmTbkKtHS/0dDSTCvHkAA+0IhlJ+RyzjNw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LOYP123MB3280.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 22:01:18 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 22:01:18 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] leds: leds-st1202: fix NULL pointer access on race condition
Date: Tue, 25 Feb 2025 22:01:02 +0000
Message-ID:
 <CWLP123MB54732771AC0CE5491B3C84DCC5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0242.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::7) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250225220102.1658528-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LOYP123MB3280:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2014b4-b5d0-43e7-d77d-08dd55e7edf9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kmghtHHYW2bqfcMlB4cJi/GTmpp/nlByNL+1bjiAOJ7AeSJWLjncfwGNpjkN?=
 =?us-ascii?Q?qXanJhW5H3+Ir3TgeEyrCr8UvzGCCsn3/6Z/HkdneF6PTpVCVKRs6WkIEmtu?=
 =?us-ascii?Q?uzr/rYwu6xcatQ7e3w4TehG1xcT7pDLYCDeSNutEBuboSM6BGjtCUh17aBGF?=
 =?us-ascii?Q?B/SpaVRzusLtImn0jgbaL3mMstbf68IK9tehYT5ZanNyFHK6Y5b9xHTnGClN?=
 =?us-ascii?Q?+AD+C5FKhCPOdvuqHcbWAHQoSsTI4MPdhvRJ9M89oTYqnTGs90/34FIHv+iW?=
 =?us-ascii?Q?N5+Szg3wd2GyJ5Z6isQYUExJJbITp8hgN3SV1rP4nq+inOZrfcvlBdsE8NCL?=
 =?us-ascii?Q?VyuQ8WGmhRLpQLR/RdKYR2KERWtJ8NCFlf5/gPNtW9iUEheSmiSiZ/sV3+J7?=
 =?us-ascii?Q?gtWZysd1HRZQQcuE19XwIKh0DNdsDIlfbPK/JLI6/d8MobuZ5QMOKANtRULJ?=
 =?us-ascii?Q?qsHMIkCGGXCjCIWR+P/t8ij34NyW4Siz+C13MKDy6otAHT1B2SkvPK/4lsrB?=
 =?us-ascii?Q?m2mkqAovQfBhTKVUeRmdT3uHbOrDWvQZ4/9z761E/MNpIuP0bl1s9v+HK2yr?=
 =?us-ascii?Q?SUoRApg1/NjBWo602BLL6NAx3zLF3Jz6PVlo38/y4fE/fXTWzv/xFe/1QmJy?=
 =?us-ascii?Q?trLs2jG5Y6DP+KurQnBaBwjphpZlsBKnElGqmAd7uZijGdPvNzEmMN0O2dzb?=
 =?us-ascii?Q?Mio808Wruo7Tr/mzizVMIrimgJDywINIAbdY+JGi3MsAIWYzllksU733HtSS?=
 =?us-ascii?Q?yf88Aoo8SCTnDGHDFVgxBpfpQCq6E1vc64iO0b/+Bhq+RoDL0sF5ZELW53p+?=
 =?us-ascii?Q?1BFkoAy8ryJUq58la6KkLc7I2i99Pl3E1XTASWT+IhZNzTu+vZbgYUtg/pxq?=
 =?us-ascii?Q?X1UR1wCeMvdrrjsGYsLbnxBm5zJ+/UTRR7Ue8W2ttuPFWtIdCfB+r+nosmJ3?=
 =?us-ascii?Q?5bRR0kZnvL9L/8RNMlnO57UxuSvrsYAsQH9sZLZb1U1R/Y30FksvEd+ma+E1?=
 =?us-ascii?Q?ocLkOcMnURT9MemytQVipc8BtfvF7j/op54MRrSG7DZQ0pMr77tL2PjHxbyU?=
 =?us-ascii?Q?lNmXyZibWGOq8/COUMJmwV+pKf0wLeAcpK1kjpwWo3autVDzhC4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OB8W/XTntZ6mFGIPf6lQoDXp4b0JB+EKjPzGGbLwaeJn0+Lc7RKsj5cGMcI/?=
 =?us-ascii?Q?Ru7Is9dT7XNljqi7lxEbCVIUHnn1GflpFS6UjemP2yQMtD8FHeaSNadJ5D6k?=
 =?us-ascii?Q?GhJgCGPQK2ekgyW17rG28B1jqj14mhKiETk8a3hT2XIJ+8TOlQufjRIDzkWl?=
 =?us-ascii?Q?zbNTHxOZVCeoLN3BKTcwXkv3zIA6+tmPXOqwARtJBor4W08r18SiscjCqLRd?=
 =?us-ascii?Q?mhBGprGxYERBlmwfFPlzrHaNkULtxfW6lMIXs6/2Xx+4U7mgdY9DxpuUw+Yo?=
 =?us-ascii?Q?O6GoGQEjEChAt8I6N7CloXoa+azqHf1ombJMkQz79TOzeugEVBvsSAqWBZKO?=
 =?us-ascii?Q?VbIvGr9nBDO8ZkqgaVdcL+wKbvUV0w38Rj5wRmglgX2VL7o8qAfgFW2/JCxT?=
 =?us-ascii?Q?ATdRqxZsVGTP/ZIAkyHVrFD2X9sn4BpqHrZJs+DdcsBpKNfIUUTRMJ97WeWN?=
 =?us-ascii?Q?ucj4v8QdXm/Qmh9IDKlvYca9Cor0buQF8wf4Vl/6nD+FDYTcBU3FWMoz/8p+?=
 =?us-ascii?Q?Drl3kKSDz+avVJC0WyfWGEvIv0zyxXjwpIL0jmtbiU0Fu/QEd+utW9yLItRN?=
 =?us-ascii?Q?Dxz1JZePl3UjcTMg2wn20xLWzsTvNTUC88rchTMHVFFzRlw5O9fPEe7uILYF?=
 =?us-ascii?Q?jvEIH+HIB4WozUGSDsxtTR2fSIWi0O9jJOl/XOU1jo2fMUyoOWRlGF2cWFLa?=
 =?us-ascii?Q?CCJ5wkFxBlgPUKW0tIs0RECrOQ8kwt7BV4WeFmtjpDksbZbjrI1ZRvt1PijS?=
 =?us-ascii?Q?EHwHqdn8WU9guiWFdlY7lYfklt1u6dNmMlq/WcL7P1OiNtwTMlqfwkyPUzpB?=
 =?us-ascii?Q?v+n48s6mB+RVerDkx2sYfIR30qF3+X3g2qxdJujizJDqOXiUhwRCJNzuWGa2?=
 =?us-ascii?Q?dKWuK6QBY/yh636b6ghMBmRu8kHjJoh3hU6IflIqQ9orsV0IXPdgavdxalby?=
 =?us-ascii?Q?6aPy98Ae9Xj2hMybojpOO6vPKmtP4t4z7NYhM9/bTnm4EgFcAMUg1jfsseej?=
 =?us-ascii?Q?eCafi8VOl2hFVaNcyE1FuPAEaNhfp0hCGHFOC5VPMsVQbMLQrEbRRb6p8HMW?=
 =?us-ascii?Q?/7apNUIpPCjm6Sig4g9wBAKNoD/Pl0PdDIALlJr84HKpF37FE0DHVDwQ0iEn?=
 =?us-ascii?Q?t3u+cTKwGL5q5hnIE/voMAOXiuoy/9y8RHzEDUMOCREKR+02Ll17eaY+Pxrd?=
 =?us-ascii?Q?v9V6tRv250oXSdZ+3TBNWALRwVG8otkr7Yu5vrVZ+FUUXYP4AOd1az48SUGb?=
 =?us-ascii?Q?LhqCuJ2+1LcpE9UfYVTfPFQnwXgNQxQivFQaH84dErThkcoCnejBDw6YOocG?=
 =?us-ascii?Q?VAk=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2014b4-b5d0-43e7-d77d-08dd55e7edf9
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:01:17.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3280

st1202_dt_init() calls devm_led_classdev_register_ext() before the
internal data structures are properly set up, so the LEDs become visible
to user space while being partially initialized, leading to a window
where trying to access them causes a NULL pointer access.

Move devm_led_classdev_register_ext() from DT initialization
to the end of the probe function when DT and hardware are fully
initialized and ready to interact with user space.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 360e9db78dc1..9f275f7fb159 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -260,8 +260,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
 	int err, reg;
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
-		struct led_init_data init_data = {};
-
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err)
 			return dev_err_probe(dev, err, "Invalid register\n");
@@ -275,15 +273,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
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
@@ -369,6 +358,7 @@ static int st1202_probe(struct i2c_client *client)
 		return ret;
 
 	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
+		struct led_init_data init_data = {};
 		led = &chip->leds[i];
 		led->chip = chip;
 		led->led_num = i;
@@ -385,6 +375,15 @@ static int st1202_probe(struct i2c_client *client)
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


