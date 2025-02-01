Return-Path: <linux-leds+bounces-3866-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C94A24943
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 14:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9F7164D88
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 13:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571851885AD;
	Sat,  1 Feb 2025 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eFEObfOW"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012052.outbound.protection.outlook.com [52.103.37.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95E2C9A;
	Sat,  1 Feb 2025 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738415161; cv=fail; b=sgwyADekK1nt1QLwbNZUlQO/yi4kzJWXrTL2Jd9Yq4zb7ypVx6Yt+bO4JZzmzEI99OkQ2FQZOO7o1Mbfd9Fj29sQLP3dbgkHsxuutKGUm66OW4RS/NcwTLAq0/1tTBLU+UaVEz3TOqjsvtM1o7rwQrdxEaQb6aGjDP/3f5ZDV8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738415161; c=relaxed/simple;
	bh=CeEs0tEqh2VHiqu0nnNFXcqlyix7Jwj+FjjUb3X6PdA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJjRiEpgpPNjisK9nkGAEed8NJrg0LFN4p2vA5a/NVAcKJdKOogvan5rnAMpFdL3B1YTX+4WvmKo2e2bqTngooeRREOlUrzy9F3Rjd09cYg2+vx1ot2FnSmyTWCPcv30jbbDATpxumab908r4hriozh5t6uFycP/k/HyVLLpmb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eFEObfOW; arc=fail smtp.client-ip=52.103.37.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqiKp0uMKU9Fz+7+b5jV+mKWKj1Ul7xcseqE4rEnWc9VyeeSSAJB9damFmAi6B/pOEnfqcNRIlH6dQMIrqfeAyoGpQnv0ndRZO+3LCAQcJCg3EhDDsDZwscm6V5zr/1us4jnhqUzDEOoNbHbHQMVTWIRg/fxZa0uX1iD5O0ZL61BM5b7Ki5Q2e8m17SzDadmhFhjikgI8AOJwharibgK46xBm5ucyp0Mv3U1WvuTdc/HTSnxp+Aefo+C8xXZF/Q5nMuE5Z1uN6Nf58qrVCA+XZa4Y9mLu1xHDnRIrmfUtJw6e8uwYjyY+6eMNdnaEOQV/h+t+9wtvNu/hb6c9m6Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPY0T2zsvShqqsPZGHaIhc8jpaX8rvAk63Ts2YuoaZk=;
 b=CaZTKKWgwaWxsgFcHLtv1FJR4PTf+6jkH+msT5C0hIZKDM1hodfBQmkM2fSJZSnokIDdAqBWjyoU6msmD0UURJB0ksVyNIZJJbGZIMyEai75VISQ7+1yQbcmlRyAHdz8Qz0G9G7zKlm96lKHBp1GDkf2RjrGt3EzMwjzT7ow2EF2GUbLTsj2rcUf91vj5Yg45wpcHc8zhW7s83YA2FFEnbfrEF/AbrACG7xpk6D8TewtouiKl+KJXvYxCbsewazYNWUINIw9/TbRRJF6TassduAzIGTgaqasJhaCcuI6bq7BFYYJkcfvSYzqWAvlW71exm0/6a6KpYWwFkCVvxJVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPY0T2zsvShqqsPZGHaIhc8jpaX8rvAk63Ts2YuoaZk=;
 b=eFEObfOW3W3jdfYGy/NcmXcxNN1zEzcpa7AnXnv/D/IUzrLb227erCQLiEmUIVoeU3iukoEZg3lgJ9SmRLmMzGazShccUOZjDsUcVhsW259lJS/l5pP8fmwlDLIQuL4/XmU0PhUJdlxxWJnWbb0wk9goNhbf5Kiw5PAcILbVGvnG2YowUL46lkWVGbDbJoxdT9B65lGuaN7/jKNX84kjZzxmKJBBwzjPbxOY2shmPaH+5s1fW8rnQzSrEW3jL+dSBuJ1Nof6Icq1h8xDr1ZEA/11AeOUha2NdMmq4cRDDIZ9aoxnONAlDd0kIlfwIGuQ3eS3UKCvQrf8yGENX2gFqw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO4P123MB6306.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Sat, 1 Feb
 2025 13:05:57 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%4]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 13:05:57 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/5] leds: Kconfig: leds-st1202: add select for required LEDS_TRIGGER_PATTERN
