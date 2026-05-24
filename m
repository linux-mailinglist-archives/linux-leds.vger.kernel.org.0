Return-Path: <linux-leds+bounces-8298-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGMpDI96E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8298-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:24:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E85C48BC
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E58E630073DD
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7B53264F3;
	Sun, 24 May 2026 22:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Kro01wmp"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011039.outbound.protection.outlook.com [52.103.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7D301460;
	Sun, 24 May 2026 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661450; cv=fail; b=bkBriKvLPAFa/+y3QOlf/Pud3kXWHyrw/i3C9FUsAzEng7TaWpa6YCiRECpV2RveoBRFZNyc0PEFK3Vm9ZElh3yElUHrk7Xt9Zx/whk/L8Ithh4huriDWd39USJgqagVmCqTWXMqh602F4WGXDxYj12B1NZMBnhoz/d/JBA5/OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661450; c=relaxed/simple;
	bh=A1ALRhZoKAPzyZvP+kDJIuWk6axFqUNc4IAOf5/leOY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bzdq2DtxpI+dFQYcBGB3BWEMiIuD0JSR/dUqdvCwrqKF5nAt0Vpg938GLHadHN1j68NR6a1tnxGCV5B2Dv7C1R+01PG0AgNWSxlSNOTYIDNKLHgGB2qTh+0k2ymVGftJljm5X+N5fq/0lmoEC/RldKHrqhEcMkVIOhbsEN69gtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Kro01wmp; arc=fail smtp.client-ip=52.103.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6wuJ7GEfs1cAsQIdENVwtDJ7yETZUunO4GtRYCRUkg/A3Mcm4ITQxxgfMxOTCXfTFXdoRXO/+vhvUwF9cFXq9ejZcWGPw4KcY6dATsCE69TmA9gm766btAr4dCGpshm4jRNAh9ZrWHFQxIOzziMn1unhWwppwEyEBnUV19M4OU4fwwbi/Zlwsp96mj+/BEBuugDOh9mEAIsU3hwMczT1hLljBNMEON61rScdx9atSl6qrxt1jcZa+L80qsS8w4Cik3EzIYNGjfUvXKcKyP1CkYM5pQUnBlRcxdiwGJtM/YF+6jw4EVcGOFZufuf5sxVUPUFmSIPmF0bezWJdSqD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2Udq71Fx+JyJ5sIJiO+u3uHbO15SuomXlQYDr4c2V0=;
 b=dsDhDCq+Mc4vdj0DVgXYXHfzElEZvt9a9a+RJ3g8cZWvLVk2keKLhf1K/I+SnwzvKV+XyNDGVLPvctzxi4Q+YZFaspXQ9QnjeyQHiPsWXPUzgOjfaSfmKhgkqicnzE4DGplsFKvdNJ94vKwl74vnTHbKjPjXZYtYb3rSqPxO0hBSvCMg+yGXnuxoEjEJKhHGZMFQAmMNMFYqzW46vpqP0QMH8c3SwSDWlXe8rKTHs+jiN4MVhuAb9WSMPQHB5DwvqNh6TcIoL+9PycB665OYU1lXvXewln3q4og/Cs62lfyA9dnTg7o7DS3mv7OfRoR9TMgm5M8yQzl531aGqvZCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2Udq71Fx+JyJ5sIJiO+u3uHbO15SuomXlQYDr4c2V0=;
 b=Kro01wmpB9p4T22ELDXoMBVQavO+il/x9Ux3AXeIzoypldP0Q8zaKsR0yQjvJLI+h1dlgvBTcSm+04amqi+zRBja+lJrm7EpiZaIC7pjq6INQt26i68mQ5+m7NZ9eLpohFlsyJBpyAFKX1ffK58XR1iq+5rgpFIMACXPS1lSrXX4z11hmskMJut3pK4xX8JVwA1htFoq+/62KfOgIoGuUmcD9Jfhj6ki8VzD39n/j4+j/eUWRlX+3cciju11ArOAUvS0f31tWAchhbx3BLjiKAPBoZXq957jXS5rJikAyU7OXB7RIbgcbgI/Wv2wCaGeau3so0qTedAXhpWtYagGAw==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:24:06 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:24:06 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] leds: st1202: validate pattern input before stopping the sequence
