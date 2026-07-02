Return-Path: <linux-leds+bounces-8888-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0vzkEPjoRmqifQsAu9opvQ
	(envelope-from <linux-leds+bounces-8888-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:40:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DE6FD430
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=rW64OPci;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8888-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8888-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 212A43058748
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D6A3D0930;
	Thu,  2 Jul 2026 22:37:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013080.outbound.protection.outlook.com [52.103.46.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B23D0936;
	Thu,  2 Jul 2026 22:37:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031843; cv=fail; b=dk6GlpUUFQLp2yUwfsK6d/K1gjwaQwV0V3oeCywgR4xq09Vf3Ji4HWLw1UBS2Doi0Qvy5kgc52XkZx9q87tZtbzC+KFl6i7xYEq7tzaBvCAq0rFbVlOCyUcF05k6kWQegdRtarOey6F9ADURb224WoykcdWM+UMkXMR6cEzIQl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031843; c=relaxed/simple;
	bh=jl4gB9fKiF2KS08nedLY/ToLCw8G8kEzFfLNglTzMAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k9zCaxVUcXbyTcSgbp1/Kmtw0cepzPDGPoubdr2v2nXgk6ZOW+p/zaQFoQvVT0wgyQ+tRVg8d66cebzbVstqP1a+TSmWL0FND/VoaCVMRQ+93fYYG2yDgRlevAiA91uK9jPv2d/s8LFIg5ryqJRv/hphCojSJy81P8RcnuKNIwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rW64OPci; arc=fail smtp.client-ip=52.103.46.80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f02LnEy3B2cvlk6xfn3AoLjQTx34J3GV5lk0gleVFHiXeobjrhgh0IkP1VJzhfXP5Ct4kVeey81cjkQNgv3lh28+YY2jKmYozVnKFG8fBM2UV8w3dUPPmhVeBW/rahrzkDqYvyFjZTNf764wLra4tj5RGmic0C7sFD/ItuzCU8VwGDKVDe+p9DjUMTV6CbKnY8ey2zWpDpYwkoRHccsLeI+LZ0JUXA1/WYvrddmFXPee9Z6HLfMWamVYWF01or62KVypz9rYSqx4VuwNsF785+iPfZmNptISX7zXJvnUb8HEE7o/EzVJbMoSGV76PbkkUNv6qi0niWTR+UutaDhipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBlFcD7L3zNbbRTzD8yZhEydL7xE3mX1aiPvxr588Zs=;
 b=bEE9oCg4E7sLmDjRXTIxJWF9iusu3p2oXcocco39p83/s97zmHOmzsJVG0RFWV0UZvTnpeP2e7kAbvSp69fFS4j7Wnw4PjknyY8QE6Xw6rYIen32TsE2Obe95RZocEk3JI7+/EMzgKiuS6VpyoRa8ew2j28OKUMdX/l5ZggjLQImoxKe0RY/PQ8kzjr3CONk3wDqn1l1F3RUthTccZ4BWsHLr8uUaCZEpDlBS+PVMk6UWXasVu+URIAOtNZDRfmSpYsfUuGJZJQch/1X5EYriRzxsWpcMvdT6+pYBicgIX83seTpcxXfLaDpjYSM6fnm07U3ZoLekoZL1csROnlYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBlFcD7L3zNbbRTzD8yZhEydL7xE3mX1aiPvxr588Zs=;
 b=rW64OPcioajVLOXec+4LgV8d0y+wHHq0/YnAzVBsgjIMJDhLW+FINjsI9+mvq9ccVtYah7lMdXlLpUs25Tyb9qehUpZ+Hz85CvjVOBShPRUqXklVnxCFtzq2EnRovgeb3qHX/aMKYpHeQnx1giegVVPu5i1o5vycxb7WiZzP+M3wVB3PCU389arBK8ZNvXczyJu3W9HXLBMqbObIv3KoTMXpRFTM4FQpRoLQWNAShcYArvT2wp+xBYGt9GR571ebhh7wDiTsqyNegZWtVG6oPZUDcemWypBmpNwpfa2+Rq/vOOw8CYtqbnZMXzNlEcPFWTEdL30mSeaW5ohkZaB0Tg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:37:16 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:37:16 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 9/9] leds: st1202: correct and extend hw_pattern documentation
Date: Thu,  2 Jul 2026 23:37:03 +0100
Message-ID:
 <GV1PR08MB8497B2FB4F5AC4B142790CE5C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0659.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702223703.140547-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA4PR08MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d0f964-9eb9-4991-8d7b-08ded88a77dd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|16051099003|37011999003|51005399006|8060799015|41001999006|19110799012|2604032031799003|25010399006|23021999003|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oLV7gZBgp35QrqFYBp+GVlbBaZiWQsE1GaRMdpn161cKVtH8BnVbDQoIA/Mj?=
 =?us-ascii?Q?bq0Mqkmnk+99cxJTOu7zdNzDy2UyC+ILAl53Taukz+EOhTI+kaeY2tOmAPK6?=
 =?us-ascii?Q?v2DMm1t8nxI6MGL5AwzIfN6kvHXvm+I9rv/uLZN2dpHdbZfBJCyb6xA9w/q1?=
 =?us-ascii?Q?IV2xM1WC88BG23kBMcrBl5/0qLigxjq43KW1QmIQlQQPjeWThm8AI28KM/+j?=
 =?us-ascii?Q?kfpvQslnlJjWTDo75bEwTkm+Bb544IhCtMWHuqETZX3o+CJmIs7WCKQTiHrz?=
 =?us-ascii?Q?ewjdQIZfTTEzaKjHO7cJe4ISK3+RMlwfq0Rnr91DiDE44tVQC9+tcY+UwtUL?=
 =?us-ascii?Q?o09/6lDVHfgTFa4++H4VuyVLCKOa3jAM4oMA8ZkD5LpFd6nB4qxZPO5/vsVd?=
 =?us-ascii?Q?jaAl7cPUkbx4HRocA4FdsPlcrmzCX0jra9FH+yXVu/bAtbGAmNSn6+3xkLLh?=
 =?us-ascii?Q?wVBFtu2HsdlbAZudsz9S1Zkbpx5R9kGuBE+bw/R6QvbpxSQ9QBWIgy5j8f7K?=
 =?us-ascii?Q?/HvrfgjPRXZ5j4yVOsE3BimH7ZVyeRmztt2VVymyTNMEaylfpa/VOJvIZDHA?=
 =?us-ascii?Q?9dc9zZ4UkCpLP6JMz0iEUAYM+Rrzuxtmj6yCB5MZhdrv/LZ+gzCSgXRPuq+A?=
 =?us-ascii?Q?IrkLzj40ba9kCoFN1P53VxmGmGzoNmoU0XEl3e118yJV+reqznez/3k9nckd?=
 =?us-ascii?Q?kxM+BKFZDZ445tigmOl25HTnnKYp8/21XdzZKWsy00u0gvKeDRkFTIATZSvC?=
 =?us-ascii?Q?mP/EPYtHS6iVtKUbnCl9cnowcXJ+fS47pmcNBGvVbpTO3oMWdnsuT0JTbcZY?=
 =?us-ascii?Q?gLALgFo+RR/CFIzX1BYT3Ya69Pcdb6WglohIvHdkF2crnjSXbiyASiqhRIB0?=
 =?us-ascii?Q?xSOadcCF+j6awzdzDAUPcZErs4bLntrI7MI90tUfSNlOKrEgTidc1CWTpRYZ?=
 =?us-ascii?Q?o9N9bFIOdX3u7gYrTHPR4cRw7Y55I+TGwzLrDvvsvm7CWNDKBZNaC7pOeuB0?=
 =?us-ascii?Q?98aKU1N1s6HvDpZa4A3RhILHJ+0MMwuFBAgcmsrFQJ2eHG8PlTrdiFYJXPjw?=
 =?us-ascii?Q?v1MreWKwXbuAucWstdj4qUY71Vk/ZA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yeCmoQIdpL9wucwLAyIxiVGyH3vLoqq7AOBcA3sWinKRzdW7l0BWmuSHqN92?=
 =?us-ascii?Q?Dcq9yQ2hUlBrX59YLfLHef4WSt7b762WzvSBfo14BOhaqc8LdZ3Qyp5PuHBy?=
 =?us-ascii?Q?ESpRhpA+7z+J/Tmx61pZj1q5pa0Ob8VVAjp1kI4iu6hpWUgRnPs93lrQKRXR?=
 =?us-ascii?Q?XfER8eBZaqXxncNksTNHEBRZmmuBYUEUuz2Ny0piJhno0w/wWujSh3LdqBQX?=
 =?us-ascii?Q?t0kiVc7dOLUTYsv+Ytk3s3s14rjsk8qjCjhhZGWiGZOURiuZsA3t6Kz7n5bj?=
 =?us-ascii?Q?376q25Dg9w7nUS9EHYspesV0zRsSvlSWhMo6hNjvXmtE9Uz8+YNZbppmiuY/?=
 =?us-ascii?Q?rGqBG4NyNYkIumvkpg9NPOZIqJuwhI4nJ6n6dSxPQG4vQt7dvq+6vZR0hvmb?=
 =?us-ascii?Q?H4q8zLhGG/TTzG08RTy0SVR1Cwz3a6B5qtMMbtQZSSqlXBDt++lPHgWGlWre?=
 =?us-ascii?Q?Vcc6G9PDI3hzFuCTV3dqT1i5Sd1qOE0HKW265/mHLnWNLNybNGftomKuz9Th?=
 =?us-ascii?Q?ynLxxWsIIjhj5CEmor3QGFq1/dfXdjFS9m2PoxWKIkHIwUIvJ35LbnyEKLIk?=
 =?us-ascii?Q?YWY4UI6p0K/iKdxxVstZQ1fNhcVTgFvcvgIBzFlQrSRdcsHvzQuEhP5v4iVK?=
 =?us-ascii?Q?WJ/kM42R7znAtEX0rQb1Qz9BoGSTlB9Bg8sBsx4WoWymMxuhaLH0YsxKiHCK?=
 =?us-ascii?Q?DnJymEgtUtciSe/hMB0XyPJPja4Ec0GJETGJTLuXlQXOXq5BSIzj/YsNCXBH?=
 =?us-ascii?Q?MAl3316HPI+KukYESMBR2ltX7cUdgUKN/rlAhmA660KxsJNuJs2e/nOCwVBD?=
 =?us-ascii?Q?iNKG+AcTfb/GLAWjSUqn60xlbXCpejh8EZtYpimOX9wnJ7aYeGO9jCIdRh/j?=
 =?us-ascii?Q?OisptLMLHEVAhiCL3iyITsJTMMMAJiwq84KvUS4fu648Nc+lOCVsocjeyfv+?=
 =?us-ascii?Q?LyRarTEtrI1n0Hgsw3L0Oen3+hXGzPOrMW99nTSGiXzTiwj3hOQsIjWxtv0A?=
 =?us-ascii?Q?w36lhk7TNZ30PJn309OhuofzM6vRorS0RAClL2n+3VDeduaUYXo1ZnNQyHnY?=
 =?us-ascii?Q?cIJLG139jkZkyiuoVluZpB7KQ7vD0yUo6l3Pt2Yv+Pvy9GPku7/X2nkbhyGg?=
 =?us-ascii?Q?3PeCe/vOLT876mlz23es7grfI8uDqfdca0+w1xqs+rg4wB4sGmC+3Aa2g7HH?=
 =?us-ascii?Q?awPTf9w5Gmv2NKQ5GIqAjzVFPFOOF8xCo7Fe6bo3EjJyeW23jaCpxOPZjNpe?=
 =?us-ascii?Q?+HaDM9M6/NfAV9w0ehqjNK/k1XOB49lR/Xr1iUQEFyQwU54lW4eC3qQNvUrX?=
 =?us-ascii?Q?Hwq8BjvYttd5eLawkA3aQNEjtSQvCsd+mK4oz51tR9sImziCZfaeoPj169ax?=
 =?us-ascii?Q?1LtN6deP+QQoB//RQvJzUqfFvPbcRmCyWHaWV3l9vdV24+/L02NKir3prRMU?=
 =?us-ascii?Q?1vuYbH8rNnwRaeK8cgOCBw34KglQDlih?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d0f964-9eb9-4991-8d7b-08ded88a77dd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:37:16.5127
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
	TAGGED_FROM(0.00)[bounces-8888-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB1DE6FD430

Fix the repeat section: -1 is a valid value meaning infinite repeat,
as accepted by the ledtrig-pattern sysfs interface; only 0 and values
below -1 are rejected. The previous text incorrectly stated all negative
numbers were invalid. Also remove the redundant trailing sentence since
the behaviour is now covered inline.

Add the brightness range (0-255) to the hw_pattern section, which was
previously undocumented.

Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index a2353549469e..ed32eb3a27d4 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -16,6 +16,7 @@ in terms of PWM duty-cycle and duration (ms).
 To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
+- Brightness range: 0-255
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
@@ -26,9 +27,7 @@ The format of the hardware pattern values should be:
 ----------------------------
 
 Specify a pattern repeat number, which is common for all channels.
-Default is 1; negative numbers and 0 are invalid.
+Default is 1. Writing 0 is invalid. Writing -1 or 255 repeats the
+pattern indefinitely.
 
 This file will always return the originally written repeat number.
-
-When the 255 value is written to it, all patterns will repeat
-indefinitely.
-- 
2.55.0


