Return-Path: <linux-leds+bounces-8885-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eCYaI6foRmqTfQsAu9opvQ
	(envelope-from <linux-leds+bounces-8885-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:39:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D871A6FD40F
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:39:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=MUM7fPRD;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8885-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8885-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A033104CF6
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A903C4B88;
	Thu,  2 Jul 2026 22:33:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013015.outbound.protection.outlook.com [52.103.33.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872353C276E;
	Thu,  2 Jul 2026 22:33:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031615; cv=fail; b=IAi4yW6lTtUtUYoFTUqGncu+Xbrz+gyVIG3iBL8CWUArxruypnuFVvoIYfvCbjkWTZIdUCj0+HdsY0rrn9FEXtwbIAfhUp6nOqbNG9VNFUlGF4bQXj7PvD9VkGtA5m2GBrRu9iMvScriV5cOxTBeaJHzr8fSWUkHlbktxMtPBc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031615; c=relaxed/simple;
	bh=Cpt4b9S+AH+wXrbq9aXygEZTDTcQxOIVHPo9qffitfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNJB9Uvu8JtmJ68zCk3QUzFssiEW4yJHWphPDe/PO6VynZ1CAnfjLwJilFgG5BPwAB99LiFJ8zojx3RzCkR8iK6laYK97gn9s/Fuug+bw8sv6OZ4/nufxXxHtRtudOHfw0GNVPwrZAmUnAJU8iVGV36FX4vF5ndazpRr6vA1M1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MUM7fPRD; arc=fail smtp.client-ip=52.103.33.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI1TdXGInJh/s11Kai9kFgDnb8PIs4BbuQwviMnItyvjD9nM/SdfMasb07xjVmT/YHb4AnC8T3z4y+Tdvuiw6pxJaIefcY2ERtNiTnx9sx0SI5M9n3G4epkpCZ1TRZxcn99Qcxvgxg8FziRCy153JUSvWPtZfBNKrNUhAxHp9hed5OobN1ISAZBcWxdohTRqa7G4vBm7V4f55aC7OJDRFWijkTxQMcGVB++m/fBg27QrKNkz/toNUbYGq/SAscMbadxN+Fo+MB6+2bfT7LXlPunO+cyalJp+rP3CThWHwGK9G0058GtSOOS5oPE9n4BQBBhW3SBrQXWUQpQCxLxfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcXiasdZnSD4KvPs3yDBRSduxa9v0dJJRbA5I2c+IGI=;
 b=drkjQavAP4S0cv7TNY8T0ernqXjTXAE1Gt+75zJcImnMeIf8bJisWVxM48lodKni9qTmmt8YRwrv/oJerepj2t0ABn55y0IRdiCGto2Hld2EmE0vIob1Y+ME9ru4aeHHEzdusOG4IAKNRHkDKfh8lJSTdVQrV2ILtRriPmFwCZ6jzKtp7FefzdW/GHVwOyGIM69uuGvlQVSg6gLh8Ubv+CuNcSbWTxed8znDQmckl0ER2pCxcSa6kqBWvCSi5K+ciuSpc10W1LSil6V3bFIV1fy9+1g5mKHNAFLwNIWJN7Cw02la5Vc8CGGEqxuG36bURBLEK1nyNH0g8DHptsSeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcXiasdZnSD4KvPs3yDBRSduxa9v0dJJRbA5I2c+IGI=;
 b=MUM7fPRDYin8f3EfBAc9cv30ao5A5yemHQPelaySjBfjdyIZ+YjXMkpMGj42cmPqE7BFjxxsC9uBIzA+HhsV6XAd6ZR/ZRmOvLl++w18hnDveSd5T3a7vN3XtmFJqfxYQWQ7pZ9VJW3SoxhFdxh3bqgWObq8pWbj+amxz7T3q9xyROOft3obg10ZTJnYp+QKDV6eFg2+Sh21xCN6nQk5gtkNF1WZIdAFKtkQqRS8g5ysDmZBh6fA6QyLCn02hRcxo5F9bjcSDoWCWjCtk6jMyZsCWvNg41uBA8hAmn4ylZTLIo9w6+k6V/JPLx2wbQ3gYIXAc4wcnTZ1trQ4cs3tFQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:33:29 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:33:29 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/9] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Thu,  2 Jul 2026 23:33:16 +0100
Message-ID:
 <GV1PR08MB8497570FD162D0D42A9864E3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702223316.119000-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA4PR08MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d71bb7-c21f-4307-c87c-08ded889f0a8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|51005399006|8060799015|19110799012|25010399006|23021999003|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sNbXizs+gPtyv42bLl0hFW+znqIlHF8vw4YwWqUePXrBcFBjtD0GcVsa8/xv?=
 =?us-ascii?Q?U5ryO4abxLRBPBFfPRqECgO0fOGUuTt7+eQ9f8L+odVgh+gmkEJut1s1gjmf?=
 =?us-ascii?Q?NDPCAT9tzT8wgyGyjEfADPtn9/p/JaqVfxJVaek1DLih+byLyLlS9jrUBF4n?=
 =?us-ascii?Q?7xZv1Krn/xQJ7KoX+AVajgD7/VCRC087bAWx+0Kp7ecpH7fa2aQ4HqJvh6Hs?=
 =?us-ascii?Q?0bXS1dDzodmCPGNixOG/Xt8A53ZQ8ZmCynPF09LXVxKYhwBVtv06nYPZ6DXj?=
 =?us-ascii?Q?OWkMeyqq6+pyF6f1HYCJKX8qOTVpFLbB5+jK3YJtW70S4+z5XmDRL0AGrOKf?=
 =?us-ascii?Q?5rYRcStN29Kn5nrrMOByjVSb6KW69tLM0GL7UjEvj7NwIiYZUafVOzHbLGFE?=
 =?us-ascii?Q?AT2tw5uZWPRL02NGAxpsR+DVQX8kynMbH7y3/w735k3ClWCTMlS2PZJ1BAfg?=
 =?us-ascii?Q?ni5NgnbcqbII2IipvpZrJc5rodaHrssHBAsIZIkK/SxO+/bHO8aWm2p84kZ/?=
 =?us-ascii?Q?J+N/RW/y2RzaGGvtEoVtJgkb3gRZBuTmUFuHeySsjS7E6Ndy3w9NzRLSVyks?=
 =?us-ascii?Q?CT7Q9AQOiKVWJdzV6FOi2Lu9QXjEGr8yt7jxa7msQRyLqba/HHABDYcKTnug?=
 =?us-ascii?Q?076KZJblPCysX5pd8D0S5+aUK/gydZVQrKsDIa5TOnlGxUu87y7xLuaw/Sqx?=
 =?us-ascii?Q?vzkmYOd0a8xgW2lDwG9MURaL3JyeggOE7vdRpwm5QNxwjbQqhf211VWe5irs?=
 =?us-ascii?Q?l00Eq/cONCiqR4O8+iEIupgPFLdLUdjqg0xB2s7PSHVAZKzCo8f9O7hOLWEi?=
 =?us-ascii?Q?oAQHCj3ehYk8fHZAKoSsszS2/k4bZSaSuW5RZhFrQuKMITaAC0CJkn+UBwqE?=
 =?us-ascii?Q?xluJxn0FTHC9NymE01JDa9+cBwW3Z3Y2tfzBVLfIdMpOqlzQj14MuRK8H0GF?=
 =?us-ascii?Q?g4fSKguHYPFVpXbJzhIkALM4x44XuCpQjHwEjm74yLk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?69VODrOUpJUDfyNkzwNRBB84h2A6u8otrG+bbVWosO2lpWIxoCFkcliBHfAo?=
 =?us-ascii?Q?Zvqsmu/MvClku7CHit4dQcZ74aKisDV6W8O++vXj/SrgBh+v1w+Pw5ADzhA3?=
 =?us-ascii?Q?wtiVR/8guMClk58IJOl/0+He3H9V+Nu8U6lGndL5s08RiPX3stCBD/gwutxL?=
 =?us-ascii?Q?LAAculrcBL3X39p/SIrhIP6Jnhb8Og6qdAiuPJeUgnsJlhThuo7mjJkhBjz6?=
 =?us-ascii?Q?1dUrTKlWbXw42/jjiYs1vZPslsI63IaV0EtcJGTv72m0xyBHtNnrkhIrUb5X?=
 =?us-ascii?Q?fm22fyX593xKqStX4GFNOQ+zzXDQXktB7NiODwnqZqqfX7c+6LIJDIGjOoXe?=
 =?us-ascii?Q?H6srpMofp4GJf4DM9f7BbR+cgwm1GOVRTtM3rpmLGm07IlvCvpjAaCdiEFfP?=
 =?us-ascii?Q?egfS69JEJotJQkaQcOCbDcT+mjjOSOmE0MyMfjpklIIO/Wkb/3FEHRdZZJ9l?=
 =?us-ascii?Q?kYsh7nRjORrmtgWoh2l7erqBWzDTFC3k4kymb5ypLvDL3W0Ls3mQ/1R5ERri?=
 =?us-ascii?Q?3HfWMA/4/2m/PDAvXviiyQHBmNh/6BqUNyGcpSTxqZc6maYlQ7HE7TyDXjHO?=
 =?us-ascii?Q?PXnysJht0o62vKufnTsIOiuObbw07P7tIbDEvs5Lm7ZjsK5Jxt4v4rgY4XXQ?=
 =?us-ascii?Q?vTMLeT9tnuTQtqREgDu7NPscnvtITbLwbl8ysEqXX8oZh/YqXDOQ1YSbFT31?=
 =?us-ascii?Q?dBfaIzRWpAuanTnY6mk/s0qvMupyMSQ78ddmHODBt6o6Ac8ubPe3lfa/+AHj?=
 =?us-ascii?Q?v+ZF7cxCDSW/ZTHO2LprpA8RybCFAL3aBK2D9G1D9SHHvDxiTfwz1SCKSKFM?=
 =?us-ascii?Q?4Ks965LqYdZQJ2owRQYa+3WTOt+izGA7zLQLazcRv+61QbLDoeJWetDAA8mj?=
 =?us-ascii?Q?xD/wBMjP6gRB87qnyjbVWnCbsO1KJeUIKg0pYBh0tUDTf87J8tx9cyW/l4bl?=
 =?us-ascii?Q?INKBx1UTXx5+cEJW70VZbIjeIXFkIlJCVRWJOb2u2CROTW0sPX+KqLtSvdLa?=
 =?us-ascii?Q?G8aMYdl0kiimXnxFwi0z9qudBT0OnI601NzVlxNqx4alS7rUyVbEOJnh8bZa?=
 =?us-ascii?Q?d75dhwQ7Kp5ldFU16Ig3aFfmWkHud72099kKIdUA9ku+FCDQ7TnpX9adTtLX?=
 =?us-ascii?Q?xNnhXp18XbZtHQLNG/PQMhJq1DpWwIaplk1ChkZoxfun3Qeztxbsb5QTHvxR?=
 =?us-ascii?Q?yoeGoRXt0+n/sMBnZxTycLvj3aQ3CsxiRW036npGi45sBp0YiPybe7ZNkson?=
 =?us-ascii?Q?P6RJLGF/93qNuv2G0FpOM+cX3s1TgCOYv+oBiliSh5OU1qNb0pT8KtfJT9QM?=
 =?us-ascii?Q?04ERcZb39ODZFYLE6CoCW6hpHodUSskABRZf9wm+YjkxgfS1zERNXkSGTWa0?=
 =?us-ascii?Q?sMTIWGTBSj4xulQdajcvldYmwUTHPn6IGmiKt7GflMKAiwgkMx2VJEg6i6zO?=
 =?us-ascii?Q?Gb6kNrvIZuyYhu28gpst7kDdoY82YIEL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d71bb7-c21f-4307-c87c-08ded889f0a8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:33:29.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8885-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D871A6FD40F

Once a hardware pattern is running (PATS=1), writing to the brightness
sysfs attribute only updates the ILED register. The visible output is
ILED x Pattern_PWM / 4095, so the change has little effect and the LED
never returns to steady static operation as the user expects.

The LED1202 has a single global sequencer shared across all channels.
Stopping it in brightness_set() to force static mode would halt running
patterns on all other active LEDs.

Instead, set all 8 PWM slots for the channel to ST1202_PATTERN_PWM_FULL
before writing ILED. With every step at full duty cycle, the output is
ILED x FULL / 4095 = ILED regardless of the sequencer state, without
disturbing other channels.

This also enables basic LED operation without the pattern trigger: with
the trigger set to none, the brightness sysfs attribute fully controls
the LED as a simple on/off device.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b8a571282900..4909985ade04 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -136,6 +136,8 @@ static void st1202_brightness_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
+	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
+		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
 }
 
-- 
2.55.0


