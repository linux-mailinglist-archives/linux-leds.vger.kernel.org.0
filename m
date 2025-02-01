Return-Path: <linux-leds+bounces-3863-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E771A2493B
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 14:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E85164D20
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C9D146D55;
	Sat,  1 Feb 2025 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dw/tBbTH"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012058.outbound.protection.outlook.com [52.103.37.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6F2C9A;
	Sat,  1 Feb 2025 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738414982; cv=fail; b=oLm/NHvbvSf7gnZ+PsRluDciTAGHj0tOgZTuiwfD5UThhl7YubVE/qPaSAbCs+QUE9VdtAOGBkejCV2d+2/bKFKyowD9u8YDa8MEWbHoQWDxWHG9SYh6LAi6Chv9tXCDjK2Z/1DYJX2PO369uivC8p3opnqR3oM3iNkDHuuYaVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738414982; c=relaxed/simple;
	bh=hRVn4644dpgs01/+pFm+Kug1oolgFC1dj4b8PExnEKs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRhqzq1akNeJZcp9UmWlsWtOrRrqMcZPTawK3t8vjWPNxeG8vuhRWqN/CYGXu8SLIQ2SErG2XR5xpFePL+grjzGI3FYh/nW6b0Xt6kb8IywlAlewbe8+Dk9J/K3p3CVqc5WOh97sXZLsRT+JoflxHAtLDIEruDXCAgmb/lKTsLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dw/tBbTH; arc=fail smtp.client-ip=52.103.37.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dilUZNw8gq4n2rx1pRkKtrVC++c/w5Jr51vuSZ7I815IFY1n8QDBi3rVnfIbhEuOL9F1A6+ISfXqixx+Zmyj0nBhpIimW1nouIMxbiWhyVpgVoCY5b7ficMEvbLue9jtS4VPVV6ld3/k+/wb77f2OZBKfihZD10PooqTDJyLDBC9e9z2FlGhY5IEEFJtyX6wUG38Vuo2GYH9rFsoKxS6GPxDJ0iYsOrILl07pGqVcSINSWpT7gVwOAIuSG1ebrbDx0SPeCX3CNIiyWsu+/GHOc3mN7lWNnAB3jeiPsrFweITx0iVZH0L47hJ/OAkszKnvyNO700H+YhsmOa9pKW9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZJBY+tRiyU5lRK4Q9axrQ85I7SfOhWcopMeYJcKGDo=;
 b=E2PFOwNZOk+DPp46Hlz5ewfXrLXCJa5lAGD2bsMLDHlSgRV+6/EOuzUPb8F6p7PfuhmhTI6/OKnwNs1337OdlHTfCMl81E0e5QefPdkRkDBV9ej0uQY8GaE3PoOgXWMz28O4wDGH31qTS47gatuUSmHdZljjBa0YN/rgXw6Ui/zepFSaV52LaPkUgZhUk/sw2+8p0MGxL8686YIHwJat5EqQVWFNaXe94hfZMglNvjNKZ5abAtoF8tUvhnqDL9qQjDsBw/Xt9gyOzzQnf4lE04hpYIfSvYSBCGLmKvrLDiI7E0kUaaxCq3UAeCqMexa44DOagnEqJGC6IXrXnZYSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZJBY+tRiyU5lRK4Q9axrQ85I7SfOhWcopMeYJcKGDo=;
 b=dw/tBbTHVqJ/qaEr+GObfbEqQco8b6b2qw4XgdaIeHFKV1Vd7FCFL9JcAP2wgGtWKq4+/HDdZzg3yz2Bsq/MdSCqhO/S8BWAb/MMSK12lL6ICESQkTH65iM5Fbfgfan6ZVOcgP47+dg6ko9yhr5InieHChoflvZnnvzj+ff1nSwb12L3b8ETYB9DrePw0gX08AOqpd42YgQAddgnTBGIn8L8qHqh81+9FAfRxeOvkxLbvCaqBWUGe7D78omaBGg2sShK/a8eazemp46+swQUUehI0NP5j2rxGQtYlyQ6Hg2Njpt+lPrP3VmyqdHbSMiOrK0fSMEG78pJPQs+36dKwg==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LOYP123MB2704.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sat, 1 Feb
 2025 13:02:58 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%4]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 13:02:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access on race condition
