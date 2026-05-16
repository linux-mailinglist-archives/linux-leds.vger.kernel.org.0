Return-Path: <linux-leds+bounces-8151-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJEcCK+ACGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8151-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:35:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F37255C1B0
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E02E230013B8
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBAE336EC5;
	Sat, 16 May 2026 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="f29hJhoZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011024.outbound.protection.outlook.com [52.103.53.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8168613957E;
	Sat, 16 May 2026 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942111; cv=fail; b=D1rY9muP8vUAinhSTAg3/VlBhnKgOYxXLpfr2exPkf9LExHbJ9hx3vfKs99Th8cFNqbNej4G7Ez26cMluSvoH24mfkTY9aHdAJTl1GjlozVLnjc9plWTpHfdx/2P2hCRHNUweCFgbJgcT4Hq2nOQiYZCO0j0752lmdpqwDQMdjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942111; c=relaxed/simple;
	bh=7gyOgZ+D5gYtxtwgUYP1IWb5CAKjqEv4n35tdTcLluc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KulxdtcmgSGbc2bm+NvjKe/oMFYIZ1A21jTTeHlkuR9ey4GI7qwx8bLRm0TL1LqqkyH6L7VBeKHkDNTjQzbpM3/YRG/uB3+UpRYuIW4lH2bkgtiKnXScnfmQgF5C6y4Y6bUstrBBHkWuPWAr40eBvm6+yb8EH500fvjweitaPbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=f29hJhoZ; arc=fail smtp.client-ip=52.103.53.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmmkZtkd9pwfqu0gT5QHj4AP2bibTBbGtl10ms6n5CdlQGStL0OUXZTe2DmLqVgJCN+tqhTCIhKDBmIW65rfsBdYusOXGSVUiK2PxdGMQDmbM+/npbJQ4VjDE/aPaguri8/fBjQ9vig+QgpFTUuXttypNFfFMDuSdQBysUdXTiQwZmhCTwahGaStvUaptDY/TimxcbhWBCUk8Xcp8cfl0mXgLvrdBKXxQ9FYO3tBYjBWjIXfNyoLKNc9uf5PUd25rSWmzjz590LDyD2N8kzTJ8gVM3Wh+SRSyLiS8zYibSrvyUwEu58XiZkxNqcLWRBYdYnIG4VNDKrQY/Cr2Ok+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gys82bOseI28kLbsF0/6fM5F00KBV+e0nNdh1qiq/+c=;
 b=mPH3yrl2aJbXcXAG9zn2/O8Gw1w7wVqzYGGilTz688hGLRCpO1ygw8IdGx+iUWUdQvsqERu4FOvD0xrc3bWW2bbFgs/kCIhw+mfhK6t5XrIbz3s8Ta55D29P3WihPm3sZzG+9RzqK3sVt5mLXXGn1KBXwm8EdRyJPU95MZQ+k5uvr/tCbbPNeGakx53CQFfA7bcTczgS81DHpkXIxCHorEp6SrEgJ/xbByQLuHWsrIOJZmy4Jv7sbeiEkiZq2VNNP5ABk/6t6hPTITXE0kFJeayirJD5/elVkh4W+NdymFBi6Fvf5aetE1ScMlUpicn3BZj4946PtXodTA0R6nDKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gys82bOseI28kLbsF0/6fM5F00KBV+e0nNdh1qiq/+c=;
 b=f29hJhoZyNNvgudUgyW4URX/V8tWG3w/J4Kfmh3F7IcHGJg0XSS4BPiQUPLTSePE3OzTWDiFTHmR7jE7i3dV/W/jrIzoxqSnrx3/2niO5JO1rp0JSRb58w38MV2N6DcJnXH6Y9mJ5QdVl+YO9Ih+dgsb2qyXWQDO0c1Ja2OMNQ0s8zi4pd8dqe4kWv87PcZ4Uw2Ka+jrLYy6Tlb/ABA/epu3j66jKBjCwGbxnJJ640n06oQS3InRlAtx/+EXF5S6Ztsdn2u1oq0zcNc15EzLvtEw8E4Y+0BSVoVOK5xeQmVLSsAqpMJ2I6/l4spcJzsPxPvgeCv0VWbKzdrCAFlFQA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0132.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Sat, 16 May 2026 14:35:07 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:35:07 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] leds: st1202: reset PAT_REP to POR default in pattern_clear
