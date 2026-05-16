Return-Path: <linux-leds+bounces-8147-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGZFMqV/CGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8147-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:31:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5155C128
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A11D300337C
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19773E2754;
	Sat, 16 May 2026 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Eov58qHI"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011027.outbound.protection.outlook.com [52.103.53.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC70383C71;
	Sat, 16 May 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941856; cv=fail; b=HV3bSIhuTbwVzR9QZkLN+TOAEnWNVRTgzmT4TA10zT6ZsjAeyCGdU5YGOlgjPFVSf9ycYTdjkjMqTA0So+YS63QcHk60WDZsYm4+CVzKr5BSjyrY4ZUkQzvS/AsFWJ7SVcsM0iI1TDZ8pZ4dkgunm8lLoJl1FwVqpBndNozRBKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941856; c=relaxed/simple;
	bh=/SWGcYySxmDrKWc/K8OKU5At8qEL2v5xYU/qLouNZiM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ER9UepEaMMHkPHuejC7/90PwEy9rQ2FC6dirN1eCUnj6kIH0OB05ac7UTm7fypJPjNq8zP3OR+6rRtL43RVqiVeErEPlU2/B4j2lETBzGdOsMnrVXHrGF4jmyfPDY+MtMnNFdESmcSwOe7TijlyNAqNgDP8s35mFvDyIdvqNJSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Eov58qHI; arc=fail smtp.client-ip=52.103.53.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEpZy7Cha9mHVnfVueexw6YTwB3PX8bZAuY1kjNHkUqm4Mt/qpTxcZzDbYKtJorIL8gA6n/lciqWAmz0ERTx3e9f3oEvO1p8ZlK5yKC8ga9Tm8Mj+UW9y0A7Ucj2L+dZePu6vElaMFzdzdCMHgme1C6h01XIUVImTCDFuaHsugFZLBM6VzBPxMfe8MIQQY+qQ07VECuDILZO+FK+rbVVq9vaJgNXoQavrGrUZg0SmQ0KsSIkRjrGuFoLOOcyHbagt8ewYnDo268l25MbpaaSxFNmTmstaijoLMXDXGOz6x7b6UkgRFl1jEs3VR+8EPoP0myF91XzaolCUEZqYVcW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUWPF8g3P6NyHloE9iDXaDM+iSHphP+nGkd2f8iERWg=;
 b=g5OWaeJC6YwN4vO5lGnZu51Qf/8RhF9Pz9nZLLccwpCvPDZksV8GWpPDoPWVp+cqTwblMVxZXasIAUB2upoTPnWf7EtL9Vhyf6XZhxXOxZJQoHY5jjQVh5Gey5hGiyQG9bh1FTRriLhsE4XBDf6FuSoKYFGrSjt4eoDdcBMJUYMfcy2T/KeCl9/AOKqFgZS7cHLbhwDl7LpNjsfWonBugQR0VDDiwIGeu/G5dk6qkR855G+QQXeZaDtHsOvYMhL2XUc50LydIPaWoSC1LxrG8BTD/QnLY6FLzWqg5dz3WtkxPSbH+H2oYnBaXXM1w4xSHFY6mXmLZ0jPcZx1EmhNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUWPF8g3P6NyHloE9iDXaDM+iSHphP+nGkd2f8iERWg=;
 b=Eov58qHIPvpMBVPZHHlp3clnjKGXTyxInLEmf5WKTmDN41Uf4hD1NW4CllGhRExVHcwnm4Orsd7k+ZZDdSDDcZKkWFgA7FwCvzc2HjSAcO2zqV6aSdNuhUIyUzHA/bmLC1s1058AhB+y77TPozc7B53XflbevW7ilyZPb5O3CmYNjDFitGaoAF2GCyhKC8KDuFpm1NDF1bG+iaLcXWRQMCa4dQ+CId3UueEmyeylQ1SnTVzsAhiLYmE4/zXlDjP2Om59oqaHoYLRf1G15G6rR4iqMQUJdpmAaNGo0o0JSSlqIffvWUui6tEm2uZyR7z7AkvizZrSvFiGC3BD2uloqw==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0132.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Sat, 16 May 2026 14:30:49 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:30:49 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] leds: st1202: stop pattern sequence before reprogramming
