Return-Path: <linux-leds+bounces-9064-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SC4uAggGVWo3jAAAu9opvQ
	(envelope-from <linux-leds+bounces-9064-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 17:36:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26774D1FA
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 17:36:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=VIvpser8;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9064-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9064-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0823028F23
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 15:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB30372696;
	Mon, 13 Jul 2026 15:20:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013011.outbound.protection.outlook.com [52.103.33.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B21284880;
	Mon, 13 Jul 2026 15:20:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956039; cv=fail; b=obWvr3LRA4AJY5wmfn+zkIPMmAtaRBLklPvz5oKyATjV5LnnWLb+EcurharbDIJPw5ti5ZSRSGHm9rPqkvzxHK2agxWx54Kt1tZjH8M5X8qaViCOwM2VW+OiRjUIW9j9c+OKI7AfMmOthDJQcvyRPt12rU2PerAFJAHb2fqHt+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956039; c=relaxed/simple;
	bh=4cEaVKYcrMjOIqw56Wm0gZD+UmrKPa47kaC7sqybaWI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ad+JD8B7ztli2rQpX3PoUap2BbG982jxEw4DJ2wd+VE25v6g4RGxT4k34dNFZT3L+k0R5AjRlYI29rpQd3GmA6baRlNyno5s2qE8kvTKlDRq4NIe0gOGE9vFIDVAQ/evNX5pdyfLQZ2gi3vNz4Qo0k64Z9pMDQheq3jA8r0sh9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VIvpser8; arc=fail smtp.client-ip=52.103.33.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euT4bOegL2cKQm2LQtls2lJIpVZL0qnaBuWCiTPNJwCnDl+jdvlpi6dkRRsHYCbaFQOkJxJcgrcB5m7k+c01Zi78t26iKkun5YHks31+wH1YLPuIW+qoEZ0UmOTHAMeZa90zOQgqprCE76g8BaQAyOTf8yeNLvOERgf4EO9dUF053waV1q2wqmwGBb27Tp929jxiX+zJL1r77i+Wq+ZZ+Hr6TtkK/uL8QrPYU+RoWxxY9b3Bu6lH3pJV7Ry2ud8TrR2NLHYTpaO1bN3BvNaODVCqfY7xpdBM8GikJeRqMh+aVdhKa4AZj70oeyotwf0psDUp15ziQrI0rfFwpOdLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwxViumOF3uG1u6tg9Ucn07uN9sOTZH6ypcdtsGEDfM=;
 b=bs8iMOZpOoxn4BYSJvnOp99BjArle5J4wA7SRAbEWNIF40FyzmBdtx4uR4W7DmrpwD+kzUW3iThCFgEDLH4BoVCyG2yLfib5azl1uPTFWN9klflBrfmWoV3xgUqD02pzH4As5HTd14pf2+eshWisHLsP4rUnCdygJkjPq3YNdZsKMb16jCi37DnpuhmeyGah5hs0kZ8goSoPJuF1iCgF2PYMCDL6RJ7GX5m6Y1Yz0OJayBDc/bcmpyjySGSXu6rkR3Pe1Rll03tUvcWDbnrUkA3ioX9biZ3tPKyv0ljDNthlFWlUraRFw/a/0hmgB5zMVbkr+yH6QUFhWZgPOLUOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwxViumOF3uG1u6tg9Ucn07uN9sOTZH6ypcdtsGEDfM=;
 b=VIvpser8gGKwbDVsIAqI+CinwncdhH97nguwLMChOGHs6RKWi9kqnHFp777lCA584KrQ9gEDc9TNN7pz4fQqJyS8LSMBUKQTIaGAvQk3dOP0+ziwNxZs920ic8dwLWs/jtKyR9sSH1IRdi+xbCW1L9Iw5Ozzs8/aMATsp0cLIpviEWc5iZNwAUv39HEYyqM/5GP5UkkUMF642r+yUetWRrM5lrV1Nl9GhpDgNEQblmFupuC1rQ9EAeSCuutvMcIPtVWw+XtFeeaKCMn/lAM1/Zox0B1+pBh5+EXjcKLhrDT3OepzadA+XVZ5qLFl9hz8ZZK9GIpOcQVBDlfyvWQR+Q==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB6406.eurprd08.prod.outlook.com (2603:10a6:20b:33c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:20:35 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 15:20:35 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] leds: st1202: add hardware-accelerated blink support
Date: Mon, 13 Jul 2026 16:20:22 +0100
Message-ID:
 <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260713152022.648141-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f1e1ba-91dc-4504-73fd-08dee0f24917
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|25010399006|5072599009|37011999003|24021099003|51005399006|15080799012|41001999006|8060799015|19110799012|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wP0TSXzoi5KQqRV4JezH/x+UjQ4EB0D2jSoAmcs0zctLyRYBFfL5b3Ctz6vz?=
 =?us-ascii?Q?oge2yNGcoJPvgNzmGI+MFk+toPWrre1Uf5aXC+gjNisege8Ohpww8fbxJ98r?=
 =?us-ascii?Q?gfOiKTEti/N1E23i+Zl6xntCCluflJ9EEd3cn7vg8y5HXswz1bm3EDpxMmtM?=
 =?us-ascii?Q?AUq/k61UVJF31X4vkDboXdBcA9DoErh2x2CMTPXw/RYZpuByXptMGzn5Ql7H?=
 =?us-ascii?Q?HDYyk2Ycb3SnqUSceKqpr4rUHU4nejE8wepPykp9Pnqszi2WWQZTcWaCcoqB?=
 =?us-ascii?Q?dfVGLR58wGNgQHEM8UtWx8tZVIF9BvSIvyQ3iCR6VhiSuR8Wj/MBUTENj4nw?=
 =?us-ascii?Q?g1cQaCBgdKd/Wtbf4m2eJtfRMeB94wbDCurX1I0yIhKmcwdLCQHVnn6Xup/c?=
 =?us-ascii?Q?I5c3ggSm8DE/NCTaEfsmJh4XLLh71IeJSRDUmvKfRSxtGPj+kryfOZ6BEw/u?=
 =?us-ascii?Q?zHPp3rN2x9blWSQsGjiLh31Y12uTjcGntCHR7jAgzYi3iddxfpYvygNXUJdq?=
 =?us-ascii?Q?Qi/tGfPD27hdI7o5edEzvZGzJi2XL/E0Sxt7g5mp5UGF0MCROlCqLQEw7fMS?=
 =?us-ascii?Q?T5PBsGbiCCMRwYHIUnhFhE+FI08DUlJiQVFJJCqZn/lHv2To8NtaEiwz9tQw?=
 =?us-ascii?Q?Riu505Xs2ojavpvLDh1tMMg0bdzO1l1ftCZadhGVEeP4X7MjYoI8EcxmSfAy?=
 =?us-ascii?Q?0GafE4Z08hq3AOI85c/RbjIzhuA6XtXf5q4c765MNvmhD0tJtZvDBKvqZBX0?=
 =?us-ascii?Q?xS6B1AtcPBSJqaDBV0a2Ijw1ccuUytRIvu6vw3loDqzUw7UrgXe7okVd2E95?=
 =?us-ascii?Q?Q+1AgVhkKvt2pIScfvVXy9uNdquiC4/KcCvVbpgtfVAaQd6cwR3jZ51Lphua?=
 =?us-ascii?Q?RuJupbxrPEoczy0W10pQlb8vVtUqzKj3QMI0e3EFkZSHQm/6MTwx5fOSbhYj?=
 =?us-ascii?Q?r0NjHTkEUKCV6NSMjmU6gyGwiK7hTrBWtno/HxhTdPfZhNmi/y3Yj6Oo46Rl?=
 =?us-ascii?Q?qcI5?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KMPDUQ+xcMJDZP5iaIiecDptSjffgJ5DHFLyaUWecR68pToDFI9MBP2f37/A?=
 =?us-ascii?Q?kSd/vQZHb7qH2+1KMTLf3qxy0i+ZU4DLJpJbjsXzSq/wQrHfpc4zH0z1SStz?=
 =?us-ascii?Q?pgyBsCBAjuM0oQ4pWkiFjhfhtoz74qrPpC7CxvDB8vopsgPvXH7qlLPv7bM/?=
 =?us-ascii?Q?zqZ6Xk4ZOVI1+361o8Uw/vPrbJ3IiVDM5psSujab3hcNBY9Jr8fxKu14ec0J?=
 =?us-ascii?Q?ijl2jbymo2NRUs+MnjkAZSjTyVAgVQHyg6Px+jlRlhSy/sZyWhEZ0OECU+E2?=
 =?us-ascii?Q?1hjx+eX5UulWB5t3/S0u3ugnvcgv3FBvxeAGUvJOaSKhP1qG6KCe7zK6rQN6?=
 =?us-ascii?Q?SHp7EDBfTkNzHC3eJ9LIlREvt5l70f6ahNjLD+XEKiFJn9ICd1AKPVwNrkTq?=
 =?us-ascii?Q?d757/2lmyt7YWRh6kFjEaFcxYVPuOhCb1cCvlQYLg2G8sJmKhG5NSK0IXj1K?=
 =?us-ascii?Q?3hGRTQNDDpF4xUmLnyuJmiyNn0+Gi0yRbmUpLOjsa+DRhWPRvQ+DFIc4pYiB?=
 =?us-ascii?Q?CkpNAvNfuIJgy0fs5K/MipvJRNbYve8EeFnflzi49HNj0cBZ6whBDIFj1+yC?=
 =?us-ascii?Q?cuy3GOlwsrOo+h6LRoTFS0xho4UCBng1vBYXWV/CJsrmjRhjgkdCPk4+J36Z?=
 =?us-ascii?Q?X14jo5lCmWY7QnUq+SWMHo1lQmkngKY8Vin820CxLsbMy4SCEIqowXuxZlHk?=
 =?us-ascii?Q?EHWtX0BJF2c0BIlfAhiMxH189M3nC590clzW43L2O5NsCiu5lRqH1zbSU2He?=
 =?us-ascii?Q?euEeKh1zb+TQ5V428X9mvFSQ4v+8SwefDzX02oItRSdYz+dyaTKVft7X16II?=
 =?us-ascii?Q?9dEz7dUyO78SINiNpT9By4lxhzIs0qO9GwE5DYW0sA/qFrgVa5/oG+QLmPTn?=
 =?us-ascii?Q?xsn3MGbeJjrwVKEO5IqzAo/xwNAsrdfZJlAmrZSh+xNQTQwzRQRx4F2Rziuo?=
 =?us-ascii?Q?HrcQ5VkSpNxU8SHsGTexN8s6VRjk8A4o5SS90n94UYJYvMJ1XszHPy/ZyerH?=
 =?us-ascii?Q?X17G/KqAvc0Fu2uiEs3/tpJd2aMr76HpFtoOFh13WwgtgVgj1nzhdNBhFfb7?=
 =?us-ascii?Q?GqY01ln0SnkumF19GBhQQEvFgRAM4x3ZwKy5eIk1KJzp7I1JEBNbyjACIawG?=
 =?us-ascii?Q?l3f+FGrE42dthEv3v3Oym4w+H6JWkEn0vb1Cz1ct1j2YwRfJNB5C7o4LtR/N?=
 =?us-ascii?Q?bW4ScCVb2rcBMQG47s2vhRHD5dKOYE6yid7GW72CNLeVPFnlJsZcVq5znaZQ?=
 =?us-ascii?Q?6cmsaD2euVbUkHu8CFY3a2v/i9twLeOiNCEeyXwPeHuEPJDGjU6WPrpmvRIT?=
 =?us-ascii?Q?cagIEbsSmdJ4YZuJPuzpgrCVNkcUtr8w0+0U4cIHPwiNwUzMTYg2XRg42c6R?=
 =?us-ascii?Q?FnoN9y+vM5u8/wBaadYkRtjErmWqdbtYws7quktEQs/AKRflIWBb2m3PmD5e?=
 =?us-ascii?Q?GMTyUpruG1WW8wd9Qs7jltuu3VtblF0c?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f1e1ba-91dc-4504-73fd-08dee0f24917
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:20:34.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6406
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
	TAGGED_FROM(0.00)[bounces-9064-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:email,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C26774D1FA

Implement blink_set() to enable hardware-accelerated blinking via the
timer trigger. The LED1202 pattern engine is used to produce a two-step
sequence: full brightness for delay_on, off for delay_off, repeating
indefinitely.

Requested delays are clamped to the hardware range [22ms, 5610ms] and
rounded up to the nearest 22ms step. A zero delay is replaced with the
default of 500ms independently for each of delay_on and delay_off.

The LED1202 pattern sequencer is global and its timing registers are
shared across all channels, so only one blink configuration can be
active at a time. Other active channels have their PWM slots zeroed for
both pattern steps so they remain dark rather than outputting unintended
values when the sequencer runs. The target channel's ILED register is
set to full brightness and the channel is enabled, since the timer
trigger deactivates the current trigger before calling blink_set which
would otherwise leave the channel disabled.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..fc784a854a33 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,86 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	return 0;
 }
 
+static int st1202_blink_set(struct led_classdev *led_cdev,
+			unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	unsigned long on, off;
+	int ret;
+
+	on = *delay_on ? *delay_on : ST1202_BLINK_DEFAULT_DELAY;
+	off = *delay_off ? *delay_off : ST1202_BLINK_DEFAULT_DELAY;
+
+	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
+	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
+
+	guard(mutex)(&chip->lock);
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret)
+		return ret;
+
+	/* Zero out PWM for all other active channels to prevent them from blinking */
+	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
+		if (!chip->leds[i].is_active || i == led->led_num)
+			continue;
+		ret = st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
+		if (ret)
+			return ret;
+		ret = st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret)
+		return ret;
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR,
+				st1202_prescalar_to_miliseconds(on));
+	if (ret)
+		return ret;
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
+				st1202_prescalar_to_miliseconds(off));
+	if (ret)
+		return ret;
+
+	for (int patt = 2; patt < ST1202_MAX_PATTERNS; patt++) {
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
+	if (ret)
+		return ret;
+
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
+				ST1202_CONFIG_REG_SHFT);
+	if (ret)
+		return ret;
+
+	*delay_on = on;
+	*delay_off = off;
+
+	return 0;
+}
+
 static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
@@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0


