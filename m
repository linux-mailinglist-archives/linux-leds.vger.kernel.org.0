Return-Path: <linux-leds+bounces-3864-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51785A2493D
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 14:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21FE164D3E
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323F3146D55;
	Sat,  1 Feb 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hvjXA9jo"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012058.outbound.protection.outlook.com [52.103.37.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8472C9A;
	Sat,  1 Feb 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738415053; cv=fail; b=iUWoNOvgGbbtRJbbeM9THU1ffMyI28bObYvDLCPTSBPUzjM0S9NG5EgGdo/vceQFuYP5Yz+1eRgpmfvf/xxVmEGyBzLqkPgufaU4wjOoQrH8byz+rj5rQ9FiSo2h6f7pgvHc/5D0PRX9SYMnTyNJnb284YoZ1tnnw+5hX9bKqMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738415053; c=relaxed/simple;
	bh=WiG2bX6V1A0y46pxpoCSREfSI8ZkVt1LrWNMcECe918=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QOanH7E/M2QU5oS12goEJuXyIRX29GuneKwolfpJvCqcH9d5Ds2TDNpPgXQ9fsbact4N7f1GIVK8fCdBslE9aCOPJYVMk2XBo+kVy4VffUrDgsms+BHhQNKyfKT/mupHshwJeg4t93CEyPGifVJYOBQ7SbYw3v8nLJWKkhBbosc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hvjXA9jo; arc=fail smtp.client-ip=52.103.37.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYx5AXuibBTnE0TBeLRdm7V+KQNQ7Sl84g1r/A0Sw4quT80dy7iBTIgVbU5liK1+UO/xg2gDHjObjKFs1pbwTxn+l9OL1duTDsJxad6IUSFiZMIOmeIB+TEGggei0uoVeQEnkvlH2cqV8Z85qowRTQA5JGesYbXh8iQE2wthSAAi+MS/olbslGM9b+b/D7sWEQS5k2ryitk7R7yimk7MmJmpuuf8NAgYMWFKXCFea5rES9WfghvnUG8KHNKEinl4EAanpJJIYyrGfzpVQGxHp89BqkCY6NSyaN3X79nHarRUPZ8i8zQvSItgs4TDoJmbXQkrW4XjvCRsYwPRfpr73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AzLQwmGaXuUyhKvYIvXIoJlxmpHxgvilNBqAEC+Ix8=;
 b=C97mkGX2+OA2dOfgiRrPeKQOc6My2yUEeG6QLzifmK9wFRKs5okOZq6BzXgHFJHnlq1GV2EJLCbslwwR66mSyVkBiHjoAmNqCXmrTgFOsckg9WwKUlfZd4/IbowFC+9qiyPNaXw73MX6QFcoE8GfWUkWqZR5ZokXmnn0LWhucggwuiZvR4qonIlM7jT+C5VNRy5sFP/cAg3x/m2zD7CCzkd583mqu4BA60x8TrOQ0Hsm1J64dCGaACcSNDvzv/kaL9iTx2NGMS3ul0WoExndD+D9x6qzpNLIL6dgHBDVeusjLUGC/7VFC55iF5XSth50gHYu6pw7vXiwnWtF5HtOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AzLQwmGaXuUyhKvYIvXIoJlxmpHxgvilNBqAEC+Ix8=;
 b=hvjXA9jomWDaPcpJlsB1YncS6dqqHrRsmUpjlrvz6ov3VbpFPjIoTXqHcJwjVJAdYqAx/wIuVQnaxmZHGgyJOf/nus+5Ko8wbs8rAb0HSQEsvOk0nPpNhboRhthqo/Ge51ZfjCifsZKrQ7nnxcnZvFbqxyC63+cn5OxrNdPpCNKxkb4nG/KuMxaetMhLIJkUoEYa2h0N6x6Hwr9dwGeLVy/aSw9X7TDi+MNkZ0HiyIYDkikep4FWhKRNdPqfrLFZAlfdzWMx391cWTulqRssovYMy3tYLtEn83OsdFEmQ/GSSNuqtzztKbSDVK7OENnZOpm6tme7Fd6JLZycAJVkuQ==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LOYP123MB2704.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sat, 1 Feb
 2025 13:04:09 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%4]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 13:04:09 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/5] leds: leds-st1202: initialize hardware before DT node child operations
