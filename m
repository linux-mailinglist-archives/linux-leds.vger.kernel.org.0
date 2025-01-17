Return-Path: <linux-leds+bounces-3813-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA4A15A02
	for <lists+linux-leds@lfdr.de>; Sat, 18 Jan 2025 00:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2090C1886118
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 23:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D718F1DED5E;
	Fri, 17 Jan 2025 23:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="syYHg4IS"
X-Original-To: linux-leds@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01olkn2023.outbound.protection.outlook.com [40.92.112.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311B1DE8A0;
	Fri, 17 Jan 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.112.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157243; cv=fail; b=E6rIwJyuLNZXUxg2M6Cn4VwDjXw3YiQJWuPSnp7x0/vbZGQoGgte1/F/B9O/WJuoglrfuJFcSKHKTJuXXkTmESHaOYM97qRfb9HBeHXKv0MIAHt5SRlCwZSeV5RnUvIhFOpFxVFNdkuLGGv/BB2eNaKckZl8tgmmwc5hVWXU8ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157243; c=relaxed/simple;
	bh=D4K9r6e8+Sk1BS+2VGhIrg5v2AEBsDv5XXQuSlnTfiY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emuWfFYv3/rZaZ2iKrEYdX8w6Ier/LFbR5j/lUOwefLG+F8krJbmPd4VoxhszIrLdEM9YZIYK88s+WErTn0JxMQ8AeD3uD2aCnP9pYitjb4nDKofzMgF7s0aTmGB7wwumvUeOenkxppBTjZC6ood1veCtABuZc3KmwGgOclYWrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=syYHg4IS; arc=fail smtp.client-ip=40.92.112.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu8AqyX543K7dXIVlfYF13iOswLXullxrkYOhmTc7ZRCmhity/nrB5syjkBrm6SRUpfwVmHaRB9i6TJze53V1/1QnOxZWlEDQGiw58Vl6Baq1PYD9USaTiGgfgmk04+9DkrgTWg/CZAXEteLLBvFUUrpOusWCdnfdlaZtAwYzOQuS5yYdM5FIfGRSHQVZd5KcTh/7gPs/tQP3fmqQ3BbhvP4gHABWUVRW55curLVX0PL9FVRfx1d3gjCFc/4VrEGeBNs7FlyNWhKedJJnCa+MByroy0jVgJNJgXEp7+61by1dsPwEVUOvktVBu2HtB50Yi3ARQRj08H8j9+Lj1K6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogS6YfdqA8BdxG9LAhhchBsCc1A0frBaELQUTCigOQE=;
 b=cIJZcgXHm7n6bzs9O/LR8InCojqjTctkSWWzEHr80Jw9kIfO45nNC6J4+QUvTgpIb89vu9yo8Oosw9pFVsNC//SPP4a7L85s677TeY1ajy5JNbwtm/V1M9RJEu2RHugzr2SCUqHOtJs5Pv/f4B4BgUsansfG4zFHkafDMKRiEqMUY6GLVbdmqLu6LTgf868tKkKr+D8GQ4I3It6b3szruHBGamIYom4f3bLN0pXTQ0CJhF/axAPeCx3FscmWQU/jR7CKz5eI/M85x5g+8oH4+M+wFRr66/EGcf/QNYFSQMQ/C0Kg+DXdxWOOpxbMlq3NfqBAGPjv1TdwNVBZEqvvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogS6YfdqA8BdxG9LAhhchBsCc1A0frBaELQUTCigOQE=;
 b=syYHg4ISn/HJzDxnogfMmUf2N8PUAt5t2dRKGPvYU3cOm/THCxpMAtn7Xg8MmkL9K0K0LDpvTqdINpZXQvX2m/TnIoOofyzGjwoCICJXcztKhgxewbBMk/WgrziOP9RbK5vA8APuHZwc6qitEPVKUS6KY3W3/pKMn3rDDQeZaTSaKwYYDvZYWlL5IbUJBTquLGr6X5jt4W/djJxnM7K0oI9t1y8Ax6s9ZDsQlNHmbvomOEy8OW9CdszZewnt5mgjM/tWBtCvpfREcFUIv7w+ZFf5P7UEE+23R1h9CKe1CAklxu27SLvlAKJDDPH470UU8wkG+QKvocQ8l5Y/zpxETw==
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
Subject: [PATCH 3/5] leds: leds-st1202: spacing and proofreading editing
Date: Fri, 17 Jan 2025 23:40:29 +0000
Message-ID:
 <CWLP123MB5473FF69CC006C0417053E58C51B2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117234034.670794-1-fombuena@outlook.com>
References: <20250117234034.670794-1-fombuena@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250117234034.670794-4-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e7cdbd-ffcd-4378-c258-08dd375057ac
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|461199028|7092599003|6090799003|19110799003|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlY3eVBkb3RzcG5kWTFFSGhWVUJwRDlMTEc4YTFEc0FPVzUxTThqSXpYMjcv?=
 =?utf-8?B?ckRzQzJ4aFNrcm9YSjJ0S1BEQTZQN1FmQUNvUERDdGc2YVgvUjVQVXNEYVZS?=
 =?utf-8?B?TFR3Zm5tS1J2V2ViK1drcXVNMWF0NDEvcWZ0MEF4VmcwT2t4YnUzM0lldXVn?=
 =?utf-8?B?SUZlL20rMTM2SjgwUWJVYitQeFZGMnAyNVEyT2pJdzd2ODVWSjFLWG5pek8v?=
 =?utf-8?B?ZUpwM1FLTFM5R285RnZHQTczTUx5bWM3Y0drUUpjMGk5VDljd2hXVGF6K3NO?=
 =?utf-8?B?eFk0bkhOdnBGUmhOZ2lzRDBtemp0azBXMjRnR0lKcVU2VEtVUmFXeHkxYmNk?=
 =?utf-8?B?UXJRVXI1MXdvaHpjZFo3ak1aMS9Wd2V1ckNHQnN6YVQ1NmdqdWVJdzExbE1R?=
 =?utf-8?B?YlBWclFKbjZ3bDg0dnoybGwxdmZMQlhRbVNtLzRxbmhGbVFZa2JxT0IrTzdP?=
 =?utf-8?B?S2hqUjhKV0N6RGM4aU1pUFJ1ckhYS2hDN0JIUGpZcUxqcjFoWml3cHVOd0F6?=
 =?utf-8?B?UTRybllmeVBZU2RPdmR0ZE45ZzhuTE1GSDVCd29zVmlmNFRvdFkvK0ZVcFVs?=
 =?utf-8?B?c2djWkVjYkxpRi9yMjJPUVJVS3FIQnZDWFhWY04waVZHM0FTa2JFWDdyZmky?=
 =?utf-8?B?Q09kc0lJV05uT201MUViM1NFYm9yeE9oWlEwVThoZVgyOWJLNSsxTzB1cmtE?=
 =?utf-8?B?eE5LMEVjTkF1RVR5RVdUeXpiK0lYUnFqcEZYcFRGaERSMG1Pbzl1YnhrTVVl?=
 =?utf-8?B?bEFzTzEwN3pmeVpUMk1tcG43ejJmWjh5ZVVIeGdJUlU1ZmxtUHdBYVFvbkl0?=
 =?utf-8?B?SEN4djhZNVJHTmlrWlgwbTZUekhSelpiVmZrS2JvRFpLNVhKaldwenFHK3da?=
 =?utf-8?B?bjgzcyt3SGZ0RnJOT3BWKzVVN0RWME8rb2tsQlN5aE5GTzNqakRXMWhodTB5?=
 =?utf-8?B?WVpxeTVKVUNWOUNrOFNRb21yWHAvaGp4WmpLZGFkdm5PM3J6WjlBTjU3Y2pE?=
 =?utf-8?B?ejNJWG1VckQyYjVMejZKSHJlQjZSa2NXcXU5cE80a2kzbGpxUWVSOHY1M2R4?=
 =?utf-8?B?aFFvTTVGM2pmQWc1NmtuRmVBTTU2MzJ1ZTlrR2ZtOVFueHgzbldBZG5pczBS?=
 =?utf-8?B?aXJUT2NKU0g5Q2ZPZy81ektUL1VIMHVheEc4QWZ1OC9oVlZFUENNUlNpTVRr?=
 =?utf-8?B?WDNBS043TFpxQXFEdndGL2RYbmNHU0R0blZiMGs1dVpHZndUaDVDK201b1dt?=
 =?utf-8?B?d2lPUU1Pc3Q4TVlCWGlqMkRwUVNiUFZmaGtkTWpPRmFpd28wMnNCbDhrRDVo?=
 =?utf-8?B?QVRYWVo1eldWN3hieHV4ZExMLzdvVnlJbTI0OWhyYmh5OVFVT0YzUGxrbTBL?=
 =?utf-8?B?RmdmMHp4LzZRZG5SQ1BlQjJpWElLR2ZRNXRpOTJHK3FibnZQbnRPb09IeU5Q?=
 =?utf-8?B?RWROc0RiSzVVOFhYak5NZkxkMjlBZTRTeEIxMTBpM2pmUEpFQWx5NWlzM25E?=
 =?utf-8?B?RXdTSzl5TDU2cDVPUzl2ZUM2WHhqVzAwK2tUT2NEY3NOeFlvQlhjekhuR3lP?=
 =?utf-8?B?VTl3UT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEN5N0NQcFRNeWVUTEhjNldhdkZpb3JSUUxhYyszT1VHa2VRNHJXZ0FLWVp2?=
 =?utf-8?B?L0VLYnRaQ1BjYkpsU1lSUzluM0xUanJCUVF6Mk5UWUZxMDZtenk4eTlXNjVL?=
 =?utf-8?B?ekVVdmNlSU00RkExSWJVRFJ0cEVsLy8zMVhuZVZSL2JzVXc5cXNHekk3dlZZ?=
 =?utf-8?B?VkRoSi9yNWpwS25UVDE1d0ZBNVBrbWR3Z1dRWTdYNFROSW5hekd3dWFuKy9m?=
 =?utf-8?B?VXoyMkFlR1k5SzZTZERXWkEvNzdSaVdxU1QrRUhyazFNWlpBSXZWRmJRdFQy?=
 =?utf-8?B?SDIyZ2QvejZyOUNZcHpPbFh5bVk1R1VaR29hRUw2MERVWDIyTmMweE4yWk52?=
 =?utf-8?B?TTZUWHhncldPT1Y1VlU4KzN0Zis3QTBnWGxlK2xOdW5ySHRZUUxHRHdNUjJq?=
 =?utf-8?B?SHk5c2p6NnMxbkUzZXovR0dqMTJQOFk2M2VpUWZjK0JmK0Q0TTF4WUUzZnFN?=
 =?utf-8?B?ZUhpcUFNdC9kZzZZMURNdUNTQzBLbnZuY2J5c0JWYjhPYWhNcGQ1NUtVeFRs?=
 =?utf-8?B?MXp3OFJ3VVRkWFFUbWxxVjM5T3BqcWNDVlo1NmMwZHVhNHMvaVozREM3bVlS?=
 =?utf-8?B?WTJlSHpBdkhZaXRJdUlsbTlMazcreXpvaVNoTGw5LzgvRndZTGc4bUViUC8r?=
 =?utf-8?B?MXlLWUl1YmFBUFQxN3NPMkc0ejhiL21sNjdXNlhKQzhTVHJ3QkFxcmpITkZr?=
 =?utf-8?B?M0ViM3RsVmhOR3VKM3hCNVhhM0ZKTWZ2bEhNbFJNdUE5Vk1Ud0dHWlExcFhp?=
 =?utf-8?B?a2cvQTlLamZ5eGxhRW1nell4eWlRSmg2dEYyQTVyWm5NNFB1WHRUTVBKTkYv?=
 =?utf-8?B?SkJvTXVpdzRPRzFqZUUwWm1VcmVzN3NaUnRpRVFIVXI0NThvd0Z4YXkra1dZ?=
 =?utf-8?B?bEZ5bStOM0kxdG1zMk9CTTVsR2FqSFpEOGE3N25SZTZ4U2pSS21yOFQ5a1d1?=
 =?utf-8?B?N2YwOENrVXZaNklEOVZSTmFlVFVhNDY4ZEd5dzdBbVBlTTNENEwzNlJKM2hx?=
 =?utf-8?B?Q1hiOVBRMERjNk5Sa0tYdVNHVmhtVGhRL2FyYVByVHlSenAzU2Q5UHFscHl0?=
 =?utf-8?B?eStzTm9SZ2Z4bWo3QVZlakRndXhjY0drT09teWJKOTJUSEZMMjRxOWtCRmRZ?=
 =?utf-8?B?Tmt3aGIrT1dNQUUrVVU0WHZQa2dkS0ZvdmR1UVJ3WGVsMUlvU3NYTktzRFdX?=
 =?utf-8?B?MzQvajlZa2VOdG9jTEtCN24vb1VMdjFyeWlXY0RnYmhoVkJTWEMwNGNXcXNu?=
 =?utf-8?B?V0ZFUlhES2JXZ1cyWHpKWkc0OSs5Zm55c0xlUGtxSEJMOGU4dW9reTVvYWVi?=
 =?utf-8?B?WGdhNlprNVlXczY3Y3lNVitEOGJpWnVyVndEczVDOGZpUWVzc0RnQ29PV042?=
 =?utf-8?B?VGdvdHQrMi83TXVlYldtYWZKQ1E0U0YzRWZIaytjU1p6NHo0QkZxMTZPRUFr?=
 =?utf-8?B?NkNFdXQvdnhGT3AxaC95bWhZc1orQWdnSnpPcG1LaHRablo5TVJSWFR1eHJl?=
 =?utf-8?B?L08xcG9qdlduSlVDYWM3OFlCd1hrVUJZYXFsRW9EVXdrWmhqc2JQSW5zaVQv?=
 =?utf-8?B?UU5HM3p1dEtqbUR1NEpVUEIydU9MQ2dpc3NNQmNCajk5Z1UralNjZ2lXZkxJ?=
 =?utf-8?B?a0p4TDd1SXhBMGVOYXBDK1I4dTBzeFlhMHFsYmR1cHNlb0pEcUUyQTNaZ3k1?=
 =?utf-8?B?UWlIMmwzWTJFbzFQNHhJd0kwMGRqYm0reU1MdG55TE11Wmw0OHFlUVVMM2E0?=
 =?utf-8?Q?FJ1XiP2QuJvi7NowJM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e7cdbd-ffcd-4378-c258-08dd375057ac
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 23:40:36.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4166

Minor edits regarding use of spacing and proofreading.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 48 +++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 927874f20839..cb4797ea8f3a 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -16,27 +16,27 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
-#define ST1202_CHAN_DISABLE_ALL            0x00
-#define ST1202_CHAN_ENABLE_HIGH            0x03
-#define ST1202_CHAN_ENABLE_LOW             0x02
-#define ST1202_CONFIG_REG                  0x04
+#define ST1202_CHAN_DISABLE_ALL				0x00
+#define ST1202_CHAN_ENABLE_HIGH				0x03
+#define ST1202_CHAN_ENABLE_LOW				0x02
+#define ST1202_CONFIG_REG					0x04
 /* PATS: Pattern sequence feature enable */
-#define ST1202_CONFIG_REG_PATS             BIT(7)
+#define ST1202_CONFIG_REG_PATS				BIT(7)
 /* PATSR: Pattern sequence runs (self-clear when sequence is finished) */
-#define ST1202_CONFIG_REG_PATSR            BIT(6)
-#define ST1202_CONFIG_REG_SHFT             BIT(3)
-#define ST1202_DEV_ENABLE                  0x01
-#define ST1202_DEV_ENABLE_ON               BIT(0)
-#define ST1202_DEV_ENABLE_RESET            BIT(7)
-#define ST1202_DEVICE_ID                   0x00
-#define ST1202_ILED_REG0                   0x09
-#define ST1202_MAX_LEDS                    12
-#define ST1202_MAX_PATTERNS                8
-#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
-#define ST1202_MILLIS_PATTERN_DUR_MIN      22
-#define ST1202_PATTERN_DUR                 0x16
-#define ST1202_PATTERN_PWM                 0x1E
-#define ST1202_PATTERN_REP                 0x15
+#define ST1202_CONFIG_REG_PATSR				BIT(6)
+#define ST1202_CONFIG_REG_SHFT				BIT(3)
+#define ST1202_DEV_ENABLE					0x01
+#define ST1202_DEV_ENABLE_ON				BIT(0)
+#define ST1202_DEV_ENABLE_RESET				BIT(7)
+#define ST1202_DEVICE_ID					0x00
+#define ST1202_ILED_REG0					0x09
+#define ST1202_MAX_LEDS						12
+#define ST1202_MAX_PATTERNS					8
+#define ST1202_MILLIS_PATTERN_DUR_MAX		5660
+#define ST1202_MILLIS_PATTERN_DUR_MIN		22
+#define ST1202_PATTERN_DUR					0x16
+#define ST1202_PATTERN_PWM					0x1E
+#define ST1202_PATTERN_REP					0x15
 
 struct st1202_led {
 	struct fwnode_handle *fwnode;
@@ -99,9 +99,9 @@ static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
 	value_h = (u8)(value >> 8);
 
 	/*
-	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
-	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
-	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 * Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
+	 * where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
+	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
 	 */
 	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
 				value_l);
@@ -288,8 +288,8 @@ static int st1202_setup(struct st1202_chip *chip)
 	guard(mutex)(&chip->lock);
 
 	/*
-	 * Once the supply voltage is applied, the LED1202 executes some internal checks,
-	 * afterwords it stops the oscillator and puts the internal LDO in quiescent mode.
+	 * Once the supply voltage is applied, the LED1202 executes some internal checks.
+	 * Afterwards, it stops the oscillator and puts the internal LDO in quiescent mode.
 	 * To start the device, EN bit must be set inside the “Device Enable” register at
 	 * address 01h. As soon as EN is set, the LED1202 loads the adjustment parameters
 	 * from the internal non-volatile memory and performs an auto-calibration procedure
-- 
2.48.1


