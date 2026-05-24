Return-Path: <linux-leds+bounces-8300-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIWhGv56E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8300-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:26:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D615C48DB
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6BA63002308
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF58E32B119;
	Sun, 24 May 2026 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="puD0qWyq"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011032.outbound.protection.outlook.com [52.103.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B71301460;
	Sun, 24 May 2026 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661562; cv=fail; b=gkZNXEyFybWzQ8a9w0jhLyrBK7iFMysSEO/zdbo27ybT9rK2PylWIpplJiRVYhdB1Qw+hKKJwTKKB9VOCvlkNkp6lFd1kiPg4Y49kk3ija8nZQ5JmE3fZoQRK10LvtpyU2UctbTYvs2ynqM1A85gz13gIekXDfM8Caes5ImRcG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661562; c=relaxed/simple;
	bh=GLT03Z4UYggg4oAGC3vSyYdMLYptuK3KIeCcLnbQpcM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tu77ePvA2mv4+dboO5McCetF+RUA64/4A1dO379VdnV/k4FL3gevriuZMkaqaykadh12d+5LzbzJU9JbOj4pATZ6zWYzVbbCT4441HK5QpQOFuHymRowQm5huPiI59RWmHJarB1Dv/SHN75DPKaSTFDasHiO1XtUxrbUehPXcC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=puD0qWyq; arc=fail smtp.client-ip=52.103.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIGvDSJohGmwThkP/x79V64FcMvzRL5PwUtj3A9P0eaD0hjdPbN1JgGN14+FDJ00ssmUlQpaHZjtzdaSv6IdceAUHlgYMhTSjccr6I16oW1OHLPyfm9ofeO8He1mtRGf/QVrrSXEB+6w7blFMAtNtuglAk/+RsAOZ5dZddEDNvJicOhFjRGgwtcQff2O4tBpHmax2KFEQ5Lys1NCWwE667xva1JS/oBFEuyRoYjyvdujSX1qScOrot8++movB3Ar8Ho8+t+5YMxBvBPgauWkbWRdOhnikLRlPK7teib0LVnkxjkJhJSRB1m6OkJ0gsu/wP+/cebT5b2JnC856rncow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HNy9DayARga3gNFPXgx64PuTVCIj3qbox6O5Z4EZOM=;
 b=UoecJzEo171lppdbd6R9ZrNRfNLy/X8xkEp6SbDiYmR7Y9zMkreehQSKYLBHbIp2y0sAF253vpBX9/61gJgJ/9u2+akDq+aSPkEEsHRYSLlBR5I6DQDHjA8jP5Jgw46EiX44NPohbaxcEkybE6VNEEW16fnQw1QO9GoM5g3J6G9F/Lz4rtP12IT/hw1XMtPUUt+f2krE236uWmluMKHAt7A8gYxJZgCZ58soAZ+8gukj1Eu/9aSIdn0mfYBr2Pr2JRqiDTjNAgyvbVJ+Rr7SbIF4XV4Mg2yykvsjAKvYqvt/NWq1MTQ+pehuv+TzeFFhqLyrNosaNL0PjDp7tVmdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HNy9DayARga3gNFPXgx64PuTVCIj3qbox6O5Z4EZOM=;
 b=puD0qWyqmpc7VJPHwSumoDGGyT/Y+zOCJmwc/72F1ABXb9gWWujVL6X9MHTMopU72McsjvyBWeQBGjEPt9nmeHoNk+CHiGrnhsa+F+WjOfPFGNtASicHlgaLNsCyK6c7sXY10UD74Jw/GmjDd4i8NvPTrEEjWHpKAN8Lu+xMXDKDKi1GIRyJy+AMLmVpByTS0iDlLK2+iyq+f2Qu5fSBrLPWWkhc3p5j2O11/CKqD29ZASh9x5HgvE/CnC4me4lrZkVtG8BxJBQxpv5VVzWHqHmd/RF8cUMuqDeZoRdqf8MtcqtCFvHxWZJPQ90JmWe4gDQIhIhc3NL7J0dwQbzdtQ==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:25:58 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:25:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] leds: st1202: fix pattern_clear to explicitly mark unused slots as skip
