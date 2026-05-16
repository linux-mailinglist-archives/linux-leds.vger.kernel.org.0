Return-Path: <linux-leds+bounces-8150-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EKyEHKACGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8150-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:34:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0F55C18B
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2875830094CA
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DA329BDBD;
	Sat, 16 May 2026 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bw9lO4J9"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012050.outbound.protection.outlook.com [52.103.53.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056B5B21A;
	Sat, 16 May 2026 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942063; cv=fail; b=MK38aTJ2Ar1+8KHO2N0fIiAcE1a711kreog0a+ygtjCXZRke+WdIDs4jZGHpli/4yJJTJ4tN+yATDhaYf8DMotZL5FebD6+88wfFCghRMz1dbC4sEHRQLrCALolPQw8777GkZHkGmKOJieR+VEgQum5/GCUILB21PDgw+dxOZ9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942063; c=relaxed/simple;
	bh=GLT03Z4UYggg4oAGC3vSyYdMLYptuK3KIeCcLnbQpcM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PRixbTJWjumlFM+2HH9KH8eGwWF2LoyZYGEOHBe9PWpB3QkRRkg+yGuky7xox8WpazkmvR1EOW0nm30XY+Ez4CsPz60pYtxueOB8SxpaEFMBvnSNmxi+wo16+0OlVtWqL6vZ5MPVSrITxQzjS8SacuA5DbjH/uh0Pc4sp3NZW5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bw9lO4J9; arc=fail smtp.client-ip=52.103.53.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSewBHDlLPs/XUxsp63RFqy/UaiArM5KbT/Ze2TlySIqKiNJPXm9FXqORQhx1N0iqA7QcDv4jJePhhzmE2oa8J9936U/TwnxYPcOK1+lfbuS2df+OpE/AmAWRIqBXO+S33MkDGTfPby2c4a6VMTOLsbeuHuor6mgeQnMWmrMMaLxnmASSyPXG1MvG0wHM8H6des57rG+CVoPPXW5chPxmAHJv2FtwXzvIrFlHJpTvZB5jy2MOIw/lMWlHW0S+7VQ4p/YkRm1+8E10GFjiGvfPI2MZzeTc3NHsfTuumvsWAS9eNKAoq1/fYp9sfeMdisnGHHUFO7wJuxT+xOZJgRepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HNy9DayARga3gNFPXgx64PuTVCIj3qbox6O5Z4EZOM=;
 b=g8ftHiaIbplL+qPd7wd1O4ls5wh/vhmudxtsx6OgdfPFKKZJsBdKOn8pjTSPJJIT2x4yILtZdHEh2w2qigSwY4iNpEDjQ3UHdC84nDVQ/AmthkaEL9Tgb67I5NtDxsDVigpQVXzGkmAZ0lBstfexRCWeva8/GF2rywcez/vu6GVIjcv0NV+W3Uk4v2AXInFvO+6Jc9fEbKgnkGjinNSitt90LYuJrDF+fjoDMk6fb1YpVellKwuGKZj1Odrk2J1eIgC4QMKiKqTSVA5tyvLtrE481roNe7fe7lBN56+S5leRpmp/GTW5Xyv2wFJ5Aebjj1cKthp6v8UWGjcBTWs4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HNy9DayARga3gNFPXgx64PuTVCIj3qbox6O5Z4EZOM=;
 b=bw9lO4J9Iuv7o9bX5XVGeWJkdoK31VLooeSPhClFZmOuCdaHPMWAhhVVyrAZS3P5ZfY9UiU65uwxvvIxpFePVIlm6JOOI9ABE3kdZXfNk5GeYMR5/gLRhjMFQ/MACYDZwLO6AJ5w3tgvQKL0rYyYJf1R+3wLLPcQmdiFfVUfoXdAnXIX9j+r8UmxfuV6om92296zc6ubk34f3wilD+jHXHPGFxW2N0+VdBtC5N+2Q2J/lxZT2CmqkCAB6mRjSOt13GqKU0kSMgcADX1UyVVlPB/iIRPnDO7XlAeYb7qJ0Z2hrC0T196ceE2Kplo4mY4/uY3WdXaUMm4ZQ10RY78sWA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0132.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Sat, 16 May 2026 14:34:18 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:34:18 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] leds: st1202: fix pattern_clear to explicitly mark unused slots as skip