Date: Sat,  1 Feb 2025 13:05:56 +0000
Message-ID:
 <CWLP123MB547316E4B06CC5985B22DDA3C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0633.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250201130556.1697791-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO4P123MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 3289b6bf-68d1-4317-fe12-08dd42c12ac3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799006|19110799003|7092599003|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6WtFGB2vsMkXvgTWdCRRTIdlwLWBTokvdD4m+dmy4k8p3r9FXhOPLV4V2C7C?=
 =?us-ascii?Q?XYaNWsejIP2I1UxTDYmyK/de5NYig2FU8JFvbFTM81G4tOVulPrjefS7+m3A?=
 =?us-ascii?Q?6fLldlSqU7NW1PXrcnS2KJYh0wWCKvM11ZF2KB/qkFfsgoHpMwcHUKphyrje?=
 =?us-ascii?Q?UhFfnuwHiSDO5HB3391FpbiiJTDXLV3cktznVFTdr67/fB/1bwYfiqSus2wG?=
 =?us-ascii?Q?RekYBA0yfGn4VMAXkCnKaoupX9iQbxTKmujukR6j/DZ1F10/wSQ1y70Gv6e7?=
 =?us-ascii?Q?JXPMff+7Z9WZFlb5ZI6D2nVEhUD5D3wbIWnpsoaMX3pvsTXWsythS47WBIoJ?=
 =?us-ascii?Q?SvzFP0yrieDtOl4WIMYAE/Q8sY23R4MRhQlXyE700dB9K4uRNbJsksEzIFVU?=
 =?us-ascii?Q?KU4vtebO3kc9SXTxLwansKM6kxkoezI+8N0r2unU2xRT7LhoRHQZ2+FA8woD?=
 =?us-ascii?Q?Dsh7Zbdpxuj4OX26dlXT/bTA5oKKDppqYB1e3uwLtR4RVH0JtE3b0ax7GcL/?=
 =?us-ascii?Q?XJY5wKZD2b7XACZ8CZ1Kptk1t/HlhA0AXa176GOMEt/naRL9ur1C0Bat1ose?=
 =?us-ascii?Q?Y70o3VxZp+X5zx8rK1ZHQXc5jM4knzfoQmZ41uk5N76qktrQlu27LwKuflS6?=
 =?us-ascii?Q?aSVJfpjuqpaE/Q3JgGSdfrs/3FmOZnZC+VE0A3WlAyuI+0eYYezIZhrEEqAY?=
 =?us-ascii?Q?PTj7/MHyqSxGckvDCsUK/x+4sPJcxK2TwQg8JDf75UNrl3eTawbYUsQ3HP7l?=
 =?us-ascii?Q?nj2SdYRk7TWbGW273erhHWcOLGiXDGc80a7RvplN26CFIq2jS61Bnjbo5sr3?=
 =?us-ascii?Q?TjEhXZjmfOnPI4+6+jofD/GLvDUajYiwRMzxFX6J02IJbAKauFGMqRcDJu1Z?=
 =?us-ascii?Q?7RkNRjgbPBGz/M+GiYeSq1CCpglRKKM9NNpxqd7OI7ZPwzGK59NSK0OkeO0F?=
 =?us-ascii?Q?GNVh59r4Oi3NCxUALMnRnYyt7FR5DcdkDBen3+EpuyLlPQdcdSvo1AVmsqrJ?=
 =?us-ascii?Q?SN6dfxVWFTslyywiHbuRUDaACEV+gRozHYCF6M9btLpH+4JFM+dxK5mmFCac?=
 =?us-ascii?Q?KzhCalx176FDopCJUfusv/al/zJqbw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ft1Efd3F/pKwm4ucAARDODFyT69kOgQJtmAqSD2rKCvkwP70Ql+O/VTqBr6W?=
 =?us-ascii?Q?VNFR6FB7jOy7MXInAQTlkZN6kNRghw3zOeDN3BCK9G8Y314J3gNM8aYk5Pvr?=
 =?us-ascii?Q?nhRZsNq+PmfkH7UxvAFgcNycVe+KhAt3aN1vPxNwWUVQ3BCV7iBNo171FLkR?=
 =?us-ascii?Q?dDTRzxRPIFd+K7O0oRuEJGwvqZfoYoyoC1vGjtQYmIrH6XSnSrVbYsZnFnFJ?=
 =?us-ascii?Q?hN3NAH6qbxzHqIrKRQveHQzr5OOuaylOy4Pn6oIAnsITH5hHcdNWvt/qwnde?=
 =?us-ascii?Q?VpjnAa3z4AGQzlXXGwVZOGKWgieOt8dSf3+6NOvCpWaRQjV1KKzr6DyHb8Nu?=
 =?us-ascii?Q?DY/njLmQJNb3H7G5eKkE+7/d1F/L5k/Th6144W0hk2jaVXfreDEp3iWn9RbO?=
 =?us-ascii?Q?iqcZGg84sZrbQhQWt62l86V7ePw9K7i6WQD59PSGJJTAGQdI/xGh7P/xr1vY?=
 =?us-ascii?Q?arjCUPZVH4GsqwxKMvjATEQfA8WBMI1pxKm8FDLbBCnmaJVrLsljbI58noIs?=
 =?us-ascii?Q?doEXr/EvhRQuDRjvHvLcyo0jsF3SbA0VpQxewuiLYGM9o3uH9B9dnXnyL54a?=
 =?us-ascii?Q?KueBCqVztlwDhyoG9vt1oJ3wYiSQFGVlpY3BAJxXpKoAGL+wzOlUQv3dCRNj?=
 =?us-ascii?Q?ggnFVnClQnlwu8TCLLZmWHU/bkRWyseDAU7a41u3JovjhLn4M0zOycKGHZEe?=
 =?us-ascii?Q?Biznks5Avc6KKFYIunb8hFD4LNFrfZ7+4xQE8aieV8Y+/DrJaw97egaiUcf1?=
 =?us-ascii?Q?haZ/uhi/yz7e5jDSoV7zOVIpvG5c7VyCynvWi40454szF8EZO0yZbiJIL316?=
 =?us-ascii?Q?gvAobEiVELWcuGulU9uf8h9MY8wTwzzY4WZYTzNpsobJF1jh8ZbOweFHRWoD?=
 =?us-ascii?Q?Q3tk8b1+VWxxOEqM/v/VomdQaGnE72hXb0Uygx3nh27sqoYGsVhnG6b8q7QP?=
 =?us-ascii?Q?aC7ML3GtNDZ26dznugm88z2Me2nQ+s/U2eYBr8uO5S0GXXzxuI8s3lNXNzda?=
 =?us-ascii?Q?ChkDOzuMR3V75KIer3elR0dAev6XOzMB+MxHTAAt7gfVIoibBlHG/4u1knq7?=
 =?us-ascii?Q?YXCWYAOHlKT1E9B+y8tIi5lsF+vu/cHM11baANWUAkHHauWYFUYPROBGIrO2?=
 =?us-ascii?Q?EO/M/ZU56RVlV7M3k5xRkXXqB1T1Qsi4Co2gBO34c6W3uwPVj7+4Wv/PupGl?=
 =?us-ascii?Q?rgaeoJHDuGAI4oEEbdIXc2pFCO6dBhAlCHNgc/OmD0Zl4hLVF8RAyIm1wuca?=
 =?us-ascii?Q?xOD4bIHdEp4aVHZSx8YeaeMzuuc3cEOUrwCXyQG+JD9uuy4waCTFg68008Nf?=
 =?us-ascii?Q?0C8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3289b6bf-68d1-4317-fe12-08dd42c12ac3
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 13:05:57.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6306

leds-st1202 requires the LED Pattern Trigger (LEDS_TRIGGER_PATTERN), which
is not selected when LED Trigger support is (LEDS_TRIGGERS).

To reproduce this:

- make menuconfig KCONFIG_CONFIG=
- select LEDS_ST1202 dependencies OF, I2C and LEDS_CLASS.
- select LEDS_ST1202
- LEDS_TRIGGERS is selected but LEDS_TRIGGER_PATTERN isn't.

Add select LEDS_TRIGGER_PATTERN to Kconfig to meet the requirement and
indirectly document it as well.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6efd514bfb48..b585548c51cb 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -960,6 +960,7 @@ config LEDS_ST1202
 	depends on I2C
 	depends on OF
 	select LEDS_TRIGGERS
+	select LEDS_TRIGGER_PATTERN
 	help
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
-- 
2.48.1


