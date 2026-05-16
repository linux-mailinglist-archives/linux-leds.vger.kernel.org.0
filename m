Return-Path: <linux-leds+bounces-8152-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDb6OOOACGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8152-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:36:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27A55C1BF
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D69C30054E1
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDC63E2ABE;
	Sat, 16 May 2026 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RETCoBWI"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19010011.outbound.protection.outlook.com [52.103.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4873E2AB7;
	Sat, 16 May 2026 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942175; cv=fail; b=YzY8ckpIV2c1mnhO26476iHgbwpy33IX/154xsf2neY9l5C5xH2Ac1+Z8hO9uWgGK0aPWLiCdbMbiNy/k7pDRmKvffXLNOr06wUXcRt70xi9lv+Dy4174cSYIDiPDTDfqhmfwtDse54TXrRmm4ReJQ9mOPY81E9pEokwP4Ssk58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942175; c=relaxed/simple;
	bh=VYuWqsg8oZkA1ysHX43GR9juLQbrwsvy4XOzkJ8B3f0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ggk1Xb/Yj6/akES4pTl4qUZh5egrJQh4uOla6uRsex9SJfglo4PnMPt1K9++0N4zAirTZBiuJbUUtwLXDiTPbMgJmOzwiJcY/Na4SNdRgT8Pzkecgy9HJtWe0nvcXC0/7n3FlphFPwT5JWrzmtCTVZjrS6+VpDcMGmrwzsE6YMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RETCoBWI; arc=fail smtp.client-ip=52.103.53.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD5kTwbxsysn59qkSUuzrtTh5Ark5N9cVJwnU2YLfJv4LPZMerW6df1w5d3XPvDd/zMAXnbtb2rgetyrmgbWIbEhw5bBRTkqwN3JVpCmVJViTs1Q8jqq6hRdDQ1r6Vx+9y8IGs6Vk/iQ4DJtWxW0d6swOFKtfpepUOl2weJ2TJk/JwxEtPDEHDVOr9yrTcHaAre1mOBmpIqNNifJoSCsjeYuoIqLWfuKTUuoKl5vMjvwPNGrW1ju7DPwVxGpaYuCCpyBZZbZZS0d9CPK7t84aq1cCFoadE7KfktcPKo4ub8I0j1htwcB4/noa/vDjPb2R/t9IeEuLGcyN/JfchxmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBEAiOFuimL+vCwuyGLyHYMVhpjnH6BBH9M+SHiVXsw=;
 b=RgA7MZLmxc7YXuHqVe+XDBWFRd5qfWhxgSgISjGwYbhrXxOfbOsc9Wq9NAyFoiRkLpz4Toda7VeeQqjABCzqKI84270GuLT0HyL97DNWgTBV0KbEi/VJanDP+Bd2UeLgiWsiyEMOumFQ+AYMDTtDKSVqB1VgglYvG+lDvp2sh3RUfEPQYM2qA6fnV2AsmW7id1/OntSAGKMh1pzDiCiBV7FQ+YRczD0V+VGfzcYQAHzcFDl5mGjpbwd2ZnRPvyo2jvV5DxtmmV88mz+FsqpXEfQUL9obZDfiTvPW3898nqeynRxbzSWAIKqlsBcIEWVi8bJc4kzH1KCRHhE0X00wEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBEAiOFuimL+vCwuyGLyHYMVhpjnH6BBH9M+SHiVXsw=;
 b=RETCoBWIMYKDH7potiZyM/iUoEFtcdatizKtMZwbx2Domx+eA28D/Die3wqoFPwD9obdVCQOeTz0RvCP/wyEuSiYqp6r0kN2RVU5GZJFRFO/5yfkI5QM/UqljiefNIlLvRITNWNCuYJV0Fh+F5r9F+11XKFRcOW7RbHws2Gm3LU6c6iG5m1s+a+YX8bu8oqP/eryFKVTJx99xkGTSTpJTDvF9BDc3uvG0J2HQe/nxYwlcnqujlynVn0WAJijfporFKfBi4Y5gO1FUbcqfhoNAbsoWpcYs/CMhVijbEptVdgyhIuOCIc+sjoP9A4yFZrVkcOtg6+KC7mbD+a1FBNEoA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0061.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Sat, 16 May 2026 14:36:09 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:36:08 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] leds: st1202: restore Pattern0 PWM to full on after clearing pattern
Date: Sat, 16 May 2026 15:35:56 +0100
Message-ID:
 <WA0P291MB038571183812A7CF0BADAE41C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::7) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143556.1629838-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0061:EE_
