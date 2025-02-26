Return-Path: <linux-leds+bounces-4104-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDFA4679F
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 18:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7A93B17B2
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 17:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E71224888;
	Wed, 26 Feb 2025 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ppXb/BE3"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazolkn19011033.outbound.protection.outlook.com [52.103.37.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9335258CFE;
	Wed, 26 Feb 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589988; cv=fail; b=czJuluQX3SCkfpS9Nme0nemyj+hss/MZdEMV/pHNhoZikIm0LHn4HQ970Mka7Kxt0zmb1juA5MgddKyhhi2ivT16eBAqoQQF/NO506lnK4dTknJro6Lu3qgEAc8a0SHlrmXFPdiWWpqah3WgoeBGTXyiwdHT06G1AjKteJrpbdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589988; c=relaxed/simple;
	bh=KFf8yatt3FG1ShAsQIq0RbrxBiTRM0CagB54zt40aqE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eSESn/QXxwvhD+zGNKtRkAZ31oZ01OejyNXjoRFiJluZ5+J/ie7Y0q0IK+BjatfNYooG3X3Fwclbz78Ss0JI5DqX5StNsXu2G4UHaP5scIVoOKOvSbd0clpjoW0mpL+DlysoEXvjzjnhrctQs6wO2telM+vzeDgmhBT/eHjTNwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ppXb/BE3; arc=fail smtp.client-ip=52.103.37.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la80DFn7++rJxwAa8OAWCRlU/5QfDRSG5gOO5WyrsGEnGrp3mugJ2eWbQ/jwkkQ24GPPBEwaVa1KoyidBBwHZnHrTnYw9UCATZztq23PIKt1M3xx7+ty1DmD+XTZIeEd2S0q04jmgbcwX7rO+KxUVwD06Te0etrE3wnk2cPUe1um0EMgk8NvBL/JFVxZSiQkhyXR2ThUV7yvbhm2CXvC+GfxxYYEaTtKBUafiU8+euBNQ5Y8MONqBbDAfXBdIKDoZMnl14hSUbu8cs/06fwsEMjvvnzuo1L50EbLdriSVLkNL2csA+RP7CT17b/WaPllBii5qfbspJqDeXRU3GlfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KStWyzwadSfBKWFvsZ1/QfORuQcuqZdbE5OwMJBwLA=;
 b=uu+zq8HYpwq/OXSQqx0bfLnPJcQBYKkrXfCAzWn2Ne1v1Hp8IDWZyNLaJmFFyDjC9Asy4fxdnKWPae91wvQV6NvTc37PXNPTlzHdZw2xvDLoAXU3gpvjyVY12gV2/xD/bj/GWJwocT2PA+bDyHA2IsOZ+UU9z5+X2RHs+REgB3lOjQIJKjRoVuUlKpvIrAmAbPKrYhDxUKQGqzJYZDMEfSgIM1lH9GLQ6O28A/IA4H1sJwFKXNaQ4khhKTiHdn+iGAivF+UzmONoVAuR6uTZUeV5YSY7g+M0Kbr2NCb/jcQP7WT2ijl9uuu6ZS5760cIhnx3n6s5DE9Km82lXzj12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KStWyzwadSfBKWFvsZ1/QfORuQcuqZdbE5OwMJBwLA=;
 b=ppXb/BE3B3eJKww52ZrWbz8WLqc/9vi8FviJW5ee09cVQzQEw1eaak/FHowh88pSkzVX6AvNs0wmNYCyyVLBS8nxuS37MD2ZEJqFwUUK1e30B9DPUjrILceYxV+MbmjHzl7Ehm1c4Uae1ifbJsIo3cqbvkHjZWAIu5mrpsVST0SQ53gSLnxvmD4D3D+sHCqwSBMcOUcK0aoGX2O37AEVBwexQDkpZpLh6bgf4AZFd0DYOQE9qCxi2r9vhLn4UQgBSvID/8OO/xMxwdcPDySWVutcyqHCsf8lKZftNFIxVlxJ81Lx5yXYsMIbIWpBZzbzN355ydEyOgkTQXMOU9PI8w==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO2P123MB7258.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:32a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 17:13:01 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 17:13:01 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] leds: Kconfig: leds-st1202: add select for required LEDS_TRIGGER_PATTERN