Date: Sat,  1 Feb 2025 13:04:07 +0000
Message-ID:
 <CWLP123MB54732954D59EFDB0D344A6DAC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::16) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250201130407.1688565-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LOYP123MB2704:EE_
X-MS-Office365-Filtering-Correlation-Id: 12428587-9dc3-41ff-95be-08dd42c0ea50
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|8060799006|19110799003|5072599009|461199028|15080799006|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZkXf7Kg9Tw664urAIAaNwMMHqYuiUDS7kfeDa7NPiXT41oTZL4mQVGTAWY6B?=
 =?us-ascii?Q?9QtPg1jtQO5lAvVv9Atiw5/QwILJLb2XUo/IskO7mgYv3mmzhjh5ki+Ju0mH?=
 =?us-ascii?Q?3AIkQZpynzrnQ/XNo/W4v0suuDpE6JqJAVxAu/xSAjq4RDFjUKmM2/flIuSO?=
 =?us-ascii?Q?nFQ7ldDXj0JNqbGvhY5bmPHdJUqfuObL+oWxO/S2njchN9NeIL1vQiGsY90r?=
 =?us-ascii?Q?KidSH0p6QGHJfYu3HtCOZ2Fx08QreiSG4aeqgoOLGKo5IRvll0KzKSj7/AgW?=
 =?us-ascii?Q?TE3QMletMwmsDKkfJ5ZvHbVkoKECIxQana/YfjxArkN+GmExJRYh4RU5Lvf6?=
 =?us-ascii?Q?Sb9/ZUTRUyiezWGLSHuEc0ghmrOvVPKWepw/ql0ejeDtKMFEnMkQ3EkuBf8c?=
 =?us-ascii?Q?/gMQF4ycJKJ2OBXqMcHqaLGaRcBkYErdUMtzRz5kgoDDc6cI5G12w03Knc62?=
 =?us-ascii?Q?SRi8haRzqhrUlolte160s9hF6MulrQdy6YBnhs2xQkUol5OwrF4aUGHCWEl7?=
 =?us-ascii?Q?op7H9P8cl+YenCXWjPH2ZZS3hAdnssl9zBR9H62DmlrggZt7LWMAvsFMEF9c?=
 =?us-ascii?Q?iRDaIRmwob8PALQyJa4C8715VmpgC9B/bU8M0lQcsAKuugmQ54qxL/pl9Djs?=
 =?us-ascii?Q?Fj7OdPnhVkVzEUsVfbIeTNtum19lvuns6Ybu9qeywk25rE91WTXW0xekT5aq?=
 =?us-ascii?Q?SWTL+bKf+iAGmD8A5pQkzHLkFyinYFiGIumSs3RmFrVnBZ8TGm4aNferZGgd?=
 =?us-ascii?Q?KXtFz7UhrsfjKPxo0lO//FiqIR2J/1vlli2FU0+J1oTIz9I9jMA7Sprqlu1Q?=
 =?us-ascii?Q?yfV6vKU5w009ewWqdWiY/aIEsTtMGmb4uEYqTJY0tgZrP3PTeRhDBSaJeLlv?=
 =?us-ascii?Q?Mi359iixND87mk/zbmH3BGVg8udSAgsPvpVTi5DrwjRM7/cA5iPTxIsa1UIa?=
 =?us-ascii?Q?pC5Rz64xK4DEJz3MdRW5/ZKNXlvdHcgoDfkFwv00BSQJfnkRy1BlJ6HRuAnO?=
 =?us-ascii?Q?Tr+AEH2F+X4GIrqkAnP27KvZ/UbPfN5D+szbuRlXxnID/mZKJ98T/1eyCWYf?=
 =?us-ascii?Q?Sd9GfJbNrgI94jdlw3ucz3KMnQX7gUQq3SrwWG7r7qFLcyVwKTE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uyQQsE+zri0WR4bI/yWhBnPMC/b4cxoyJdiGCys2fv2/y0oe4Wo1FL+YFE8o?=
 =?us-ascii?Q?S3d2BsuR70GJ5wm+o21nMVkBGm5KqUo7lBxE23qgG9/2s74bbhiNNYQn0NYF?=
 =?us-ascii?Q?5aBStNfD12oa1jhM4HO03SfM+uJP5s1GHiS/ADBzaJZ8+ZYg/PNM+djdQ19X?=
 =?us-ascii?Q?6a8NMocWX6RQiZdx20+kLvyBjx+ZrSJXliKD9LC6kK+KvTp1uoHGgxfwwnAz?=
 =?us-ascii?Q?yv9PZ595fV4cuS8dAhfSomUWYZCdjnpj40tBHYDebNumcHXiR/Q5CUBfWT3U?=
 =?us-ascii?Q?b6ooAhvkhjfKbEA2n0eqQiCg1uFDWSMTV1c02xQu/FNQvZ8wVIj//UIoPX5N?=
 =?us-ascii?Q?jaa2ONYZWbEUM4GrB6tis2Ay8zLOnipuiT59jP7xx+/A+srXpmucmy+tduqP?=
 =?us-ascii?Q?e+lK1n3JAP+n1y8AAXA3YNv61i8TlkD+4sJr7hSQc1Q4hcqMO9T8KQPa/LpS?=
 =?us-ascii?Q?zh9TUrLvsa9RcyLq8j4RnGx3U48JwXL5X7sZmQNqu1N6HDBu4IspBLbIwAk4?=
 =?us-ascii?Q?+Id27lAJVeiUr9/QEzejt1zrB9R8flZcOItTmbewgfNcnU14NvzaPPGPoSdr?=
 =?us-ascii?Q?ts69bD9UWIHqQjly+scnhFq16ccU/Ve1onL1nzlKWHq3LKV6tvExvVxkzFMW?=
 =?us-ascii?Q?2tVWKbC15ltPtKJ59/NcBSMDAc0cFbBGZZewhA/XJNNja8QALI07uLU7x84V?=
 =?us-ascii?Q?rGmNDVjDhsHxmI2f/1TbFCOneDkYW7fasfzIcSp7TnoKUkWoxSr4S2T02hcd?=
 =?us-ascii?Q?dUkaW+wyxqo/GHS5ggJ6fKkJe39abi1W3P5E5ChxYgoQeSNRao2SZlF1/dtY?=
 =?us-ascii?Q?TYlaR7JPLDczq7M/BOlWdJmEqJvWO6aRr73uz+MV6G0RsH5G03Xu6enh+6I5?=
 =?us-ascii?Q?Cp0HtzGKGXhD46+WCg3BLVeJDfuAVcLNYjSpe0978bcgg+rTFR+dJVw7JY8V?=
 =?us-ascii?Q?T0aw30aY4wtRE/IReCoTAub/GgViZGih4K4NKoYG8Yzd72NbLYxPUz6FHQ2w?=
 =?us-ascii?Q?Yf+wn4bbAiipBXIcmRJQ5ghkiV2EgF57wdXmU334eNhVNVNRdAZeOkqKeSQ+?=
 =?us-ascii?Q?LJ6sN8mFfcBaph22ciOAARBeST1ls8CB4c7nQoQXqE7PUdDHs0pwNxmaksfe?=
 =?us-ascii?Q?EOUb1OxgA1e5bB6s+0X/Zbd95tfL4RUztwRiB1RzG+melEeS7+y+z7/7lBCf?=
 =?us-ascii?Q?HrTiFuAIZZzMS3BBDWd7IT2fB33EayxGBElgVbs3abV2eQAEYhju2yVUQ4mL?=
 =?us-ascii?Q?G0GIiHiM6/7LoC3UtlsRtJhGhbSK07NdiKVcasF8I0trYavHwro/1zuVSbZC?=
 =?us-ascii?Q?P4Q=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12428587-9dc3-41ff-95be-08dd42c0ea50
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 13:04:09.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2704

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