Date: Sat,  1 Feb 2025 13:02:56 +0000
Message-ID:
 <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0351.eurprd05.prod.outlook.com
 (2603:10a6:20b:490::34) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250201130256.1682557-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LOYP123MB2704:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5ac7df-3923-4759-3d15-08dd42c0c023
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|8060799006|19110799003|5072599009|461199028|15080799006|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EphtgeYQQmUOcOodbByEpBlAU5ipgtIxahpaoQyjvfToaJ4rNcAN0Foomf3P?=
 =?us-ascii?Q?sFNiaNMeNW3nTvzrH2fFyWbnDlIc/HnUp2Vs3LRbHRvjkakIIZl6BOBEPefO?=
 =?us-ascii?Q?ie0E2nhP2b7RdPyug0sZv6zhW/kUGvl1fkZsYJz//m20JVgWryFLaeW7g1jb?=
 =?us-ascii?Q?v7alCTYM/wmX5tWp8PlHlcU1fs6WpUY7Moaz+Tg9ZeFKrh6yJUI6Jg441Bsb?=
 =?us-ascii?Q?Aaz70faIlQnj8dHFQPb6Bl2MM9tBn1fsR7Iy0Ur28jDBVKnXYF6ynYpOfRWY?=
 =?us-ascii?Q?LLDIfOJt1mrNDPXHMJcCffwKAEdRpWukvh21wGU147QdBY7RBZ8ZxxT3hxnI?=
 =?us-ascii?Q?qufothcKXnDKgkC74o4dxncu4EkoDib8OZYLGAN5CqtBuWlHqg/i38SCU6si?=
 =?us-ascii?Q?ySR6kujbMWAoroeX8XtVqKifGIGWbNSxzUtRPE6VuQMY85TMAuYaTv1XF7+4?=
 =?us-ascii?Q?XXWiDKZ3Dcja9fK/nsHOajLp94wqod00BPRDYa5giyhQhxra8qUpDAZpB6x4?=
 =?us-ascii?Q?XAqsSoWSgB+WdN6gvATyznyeF2+UMJLxDGPGdavUnlRIM1Fdg4qXgHLtOMKr?=
 =?us-ascii?Q?jNarO+Fp3zDe4IIojeiv98yqW+KJjjZJ8gQl512fYLh5Osb1VvGcuqNFNgMj?=
 =?us-ascii?Q?AbhziswXvbi1bEY5j/2eUiA/CobHzLFDVW3qBHPqmHDAJmDO1Ym+5+JhKVo9?=
 =?us-ascii?Q?7Tk5f+bd+ncY7ouyvtsBkM+ve/JOhwgMFXHRnSnjJDBmY/HLpEIOgHU0cc0k?=
 =?us-ascii?Q?RwrJ/QNeD2V8+uXsyDwNM4Wz/e7RFd7o1XlYYDs1azZVuv2SxbbkJ1T96zJO?=
 =?us-ascii?Q?m3eDXcY7021AEGBt7OyPghFYcQ92ycZm82z5/I0bfwrPx+YQY1sGhGRE/4tS?=
 =?us-ascii?Q?4P9nCBczeD3LL5/QoTMPVxCiLFtl3ikQyIc4GoIKvBzjIY78wCHmxrmb82Rc?=
 =?us-ascii?Q?bqn8R4IULWLKTBHDWVwU0oj25YKxL8xGTqDitQSOriYAysEnAQQMNb/T+GZu?=
 =?us-ascii?Q?iWrXdfBITbaeIgOg8cFYsbzOJVzNGGeVrFcZV+vquj1lKBQrugjimBfJvh55?=
 =?us-ascii?Q?GTwNxTdl4ODFfvKN25rXdFuJNcuUHk8eLAbLnaHzM9+MRr6yAkY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O9lH20XcB2DyW3AzZ0oPRrtHpw0MDTluGzL6ZCEmMGo8LVrkGFdJVpRhWpRO?=
 =?us-ascii?Q?Y6qMPJkryFNoHmIn0vOX2aF1wZ+21rDLeSjFrqphMhK8++fHQvFf8IgtgW2n?=
 =?us-ascii?Q?/tNiR2seurWFCZjUqH3X3Z3KvMACpfrc6fWQeT1pPSwAUuTPxGOqZCRJASxh?=
 =?us-ascii?Q?GPQdT5ixaQPCj1bQ1071ZdHOEfOfrjlfZakXHTU8k8VuvI2FDEsFgbtgl2xm?=
 =?us-ascii?Q?butwlqlLoJHN14xhBmtKUCrbmiZQux4exeVYXKA9jTPeGkzzWM5mdUFer0Rd?=
 =?us-ascii?Q?kjstkoiChPFGQvMgPUuMtRTtYAxS3mnPVhHn2aHfpqb6w6iEfVIH6tpS8bqU?=
 =?us-ascii?Q?E3KBGWKKsYotT/H8Q1G61j8tc6nvjL/U1nZZQxsB3PfSqNw7/3QcLSATqgBe?=
 =?us-ascii?Q?NDZp1UmQa1vkoGzWFUM4CtR7598qPKp85fAU73wJx2matsNvXrvKzWYsjqyG?=
 =?us-ascii?Q?D2K0Qwl6pmeLvoyKd8HziFtbqJlptXqISweizkdfi0ZX/Uq9LTSQaw9m39fA?=
 =?us-ascii?Q?Ws96hBjJhrUwqGxKar9wQIuLN2s9zeN6BPEB5ObWCupfe6aJLVf66wWj1lUR?=
 =?us-ascii?Q?aR1vDERZo8iCrDvbb2+vI6fyIoJeURW1R48gNvq5FuO0xxBq3U9S/KbaMpbM?=
 =?us-ascii?Q?0RaVQYVXmEK1mTG3uPAr1RrkuvAen7WbnSKomjHduVLLdVAwlvP3ZuuX/Pab?=
 =?us-ascii?Q?e4gTaM114GapN5suY3UvjJcIA93+UIIX7vn7tjH1TTHRv+hfp8kuCodE3BzO?=
 =?us-ascii?Q?Q7esnIp++h32f49IRmNw4AWHEXfrz0animo4ZUV7JSsZXyr553wtbETg08aQ?=
 =?us-ascii?Q?kaFuUG3cIyZuMlICjZwNuGEybdb49sUadzYGs0Obe81kuQn3Q9Cm2Y20Rgbz?=
 =?us-ascii?Q?7GKJoOiwyN6ebifcxcbxhrxhQE+nyARe1mJODgrrdDW7QGS20ESRbsfvNTSV?=
 =?us-ascii?Q?sjB7vT2ICwpjjX7fBYGcYz6SqhLuibKLZMnoW1YzXcxgk2CbaDBIvkxitpZL?=
 =?us-ascii?Q?YYcNN+DNyQ/YPSNrIMcFsb9SRkvWOzyCvHNsoP7a9XgtOh64fdpxh6bXMyeY?=
 =?us-ascii?Q?JIF+PGN78l2wwYmDGJ241MVX1sjNT1Bb+Cad5d/FL+kVeqXI7cLxtq6SFL9z?=
 =?us-ascii?Q?5pLljJT7zckYYk2ljmg58u6FOv3hZfB1pXNY1EcbNt3QusYLME9omM2P7n4B?=
 =?us-ascii?Q?UQlIIs0EwRCFwMvuA+nx2Ns7msJAMtsyrX5etnFzzqsZSDtRGCuutldY6r22?=
 =?us-ascii?Q?aQSO+cKV5tkns0spsbHCXjyHnfY0WxTQS8V3xGc9Cpro2qdYVGA5xEFsv8XY?=
 =?us-ascii?Q?tMA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5ac7df-3923-4759-3d15-08dd42c0c023
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 13:02:58.4228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2704

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