Date: Sun, 24 May 2026 23:25:46 +0100
Message-ID:
 <WA0P291MB0385A39337358F03C2F073C9C50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::12) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222546.368870-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: dafb4b91-27d7-42b6-0411-08deb9e36da1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rgii4I0yNlumcOcTZDjnldupunfQ13rJcBsfgRcqEwY9qn81f9I0+iS8Uuwf?=
 =?us-ascii?Q?NkU4s8gPi3CBTszeMW8+LSQYnNO3YN0ZN+XldwifDSbmu/e7YeEn3GqPnJno?=
 =?us-ascii?Q?RYFNdLKkW61W8zRn6mq5efkUVPTIlzpaBsuwb5kFEEUQTZHpJR8LWU7kWPgA?=
 =?us-ascii?Q?34pMW9aBiJSQTjPwwY0FU2ZuaAzfdplOt2GeRzp3cgkg2hgUwaz+Sil+D3PN?=
 =?us-ascii?Q?48rUxc7t/5MiRX78uB32XNmrAtNnne6GZkBsZ42SN+PvGz1X4AIlBK631JJO?=
 =?us-ascii?Q?BNRX7YXp3ycazH3DgB7GRmsLyA6cNxZUoSMl4jlqKRzPV/DVoxM745Vge0Mn?=
 =?us-ascii?Q?3STqwm6EXLn47ahNwInLNW1ebTEgAhIcmcNjQmqLW2QRZ/FGMmqeRB6lUW7+?=
 =?us-ascii?Q?yxZwNzBMT3e2YuxW0hZJkwdzL8gSAcIXubkFcC2tpfjItE6L7NyyNSExjmOG?=
 =?us-ascii?Q?DCcQcrA7ygbo165NYH6n2Rk/9GuWnJ2QV6JAUeB4Fmh7CMvFW+g6kZ5Z5JWC?=
 =?us-ascii?Q?Y4dwUD30dkLt5Efu0HfCVEN5AR3/C4GhK5ILX42F6jb+03H8HtEVF85EQeFY?=
 =?us-ascii?Q?7DO0Yo7YHDVqUASZPCSnHERiH4cJHfdrFUG96ZxX5O6yd7WduJPRpvazwJNC?=
 =?us-ascii?Q?DCwDH1NRPyiAw/ENJD/3p4UIkXUI/YKroPjDCXdQw1T2Ct5lNiSbSSGwAbcn?=
 =?us-ascii?Q?a2fLJrKqXR+jsiLLahLDrUnIN3+mbA2A3sfou3sLMpuYJYHLqY5JtUlPepel?=
 =?us-ascii?Q?P0cQRTp0vlwarF7cDTk6zs7IFoQe7ky13BjkhVzAUNKrLDdI7ocU1uRsQ7QP?=
 =?us-ascii?Q?yBygl209k1NIhqGRyq38gDOf+OznALDLmhh7QNdAVWaKPsvyuy8lysZBqtv0?=
 =?us-ascii?Q?yODL4cV+bfVdZDGvraeBG8RdoH7Z+2pr58HLXbFL1yxSScmy4zvz20+jIWAZ?=
 =?us-ascii?Q?U1f0XPVkhKLoiGahD0yeXeAzlaSPgK/mILu6TI/QuR4RnzJhYTy71u5624VP?=
 =?us-ascii?Q?Y13HgroW/NZ1Rv6vdAma/9kWEK0Tmyk+Uck35pu95jest6o=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X6eOFJaldhlATe86W0WVLgtoAyelN0WIgOKrKsW+45Lv/0xbE06Kie43o/98?=
 =?us-ascii?Q?XPZJOX+RS2V0DHC5TP0ZEehqOa8s+8zD0XUJRBZHqYVRghqBcyEXq6eomz8H?=
 =?us-ascii?Q?RVC6QETciXcFF9pRURyorJKPBXJuBxM3e1fd+GMhQaUSmL/pd0y2ctTvw57k?=
 =?us-ascii?Q?91bqnqQW2Lh3tRqPa6apDbVYnrn8d83yo4hjaEs3s5upJ1RAzvx1N/DbHTYL?=
 =?us-ascii?Q?tUjr2VhQC95TukMBKWPWgYYglYaU0RiY36CHuQdlrzi1NfD7qUFrt9ePGkOo?=
 =?us-ascii?Q?Iwu9Q5QPUV5U/HizomCuO2FqED7hqEBYJAqbWh8m0ntnZSV3/OHqKhc2lUdX?=
 =?us-ascii?Q?2oYrMj5jj7HWRwgej0IHK7IrOCZL27wds9ZJjZCqgr+VIgB2x/ljoo1qrBXy?=
 =?us-ascii?Q?rILaVdVLTbaL1FmGD98LNxwsJbOh3v2MZouuLShwzKiATXzZZAf95SynHF0m?=
 =?us-ascii?Q?e21FepxWEId2tVeEfoC7l/f9Daci1tGwKz2B/FziCbKMxJd3ELlWntLTLyPZ?=
 =?us-ascii?Q?uvj3v4c7ypfn1UfkJEUVqVGF14a5/rrwqYTF/1QCq1LEd+4VBC3e1zHwyBBC?=
 =?us-ascii?Q?odzONltvEo7xmJQtG4Wfx3fpdzw++fuVKAct5roRE0wH3aaL7vCoTHwft42f?=
 =?us-ascii?Q?fRB7Tg913AT+tjMozu4tMT8/h2Yz6kxvRAvmyXWrEpbdxPsA2rxhAjrHpcaS?=
 =?us-ascii?Q?hSbVSaUQI/atrv0dfkWNhSwpnJk/ov6VuCpUyMPT9qvr+KKlM67BfPcknUZ4?=
 =?us-ascii?Q?9G2tBK3bcFCjRZqKTEH38/ocDXhkIcGnM2XXkqYmwa04r3OV+kbBYbbgmU3B?=
 =?us-ascii?Q?1thfK1reUIgrgkwvJtzDiRX09h4HpeF4/DeY6BJWEZlpkQ7JqffhYMOCW7KN?=
 =?us-ascii?Q?4BGXApnPYWHcF52DmrBhGGf8dZiN1HBL6Qx4H4A/QGmghX9m+wPW4YBvX1O7?=
 =?us-ascii?Q?VulHOkaTO9G9habLZC5GlECooPqGnUO+o75FiLf27C0WjqG359ytaE0mzCa7?=
 =?us-ascii?Q?OEhRS+SgmNc+CKw8glqUV28BvTnNhljNJu/l+3NrK6SiYVHT1k2WjdFIeEk+?=
 =?us-ascii?Q?q5SlQsAuv7+c6qvg38rqjZ2vAMJ9Ivpzz4hze4H88OK9OauL3CW4EmO2WyvR?=
 =?us-ascii?Q?hYW21paZyRH7b3cnEni1yCDY5FqEH8KvGTx9lS0sbYVmP7xtZtLle6ybgSqZ?=
 =?us-ascii?Q?b/ZTgAQkN2bbbTVBSfy6+ihTqTXfx4x5ojIdGBsGA6gsVzD4+UpgGDM9+yFe?=
 =?us-ascii?Q?doApsDzHzsoMeV9/Z2vCandO5nOTj22rNJe7/MohlgpWOqQ/3vKFr34TBQ+O?=
 =?us-ascii?Q?12rjQfOMElNtcnjChWaaxEd8/auNgTACYND3+q+NatBkfaYCBeXVYAFt/W+7?=
 =?us-ascii?Q?8jAThLjbNXxgIuFAUevvzvINlSQOgPq9r/42tlGnGXfeD+1tUtWEnCCKHNpk?=
 =?us-ascii?Q?2daS9Mr/ZMSaRVmpI7YjjprAdJ03fkDP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafb4b91-27d7-42b6-0411-08deb9e36da1
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:25:58.3677
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8300-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 11D615C48DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


