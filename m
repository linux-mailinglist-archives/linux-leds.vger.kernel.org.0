Return-Path: <linux-leds+bounces-8886-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GqvVDCToRmqGfQsAu9opvQ
	(envelope-from <linux-leds+bounces-8886-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:37:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92F6FD3F5
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:37:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=fmKS8iXo;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8886-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8886-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7C08301F1DC
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0217E3CFF46;
	Thu,  2 Jul 2026 22:34:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013085.outbound.protection.outlook.com [52.103.46.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A93CC32B;
	Thu,  2 Jul 2026 22:34:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031698; cv=fail; b=dNObbggcp/V8ojydcdsTSX2mOmVbLyUHZ/8mt1afq4Os5JEbXmRTF6A0fOTB5kzB/edVKDF2r6zS2hSiVUoT5vTJyCW1QzpIPEbf+gYjwunGbdCRCTaT7vEgz+M9S0nFNbEFCvSzFbZrGC2iNuuWnzdHrtvnW2ocnfNb5srxPto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031698; c=relaxed/simple;
	bh=u9jBK+2dcKy/dAxVLQPi+IarBcSNBBzpAvGCArnmWJc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KTmNym4BweZTA2tvaWqI8mAwRc+kZEWh1H0YGyL0s2zELPpaLAdxxx4K2i3q+b+v7r5qYhsNNqzP2dfGt2+TCMdVDmTiR4mx1ukOMqmTX6EPOA7Wsugc0VA+IJRy2bizQAhyYDXjqDTUDli284JbIzqyh5XbwKccqPyypzlpKR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fmKS8iXo; arc=fail smtp.client-ip=52.103.46.85
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYruwbz/pSNGNQI4sFbbgYRKsSUUQMMX0OnYWOVm0ujiaIaNAUkFGD0cCaWM2baoD1KlTPFnjLtMsceRcDvNswl6EzcPo3Q7sbXAbgaEcvyVgQ1wUsbiL0BZYz/uXfsXL5/VcFybSb1scsxqG2LHum/NcvG//lnbD0LUviVIm0TeiO6JoTzeEFgmAHt7nt40uLs/Elw6tVB6JSw/Q6xK1NcBHfTacnUQebi94i8ybGiH2gtGql47IPRnkmEs+3bLnJ0lAPug8bQctxq6kmuykes/N4A/CvT9djIyWA92UZ8YI9dqJ/iKg2ZN+0sAvkF+bG4fhg3ghEdmxGADPo/73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7eiSwYr6TBJNIePMLzCCKcoc1ARTrol4g5RyxFz04g=;
 b=MhAHu9y1Eb26hqE/xmNI0PGs1XyhsKFscWmpK9DbjRQLYuFA36mTyLvfk9cZGf2Z9qxkDAFgzPCR+IBgHqyKQTheMoQ7yMVXvNIXA7eURd9ZK9SECN73U1Mv5vQAwvHvnch5kD7LGaOTqT01/LKvJBaj6Ai/WJqfiJh8Ik3KjrvODk5FMrv9ydpcoG3BLcTiI0+aYEm8qL1U22TpexKP4vYerVX9DpKKnMWnQpRP1WCjMXvFecAQwRWY4yfZ30nmN9EyV0NrgU/XMVJkHy7pxHDNzozU6rLGIsgcknPSVmNYQ/7DDTL0cRkZ8dI92v1sTGnxkeb9MyMnpd0D8q0MvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7eiSwYr6TBJNIePMLzCCKcoc1ARTrol4g5RyxFz04g=;
 b=fmKS8iXoYTR6/wKWn20URDPlTghVTm8gwDD2XrURGWKc3wzNicDov0RxFi1aJXkXS6ZQWprE/n+5ILxIn0yg6to6b2niSxuk47CsE5CQmIy1Rp9TYEBnokXc6qYHIILvPzuBtCHFtzbYk9vIZwEKHsPSsxGM3maVCK1YX1xe+OS5kcD8qwuyWVWw45hLiIQJKYUuBUR2oBY+VT39L82oxXwQ/5QWTTsvtYAu9SMl6jUxrSN1mv2asV8+JpRBY/H5eLX5yj4a3PXsf5sR/nH0vZpTsrYVMLW0xyiTaSK+LSXshy9MpfcB8jj739vaWkMkYyoxICfpERaeAPgwjYQrPQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:34:49 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:34:49 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/9] leds: st1202: disable channel when brightness is set to zero
Date: Thu,  2 Jul 2026 23:34:37 +0100
Message-ID:
 <GV1PR08MB8497F11B30FE7D74CAA25135C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702223437.126687-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA4PR08MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: badca66b-6189-4785-738a-08ded88a2053
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|51005399006|8060799015|41001999006|19110799012|25010399006|23021999003|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TnMlESxjQ+4qhxhZiHCbu9qm0b4/DtoUeagykM//WtSjrWN5yq0Po214O82R?=
 =?us-ascii?Q?daDZC1QHbyEnV/USkKck8rqevPwvznY7BAwWbbiSHVPPMwuHUVGnekWGZHgp?=
 =?us-ascii?Q?r2qUU3GSGDPZRpBLSm6RhVmugMNxk9L4kSShQbS09IOQ8EkXUW2opARWM4f3?=
 =?us-ascii?Q?vOI5+TH8f/tzVpVHlX/4HzGleVltjseZQ2aoaalmfrKNzPHXzB3TupaVP9TW?=
 =?us-ascii?Q?N6WyJ4RRWrcI2oEECnkoAVWGPZKBajwrr8hxG5vfuwQXjDCSFhjLLUDKYFGV?=
 =?us-ascii?Q?Fopfr+PFBEeyxIlfu348yU+1IUXPKo9IBh6ojzni6hFIN2rx5F3yf0pjY9pG?=
 =?us-ascii?Q?uO6BKOU5L76DXevS0NtGXkSfslZOmK+k1ENdVm656zqAnE7OfIeIkIMnj9cp?=
 =?us-ascii?Q?TmvqcOyyJbov9mHMYKOJlNFYFp8UYwY3SGDLWzj/lMHfrEOCA3c6mqgoyFjK?=
 =?us-ascii?Q?6HRzaeW5OoE3UXihFI4SQoS5HQPz16o2iYtDHR7YwYZKf8S2gJR9TZXo7vOC?=
 =?us-ascii?Q?hEuEu5Hg/6QBrEnfbsnRyO1TY1TZY7gK6rO1RL6weSu0fjOfBJqJao6a80MW?=
 =?us-ascii?Q?ru07O2PE5PreeYZrUiBollEHU4SxRmeCAyRgRn4bH9EMQpEX0WhGvc12m2HA?=
 =?us-ascii?Q?UpM/2KdoWw+QSllraiBStC7/KF5HVRZX+DqRHzgdutnxbs/yUlE/y3tH0HoD?=
 =?us-ascii?Q?RPxRJxxgHbF7WJZDj1RaN/JXKZ23XKjCfJl7i72cyvLUblbMZXNG6ImctYc2?=
 =?us-ascii?Q?BJTRTDHujBuju5GPsuyGqB01CnHfnDvupDIDkr17nr7YxaNBhvSyFmJdgIay?=
 =?us-ascii?Q?2ma05q+WSwNS0I6tKwE0YnC7vmvuxwGt+kceNB1EaBv5ZnF7WLvfb3zTwcol?=
 =?us-ascii?Q?Vvg8Viqzwq2Ys3PP7vG/Yu5noMkVk7lu8va+X0rz0cZk5lY8XEJOWWqyJTUh?=
 =?us-ascii?Q?FJib06u+Bs7PgX4M2LVqrvnkHj3XZ7AghZ+s1u4KVVQHL/rDWa/FU+Se6/Js?=
 =?us-ascii?Q?rr1o?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GT3uHF8CVuVi4ZCG4ZScQsH8Sf4ZKxm6m1ox3nOyjrMEOuzgfpG6dF361XXz?=
 =?us-ascii?Q?FPuB9b0fDCyZHRmO8cRfx2pE1mjYMsakxr658UJy8A85KRn0kJh5ycvJOI5s?=
 =?us-ascii?Q?30pRMOyApGThFgsXJh/kr2zZkx1HPYbHhoqKrZG88VrJEVM6m21YARoGAvCN?=
 =?us-ascii?Q?e9thYwmkpHl/7nUI1cZUygVdunZuZIcqdhPEf0fUnsx8c0OWz7I51lTsniWX?=
 =?us-ascii?Q?V6wFjraqy+2SUxm7Oa99vk8Z2fDlvdAXCO7jmGPxcCbmNUxheEifZcem69jW?=
 =?us-ascii?Q?TfkihVre7PE9AUiGdg7Z7omWbcE8cc9CkMcXyYpxwhFaj8qTno6pdqvEpYCC?=
 =?us-ascii?Q?Co19M/8W8da+cP8EG6hIlh+6NVDHKXR9TPwG0qpLGlrr2zRq0YJ6+ugoyVlN?=
 =?us-ascii?Q?I9S9syC3oxXJeXqReCrMW5JS679nBxz3a9LJVzez4ZFxoob/1smhAZQRA1AJ?=
 =?us-ascii?Q?w7H9mrIINwukXrBebichaSpspzAR2/lQzeIJ/15Q4xuBHDZ7TLtBPBnIvPl2?=
 =?us-ascii?Q?K0n2QWhHKujnjIo/7dZZlUH2M1tLaZ85i9RuyrLeZ0MuAWQGKSfPlZGzfgbD?=
 =?us-ascii?Q?5tHUoXR/xl4UXGhOAqttWwQvpbOe+Q9RqhIQxXHNxB4QKl7ycLzvZQLDJWjW?=
 =?us-ascii?Q?lBjLDa9Db/IapJW8Uwm1zrVbWxGNGPLEToIHOpwtEX13h/hCkGbCjCPEmJtQ?=
 =?us-ascii?Q?aeEn82tYBR4XI76C98hkH3bVHyHxobvF9i1NgA630/m2zNZ7raCtdBjPXhwY?=
 =?us-ascii?Q?qLFwmG52DPpH8CXG3V9bc/NgePxrqfxOLZNgLGCF8xHgIdk2Ue/q96/M5z53?=
 =?us-ascii?Q?31p1dlY6yA6v5Jok0E60axKFbMrLw9kKr/+J2CnOGKtc/gglnBlxauALs/qG?=
 =?us-ascii?Q?Gyq46nHHdNcOeAsspfYDchk64MOCn/z5eoVc1FWifj0m396+YE63TDAZBbYv?=
 =?us-ascii?Q?7ygyjECVVOSkA6CpMARhqLSqEjbHfZbpmLQuE6eVSnpP/7s3/j8QOoGNan2j?=
 =?us-ascii?Q?ORUwQQnTTiL6MF2SC1LWBhBUAsNUeZUgoJ74+6wnuZgIiiZhYudZafbPn65c?=
 =?us-ascii?Q?4KyT0aEXzScf5KPyHNZcB4SRvup2NYgX/dX3gotFatXu24WkzfBmMRJ+FX4n?=
 =?us-ascii?Q?HgnnaJqqhdi0BtsvoCOV1rLt/g95fqiu9D2Dn+qWikx4t2RwEQT6pAyjLv9A?=
 =?us-ascii?Q?iK16RkId78jWtwj2RfJ1eW4M134EJ6whX5Hut3FiweT0TadGAOw7zo3+nBWs?=
 =?us-ascii?Q?NJpXlgw7PaFPcsr2bkK4BFJPQhqJIWjAF81w6dUMois3Fu+2WnOtjJRpxo/b?=
 =?us-ascii?Q?NQfHNI8OCekGJJu9dqzJrgewEw4TC/dZ7EZGQfWD2ijoRB8M8sxObdlVddrQ?=
 =?us-ascii?Q?5gTYy6+tkJR3fvkRsxFtj5U4IcaCBMWrjdPdysgRWUG1Hw33Xnjf0r/Whv+A?=
 =?us-ascii?Q?cycwuoa24PeH5kF0DuN/dlaeOrdLgfGU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: badca66b-6189-4785-738a-08ded88a2053
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:34:49.5205
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8886-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B92F6FD3F5

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 68 ++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4909985ade04..2ecd36aae336 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,39 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
-		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -188,6 +160,40 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
+		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
@@ -257,6 +263,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret != 0)
+		return ret;
+
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
 							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
 	if (ret != 0)
-- 
2.55.0


