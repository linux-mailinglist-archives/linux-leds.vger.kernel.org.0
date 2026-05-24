Return-Path: <linux-leds+bounces-8302-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKkVFG17E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8302-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:27:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDDB5C4911
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30079300653B
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443B431E83E;
	Sun, 24 May 2026 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="d+4e02vR"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013083.outbound.protection.outlook.com [52.103.53.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D262E424F;
	Sun, 24 May 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661673; cv=fail; b=dpEsj2Fx9yPlhUoKd5fmGmsLdAqLP3Uo3BpvaAkA5U02MH/aXoRRPDgQhVh5EIxKerWoIckUnV6XRmy+56ryOjnQGOd1iUEubuco5Fgq+R2DLzVhV9pz9x9o/iwdnisSqqXLit0J5+QCqe5MsV60GhJX8ggtoPTAYl4vo+Iwndw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661673; c=relaxed/simple;
	bh=VYuWqsg8oZkA1ysHX43GR9juLQbrwsvy4XOzkJ8B3f0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tOpXRdEwP4L1aK40rXsS2ijeBqkLZfCFDOHQQY8Gy54+LmRm+laqAS2Xo0/8or5LCKwGipQ57aAGw89HM2NhiHAWsE4kllL7gp+MUT4EWqqDYxxhPbvCaAZlobQWqY/W+0uzy6WhDU+p86hEi6JunEk+2HUoKG3qr5nATIbeJ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=d+4e02vR; arc=fail smtp.client-ip=52.103.53.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNuFKy1fhBGQAojmsw1JuSFv/heXyPOIK4+Hla5UsKkQToxTSOtk9LTZmj/NAqQuFb1CJx7iRASnfzgEKRKwG7Ep2Bw2jJx+O7uL9+E6jEwH4xnJ53UxEW5ms5akaKjUqj3Lqjox8ZtcyAb+sEfM3HEednFjsHCAP8y66dWHO5vRPQeAh9HxR/cXUPmX4z8YIXkoBZT2rCZr2fdFhWbNkuv3Qg8/WcugzUQ95ozpUC4pj6novWobOGDSF0dL50+X8wY6fEoJWlfVKGkP+TXagLypFrb/1s02ERHCKXzLESXiCpMcKbf/l59EqhXqSb8iKsAASVZmbFIxvAuCOcYMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBEAiOFuimL+vCwuyGLyHYMVhpjnH6BBH9M+SHiVXsw=;
 b=K/ytvhJA0N2k7Iq51ICCqNQiZQkkmqyTpDjAMDTXelkE1sx8v2NeUeWJqrjXzisXloVlR+/YVO7gNPSboW+94Yp13i3tGVWTfFDY0jns1QiFoHUszkNu/ga4t86WO55VyZ1jQTnkkYmc18z/K0orEdsCe7NG38f3HWwKnLJnHZFzKs9kKXBzbqWGfMix5QiuaJ9l1CmPQn6N5WcWN3Ls/DKux9H9S9p9v2VI9MYs2RU8gyt2ABUfXSeBUvVfrj0vmlWJhRB2FCXt2GKqjQEoUxNOEM/cNWZdRMgaB+sWtp56+TmcKgdPTqm+w6Iq92Zy9KmsjiUF2GJ21wDSnA5EDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBEAiOFuimL+vCwuyGLyHYMVhpjnH6BBH9M+SHiVXsw=;
 b=d+4e02vRAWwyozw+jj/KTL4Ez2p0Mrbpmr6niiEzpr45TwWGsDaXW3D7gVdgtsHMi3M0RosVJ7BitUhxjDJ12GVxSB2MMtYNQrSzSFST3iutyhPBuQ3bZeBIH5/QMgVJKkIOSKxqW4WGJoESmJMw5oEiS4RRaTkPisdH+z5AhpkJIdwMOJM1OnSV4HbfWx22YW5KJ7M3Z/d/wmUsVCdvms/JOL8dvBOKwON3I6PJZsvR5+MLSCB1qM9PK4BHvuZC0hJLoTIYVbr83PapwlnCfnjPaYY1ku8Yt15mAhpfmbhcmGm+yZlCu0qYG8u8yygjKxH8pdn6r3RvIzXH2yDZAA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:27:49 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:27:49 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] leds: st1202: restore Pattern0 PWM to full on after clearing pattern
