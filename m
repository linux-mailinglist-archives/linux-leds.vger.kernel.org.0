Return-Path: <linux-leds+bounces-8297-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c+yWIDt6E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8297-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:22:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC55C48AC
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D4023002318
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2F03264F3;
	Sun, 24 May 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CQ6lN4DD"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013077.outbound.protection.outlook.com [52.103.53.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9896301460;
	Sun, 24 May 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661368; cv=fail; b=I/IuKGrMtVkhMy/UeXqWzlBGU/KPqQ1Vq6IYASwKIjWwHj7VIjaPpw9fME3yr95ys0qyvmz8FoXM1ICGqhPcwbUjeHLvvwmft0wKLhB2LW8VHiR2F5nxfIJ8c0F2BzhQExIKRQEeYmZ3MoOmBAUlwnMtc2AQZZD9TK4CAbN4iQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661368; c=relaxed/simple;
	bh=/SWGcYySxmDrKWc/K8OKU5At8qEL2v5xYU/qLouNZiM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KK8rKfcnjVlOgwhkfDKU1Fg1u6MuwryCBhmkNYOshA98rFHQuBH5OIoTwNXGP9GDNz30Tt5QNt872oMzeQDLh6kvQM3+5qpaDai8n1KxC1L+Ukmx9uaE+m47foX51HCRIQaRP+dG3ohlgiZhcm8aYQjuNE2GEgw2k4RjPfb5tCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CQ6lN4DD; arc=fail smtp.client-ip=52.103.53.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbFjmpIulWq11pT3ANchlpI5jJ4MKTq/hd6uFnz5sBt1z9WLtc/+XYYbtf9U+MvXzAfIU7vIeMXbZlZ+RF0qt7JhbEBG4rKKJHS9RNN8lW9MVKYgBwsl+ewArR8f14/Q28jQvq5KSEvJqM8MIBDdKfv3LsxX9/Qk2eZGbYTsWUeWwNaOaPRicrUYB44E/X0ZBF1QqyTTDpws2KY0+VVOdLi1JtSUAiPV8fxjIjaOwuaJw8eC5fpO7obeqV5VC/MTJ/eLx5cGxfynUKv4/Sl7MnSL3OUnicwJztEXOeGpdlia5e0dBJZsvsfOPfyH64jY3uOfXUnkIKepowvd8Q5w2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUWPF8g3P6NyHloE9iDXaDM+iSHphP+nGkd2f8iERWg=;
 b=Q36ezFFCz7lNXQXuFoT0/FGoiid52vPlv9joMaES6fXMmK47WOGn6ibKYmOzddHrgEBSxdSpv92vlDquwOVDY5l4IHqH02NC3W2g/EALYKbT5xLuFymaJuaW740fBKEVpXsL4ETCws3Dsn8bgiCqoE7B5FrIdgNf4Y84M1uJ/lDwK7uD7n97RSqLeX9emyRCS5c5rvoZJCc6SRkP9fvrZdfemGEnbebU1EQU9X2b+XJOX0hsqQL1dMo5am+ZL4dndDlBzbEx5Ot0l7bT8GYfdF5CIhrmleE2mgukO/U0TfhyAqEW4XnNOkdhsvCZr/Z2Z8r2koxyTw7LtQWNC8S4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUWPF8g3P6NyHloE9iDXaDM+iSHphP+nGkd2f8iERWg=;
 b=CQ6lN4DDW9pJ1PI6VKlljkLps/klLshVLiGcuPiZEnQNcx+KWRjAVxJ23IqiiDEiwk+4EoxQ2NNIDF10qAAZ0l6oqo4+iJSrxU9fOgmLL6y24nbXOvyVZ0ZCadFutJ68qRWKNhhAigDsq56fNdAkrIK5JHYcQRcNL/dN/i9pTV6jxSD7DOjU9+Oe+nFVoJ+jqAxflWjLZ2KfhdPBxOkeiNANJM1HB7yOmx7kr2OKmijXtzh0EkKk8VCxrkeiHpMbN19pXxiAK38QZ6FoFgU6o839zzDDjeZCoLDdu1mGgnLCiJL0XYKV79Yv1a0KcULxitcTe5kTZmMNQgaDqePC8A==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:22:43 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:22:43 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] leds: st1202: stop pattern sequence before reprogramming