Date: Wed, 26 Feb 2025 17:12:50 +0000
Message-ID:
 <CWLP123MB5473F4DF3A668F7DD057A280C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::31) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250226171250.2371299-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO2P123MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf7f2c9-284d-4588-37c0-08dd5688d30e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|5072599009|461199028|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wc6zWCKc9Y2ICCqZ4UP3a/5/rKl+HoX7SRTvhQnpJwpVn8XesYxrAGqGyqmr?=
 =?us-ascii?Q?Zwvi6rrIJG984fPH/ZvERW0bvstEes+rkYFe+l/DK84BL4qRYLtmiVgXcxKF?=
 =?us-ascii?Q?3DBj1AnFtRYZ7X2fyLam+G+v2nSUruWY9K7yV8cxz6pgmfaKO3gHrcEDuRFk?=
 =?us-ascii?Q?hAS4Pu6eSe6T6QWbeL0j9KMCcEHYMnZxADHiOToJGmma0LTYgt8/tTm4E1Iy?=
 =?us-ascii?Q?XN1oPlTrGeXyDNJAjoUJ7ByUVsbFp7UtcRmV61GilbnhCC/FgI8IXgVPwLLh?=
 =?us-ascii?Q?kguvh2Qi8Z61fREJIb1XQiRCmsc4d83rVl7wO0Lqe6JtVT7qidfdbN3IE0LM?=
 =?us-ascii?Q?Gt/5Jyfq27HA3KJkFiw465LpakHHl/Pgx/ckLHAxMG4A+I0DXBBtL39RytF6?=
 =?us-ascii?Q?QNWlDCK+zUXr8k0ahMfNEtkKlUbUdxuhcLAWI+vlf+cjkzBruOVbMfbH87Lf?=
 =?us-ascii?Q?nU76IcPtO+LlfSVQXvOIryLP0+7C82/DYBjMFTZAkqPkp9uW3dy4mm12Cm3H?=
 =?us-ascii?Q?Pf3waYSLdO/E88s4zXXY8OKiW+9DQBT8siXmlFFvcebsS654jnnx0mXMtHUJ?=
 =?us-ascii?Q?HXQhS2gXk5UPeNePYdZ6r+LWKJwJjHJcufMiun9Rfym++SAuzoQxgY7Q+Pfa?=
 =?us-ascii?Q?6yYBDHZhsktuHD0u+VEws8ZBXMdJYYFJp8ymbNB8/54CwbHAJ4FnxPp9/TtP?=
 =?us-ascii?Q?2dVlmL2B86ksWLW7EwIZ6txl8ZKP4jKnfWxTRUr8gN1YBswqJ28v/WrE+7Oh?=
 =?us-ascii?Q?WCyLyVzyiZK6JKofI+Gui329XXRXZODE1QX/UvV6Nz3x/+25nEKOKH9xyZxR?=
 =?us-ascii?Q?cF2sTsHe9QOvgdnZFFzxqnI1T4IM020dgfL32Uq6qQbOfxFGbHRAa5cW8CsR?=
 =?us-ascii?Q?mvwCciKp/lCw0XO4F00VFlfM+H4LIf2bI8cUabxL5SdzNYTkRj3ygkgL4zAA?=
 =?us-ascii?Q?ORWsTPNiRmYQrePMGH9jgbHQvUwYfy+TK2/uRAmREMcNONhG6qfsvMwhHo7a?=
 =?us-ascii?Q?QAYKYte1exaqgTHxuHWGbx2252aO31b+FObEmsETX6ulMzXGGh8fQ1Mlj0E5?=
 =?us-ascii?Q?s/scyzlXE3f5SsoOOfWY/ttjWqfxTg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4mAF0NO+lLqeAAIq+2egmexNcvfDdboMMMxBl7RsfSoeXODiBqJVz2yyDzt1?=
 =?us-ascii?Q?mRg1Nez1/yGZHBozoUF+1aMJgA3/G3ZLBtFj+K6GARt6Dm6rVxvebDzKSMkq?=
 =?us-ascii?Q?ka5NYge3Dv3zWi2dAcUEOzxu0OTKD7R/ggRYc751o7UH5fJyKNOzE7FKDZfW?=
 =?us-ascii?Q?AIPkrc2apxyefaUi+oESIQNmNvEldhDyLktThmRNHJEMw8MvdJDL9VqqbVCm?=
 =?us-ascii?Q?6Ln0sCR3SVDwUyxRCMr9f+HTCC/dSOsmCn/KyXxj8nKWGqsHY6gxPU9J0mQ7?=
 =?us-ascii?Q?1YbETWKzmzdxv3U7f97qNlSOZOwvx+lrx8DWGWRXcOs6hxhyRJufBaCenVbh?=
 =?us-ascii?Q?hIZBimUNf6MoaVsIyl12An93rrPMw0CBkPvUpCNMwKEJZDx83n5YyOfeyQ4B?=
 =?us-ascii?Q?OGtQZ4pitwhJzW/ueMAFWvjvOOcWiTQOccd5maEE1hRAJaooc6Wqf/bx/pdD?=
 =?us-ascii?Q?pU6nDLxRmr0U6ElIvNGygoAh1Esz3AFulXfyVMLyKMPrWZtqFtpS5TFxBX5d?=
 =?us-ascii?Q?kO/ebmNMs4uSrzCpmPd5E48mC+IAALllHFPGKSaxzUhr5UDmsHVvPMI8GUea?=
 =?us-ascii?Q?WYnQUyJXEOt40qCVEXgi/RVv8WKrzK9PU1vS4QPyhWrbPjSE7Qo6eKxLVqec?=
 =?us-ascii?Q?R9IR7/p7FqJfatMrl6jaqvUNceZkM0H7y3DsKGgzDcLC9IKpT1gT8+Fz23+E?=
 =?us-ascii?Q?kwsbP0wfYj+FDsSOO2KglolRJLmylMQWbjSeAf+EmLX7GntUWgJp0Yv6RBU9?=
 =?us-ascii?Q?jB0kn3oJYVBs5a74Cs/c10iBosJOZB2Dm72+31OX5GxQNcw7MkihLMK/wg0I?=
 =?us-ascii?Q?rzoZdwhvxgJLTCd87A10yR6ini5BfcChbTvSKUJhqTrAMLYpGphShqy/jeya?=
 =?us-ascii?Q?LL07JB/R37XuB4CMo/w8wSAf9FT0OT3QXsJFt6T93HQAvWRUcfoY4BsZUhor?=
 =?us-ascii?Q?VWwsVJ7ZpM66pXHnzCnHVnE+CyjDwxbwnkkzEffPTVd9IHLa5wqvf/Xvqgi5?=
 =?us-ascii?Q?gIo7h3mhlOB9r1PO4mqf0JnLWYuNaEQqA98HIz5DkshRxu7a0ZSFGWHS0uvX?=
 =?us-ascii?Q?BCqXq7ktGlHhEEEdQUUsb/U8P812iagW2XzUctzh8fxaiJMCIRebgSbtFXyr?=
 =?us-ascii?Q?vps2pOfTu65Bc5xkCR9Hxqd8oTT6wydRnFjjw4yx5QgR3sALcCJW+4b3KfWE?=
 =?us-ascii?Q?soslesFERqCf5QzJYlJFciyU7cW/OSIYIBeq3vxeQDJ9DJuqcf7Yhm3RNsuv?=
 =?us-ascii?Q?M6jB3ec2OU5qXGnzp98gk0JChZrkUXr8kIwJLLrO5NCXX1QBy+a4VuXSXDq9?=
 =?us-ascii?Q?zbc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf7f2c9-284d-4588-37c0-08dd5688d30e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:13:01.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB7258

leds-st1202 requires the LED Pattern Trigger (LEDS_TRIGGER_PATTERN), which
is not selected when LED Trigger support is (LEDS_TRIGGERS).

To reproduce this:

- make menuconfig KCONFIG_CONFIG=
- select LEDS_ST1202 dependencies OF, I2C and LEDS_CLASS.
- select LEDS_ST1202
- LEDS_TRIGGERS is selected but LEDS_TRIGGER_PATTERN isn't.

The absence of LEDS_TRIGGER_PATTERN explicitly required can lead to builds
in which LEDS_ST1202 is selected while LEDS_TRIGGER_PATTERN isn't. The direct
result of that would be that /sys/class/leds/<led>/hw_pattern wouldn't be
available and there would be no way of interacting with the driver and
hardware from user space.

Add select LEDS_TRIGGER_PATTERN to Kconfig to meet the requirement and
indirectly document it as well.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2b27d043921c..8859e8fe292a 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -971,6 +971,7 @@ config LEDS_ST1202
 	depends on I2C
 	depends on OF
 	select LEDS_TRIGGERS
+	select LEDS_TRIGGER_PATTERN
 	help
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
-- 
2.48.1