Date: Sun, 24 May 2026 23:23:53 +0100
Message-ID:
 <WA0P291MB03853C8F981B67933616316CC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222353.358202-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: a97ffc0e-82d3-48ac-1ddd-08deb9e32a9d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D9cr0r1vOi9mNWF3LSiKk5tva70hVJyMDVGOyQ6cu9OqONqfC7Si829AVLBE?=
 =?us-ascii?Q?S8p6ZkwF0wnf1ylvio7zJX5yVULM+E0wVGyA9nQoyfxJpzh8SbBZVSCo9nn6?=
 =?us-ascii?Q?PwAAouy1gz8TLSVe8P2WNwpT/NSb3//0Z7MlccGzFyRsuDdhUpTlOwc51zVm?=
 =?us-ascii?Q?nblrNAEXOX4oA7rXUjQjRZccGLmKSwQW6wO23cD7rPxjrL/Ty9duv14WRja0?=
 =?us-ascii?Q?2GYob9f4qSyZI4mgkGYPmnxjQO3wxi2Tv/YJrr9M08qJUyZjF7ChzT1Ib9SS?=
 =?us-ascii?Q?3wOjUYgSms9wqBdDLA/qeM5P6Fbk9yhDabw4y55KccvN5LoIH8+Ps9qqrnw1?=
 =?us-ascii?Q?lIU0njnrZQZj0L+goQZ8jr7vDQvj5TGBT1Ay320xyHebBAc8jup4sEmM2iRl?=
 =?us-ascii?Q?m+sMnpvLe6O1O9snNaK6OpWjjA2bcyFOP+U1UxzOKUHj1opVTNr+Or4zbmj+?=
 =?us-ascii?Q?lLAyX5wHU3D9hfn5hq2MNVAuSL1jJaGh63xWsbWwIfyLGRhc8Bb9JxgjiGFP?=
 =?us-ascii?Q?tbdMvTJPk6X5ODJkJbdPYR/gVSSpds4iOFxgKhAWewcTnxGBYcolzMey3N7C?=
 =?us-ascii?Q?+Wiutj8kBgtk7tXDaEQTX6RLa1X5YiIW+DY8cFL3WLh2Vp23tNoFAmOwkLx0?=
 =?us-ascii?Q?foPDCsRtqIm4EF48GJunWgraoDhqw4bvtXyXXhnMytC6eMWvlrk31njguj3y?=
 =?us-ascii?Q?yYWwhlUudPD9kXofQVZHc4v9ZP60Oy1l/PXzx8bqArlut0I60gWKfsvIi4FU?=
 =?us-ascii?Q?1ZoHzKHrRfujYLgNRnZx68HCmkFY3kwb5IU+hudlEW0Hjs7siCEyDTfKtA+8?=
 =?us-ascii?Q?6LLfWDrlFJLVjhiYkXP7BLhs+63Ds4Le766xtwguhNw3e2hvDVc3BaSI/ntB?=
 =?us-ascii?Q?wKXv1h60PSrZ5MIQ0hXBMvcOogpxFMzIfVhONCjA5iQXqmo706JMU8gptsGW?=
 =?us-ascii?Q?KdoofDwPNOpBkXi7GhGUNaegDZAm9sa0bP0CmDVcSHBVl1eLpxyhmFaV5oIS?=
 =?us-ascii?Q?osJc0D/1GD5KnUS+GjQ7ptUNqw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?55CnreJGiXxXEBdQpB3XkWmT9mr736tOd3UUUo5iz8OledNRUK6xk3IY82tl?=
 =?us-ascii?Q?gOHxVoX7oA8EKz92bNyEm0704IsHmUSYxrlSCYb5S+Cu06e235c1D+EnYvRe?=
 =?us-ascii?Q?+588RodBZ1WvkCR3s2uokY6ZUK9Rlh2ZFQkid/kZGV0oruEGgfasuvitjaGS?=
 =?us-ascii?Q?lg3hFQxByFeCXJcO2r8Kqc7JH/oFxUp7i1utjUHbQTAONF95YTsdHExHbe1p?=
 =?us-ascii?Q?IRMJ9S8Dne2qNk6gjxzfTlFHTN++2h/4L4aU1GxQc+QL3MWIU44LY7IKUc8Q?=
 =?us-ascii?Q?Crbkad1tbiZzELChYKkjC297GAIeGuzqMG2OA7sk8BI5FKOG2tnt0zZQTzBl?=
 =?us-ascii?Q?OPZ9hNM87eNWYKkNjaeb1pPc+L5PIIpGKe1Uw1ZjbZztOAjRJvBnyeR/mhWT?=
 =?us-ascii?Q?cqtxZiZGHz5i2Jww5hK5B30L5NVcZGYxxijajczy7bFu13m8Sg9CnAKIifCx?=
 =?us-ascii?Q?8sc4oMPuor2UhKt2zHtRcV0UCjRbVlBYZXURpjWmKwl5kYVa0CFLnvRFpqFd?=
 =?us-ascii?Q?2S16Ob6VC9GvLl7Z0Xe1EM+Zf/shguZQxYrsKISDp7dbgGjiqSk9UFM2WAq4?=
 =?us-ascii?Q?pklXfgkVZ10c1t/xMkr6sj0sFx0FJT/POzRVWEcJ5mMjSoIdaXhlI/V5Mcn/?=
 =?us-ascii?Q?mr0eYRNek5YI0EPycALVfCaS12R1QBdluCFFqWeFbRds+q9kJh3w3ftenIT2?=
 =?us-ascii?Q?fmux4kvdy6C1kZOAugQ80CMaHfX3f/zwx0BXl+meX2fDAkqMqcqevPGCEzDw?=
 =?us-ascii?Q?vivvNG8Oe0O6XeYh01+s0dcBcOMVVsJcm/h3hljiP0OeD+h9tKgSf99u/jZ6?=
 =?us-ascii?Q?QT7Wbofkbq1k5F4L3lAI1IzIMlhZ31vk/L66Trcz0n+0RTFLD7KcdzGJjXWe?=
 =?us-ascii?Q?u/rrTjqjm1sz23fcnpErJ2mAmzBm9r9OWF0CNQPhctHP2bJi31vXyZQO0cxj?=
 =?us-ascii?Q?3hKTmwpQbAalmefv/lPagXZI7NZ0UhxSIq7ibWSA5sydioZ1h9H9SJBA9Mib?=
 =?us-ascii?Q?BtK1yrx0MKe3l3a4cUpCrbEPEWgZYs5Ff0Agut6zOMeTcqSfCZ8xk5EE3CUU?=
 =?us-ascii?Q?bcgV9gaPwppHaze/TmJQkOPMIx7nVR4a01mJeI61I8LcDMRlJIJsI+Sse+kY?=
 =?us-ascii?Q?8ZjwUxqjP+4D0eOOlhHhQeTtGXo/9OcVMYE71ds89qRFPJoIT3CWCb8ApVZc?=
 =?us-ascii?Q?QLq/uWvWjZpRn1OCZ7+67RPHzR7RrlfkckKRQAppYGwfE5jbk3m2tgKItjge?=
 =?us-ascii?Q?P+3lrePNNtO73uo6BQLMSsmv/+n5RaML10HyjzPK5+jhxUviczcTXhikJEHX?=
 =?us-ascii?Q?4vD8iEF3xpo7VCMTBnzO9ghPnDqMbB/aVLRi2bnAgtW4COc4uf3j/YHfGuTP?=
 =?us-ascii?Q?0hF9DXjwypVkC0lRBC4WuenmZlJkyVNi8yaExd8YagkpOAQBeFJARkpI1H98?=
 =?us-ascii?Q?YOipxG85zBhjp/XxzfY0ryfpq5R7RJbJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97ffc0e-82d3-48ac-1ddd-08deb9e32a9d
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:24:05.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0169
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8298-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8D8E85C48BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Input validation for pattern duration is performed inside the write
loop, after the pattern sequence has already been stopped. If
validation fails mid-loop the chip is left with the sequence stopped
and partially written pattern data, with no recovery.

Move all input validation before the mutex and before any hardware
interaction, so an invalid input leaves the chip state unchanged.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 28e3f1e2314c..5f4238181057 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -228,6 +228,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+			return -EINVAL;
+	}
+
 	guard(mutex)(&chip->lock);
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
@@ -235,10 +241,6 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 		return ret;
 
 	for (int patt = 0; patt < len; patt++) {
-		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
-				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-			return -EINVAL;
-
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
 		if (ret != 0)
 			return ret;
-- 
2.54.0