Date: Sun, 24 May 2026 23:22:31 +0100
Message-ID:
 <WA0P291MB03858E777D8E9DABFE03DBDEC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::19) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222231.348813-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: 48851476-d539-4eda-a193-08deb9e2f97c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wNjSXzwvUi3xdNBISVZdSBlsGuo3o6gU1x01DtF3HDS/oKgw72lEaed8wEuO?=
 =?us-ascii?Q?Pwibg98NcTGKh8F/zNkIM8jOvnOuPfxBBFe4sidQ9kSuCQL1fPKdhyuiN0xj?=
 =?us-ascii?Q?xkNxfz+aVg+fzNHctX7Yq4wWybS+BAXdclPL5qK6QmIc6M0bggXmz7Uqe1Pf?=
 =?us-ascii?Q?A5ntMkbctiRNdciRXQArzkenoVkEaTWChg9ZuemWar+ukndEMWajlJAsXMNY?=
 =?us-ascii?Q?75B8ol4oPyiRMbjTbWvL0BvV74zmtfOwnnGCEfL+lv8xfkkvJgspYzO+5udJ?=
 =?us-ascii?Q?A282ORma/9l48D1slpo3wsMxzYgu1btXUgsIYPGa1Tn+VwODQSlLlZyC/7Uy?=
 =?us-ascii?Q?sdXKGWNiP7xAGx1VUs7pw8tRe9PDsQ8wIoxcL+vPunk83/tZNlSo9wYdx2eW?=
 =?us-ascii?Q?+jyE2VLg8nuFF396EXIYHxX2vf1198CH/JAg/pziQl1HS7mB2w5BEjCMQ9mE?=
 =?us-ascii?Q?G4uGucEEVZCYd/qZI4gIHYnrOtKi/VF7Us8I6IPZyyc/ycSTeV8sZLzMM/kU?=
 =?us-ascii?Q?xmpnvHJGYYgEKZdIlZn4ofkEGaBj3ZQh4/35c0QfVSUi1gFPBY3knJy7PfYa?=
 =?us-ascii?Q?nRlhyj7Ee58YZjd0UYFnIB8qswLiH7FsTKYYK4rcSp+A9nPwKgPpiPyT2lP7?=
 =?us-ascii?Q?bOmSjFgGQ9y2EgS/muh9sSlK/RQQuz0YSu75IzflKjXzAOy7TYa0U+yIXFWw?=
 =?us-ascii?Q?tFNAFnOAMtvBAHDhs3U2Vu7oqI/u1sfIEDv/CCgKZWlZDkNXxxW0W4FjGEYj?=
 =?us-ascii?Q?jy6rytA0nJZeguMLaJZTT4gUHoD02ojOgv0n77foaP7H/rgLYVpgGznw4IR3?=
 =?us-ascii?Q?Nq80A+P+gfOWC9R8EwPc4pXgsreZJAapl6ReHhrQ68TEyuRsxO475IMY0kOw?=
 =?us-ascii?Q?ZIVF6rDdjV/D7MN1hch81HxQFaGoTlx0ZgC5+v4G8Iol7DRcM4BOue7nQPk+?=
 =?us-ascii?Q?rWY4zhhlV2dTkhLkFZvLayrLWhuULofiAIqXuEQG4R1WqMug/6/+o6ThTFnl?=
 =?us-ascii?Q?Ejm7f6DwYJ7MsKB34eDmTD8OHF/3lNTkT3EyoXky3pc/FH4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BfC7aug75xO+b/PZj3ldy44nOnKDN1YKWkUy8TgbTqfNYB6Oee3OHZ0qudEV?=
 =?us-ascii?Q?W8tD3X+sErmaRVxxQYqE9lES4Je8wbSwckzhvxZV0sv6zPvZwt7jarXPie33?=
 =?us-ascii?Q?98vn5K8qkmxMr7d11AoR+1xzQtSLIrYAq5+lC1CDpIhacvXr7gfGoy2RwGqK?=
 =?us-ascii?Q?iWDampKlxjf7JVqKRS2XHWLL0ekV5TY51sV1SqQQUZsDvmH4I7LJcYfuIi/C?=
 =?us-ascii?Q?bb4TsKJllXQafjGyEG6l24mqA/IPRkYnchnoov/MIUGTRl80BZK4tc95XKuD?=
 =?us-ascii?Q?6haZzQGc4yf3pNTeP8GKwkbNWl2MyKsCGGKEVyiGfUkX+Eo7U3aPNrnZLBgt?=
 =?us-ascii?Q?UKrx52Jga4Y/wE1kza/Cbg2h0Meiw2laVxF/V0PgdEQF3dtU895DOxAmzA1w?=
 =?us-ascii?Q?t20WXX01dFMr7ugE6fprp8/pDXpPM6TWdKjv1YM5DbOEwwfDb0QBeaHrf5tf?=
 =?us-ascii?Q?mFa6GGcAK6ulvrMdqc83VLEWcgeRT106Sv0tQjMxoqulJyj7g+CxazaDBa36?=
 =?us-ascii?Q?UbacQc++R71MSN0/mAG/pCDg3lO+CcoJ7oorljMDs7a+iFHFa88E1g+fbvYL?=
 =?us-ascii?Q?+ZhGwSglHvlR3X9F1Md2qiBkcNxFUZ7l4yQ7Wb1+QJ+ZCthIJz06xcbOTg9l?=
 =?us-ascii?Q?7P8b5sLaflS/RWf0nnRVNctsUK+oQlxTcrId0NjoBPP5ycr9LR8ynexOcNTB?=
 =?us-ascii?Q?dtp9iffrGmDnjDYBFK/KrQ6wQHbBgOeNg962Alw8ZyIloFmTHanqTbV16JzM?=
 =?us-ascii?Q?wZ97GAWHHAlKhow+/lhupmbr2SsbfwobcrFliD4LreMtz4Oli3Uw2rwtbw43?=
 =?us-ascii?Q?yAa/kuJdiMwwR96WcwHwt63tAamTdqc6l3cy9UEL3K+9LwE/tBXJeILquMlr?=
 =?us-ascii?Q?Puo9BwHceTSj4E3ZDFeBByQpjGGrfiN9PD7etu9JQtqtw/6Rs7Ejo8QquuPh?=
 =?us-ascii?Q?r35QZ/x+uT6WnamiOWS3F2E82iPtCDbDE+iFHRlg1GMgqzIpnB8AF3wtaMYP?=
 =?us-ascii?Q?NnbLXoPL6oXE3QrKeOkr/iw5O6eVaBxYmO8ZDc7vYhGhzMzKeZgg+IPSuNA+?=
 =?us-ascii?Q?h819WS3XkwMOIX2dC7VTGC2Zam0AtFVk4/3yevIgaWSdURQYb+02sQKn62dM?=
 =?us-ascii?Q?Mv39BpM7QaLfTdKEwRJB6gg6zghxLFb1wjEGhNm7GYjoC1W5qKrJDR4dNpPs?=
 =?us-ascii?Q?1LLCcirBtiraixlNEJB72giRisvPUYe+qtsFC7bqhO9I1fd7Snpnm4fo4w20?=
 =?us-ascii?Q?DdaQzc3bhHI04/gBtUgkNt0QtZ2de9eHv0DMmqX5FDltwa1YPiFVSLq7XGYv?=
 =?us-ascii?Q?r3EesHgIGbTJ2S9rsIiZ8ACdHRM95kH8otq4mVN05z+9haXR1H1W5x3YhvID?=
 =?us-ascii?Q?npqQNueCJRI/oqnuW3MBk1YgZNWMqRKcezqeugbKzPkn+XMWKzfCGOQl5SuO?=
 =?us-ascii?Q?qg2gbXCfiAAiym07Ar/gJzdqgBwBmMVz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48851476-d539-4eda-a193-08deb9e2f97c
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:22:43.5277
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8297-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 09EC55C48AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


