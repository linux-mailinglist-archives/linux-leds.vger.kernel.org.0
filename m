Return-Path: <linux-leds+bounces-8500-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2y1BPfZImqyeQEAu9opvQ
	(envelope-from <linux-leds+bounces-8500-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:15:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E685648C30
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=aMMqTNjT;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8500-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8500-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91F5E3028EF2
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AE82ECE93;
	Fri,  5 Jun 2026 14:08:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011031.outbound.protection.outlook.com [52.103.39.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE4357D03;
	Fri,  5 Jun 2026 14:08:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668489; cv=fail; b=a13Pgy2D1zoYxrmakbSt8+A1p3LQ6gRdG+rxk8WisfkCVF3opD02R6ltV2g56ZOvxKmKhajXYkX6jpsWPDtc04ky3H13v7tEr48UDJU1e0eO7F12CrmPxBqYsGJcQHnb2c3lwFteecVnqczoBhFYbMXMWtDg6NJPvPx+fq07pmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668489; c=relaxed/simple;
	bh=oCo2ixX6M1voCit2pQ6M0xM3DSanXpOkSZAboxgM0Gw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0o+0jDP7TPjhwFz07fdaQgFNFyZar1cpaeYdqTL9SxVjlhgwiuG/vLa0eilQ/eu0Ul0WWBcIt+E05LTa4Ab1HIaJBpMstadPyDaPrZB1JKwRJaDstOE2PPc/6qSCCizSX2hiIjUoI8OvqouRHvAEmqIRPKUfvmi3oYdgqfjQbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aMMqTNjT; arc=fail smtp.client-ip=52.103.39.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ/uYLCOxO4KAD/R4FczUouto/o1WvkqUpiv2+WPYwYDxHLHXLEGs4S09OyYcLOZUhPJtm60e/jobOXBUO0olsLDiV5oSCa2OEXc6d9RMCDOviwPrGaIF4dT3WsrjhlFHGARVZW1DrwBTprIxbTajJ6rOnN8q1VeETOLxOUetPQREs4Oib2/hHGtgLCZUeM+gmG1CZDaHGWuUp7f7NnZi+PApO+FZAHYMAQHnslbtvfRB4ykCHvvlfdfzd2nT12OoqqOwNbkga9LCJRXVaLw9Ad+9gq0aEYTPzC1seOzYQ1ekXgOXxbRJcAKNUitrMae+4SkgIgNfcWuWfV0UlKmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi5vJ4TcdH4tdZU6ts9NxFRN+tuYLjuJtfX3n5Tcf3I=;
 b=ldHCD+E0Kex80HbE8QJVxWXCCgzFwXq02iuyT+1xptXSYlzPbi65VHpEAYYcNU7Uq2g0aJSgyUPnEqO8mQsL/3PDibLatej8PNXp5HKH498N4GEqGhJMTEi3FSSiEVHWaPtJgLffINwaimjT0BgjQRplHDZURgqGN+IdLZjS5mGfko7tnHqWiHWtpABbfWjdL89GF4I2OQ+kV1CsxPs9bzxXJJ7TOpnxvFl8H/D8TBQ3LyBDEF+B7VIzKm8l/Qj9MMz2HAc0YAPkA9CffJYH7BUsQHLcGgItdEvcSdZi0aqtw6A5yJTiMq+wWAB/aoHfQP+rBoVIP0Ml3Z475ygUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi5vJ4TcdH4tdZU6ts9NxFRN+tuYLjuJtfX3n5Tcf3I=;
 b=aMMqTNjTL8TBJCeJ4cU+qMr1wkrWT+k5ff7f5ZKSOe5xx2uJk8W2IaZ2G/kWsbu7rgJxB7zuJzaq+Z9jkZz1+QTkA1mscpLaMUK+IzXProy+trM9Ld7aBLXRTe2Bng7fZoYbk9gIsXw/GCdEcMtJNYMfYkR6nxTqRTOOq+phcBO3YD7JmtjHdA5Fx7qxqrSHmr50HrPIqfss5I6FF/P3os/cv9E/SBeQhs0JS9oP4eKHsjfdQVEfOct8mNvapbEICPBhuytm5vPGZsOCTTib+YE9lR1TPUpmtpcpVQBdzd9qKwhTJG+2IqF5gmTHR/XOabRWLJXN1ozHZmDIxZ9Ubg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAWPR08MB9994.eurprd08.prod.outlook.com (2603:10a6:102:35f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:08:04 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:08:04 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] leds: st1202: restore Pattern0 PWM to full on after clearing pattern
Date: Fri,  5 Jun 2026 15:07:52 +0100
Message-ID:
 <GV1PR08MB849772336DDEA4026603932EC5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605140752.1457526-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAWPR08MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: 2375aade-46bc-4653-5ebd-08dec30bdc68
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|37011999003|24021099003|55001999006|51005399006|41001999006|19110799012|15080799012|8060799015|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ph2UMY9+LD+LtS0Jg9uF+1VWkIjH2rSKe2TafIfNZtWpwUvtXDs0z4D7Phxw?=
 =?us-ascii?Q?xWqDR2UGawMGh7qXzbxtGhwSVRRsCOG8Fu09p9uaIFe8b1qRsoCEG4uJ/CAY?=
 =?us-ascii?Q?v4soNHS63JbANGSfBGehvl7VRcy6sSniF2FYt9lq7R8MtgQiZEKJB+cjBBEL?=
 =?us-ascii?Q?v2xfCcaNyx6/HsSMUIGAfrJt+8XPldf+9UfdYhGVMLObGpjW6CiqLZFK83hU?=
 =?us-ascii?Q?KiMMgI1IxixRaW3e2ZW4rY7StZ/cacDznL6rFmD8Ghsk7nrXL9Zi95KwKgr0?=
 =?us-ascii?Q?s1la4A+/pUO/ZaTj8EqLKsFJ6FM2iJ2smBXxQDBu+lORQMuB0RUbfHkjbN1n?=
 =?us-ascii?Q?WHq6hM8AdJ8S3OTeX8ilMsO/xRjiqH+v7Odxj9Q7s5sGrsl0a83OxHVkdTEP?=
 =?us-ascii?Q?vdEhDti3L6o0TrLg9Qy6wgdiVU0DHHWtJq05gk4StaaXPBz4LUuh7fyGpANR?=
 =?us-ascii?Q?UpPl6EX9OVnYWmA7r5RHXDPWnL1pPPBEv/CldhL4coCLqPSIWAmTD0TWPouT?=
 =?us-ascii?Q?p6UDbz9nr57BQzluWeDieEJZj1qpJ8ai9D2VLb1+5GKh9vX/T/DKNF/7iPC4?=
 =?us-ascii?Q?QcDh6621PFQGxFfQDNdOVH5HczE3GhN2hagrOzJEs/WphjmpILQMtECDd14G?=
 =?us-ascii?Q?NyAb9Cc0U975nGkl8cMiOjHfZIpYVEQ9Hj3FCfMG62rF4dzcGVT0SMzethl8?=
 =?us-ascii?Q?P6DuI0eGMiUJwDIS9GIqZZS28WLYdg4bU0J+OAtcaAaNWKTbvS3k9Ihrd5ln?=
 =?us-ascii?Q?NCZK2TnXF8Yy4OkkYvRKa+60oPv6f/oOS1mcH4/rrIGR/cKX0w3IDJ/LaMuj?=
 =?us-ascii?Q?Vb1DYmXkzQdlu1aV8j2cfm/PeL5nZPt12fl6VoTUbj9Q2N1nl7R3O3FnTvMq?=
 =?us-ascii?Q?A8qTenU8c/lfKzFPTXrFj8I04aomnhUJLLmldO66GDxPsMGMllsvqfMZLBdj?=
 =?us-ascii?Q?61ph6joPbCec2R9zhlAjEtUU18f8BrzCMddWkfCAxRFwee/Hl3K5+EtqAPT6?=
 =?us-ascii?Q?7LR4DNXbjIIzqu6TvOAdJjmjLsHHmjqBz5rcEJyzCcNlows=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6MHdpx9Rhi3x76fdp0pS/06TMv+UFdTk7JB4FNVBQDnPHJ1JSroWa+Hl98OG?=
 =?us-ascii?Q?FKMviMD6dc4i3pTQ3w8zH4rrxNX5SfsBuiTbZKdeOIgOq0eDcvyEiQKtQmr7?=
 =?us-ascii?Q?dNjFxSPhn5z7JUPHI4CZ3B18PZV3HNaaR4HzrPz7+9DSv9eaz1lhM8IHDmzN?=
 =?us-ascii?Q?QEAF/pvVKP8VDBtGa3gTEqJff3be+4ool22NYRCzWNT9V+hhJFD+bpgNrVaM?=
 =?us-ascii?Q?5GlOl5pb/SXjhHQipJYHut9wFOVSVneIoQKOvybYDeZqE/nF21lns9uxZPF6?=
 =?us-ascii?Q?8pHPrYDA1FSPTSL4JikKUZzcvlAkXS7DfcJ4Pl2nl7flvlTbSlq08eT1n2R8?=
 =?us-ascii?Q?pm7s3t4RG8OviD1pI5YH3NKFh6z5hOEgGmjSuVLMyNwb82uKKv7Yd2wVLWMG?=
 =?us-ascii?Q?C2TMVj9lKLuZqoQsjwvp+HWYWqv2dR8zJQhech/bYTuWkJCnO3Q+bCrOKoc0?=
 =?us-ascii?Q?t7pu0sla51Ss693Gtrwp9/amQjGeuj56rTrDNiWN4f+ZSk2jyY17efcerHU9?=
 =?us-ascii?Q?cBEezZz775eg8gbQuwiu1g+YiGm72Oos8FVq8FSQ9C9iMW6BbJqpj5aHg0k6?=
 =?us-ascii?Q?7JOAqO9CsmbXV9cy0ZuEpaKmPZ4ZXY9rWrMT+TIztS427tYlcMGsm/95nrmU?=
 =?us-ascii?Q?TmHQXpvkmBv+ASiutuBn5oZIc3/dwFZ7KlleEMYcEjEqz7aqq47i8VXjPoz/?=
 =?us-ascii?Q?SGi4q5cmbET/ZxL6IQDn5rGYzO7uJUj4wVHp2uoLMu4hy/zYUCacFfZ73XqH?=
 =?us-ascii?Q?1nufCyY81AVLNWH8XqQ9Tjm7RWVIP1fsB2We1KJPst3Ck7GO4l7y92JTDqqA?=
 =?us-ascii?Q?fBFv7IGHtEfOyD/x/wWv8+a/LOYwRSStLv7m2Rn0BDvqdpPmvo5ZRPFC/qdi?=
 =?us-ascii?Q?V9xdpFjS+sQpwF181gF6OSgSWqxUPrWJD1B5mhR82Pq5YPQUGbtdII5SiJVG?=
 =?us-ascii?Q?Y/wvvH7b3Vx4nuYrP5ZkhdwsKDKkzIQ1zLJmO7DsM2jKHGTZcK+VsiP1en4a?=
 =?us-ascii?Q?29u3u+YDf9RW9yLrqqXKop9rERto15LTztBKogM084Dh5P6/mlLKE/qcT9dx?=
 =?us-ascii?Q?Fspg8MetfG5K8IFEiMeEiB6ZxGRwKExh295K1bXELnFP3CHfFbCTxfAq/shG?=
 =?us-ascii?Q?hMphdt8CGRgqaUkJeGbN6lbFS8S5mDyuSTUdtPjiKEMaZtE19tGqHk0j4x3u?=
 =?us-ascii?Q?SPb7KjO+JzmSAyny1zJzSkI1droWz1hkB8CUW7qaiWdx5AxlObVgwvTVvCUO?=
 =?us-ascii?Q?p/7Pw66LbcFRFY2b49u/wKCnEvSki1bVx/+Poa1TZkHfuw/yRITk/x74uozj?=
 =?us-ascii?Q?n1xhLHs8FpiMk/zUgfU0vfSeL2kqhRmZchZqOoYupXgUVOEASyUPD/FOxk3g?=
 =?us-ascii?Q?kweZUIGswEf3ScsjYJjIFj0nnGil1YlMVzE1DFB/pjesB7ji3FT6uQz6Qu7O?=
 =?us-ascii?Q?oCd7rJGgBx2/qCBpE9FWKFhIqVcjsKdX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2375aade-46bc-4653-5ebd-08dec30bdc68
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:08:04.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9994
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
	TAGGED_FROM(0.00)[bounces-8500-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:from_mime,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E685648C30

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
 drivers/leds/leds-st1202.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b4adade49898..b32d8e716372 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -35,6 +35,7 @@
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
+#define ST1202_PATTERN_PWM_FULL            0x0FFF
 #define ST1202_PATTERN_REP                 0x15
 
 struct st1202_led {
@@ -204,7 +205,15 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 	if (ret != 0)
 		return ret;
 
-	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret != 0)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR, 0);
+	if (ret != 0)
+		return ret;
+
+	for (int patt = 1; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
 			return ret;
-- 
2.54.0