Date: Sat, 16 May 2026 15:34:06 +0100
Message-ID:
 <WA0P291MB0385C7F36F3D6D7C0477DEC0C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143406.1621466-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5bfd7d-ad35-4fc5-14b8-08deb3583664
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|8060799015|23021999003|15080799012|41001999006|51005399006|24021099003|37011999003|55001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GatKJcZKskY7uQnqUaYvigYej4Rl4Cf2YlY4QOd1smWrQlK+2itEnHafKijM?=
 =?us-ascii?Q?jx7gHsWndhzwOcsG2ouBlQhRuAsP7+qYQTkv4IfrUcrd9q3m3790KvymxWxw?=
 =?us-ascii?Q?cYUij+Pf3HhLCWD5hNj5llCU76FAB8bUQpKog3liuaEwt4zuOauzzONDBXgz?=
 =?us-ascii?Q?dFVw+MbRYqzBuoXnp/zYeEVf2wOUUBoyfcgx2iTabKEB5I1JKwqldfGsYSz9?=
 =?us-ascii?Q?WYy5Wy4hwX5q+iSWXOcVRqesK2CMKWDOOOJSwTCeTrSgbVyJgHKcGdMmrTmw?=
 =?us-ascii?Q?M1SuIJ/QqwftzBLw4DV2Fz1Gf2LRSCcmChbOdnfoHX7uIGGT/f4E0QVaIZx2?=
 =?us-ascii?Q?yWU57UjW1gO5+tLzl8Yz/abGdmHDVQ5wFxYSmuiwePyeoJxJC7IG8D11hMho?=
 =?us-ascii?Q?abbKVMxLhu6iclhCxwn0DXUpT+4WTNSb36KdqqiUNe+kEYO9TflhMuoEujtb?=
 =?us-ascii?Q?rSarQfdlxdtZFrePVQnBNefycAjGqBq4qXCU5KW4CEkErvdArQnWUBw7FGnQ?=
 =?us-ascii?Q?bCmhUtdGZ+OWbHC+bD+PCAM+cxznFhDrSDun+VrhT6SG2dxfUuOGFr92r/es?=
 =?us-ascii?Q?XSazGqsjPjF7DVfhmiRYbkWQtjqKON0Z7CLIBrO8pOhnOveLR83/JLeAILLm?=
 =?us-ascii?Q?XZiZ0svhSdRmwuuTRq8f57EJ9fK2CNluhM05fScTuze9kd0D3q9G1+Cvxlu5?=
 =?us-ascii?Q?kGd45CQej7C3A5Nrt+D+HAw5WSNzmczax1dFCFlhAHYGf1tSOFwox9pmApqw?=
 =?us-ascii?Q?kfMnp3eZUdrtb0P/37nWArWOXQMAC6KwW4nzrOR8qyqQ9aFxP6ktv4vWmddz?=
 =?us-ascii?Q?mSOkGHkY6vMBKhxdlCJg9UYzbiklrXq8h/i/azCuHbKD0l5HKUvT0wFzzC9D?=
 =?us-ascii?Q?OCbu9ubMXhekkXGdTzGUE/1/PqllfKrYm++aKOrC+ehoGyR7hzD662PWW9VF?=
 =?us-ascii?Q?yUTyKwPfQ2xV4WKhxG1IuBbqzlimkm5Ni8HWyXXNsSYjwm0vWf9erEVbNx9+?=
 =?us-ascii?Q?BJl+wZ3UZ+IvrmI7nYgN96SU+zDCwtMJVAS1Io9o3q7mKfo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0CFWE7OFiKz23Fqg708/fMY3pRpCgO9iBELsoCnTXNOgLxZ93TfgX+GX6bGN?=
 =?us-ascii?Q?nrv1uSsP8g9HwVFuc4tcCT9zOH4NyX8let8QuZmTJePgEjNFhZUZTJdtfWCL?=
 =?us-ascii?Q?01VBPg5FhnmF7o2xsVhONZPjb4Xpb1zyFFJxPft1xPnWhO/BqrQLsQ0xL7iU?=
 =?us-ascii?Q?aL+s/7JCnPrScD7sUzTME+u1TdzrAKrUCztAnBwyghqd34twiW5dIxRGGNRQ?=
 =?us-ascii?Q?ET02NxmAX0fzqkWw+/xWnoERY/H0Fpoygggtja8dAFky9npAmyLQZbUe/M/y?=
 =?us-ascii?Q?BxwcwH8EQ+ststESt+gJKL8vk1vhsHgacskO9GPilDQzeN7zVAmsVU5NAFor?=
 =?us-ascii?Q?jrq2mKtW/QE5mDCA86AWuaS2E89nEIRWIV1dK5go4HVhfaqPyJmwVHoVU69w?=
 =?us-ascii?Q?uuHWFuYErt79MwyyxWwwwsTI0Gvn9omH34r+PyNvxtC9FRAsagAHRavHtAy6?=
 =?us-ascii?Q?6h3isaAAcsaG0xV1UWEN1RlfVfLLW+O2o2Y7apGmlPtJrnYgpz1HZdZPzHBT?=
 =?us-ascii?Q?bpWPSIXPovZh3d6CR8rlu8JKf4R3334i9W9BAudkvnBHv83ig9/wxbBxanQQ?=
 =?us-ascii?Q?OjXxz+2AsIo6QK8O0K9utdlZSRWNzTX8WNWd3ORvisT/GqkgSs02I3/JiZPX?=
 =?us-ascii?Q?yPn+ocuUGxGtpxNSkcw4/dNVQhPx2OYE0zqshfT9WMYdkABvUpNasJVCv9jD?=
 =?us-ascii?Q?E1Yd9q8Odnr6ca3QsaZqgkYt0yJwUDJ72bemMLloQ3FrRBrpLxOLNi+zo1Cq?=
 =?us-ascii?Q?2UgGHLIqwhb6br48U4gROgE7WuDemAEf/Rqvyr7v3XapRmhoJwC629YQuYRP?=
 =?us-ascii?Q?BJRq17xmWRF31muoc3J7Nk3owRODt7fu6Uvv/xUCSuFr9AeEf53XIIQuZRPI?=
 =?us-ascii?Q?zl+LeM6GS+N6wwj/hf5sCDysyXSJlrXlDQooG0C+OjxrB5GrFaTePMmMLGny?=
 =?us-ascii?Q?Nw1px8kdjvPnICL1bIP8lAtYMX6ZWv6+t5uj6/jAVMOLRkn7ZS2mtRHiQsh0?=
 =?us-ascii?Q?koMLxTbwsnyBJ40vnF1wg3euS9UoJAyJMkIz8eNGe4Hi7NyQUOxNrZ30AQ73?=
 =?us-ascii?Q?thvJizcDDCjXFF0Cwh2+AsBVGa+zPLk4eORl0PusoTj5aJlKNrAV+FyCR6MW?=
 =?us-ascii?Q?5CDghX/2puzenxwcpg4TszqH9dljiTJw0ehONiBRIBl9Ly4MdAAlnXVwqJqC?=
 =?us-ascii?Q?LK0qwc625gwWuRR9IBb9Fv7xvj5fMipSuvLf9ljZcsi6N1M1CeeVIHKRvy9G?=
 =?us-ascii?Q?JfP7w35yQURNBon4y1hZ6WyrBT4hDE3NBCqZIOzN963+3s3fuqLfQrUyAggL?=
 =?us-ascii?Q?MrhAGfHBsadNt6Cjf8SRuHK62cC/2QurmLG+d/WU4xMUfA2iFSkZxjIi7Gi7?=
 =?us-ascii?Q?SzxFL13gKOC2h23LcVEN4gitgzPKtixVhh8Ru6J0SpYDu0F9T2j03b8yqjpc?=
 =?us-ascii?Q?ZUdTDpHB7P90hg4Z8IRxYVh711L9bDJp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5bfd7d-ad35-4fc5-14b8-08deb3583664
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:34:18.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0132
X-Rspamd-Queue-Id: B0B0F55C18B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8150-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

pattern_clear used st1202_duration_pattern_write() with the minimum
duration (22 ms) to reset the eight pattern slots. With the old buggy
formula (value / 22 - 1) this accidentally wrote register value 0,
which the hardware interprets as skip. The corrected formula
(value / 22) maps 22 ms to register 1, a valid 22 ms duration.

As a result, any pattern_set() call with fewer than eight steps left
the remaining slots with 22 ms valid durations and zero PWM, making
the LED appear off for 7 x 22 ms out of every cycle.

Write 0 directly to the duration registers so that unused slots are
always explicitly marked as skip, independently of the conversion
formula.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 02db1006fb53..1ca77fbe4ec9 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.54.0