Date: Sat, 16 May 2026 15:34:54 +0100
Message-ID:
 <WA0P291MB03855D8F0CFB78013532AF45C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0304.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::20) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143454.1625231-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0132:EE_
X-MS-Office365-Filtering-Correlation-Id: fe51182c-0514-4e15-b297-08deb3585371
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|8060799015|23021999003|15080799012|21061999006|41001999006|51005399006|24021099003|37011999003|55001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lfzTaOB6iRG9rv8f9H88U5DhupLGZnGxMC5CVZV/Frqcm1XoJQj0Mh9Xg9f3?=
 =?us-ascii?Q?Ro8iBzpORhHRBfR6CkBMiIxJfsRpF8kWByPruZjAHmhqo8hEP5Ipa0oqComi?=
 =?us-ascii?Q?7sF7dCSltEQFKfStDJYWbDHK/p4viTbQjd075ca5P1GngfyKMUsU4arBhzYF?=
 =?us-ascii?Q?UOOARuJDmrdQpdQVm8VfZ56ARIUP/z2FuMpFjqtJcUmKq8RY7n7TKMv9Z7QN?=
 =?us-ascii?Q?9I7UKIg99LdPWuFbnaS0NYFL+Okb+ulV12qza2zP+ip4KwFVGeEG8ByEZ5dp?=
 =?us-ascii?Q?Agn/IAgw0U+WsXqgh9el+mFHrV47oZ2prKjtUcNhRjoO75Jry3k7gYMpevWn?=
 =?us-ascii?Q?RR0HnMqN+vKnrAAMOPibMNHDc0OnlzNVT0vHIRkunT2FEWZNUOnpp/sEmibh?=
 =?us-ascii?Q?cP7VitFOjQOqvNNuQqkGFh4CmXtehZUqa+Hq6SfImrAC5BykdlUUdDdiUybI?=
 =?us-ascii?Q?qs2EwQsajLZhkR57L3jbHmdzkU/ytJDL2AE9ppbQNApC4FNFCNeSeV6AlaoJ?=
 =?us-ascii?Q?Lrr1ObcRhyVHwWIwFvDzHywVkyyAAXBSvUXPQ8QZ2qTz2VtXsUcgOTsrPE0q?=
 =?us-ascii?Q?IywaZfvXWK0NsEqXv9VO4gftpRQHrbabttJej2PGfL62INXyWj+d6dQU1gie?=
 =?us-ascii?Q?qVE4bWzLizBMzKmWmJjqg11TKR83J04XilLR2saKVj3GcEyXzNJgfxzsXsiO?=
 =?us-ascii?Q?AdKyHn3UvIrbpJcAT1lVIlOUcKsw2b9gGhYpCvn4vpoZ9flB4FRcQKCV1Qwu?=
 =?us-ascii?Q?/DhjM5b6eWdAx62Zx20A3Gj757vwIh9jLCKKHNTVT3ymMIW/117J3NUpfm+n?=
 =?us-ascii?Q?Mn52v94pmpV7MFau+2T4VP2SNvY6WeGgRobYedg2eXABubPeBXGObZV+l9TC?=
 =?us-ascii?Q?87lXaxrq3/Rje+OwUc483gLRQIHs4GVEXciAGKW8kinDExx/rYHW91wQP4aE?=
 =?us-ascii?Q?F9uKE30uml35q/TrFMrYI80mG6Hjuaa/dqN2BwA3W62ynPo8Ze5uAlubmTWW?=
 =?us-ascii?Q?5LBbb3Gi0/uhDz0ydkvvB5xiD/kZhgMQS0SrP5ve9AxbgHMa5LmkhK5Xwn5I?=
 =?us-ascii?Q?1ngbZXn3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iWHCNI5Z6nG+9/XzKFrnCu+IX3xPcxHAwRlyB3u+mGPvhvlRXFmuO4Qx8n0D?=
 =?us-ascii?Q?nlz4lKnqgV6Mc30MQFNgTQLYMbOsTX+wp0M8X1G+NUt8lGWeM+arkhJYuj4K?=
 =?us-ascii?Q?GL5ttrl3iw4Xtnuf1wIOSuh2I2KOM/E/LOkBAceXL1crLTz0jOqdLj0je3Zu?=
 =?us-ascii?Q?Y2zoHW17H6MRE+26Z5sCBGKxYa8yP6rhvxc9zjlvWq7h+Ys9iF2f0v5z7wLX?=
 =?us-ascii?Q?sTntnFE+448Bh6/v+CEni4ZAmbnxBapYVYuTD4LDrA3EgLgm9Tq5uxYzpXM4?=
 =?us-ascii?Q?PFa/afRhiqKJcDuxwoZd8QGRmKh7PTsBwlvxYASurmiU5v9sX9vB4Vi9NhlQ?=
 =?us-ascii?Q?/MEBp0RYrtYfBHs5Vg5r8W3C61vzpc7iZ6ESAi7x2r23Me37z7tfEPNZLvlh?=
 =?us-ascii?Q?p1STS316OLEj5I5lyDarTXoapIduPPciC62hZuHtooXa+FWjvtjSV1YBmgzh?=
 =?us-ascii?Q?VbKrvlmB54+9qRkzL9bVZJi+D9SPN6NfVTPhr1MrhQyk0YWdqcWVKDLFRu0/?=
 =?us-ascii?Q?h9FMJAoEIOoBGRsWT7uX9Jm5Zv4l5nGI2fXeUEutB2X1PxvLKfqK6lNKn2Sd?=
 =?us-ascii?Q?NrfLi+6bkmKMz+YAfvZ2Y8Smjj6HINd4J/0tmNkQpwa1dw+VDmZLcafxhdfz?=
 =?us-ascii?Q?ANiAnvBbdAIfeZK+EVFC/REE56rIlOhE7Yyh0ump0UOxW0q1eSqLyIFyOOqm?=
 =?us-ascii?Q?0RNN5zbzoh0WiltO1V4HPk0+lYyl0tnXOSGNEVb3H4YtzWMyUSvzowd1qJTh?=
 =?us-ascii?Q?E/RBNm3Ct5x6NCxTSq+CUQYLnbXszdD/ssHc8AeI2Y+ye5kPR7czOUw9O7Yc?=
 =?us-ascii?Q?YuC3M4HdPT3HiB/kwf1dshSreeBiBuuE1CfzBmZKb5Gz2QBGDZOjLsu+aZPj?=
 =?us-ascii?Q?d0wahbxJP+rZjv4+54efqrZBaNLCt1mXxsXNi0yngpzKMfCh+v1nkRHKEyBG?=
 =?us-ascii?Q?+tBxXGqAga7ndANdM+BI/+8GU3smMLLnsfhuYUDEnfMaLbCEApubf0hbbLaj?=
 =?us-ascii?Q?pGZIoFoafHwt2snn9zZhfXqP/aOAeoFRS8/ACuNNsOTePVF47FOO1ltiYCNT?=
 =?us-ascii?Q?RdEgKZKlaDhgaKlSv5ukll2iXCx47m6dXSYk+F/C/myfvRjPT2gnWxzQBgFi?=
 =?us-ascii?Q?NYlTVECSOR407DTjxWZjFXOVGvHpwIwx1xo3Bm9NfpxrsOF04Z6UwLTBVw4w?=
 =?us-ascii?Q?Z9bIZftxK+oZUf0bQp2/ME0VCIbVJtRwKIQtl55baupYUnuJOv7S/kZNAwnn?=
 =?us-ascii?Q?N2w3jzzRG48FQv7kW58VcqW3jZIBUcRRKBfqbgsJz5OWL79ttLkk514FZFHA?=
 =?us-ascii?Q?htPcIWBPWPYdlwk99dDZeu1sNMBuN68iX8502vom2rjWXtrI+PEdXJHWAgoW?=
 =?us-ascii?Q?nELoYft641uE3o93cZdfhW//YxKuO9EQ/saE+Xpp8NxYEhoIypNwc0IP9EFf?=
 =?us-ascii?Q?PEj/CqJVEQSBI9BVvh5rcjU11wejonm8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe51182c-0514-4e15-b297-08deb3585371
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:35:07.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0132
X-Rspamd-Queue-Id: 1F37255C1B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8151-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

The Pattern Sequence Repetition register (PAT_REP) is not reset when
clearing a pattern. This leaves a stale repeat count in the register,
most critically 0xFF if the previous pattern was set to infinite loop,
which will be picked up by a subsequent pattern_set() call in the
window between pattern_clear() returning and pattern_set() writing its
own value.

Reset PAT_REP to its power-on reset default of 1 in pattern_clear() to
ensure a clean state.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 1ca77fbe4ec9..9c1ae35dcb4c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -204,6 +204,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 	if (ret != 0)
 		return ret;
 
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, 1);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
-- 
2.54.0