Date: Sun, 24 May 2026 23:27:36 +0100
Message-ID:
 <WA0P291MB03851545B5C0F0D292894A68C50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0521.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::22) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222736.379123-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: 89dcca6d-e5c3-4400-6a8d-08deb9e3af88
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j0b0UWyXUGTgIDJUQYN6aYo/jnLeSbJirqeGXlwHKzWezmjNHd8BIgA0ZMgP?=
 =?us-ascii?Q?9zWxhqPCbgfTzWrMtYSCWZCfQPsRJ1Lu2k6sSPo/X1svJQX64kAZGWuzD4qD?=
 =?us-ascii?Q?SoFniqrgpD6el62eoi63vKgDVO8bIbixwgGo0MyqAj4GhERw+ML5M2XaMhvI?=
 =?us-ascii?Q?7fAE+m4MwEaWE4vxFCucgBM9Vz9d9AIHlG+z5R5V1H5GJ1vpeQQ7vnAN8otf?=
 =?us-ascii?Q?YplT5aoRAaxVEwZecuXP3Nzuc6pVRraU8lOoWAHI8qSKDHYjeaKi1kgBYcR3?=
 =?us-ascii?Q?oCp3EaklPpFs+CBy3gvRgH2LBNotsGWDMxyKT47crIxaWn5Mua1nLlmZWLuh?=
 =?us-ascii?Q?wp4Wm9q3oaoLeH95omGkF0A7GsoGWjAf5DsQbSR6BcOMEfEGReWTr/MUb8Ej?=
 =?us-ascii?Q?fm2OKSTIV4rMIYBV7Vp2Vyv+ks5+dXXzMvVFvYRqnqYu+MuZWLOGl09rF2ED?=
 =?us-ascii?Q?RK8JAic9dBSCzQn7wGiOdQW9KO5fZGwjTTZ3aEdBGb2VGAFgoqR117YPY4QN?=
 =?us-ascii?Q?FoZYkhZo/wP5ggeKbbVLE6+Gfs5J584l6QmtFT3XM1sTZkhNm5MUDl8KG95P?=
 =?us-ascii?Q?Y7uaD94XMyEnYoktPYsRs4kNszr8xD2whcCzGUl35m3lhUu/T8ZUVrp18a1V?=
 =?us-ascii?Q?feW3sNIpPEZg/Sz/Fq6Y8x8P0bqcFu/67WbkuwMaBX+WNAzXYfGOWLxtH/wf?=
 =?us-ascii?Q?6VaWOPeAG751ee7Tgoc/Xvcddib+Jhmp7Z7DO0H2+/z5fZo169eVUw3ai96Q?=
 =?us-ascii?Q?hfcICLAMQEPuEhuZxStPAzHY2IHmteJFr5i4pIL50aw1aH1rYVV2BmJK0J5s?=
 =?us-ascii?Q?mgUdEaauBOzvXzB9GLj1bP5Ho6hvd0HqvaTOVbi+Ry4NQotFNh+KurtFo47m?=
 =?us-ascii?Q?Dfh7OZRix4+emea2snVwwID03v5cTjZ2I2eViHf40hatuKG3Xlwi5PsOXIP4?=
 =?us-ascii?Q?Y33D+FJvAjfTeJEu0qhTUuFy52k/gFX70IDXgpL3Hl9DjtJzYUcacIvutT2d?=
 =?us-ascii?Q?52gvQAFGCtu8FPRdWKKipLhRhlUEkSy4zIDynHhbxSmf9a4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HkHQOvGicx5Oci51Hp6oxF3VH6pcFT5DQ6nNQTxatgAv1X6wcga8wD9ZLrpc?=
 =?us-ascii?Q?iXo/nhyC6zQtifwvkx80D5kLT8cJHlWJ7xon/LqqE5w578epCKT5xh2Omz1Q?=
 =?us-ascii?Q?LRuheeoSUsPr0+CyKw1LdmprbH/9NccJTczPjcMVdypuvs1KDBnj4n12kb96?=
 =?us-ascii?Q?ZrzgJtt4qKe0wMstkAByvoIqVcrTnA6MOG73Wf8Ph7tk/Hv8iN+InVe1JGh2?=
 =?us-ascii?Q?n/zpiOldlWRbuKxLoANKhChtiSb1tClc21ii0h+9YbgzULjHsiOyqFY/pa7V?=
 =?us-ascii?Q?OZEaxHTp5A5tBvb4n2wToS5X1kdfnK+q/iKEqn4xX4u77Rf/Hz5KJe24PDWi?=
 =?us-ascii?Q?iH+GHxsYMkTZxkoNXrBdYAq/NrWSMs9o76km81eERGOotQ6Lk3r9qrh21AQs?=
 =?us-ascii?Q?uoIC7aiwAxoXJ5ZZk1x2XRR9mzgeHLodZgOyFZOgG6SOLqJhDi3TeaLHvSPl?=
 =?us-ascii?Q?RS2AkGAenwPhxmDf2rjxzYFZF9tTitoqmAQoR3cEj68Nd72NKkzZaZGLpJ9t?=
 =?us-ascii?Q?7+DpTQ+svDWvU47pxY7qqeaXda+Zu/BaQWmAyNWOg2F8F3kSA83GJwc9ZNGq?=
 =?us-ascii?Q?zy0D2URF42iaVNWPhAiYrQDTDBaiy52KHYyzPzGErSFsKEdvabUU92MVFdZl?=
 =?us-ascii?Q?zSUfOjf/yZg1+H2/SGB4sEnTw+QLo9Rw+pMAoCqfO/gc7pTqRUoDZE26IM4M?=
 =?us-ascii?Q?AS4MRjDDRSMY1+ElAFldpSR+U/l1dush1v5Q+w1X13NlcR7QEuCZyjl6PJcU?=
 =?us-ascii?Q?gtDWgoc6qFoLh8QPRezyNk4BqoHF/xmxLlVPaC6asQ9SvLZ38KuhxseL+mOo?=
 =?us-ascii?Q?9urTNuGCB55PLBCsAqRGrfrQxD/w6T4PB/DAFlpb7bWkd5KPj78Pep0RJ3wN?=
 =?us-ascii?Q?9GVJn03n/VcLs27yNoQP7RO+aCjVelRmx5DnJ78guUVw+sfuup8j14O6qe76?=
 =?us-ascii?Q?+S4UxSVcb0F4KTCEoNn+9eqmI+09lGBKsuU6fSwim3J1V74nUtD3/pU6pff5?=
 =?us-ascii?Q?3iDcIiBanqG29tDm/4D+CntzNvMYdKg17WUykFAR0745A3mLqglwd1UTeEtf?=
 =?us-ascii?Q?IMOY/UH0aPOz8+oL6nUBsdMkcZD99HcUpmJBqbkPDvVXzK/Sh2qkXAQm4i6k?=
 =?us-ascii?Q?cWhpd+2diXZ05waxyVNne+8Cbt4d4QnuT1ufVnA2DQHcWXDYoap9JwzHLgse?=
 =?us-ascii?Q?2ssBENo4yMzMEQjgiHSCTHf/GzJe/J0Tlh246/AtAHJPMuEEFV2T98ZDyZHd?=
 =?us-ascii?Q?jY6YTt/Uz0lZ+LtZ84DW5DdHAM9v449HClFIcqb4p086yvUdQp72yQP5aSnO?=
 =?us-ascii?Q?ULv7sr2BdpGHHtcZHNOh3EbMP7rBugU8bJsUhEqbwn9hnnTtDWEjmYXfO5RP?=
 =?us-ascii?Q?njdHEcp1LzjzkCgaQaICd4lO5qaS29jxkBGVsqdVB29At2YmYnNmF92Qkxaz?=
 =?us-ascii?Q?gVQuB7xE7OxnlPUQoJWnWJ+FmO0IYUk7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dcca6d-e5c3-4400-6a8d-08deb9e3af88
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:27:48.9333
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8302-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BDDDB5C4911
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