Date: Sat, 16 May 2026 15:30:36 +0100
Message-ID:
 <WA0P291MB03850F4778E28095CFBE3922C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143037.1605261-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0132:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e5ee17-7579-47c7-75ba-08deb357b9b9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|8060799015|23021999003|15080799012|41001999006|51005399006|24021099003|37011999003|55001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?48H/0RucMUFoh9/Ae+n9pDngybNtWJ2MiU+rHbW2Qt8NjpqtutmJZ0LD2nep?=
 =?us-ascii?Q?tzcsM9C242vV2ESL8xjhXPYgjFt461AmQ6IlgKj/CUM1cHrIjZ41yFKMP/Xt?=
 =?us-ascii?Q?zjI/jMOqPhWNofg3Pb3+i9e84rQ1T62NEa/+fZvEGv5NhX1wQ+5VsjQtxwnl?=
 =?us-ascii?Q?2vFJEDEIvCJv3LEahixE6S4ZVmONj0/hHMkJ1PD/84VnQCL+UyK6om14Cc34?=
 =?us-ascii?Q?YjtNLEhMwEc1hd21LKRSRw/ZJzvboLGHe3ASKM0CRon6RHPvslddagKYZ+nt?=
 =?us-ascii?Q?hoTvluDvyR4Ieov2nNmHwmLrhjP7h0jVjuesFP8DBDjx9Grc6pTE+T44UPwF?=
 =?us-ascii?Q?khuzOyzHL/wNIgnuIrbgzEaKS4K/05oMN2c63lHwab0e2Wn3D4EVRt1jlv+b?=
 =?us-ascii?Q?Av185QGLPBYsn9nRXrO3KDCO9BQfRCyjmimhHoFSmtnOUGdmGgsgX6CBHAXI?=
 =?us-ascii?Q?f5f5NqhXX4jVHsBtbjaNxw6vCsPTf3HUN8HvAg+KSG5J66yFt6hX5puMdUxQ?=
 =?us-ascii?Q?mxN82ycVTNgOmhuVzHu6h3MOvCBvXOhvwJtjwSk6bRMLDpYAN97w24ces1s9?=
 =?us-ascii?Q?onDafcayHEelFcQii2W43Fz4JQfI7N8y3u/dRZq7xdOYnN/FTLwXbZyUciB0?=
 =?us-ascii?Q?Ysk7J8K3IR9IXRscFRk4QBy+fWJ2oN0VTumMAKIW58ieTYHcA0GaKUkBsGnJ?=
 =?us-ascii?Q?EtdDMfIYD5Yxs1ucEgdw4RWrbCHPZIAUr03DwMmEkU31pqqRqZtJMzyj5gn4?=
 =?us-ascii?Q?C5ZYHYFz0Kh89WuJ2UcOkt1W/jLPn4IBbnp62V6j44cWIyTdOgnDb/y5hcC8?=
 =?us-ascii?Q?seFTUcbyfo9s+A6/qs5Og5lisQddFRNN3nQjBCZVvy0IQMtl6CWRPrC3RyPH?=
 =?us-ascii?Q?F043uEgcHvtn1sy5LjxmQa1ZuPjt+gO1qQb/Ur/rI+UtjRhzgh7CME2Qug+4?=
 =?us-ascii?Q?KXaZwliC/LowEdJuIwZ3xge2W7qwv0N67b52D0N9eXy9K06HIoXEhtvLIlpF?=
 =?us-ascii?Q?rpz2VLUDaLOps8hcs1mSpLzq/94BD07ch0NVJn+mO9+qaoE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RXuxpQx2oJt0pgB9pS5S+u7PvlwA4xRa9efsqkd6n/vT1N/5yCgyfsYALNwW?=
 =?us-ascii?Q?uhTQ4GuK84MXuc3Q6uY8mAlf4bSNqgDer/yW5GBZ2hl1pJ35dMlTzmQA7L5J?=
 =?us-ascii?Q?EEOgkCGEpBFrN83rRjGhyemYKc6L3Xwm2mMLRkfKHlQRcx7Tw8VdzVTH7KWZ?=
 =?us-ascii?Q?JJ91hKyJEbiVxy2ea7GaPSVn1MB29GN547N8moeFqtMEbrS2ACWbTZfmD4nx?=
 =?us-ascii?Q?HjRp8dnKSfyI3+mw3hKr22YlTTuCXhI5ELG7uX37vMWJNl5lgxjkJrJUcvtt?=
 =?us-ascii?Q?CrT5z5V+QYXHam6zfwT4/iDAMDkpyrMN40z4oXMT6awUctHtzqPPCLrRKKTs?=
 =?us-ascii?Q?o97ylW7+rrlPNjcLPB+P0UZBJSSfC325Q2WWI2LUjt+cd88umCd8LWMLhnh4?=
 =?us-ascii?Q?WNNwLVmv0SzvY9MU06Q6/OMwItHgZLsbK5pYrNPqjEo2tGtwicLHad3duY49?=
 =?us-ascii?Q?9L6BqZJRg4P38UijTxm2ftiIJvSCNMb9SvpDeVAvLRleikl2REoD0Lfc6+hz?=
 =?us-ascii?Q?M1F/y8t7WrehwhZhoy8NvPRAxYR0GDtAgrr/p31JX5rUtfkKRkxLL8tFiJVR?=
 =?us-ascii?Q?ApFQ+CS1JhdEla2bbdTuiwpwpTKM3gPo1P8eC4Qvb5mYf6L8UVmgy4eOJOCN?=
 =?us-ascii?Q?1IwF1kAbz2vSW7B+Z7UX+9MntDvUkTva3DJF6ypyjtQk7y/c/iwuTiJfpOmQ?=
 =?us-ascii?Q?+s+xW7uWiKpuDlNBLRMoJ9RbNpokBZUXbXO8J3hNdBJkMpahvjz3H6jMyMwI?=
 =?us-ascii?Q?MATYUvBd4g4eLwD+DqMzbhhSaYP/imIaGHownjAPkvo/aVtYURcpw5hKDEfL?=
 =?us-ascii?Q?acagttdsPAL1EzbrRjd8FrD+iCXxjYm9vPpBdZ4GdzrIqMUqcn+qCxiEnSFu?=
 =?us-ascii?Q?Hvlbj1bOh8lXL+9LAcz3/tjBh8splLewB4J/eHSo92sFbRPEpRFYQIi516jf?=
 =?us-ascii?Q?BQ6V2wrwjPowAPDc6nmlYY4Bb4HwIsk1cu7i9507ptKuOVPDAh5wLzaAhjaF?=
 =?us-ascii?Q?w6Bvbjy35mR0eRqcaEGNq2ttjq1896ffiGjhnJ5z1+smyX/hpwKo11XUV8ze?=
 =?us-ascii?Q?SJW5sBSGCOT2L/azStqXQK6kBavMawN77HDgZIZnuTVxet0Hfq3vkjoTa7c5?=
 =?us-ascii?Q?6FppvZC3m4i4hP7a3XPc/GOrzahtAPG31PycGkrJyD844AvJB+BJXkqrC5EK?=
 =?us-ascii?Q?0nCeSq0xYKDvztgQs0ipCymyOa/2YDtlQKkkFGSIWWANuOu0/BFoofAllFJH?=
 =?us-ascii?Q?wgzu3jLaVMY5etNZ81FU1Dx4ry3/9t5LDHsAV6DiddjT9wKJg6bNKk42KPhS?=
 =?us-ascii?Q?Pg//kgua2yEl/thlw9BkTOYb1dhx/+8fStouzB/hcG757sbpLPYKlwXfdYVS?=
 =?us-ascii?Q?hFM1n2EpKL3P7zv4V01Setb8CqC9R1CGzcIcTu8Y1SH/rUAtmF5eSN3IIbsN?=
 =?us-ascii?Q?QTOB6p9IG05pGuk3NMSZdPi4QVJI8jBp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e5ee17-7579-47c7-75ba-08deb357b9b9
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:30:49.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0132
X-Rspamd-Queue-Id: 65F5155C128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8147-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

The LED1202 datasheet (section 4.8) states that modifications to the
Pattern Sequence Repetition register (PAT_REP) and pattern duration
registers are only applied after the sequence has completed or been
stopped. When the device is running in infinite loop mode (PAT_REP =
0xFF) the sequence never completes on its own, so these writes are
silently ignored by the hardware.

Neither pattern_clear() nor pattern_set() stop the running sequence
before modifying pattern registers, causing any subsequent pattern
reprogramming to have no effect when the previous pattern was set to
infinite repeat.

Fix this by clearing PATS in the Configuration register before touching
any pattern registers in both functions, ensuring the hardware accepts
the new values immediately.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 2b68cd3c45f8..28e3f1e2314c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -200,6 +200,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
@@ -226,6 +230,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < len; patt++) {
 		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
 				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-- 
2.54.0