X-MS-Office365-Filtering-Correlation-Id: dae484c1-4111-4837-099e-08deb358780a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|19110799012|8060799015|41001999006|15080799012|23021999003|55001999006|37011999003|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bsnQJ2q7HM2LRgldZ61QcX8nC7l8yG0FyXiNbt9127H7k+4BRTCefOFIg0rc?=
 =?us-ascii?Q?0NCXMifaEFx+gjQNvDmzcXEv/29oCSMKhBmuk0smLBPXJrWtFiou1ih1RejY?=
 =?us-ascii?Q?fheSTOrNtzIwqslXyXaFP5ED5MXjcvHH6YoBWa44rE1NJhIgKNmj0PF3Ab6N?=
 =?us-ascii?Q?7TBdzQOS+K0mm+2pxAUz33xcQChj75HU1ZOB648qDsLlkNnQSipJdOL7laJh?=
 =?us-ascii?Q?ifpeS2mabLbP6aSzqz2Rt3DvnIC7OIxCYmeO+Rwgq8Oi4jeZRQNAUlfNWtkj?=
 =?us-ascii?Q?VQ5P+nuKPL+FksjaxUaBnvtyWBxI9amwNOLejDzUTcOtlS2GjYKshX3SXX+a?=
 =?us-ascii?Q?tTNMVhAY49iQKwUY8QWwGL+7QdLn7eYxiCf+7xo1jocLjZ0X+aeRYMFDSgPH?=
 =?us-ascii?Q?w+WygEQaIUMm2Go1wrZDPkK+LYZ9fj6tSk+rfpRzDvUvJqyL+xgFL3SYXJuV?=
 =?us-ascii?Q?IzowQHa3ZmrQSSX9akRas7UKO/G0aQeMl5tmgUjpqrWYaCLzhhwkcNK7eeVI?=
 =?us-ascii?Q?1dqWncyRnWEI1RT8J9nmSb+rcLX3/+fc7UBOemU6WZUbhOn0DuD9F7YtcPdG?=
 =?us-ascii?Q?L6LDu3eZOME5XSBWrZs5KAkDFYH8l/C1daHmInZBIS3+pzKUHCG2Tpg+1C3C?=
 =?us-ascii?Q?GIcR4Nbjh5HfEoaKxiWKn4FAnIMn2UtljxbHmh/K0BuisyCXu0sY3jxSO9/U?=
 =?us-ascii?Q?rYqkcL9FGJBARCaPlaqTS8H8RVAOqa8cwVrCQcaG6Rxsha67uZDx5KPic2Jm?=
 =?us-ascii?Q?xcxlYO8PHwp5BAEBZGKOZ8IsDc8UG960n8OtvFfAYng0dFfB91iSi5AMLAnx?=
 =?us-ascii?Q?4hsU2RtK2pwT8Eor4c2NbcJfSIDIyK5ofI2vQGo1v49Jv747+4GNcPSTlxzt?=
 =?us-ascii?Q?S5tzER+Q4OLOfyOaQOhmKwSfw+XOu9Zu5lU4zE7wtyp/FVfFVMvC9QhCpFTF?=
 =?us-ascii?Q?AyOQfBr0qsZb5smyF4Kqf02OqdCRxylD95JmHC/f4vs4bBgoE2bQ6PrZvmUe?=
 =?us-ascii?Q?VNIjCiRv0O8qgjaefW+ff6/tIYPlAPqzmsE0VHrVf4FqT2s=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPwplItkB0WE05pDHIg4+F1ScOwxEi93SkxY8F6Qs+/NAuotOKc/yv7sG1V/?=
 =?us-ascii?Q?kjvaGXmxVjeXUlXmj/tv1Xxv4d7NpOfO2ilVn2algIVTrrp46yaDIlFI7NUT?=
 =?us-ascii?Q?bo0g/wTMHfBan6QPJQRy0ojslMeCzQPotSYlioxRl4dZ0+45IKlHDs/lDmZ2?=
 =?us-ascii?Q?nDLlEj0lhqwjYK3+jtLKoDmhAOsEiHIXTGz0NYSHALdUPB+V8AYW39Ez+EsQ?=
 =?us-ascii?Q?HyIt9wG7xtIETVG7JZLIRQyQfpClS8/yV0JziJMltIrfsEpQwk94PAxuzwcS?=
 =?us-ascii?Q?jzL8+a1EAcbxv+RhqR0lxhttKQttWmGYBaK7kVHMmnU3ZSGypwK58zZ+GuJY?=
 =?us-ascii?Q?oMG5eRoFxeQ1+Y+s75xNQI+Vsvt4+M7GxzdYvxkV5mcB+5sMkb537XFpHh3q?=
 =?us-ascii?Q?qsJb/cluIOc+9nn3p4jNZaBy7oJfoD5mAbxzY8o6VafqAnHFwWFcl2KyKcpW?=
 =?us-ascii?Q?Ak/JMoU10rUUTwRiV4hscvfqDBqaAjOvUFqCUNxqvgoxzeym5Ov8F0xGyZ8d?=
 =?us-ascii?Q?J98jROeUZE3g1L50egTesXG5MLOFmI27yEHrACSvLsDXaAXFBICYgtcmtJWb?=
 =?us-ascii?Q?ZpsgqFIM7fRWPiVeuN1gfpqRSN6DD8XwjI8ZY2v2mXqM+ogMs0KmNKG6xfCn?=
 =?us-ascii?Q?wrN+TWIaU0iuIOxyp8X5fJz2PM9mGJb8Jfhte28SRLT58zEY/NpbiJNIY6RC?=
 =?us-ascii?Q?tWAfTvXT+2eW7cGlAUSQmVGE8TVVDi2y8s3xjTodPO+RJam3R3YxL8s12VD3?=
 =?us-ascii?Q?PZlbHEwg3+XPEG2JifX4hBKWcJIBw+703aXgNQ+XW7bCkDU93/9h80omA+cp?=
 =?us-ascii?Q?2ChKKF3b96RjusHzCRfAg8JtYEh5YoIeptELE3rVYssIgwhPnY84FL4w+fTa?=
 =?us-ascii?Q?760Vu3BVqyXutJL3B1ZLlQ885+uVpvmcGp7tv60NvIGk9umjVkRqCqWeOU2D?=
 =?us-ascii?Q?lv3ofZjWTHrNOQdV6WrOSNMOSkCkd9ZzQHdgnHTyZPQWKlKQH0g/0hG9uNyV?=
 =?us-ascii?Q?P/sYFb4XUVo+UkqDz71jT2/NPjLbJPMltvMONwyzrjIicU3uJxfQ+tw/QVA5?=
 =?us-ascii?Q?bO5ATd7Ak5ZAoSdianb86yUUW4h4P/4icDDltX8361CEgT1mcS0Rn7JtTk4e?=
 =?us-ascii?Q?+mkUjti8H7tQGhjzswa6a4gPrRiPOWMppqF2uTpM/QuHXrTmOi2y4hg9SEWr?=
 =?us-ascii?Q?fFLeMMAfYcS+ZIjO6cThkF5I3xRooBPo38gIlK5vY9XXlWVn3pA4k4di3KGF?=
 =?us-ascii?Q?PZWW4/nquTJcAkavmhPbFPPPd3ZBPfS2u3lR8/iGpY2kcsGrBqfpxLmynH9Q?=
 =?us-ascii?Q?3btMHjGGZt+lAVUyDpeCR92RWqz9z9/7ZmQ1NIwNU8SjSiZxu5XDGZ7CNeZf?=
 =?us-ascii?Q?VE7sM9mBE/0MT0q0E/PLDazhjeCBODmlx8gz0RLyIn9fCcvnXD8qLJeZGq3D?=
 =?us-ascii?Q?UMl9F3E/Xl3q2DWJBvgnB4i3x7uh2Pwu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae484c1-4111-4837-099e-08deb358780a
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:36:08.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0061
X-Rspamd-Queue-Id: 5D27A55C1BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8152-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

When PATS is cleared the LED output is the product of the ILED analog
current register and the Pattern0 PWM duty cycle. brightness_set only
writes the ILED register, so if Pattern0 PWM is zero the LED remains
dark regardless of the brightness value set.

pattern_clear zeros all pattern PWM registers including Pattern0, which
means any subsequent brightness_set call has no visible effect until a
new pattern is programmed.

Restore Pattern0 PWM to full duty cycle after clearing so that ILED
alone controls brightness in static mode.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 9c1ae35dcb4c..933c50c317c1 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -35,6 +35,7 @@
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
+#define ST1202_PATTERN_PWM_FULL            0x0FFF
 #define ST1202_PATTERN_REP                 0x15
 
 struct st1202_led {
@@ -218,6 +219,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 			return ret;
 	}
 
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret != 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.54.0


