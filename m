Return-Path: <linux-leds+bounces-8858-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AvYfM6ihRmptagsAu9opvQ
	(envelope-from <linux-leds+bounces-8858-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:36:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 675F86FB7CC
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Pn1icCzp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8858-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8858-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02779302A9E8
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7463B381E92;
	Thu,  2 Jul 2026 17:36:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013075.outbound.protection.outlook.com [52.103.35.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2A137A83F;
	Thu,  2 Jul 2026 17:36:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013784; cv=fail; b=GUHzUou8/dz0j/+n4qUZwMkBygluXoS9NHfHU4tYqoSMjsqFzCf9ykPGmA2ZfGyvmxQ2uPisZp59o6qGeXn4eiveDHG9ETS8dKjCEmjlfXM3r/u+gzEt+Op1OlJF5yYD8w99dc2nCM7K4Yq6sdJSdDS48/KeQuvkfWKEs2xtbpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013784; c=relaxed/simple;
	bh=KA2EhigSDErVUKEPw4qCIYxGCfenFjKGXxjYAQLbZTg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFmtqVZIrcBL15fk6L8gyG9AZru3bQcQYA976Kf2SrPnf/4XlbsK1PGs3tqWACQ9V8+ir9Mi1J15VCXy8bcuDKXRh2Dl4K70mhbiMBbEO6dbEdipY7jNjH0ccMvoqPJu/b0SCYyoUliPAWwz7JZ6lGqdEovibP48wz99Wd/2Icg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Pn1icCzp; arc=fail smtp.client-ip=52.103.35.75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmT6/sZ/sgnnxxj9OAgxhebig4w4i2XVyQ39ELfokEF+VqQZ61nHvUs1Ru6GvAZVV2ZO7QC8/JWKAvbshJqZ2D0I+zoB7Ov1mVzYLVQVdnVd2TA/SROhZDX0Oj1ii6dZEXBkIUi83rHre6uavewG9AtOoldIZcSpkUCpL2qeR15984bfYy3F511ymHrzugBJjfm8LQvQV6OAeoeQsu/BN7EfE0lynrrkHyPRuihqvVn8A1IJ48NZo0/ibvT4WQXp2eRxuriIPW6c/QcMBWiDN9XSem/iylPI265PEd5ZP3bvwk6uexHVmh71JeEC861/IshUT0OyOyXaFctf8dv42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts9xczg8n3EAR1pvGf3puqSMRyqME7v0+IvnlzFZsL0=;
 b=FUaQT1fW1XWei+VTuPE7mmbyf7AsXnGsXLqzqqs3xV55W8KqjR53cNWQxuqTCDEI37PaSk159vb41VHDXO/CAE1+JoTOJ0LZVU/Stqt6FVLHdsGuKxGVV2YabY7Xc13UQbsdtqnhXpVNJUiuNS/w1TYFXKrQsB60GQdPmXfpqWn2FAzwMHfy8lWGf3GxFhyKmIaJfyjPawzgni7E+1WLJwPi6gYTfUEPGSjqrweRrt254OGFKwoc1SqHQTyCErDksaesH/1KcqJynhX/EPoNs7e0e2o4CTkJUFd8vVSyFn0WoZGtkx+v5XcuXIPUcSpo83TnBqBUpC30Ey77A2MhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts9xczg8n3EAR1pvGf3puqSMRyqME7v0+IvnlzFZsL0=;
 b=Pn1icCzpMtY53dderQGb2VhWW77dHae+NbGjh05rO8ddxZBFi8oKE/Rxbgd4McvrYqw2vKObuALAHZLvWAI3wGFkcExlSj8zRHZcHOxLKgf+XO9neOmTbOV+SKkbNqj/yy2f92uw0rXkz9FHuqfinawVmacw32suxKkU8L+gmxn2JAIPDB370AkSxd0NjIBiANtNaaIrbpJZHYZdG2ouFfCJUGb8BP6W0pzD51OVSLfBh1JXDZhv76smEgDB50LXz9pyZ/6prWS6t/lo64pTx4tsG8JESXwtSzDZ4v1hf0a0Cg8Jv2WMHMBWTWYFYnA99JtvMr4G1dYaSE/jsTFEbw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 17:36:20 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:36:20 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/9] leds: st1202: stop pattern sequence before reprogramming
Date: Thu,  2 Jul 2026 18:36:07 +0100
Message-ID:
 <GV1PR08MB8497E8C6EB0630EE9312B273C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0304.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::21) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702173607.2612275-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PR3PR08MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ede15a-e000-4d3e-726f-08ded8606d44
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|19110799012|8060799015|41001999006|37011999003|25010399006|15080799012|24021099003|5072599009|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s8/OU1zPXZeRpKHxFaSozRkAWGCu8TFLSVFC28aDou0ocIfSoFVAF8T5vurw?=
 =?us-ascii?Q?Wljm6Aj7qr+ADQVNQVFGTrVCcHYSgq16s+4Ve7OQnV6akpW1yUdoyWF839+L?=
 =?us-ascii?Q?CUyYwSTVHjKCLC6OjvwRYVjeELjQgJkFgn/BHK+cesGi8CP4n1LbtOJeWAuo?=
 =?us-ascii?Q?64PAOEX2YTArkhUIb7V9lm4hJFSvK6Ae4EB9zyI1Zm7HSGx71gN/DuZRZIu3?=
 =?us-ascii?Q?v6t/lLVKx/bYfgd1qVo9wV1c5Ye7kIlTA4OkVHwNb0ApXeOlRMBYp45fUaVM?=
 =?us-ascii?Q?hECgyGmxzEiwyciQIEAeNXUizorACy37pxP2q6coNuS2F9HrB+u2Nn2TMqCx?=
 =?us-ascii?Q?PQUHwcl9l/FgpApRouEjP3tKAVjyKykc8F5fKjI+wvkP5FLS+M8oTMcMl8yN?=
 =?us-ascii?Q?LaOa41uILpclpkRt5hcu4obhWMao28gf0DcVxdUe7B4Uc/QMrDxHS/xthPVC?=
 =?us-ascii?Q?rAaMRr9v9zzYQbcQf7nYJ1CPaSKcKVCE7m2jt3xMqr90mOLe2lunJ9Eeu6KW?=
 =?us-ascii?Q?xxoMqM4sQ52liD/D4J/pvjpwh/qSaboA5lUwsKes+VBcv213RiQGSlEVe3BA?=
 =?us-ascii?Q?ob+TspLv8+qahWx/KKjMY7tmcqQpdtFlNDWVWr6UPmQj6NRdobBYOdXPblEM?=
 =?us-ascii?Q?MRZXt+xCNVG0QG/XRj0r5vEQFtm1qzJ96asLyFFdIgHl4U70ITZX7m/xgPK0?=
 =?us-ascii?Q?Eub9zTwatLNGfUwvAYuqQAPTNXXtjXZARKoQ+avjonBd6IVjujG1J9+iJt4Q?=
 =?us-ascii?Q?fQOeO+t2AYcZnUs/OMsTPVSR7hUclSuezT0A2zvWhswxVplfINRbJz8fnx2L?=
 =?us-ascii?Q?P8gJ4LNE+maBofJIe9CB1td0zGyz7g/5YK3BsXOZPdWfSVJPEs31yCZJiRgY?=
 =?us-ascii?Q?5V6y0njw1ZSc8/mMah/rf9SQcpOQmo6rF7xbBBZLEl5Ge+RAv8w2GGxkQcUR?=
 =?us-ascii?Q?Xic5N4GC8lwu/zdYFrcN8fL4wo54erfhtbyBJgKahWl83bv+Knn9W4yd66xC?=
 =?us-ascii?Q?aZGZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VnNWgOB4TDBOAVmw2syfnh4oGBIEfnauVaQqY5/vKsvcMN/9Rf4B5740iWT3?=
 =?us-ascii?Q?g6iFDiu5F8RX4Wr9vzrfKCV61KbZFrn161kBLY8gp702mwNrYEYp/yGCD7+M?=
 =?us-ascii?Q?puZLjtESPBvqcXhAZfPud0osGSUJaNbqy6hIgQLJMr5yIBIkutKSMy1K9xYY?=
 =?us-ascii?Q?MTJXbso0Qy3AZXAUoVkvtdnsKKhO9xnQ8rp6gYg3NTGHGZNDi3iMiR7/uHfv?=
 =?us-ascii?Q?z7y5O8XoIm6VaV7orX0NUHZwdL/2RRPpywv4i6qcgaHNEkn7QBrDeADyBO8r?=
 =?us-ascii?Q?g+XMfTY8O16QEEl3xzNVKLRUNQs1aHLzmvvDcFJ0pmQ3xsguoEJZ3z2e7Fjx?=
 =?us-ascii?Q?XWcSFgPzKHqhEziU3IxFZvW+equ3T1VRVUuDstLgmDxbUd46mhQ0fLKB2Xf9?=
 =?us-ascii?Q?4yjYWpGTqFLI8sXHvoxcCUeN7agda0WZdF+XccrPxzKS9BJqzQePPI9GN/7g?=
 =?us-ascii?Q?cYrXPDiMi8SaB0AXUqqe4abintgRo3m0uD3AYhUrOQT4Mc6JQ/jqwM4VJtiW?=
 =?us-ascii?Q?HQwUu0TLJJvGqF/x/nfisEE1OAOIH950ozzCEKcbMxAX92mWO4rSUhE0VPvG?=
 =?us-ascii?Q?p5vkIFtZaAJFtYHTDqllJ8G0QbdUmiHOnryCX2WdwJPo++pqbnE4O/z7hMLE?=
 =?us-ascii?Q?fhpMomnghOgRa8d3KgHXPEGk5QitM6UTj6XPQOsgL24Q2b8sH3d1SpP3Pofc?=
 =?us-ascii?Q?hbm0yygW7qdqCG7pce8VvaeblADbBBtHySe/oJHH9aagMj2hvSMoowRQxIqj?=
 =?us-ascii?Q?BSAei35h4YrvYuSaoKTqKggfCI/iwnoZpdBZPAxWBn6kAM2tUYRjtkJ/UUN5?=
 =?us-ascii?Q?DhNGV742k6QnuaYtdXpV10yzGRfMM/+la5SbOG0H1+9HD7/w5Vw5dhpKonte?=
 =?us-ascii?Q?OY0ZoAm0K4xWK2jrZJaiuk4L0bbQHy3TKfe9Pp8cn+xfDNX5mSQWmA9ccrp7?=
 =?us-ascii?Q?jtu7oZ9Rpay8heDxuMmUU4SzumzztsFLVV9nq2XpvGXM/KULko6vxWzmFWFU?=
 =?us-ascii?Q?kvBpy0WEONaFYjLF+63gs0gY/4o7Bh2ydEotKZLynwFSXZBXr4agKtHswktY?=
 =?us-ascii?Q?ah+1jJ/1iD4fG4gXiEs0ruKGVUTw+gc5+/Ipz5xTY/w5do3iKJRKF/Xgn7IA?=
 =?us-ascii?Q?NESFrH/eQRvCUBXHOGKfEnChDjR7WfdSOWBWsG91qYzK7zP6bP0KlGZLRbrb?=
 =?us-ascii?Q?AJPoM0qR+DwwrcaAt8Eed+aHbqLZueDrGYVsK13IpAnkZPLUnK/laI5FuMQB?=
 =?us-ascii?Q?GghDcFhG9C/0UGnYtiTjjthKKZ4Xi4csfsjkb9iltT82tinxBFhto5SvC4Ri?=
 =?us-ascii?Q?jDH7/yo7dCk1rYaYzSt74ja/F5ze0H/Ne1oCeFm3FNlCNDS7RplZysSnqREZ?=
 =?us-ascii?Q?jNCwhMVx7gjYLmjTjisee/rN2sZP/fXJeKVyYJAID40XNu1M+Wvz3q6/LN1v?=
 =?us-ascii?Q?8M4siRIbZHv5GVkHPchU46XNFEOEAa0k?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ede15a-e000-4d3e-726f-08ded8606d44
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:36:20.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8858-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 675F86FB7CC

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

Note that the LED1202 has a single global pattern sequencer shared by
all channels: PATS, PATSR, the duration registers, and PAT_REP are
chip-wide. Stopping the sequencer in pattern_clear() therefore halts
any pattern running on other channels. This is an inherent hardware
constraint; pattern_set() restarts the sequencer when a new pattern is
programmed.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 7f68d956f694..316ed8eb054f 100644
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
2.55.0


