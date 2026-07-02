Return-Path: <linux-leds+bounces-8880-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id waPUF97lRmoTfQsAu9opvQ
	(envelope-from <linux-leds+bounces-8880-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:27:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2FD6FD308
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=NaZjAPhJ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8880-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8880-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4441D301E59B
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538A6368D70;
	Thu,  2 Jul 2026 22:27:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011039.outbound.protection.outlook.com [52.103.33.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF53304BA3;
	Thu,  2 Jul 2026 22:27:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031259; cv=fail; b=Rkm/7X0CMsx6G7KRNFpJgMtemUjS1Hvqih5SmTmkUZFwGhU413hgjGXGwo2tKdwv/MJEGxSdcSpRBlfLViY70qXQPn3fXadp0+1FnADAndC8ut3j5IqZcN0wIoTEW4M70VrB+t4RbYiwh0gReDKx5BXdghMbi+l2QiWcwkQNquk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031259; c=relaxed/simple;
	bh=KA2EhigSDErVUKEPw4qCIYxGCfenFjKGXxjYAQLbZTg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=upCIX5cl2g/MSdBdCsvGDX2+HdT8+W5MICJWVHmF+sM1KwB7svcCn8qPAEa6eTHLXNd5I2DppfqggSSQldiMq1BRvCnytJTuF9qbbko9GgcDw4yUEXz7y1dq2dKK+zmo5r+ViwXnNBiajxsCocPs65HFXmuscVvBiamhZnYZAM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NaZjAPhJ; arc=fail smtp.client-ip=52.103.33.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFgeb2wBm0UwA5EOGebO++3z0screX6T2AeQVMZi+cm1m/HGMlCFU66oFue2/PVkfRMtjxUVvyfXuowsVA7S00fPkqcjRcgwGMKNCA+f4LIqtr+hMukKxPagJ8Cf4QwIHiiVS9DpUgGh7+uKrvPkHqxp5SaiK66Qmq89wD+0TbDV57dI0cyf5MYqkzUKdEwC6ltMHcsQuYJcQH8d2qAwi7AFw0NkAYquDWOVY9PP1ZOzbRCX2rmaQmx3z9xWdgC+able/FV5T9mE1OBUMR0DLagUpo5QQrFmK4hI4pYk284sAgR0W5VVWbqGS32oUEmQltV5IXhZGrJxQE+FLlwqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts9xczg8n3EAR1pvGf3puqSMRyqME7v0+IvnlzFZsL0=;
 b=Qylx4lN3cLOcUhIDuh6xplRQ4cmlYoOWXzXKkQ+h0t9f1qgP0s8fLGdZF0Bi7OWjzJ4451ruRe1VrzB+PXYi9FytCfFofOtG3zaASnaZ9U7B8PlV6/Fq8y5SeViYadXeIAMgaN2skXIguXxoZRm/uTsZ1AUaxaAwDdAXj+lzPt2usdtzvYf0hf+uSbQ5L+uQHDWQFMBKmdi9B8DvhpPms2So1KQyZsQZoPbfH/GB+12+ALsc4VvD4obGr9KXoTXBGJKmI1guaBty/hIziUQU5+U8lLpvdhZaBYCVSSN7KcB9YbD2jdz3WCVYwSTQNJ+4IQ0VCJzfEMESshKLLMJjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts9xczg8n3EAR1pvGf3puqSMRyqME7v0+IvnlzFZsL0=;
 b=NaZjAPhJcIrAmDej+KNsPeF3vSsH21LArl3fmf+5xTu4rUoCS4OK5rM+lRDlMBtt2rNNIE2PDHSVha5QLsvFQ/p6jiMP62259U4xg8zLyEt0A1zR9E3j+e4Up97qV4AeIL9S7pfQtBdKUoPIxCb7ZR920/PikVNZSBryIfQGQzk8Ibo5rptqJs2Kpud6INSDDdeXmtmXFEmQIbR8cuyR5SrWLwL0Pkv7VujNo40k6+ZzbRiQnO1j0l0gPPiA2BllTbXrjlgsnKfcIMRtTyX7/jx7Swa9AzNj3/uyBZk+wAGgAQpeP2OYFz97pEs/rmewIpLJw0fPqoWqqQdxPe7t5w==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB7702.eurprd08.prod.outlook.com (2603:10a6:150:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:27:35 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:27:35 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] leds: st1202: stop pattern sequence before reprogramming
Date: Thu,  2 Jul 2026 23:27:22 +0100
Message-ID:
 <GV1PR08MB84978D0F499774773C7DA1FCC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0224.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID: <20260702222722.83665-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 7160012c-56c7-42f0-93c6-08ded8891d79
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4IAaVwzmNYz3j1POCPJxJrOEA+wlz5dg6sXvr+3zOYdw/w+tcyhisgnyh3xn/3JwAIHq8/5ZwBLCPvCAwuDXj96ZzwlFcaRrexzgR1U34ZU6Mw3CN6Q0JYoKggHT3ZI6bhMqcfqB7vzib8lpGo9jW6+dCsqFGgZF87D9lO4W4+OXGJFhzRgmdafiSVNvEuPI9/DNJ+lm28IPrDH0jizGSilQg8hIsgCYObvf/zCN5bRQcLuG4AFVlJwTHslWmNdwliuDr5aHl2BlMCPNBmuQVaBXvERtAvZrx4Fb3h3U2D4svtbrUNtfaQYcwjYB7emusOeemEuYjSQHtP3f4Koqm80aKygl6kv9wRkOL1UsSM/dDK+5NsM8m8cvnbE4IrvlFzDv0u/Dl2pJ13TbL47xLd+lSb1gItFr9GXkSH8rKutB+nGHEzXsMXAq0HTU26w/BEBEgSc+sUTAKlW0KTw23roUcIsSq+KJNgGYUKxfcS3aoJ1TXxU5UBIlAul4vU7joZzbFEBbBrXj8Y/zyJLXWqGIV7b/OmzuXUS2vN7JKQBVYFndDYo1ahyiWVbobZThAKiG7Z/0Ozpc/80nLpFvyMhvV36majFQ+cC+KXNVJgdG2AdaGjqtsykWrafTfecD1g0kXApefgVekrTBODLA6b1pXkLvwppn3Q1a06QukWNsZmAD7T7QhggPU7eLQCuj9fQ+/IVGllNs=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|51005399006|19110799012|24021099003|41001999006|5072599009|23021999003|37011999003|15080799012|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?40KE6ibz6ctzJp3woTd4hT13Vo+m7rMfmXkEsi6mvgGN5cK0mBE+4KJD6nPB?=
 =?us-ascii?Q?UgjgNwSdRAN/vKRIVF7ICUBcBrL8BryY/ONM6P1tsl2L2vKolCwBvbaAFGTz?=
 =?us-ascii?Q?CAXTuzN4FcNus2LEWKsrkp5U0/PwFe1wLp0CxpUfddNiSQp6l3uYKH5XdGlX?=
 =?us-ascii?Q?uqMnNoTHePmBpxJzcrTxurt3SenSch4gQK8TkHx3kaP/cDVf0B9F45Wy4crQ?=
 =?us-ascii?Q?I6RhiHztE705MEjQWEfKZ8Ns1qC52UIkTE0oLxRbruJ3+GI2rDUxSSTBvEXd?=
 =?us-ascii?Q?4e0OSVeSGaKsGlI27hnpq+gZDMQvMrV4YAQvCsOUi9BEgkaTH0cA9/A9YddD?=
 =?us-ascii?Q?E+CIq/MrVLOFd9Fqe/loK9Zeb9lfW8S0eF/SpvR5lduRnDH1QPt6UMqzb0FY?=
 =?us-ascii?Q?yjlXmRAPGFacV/o2Ndhq+NhvhBEBewMCZk+7AkQet4bcxYcKCLHysjAI7G/N?=
 =?us-ascii?Q?7TDUwMnXrqGadbaSRcJs3TP16QJw8eHUb9S/O38Am0bswYAFX7iYJRSi+j4q?=
 =?us-ascii?Q?6yv3etETt/HEfIaRlI3oeLeXr/RCWcxIZqhQE5uE6PMjf3mWOIQoQYd5kSXN?=
 =?us-ascii?Q?llpkTtnIuxrpIHw0eRmp9I2JlCUKvwEu7H7A/KBIj6IyGnGQOBnWyKsLw99p?=
 =?us-ascii?Q?NZtuARLPz6yh4Uxo74D6iUKnOZ2bcmcRIzEDmk+ph40H0AwMEW92L95y6o7X?=
 =?us-ascii?Q?JSs76eWCFfWF+cIM1sdknpWqTCAbE/xwskWNnKo1kg6tHn+r9ZLTCCE9xlnu?=
 =?us-ascii?Q?A+R5nZNbkxn+cgsoEi/uLKzuF4rTnHLjtOywHBecI3o4jQmnOhrtv655bz67?=
 =?us-ascii?Q?E/HE+bVptdtP2PN/Y4ZSxphWahiQrHoHIcmDmz4MqTEHWhLCPQ5V22Q7HX/O?=
 =?us-ascii?Q?Fc/ck4ZEI674//vHF4B+C7YJhGAlBNwolD0tgMBXXbcmRRZmicANaVK5T+rV?=
 =?us-ascii?Q?OCOdeCAbpo5VsokpigHJIz22ZOTm4uV3HHyY7KtMC+nn6zl633EC1Ryrv1ss?=
 =?us-ascii?Q?kEtr?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UJBdRK7Dt/uq53lqzP/ke/Sg4QfkHaiZcplNZOSe3SeVvl95Uz+qTsZKI9jm?=
 =?us-ascii?Q?6ZF1gzwa6LMGx2tNu2o/kYeoi+RFiCKzDNzxKtgzhi0Nl0qia8G1p0ykyA+e?=
 =?us-ascii?Q?FoJOTzIC604wH9VIt66+5Cr5kbnq/KIrHOchuEm0rNKLgDBNYGVrweKMTvOT?=
 =?us-ascii?Q?067omNsSp/3HTEXhRorcYwG8tDS4vnop6gY5GLY514RDtW/AnjsXwn8Ehq7z?=
 =?us-ascii?Q?1eSN1JdPdDUOUNIE5SVV49Vi3yiiFeg9mZKUypAq5orQcpn8GO6lK0ZoLwq3?=
 =?us-ascii?Q?nJAZ8F+vSZ6OCrrvcELaV01VtmAnmEO44+uYi9bRE6NxGpju9zKNBynAWet8?=
 =?us-ascii?Q?oJn8JW/8d4yCdalLFg+g4WoAC4lXG5CtC47x2+el1MArsboGfUxGjWPkhz93?=
 =?us-ascii?Q?OWiMFryC0OSZJrvEXGXIdsGQjG5DDrJA195eHdcp4BHbKkbBXSBWksFBOczP?=
 =?us-ascii?Q?o6Hael0NuRVDGQfdgybTUh42Pvt1Tgns3CVna34IyKfhNpjkPa9sajjuc1Bn?=
 =?us-ascii?Q?QoOC00z3R29pm/L3cHWc32xJgnqLGWnOk0yZlTMV7E5EzpQS7yFFneW04e6S?=
 =?us-ascii?Q?I2jwLciwTmPfnnht5OpkGhSSDZPKRFkbX9yk3SNQLbFsS5MzhWZT6sqqB2vJ?=
 =?us-ascii?Q?unGuLNpok3yqTPg2NhDbExBxTA4+IAGttg7NULI1NbqyxaGdmXAmhnJu+2XY?=
 =?us-ascii?Q?p3hoj2hwmay8RqyNo5+a3/3PUGn+CBMcxqvLQwAI8DaShwI+4i1VbLOaZBLB?=
 =?us-ascii?Q?snGA4YZA348GZ16Wh2FvdKvc00LXsZf4FRI2kMQ9J/uPEOKEzNTtjxQLYfvu?=
 =?us-ascii?Q?1JEMisvAZ46iRStklIxpONpMJmFWcTIrYKxItR329o5gPOfGj3M90mSppVtc?=
 =?us-ascii?Q?iKtsXQLETjDq9f7gawCxBfxdKJNDNB2aZfhXmucr4i+8QWZ47X2ZkiABeL2y?=
 =?us-ascii?Q?aWaTKMcGOGidD9K489ELgRqzihKdak/8sSPcCrTwAL9EnyZq5rGlre0F4SYR?=
 =?us-ascii?Q?Nt+o+Hw0CVU78kKYWmN3ZZNRKiyetaz1oO8yIrHwh1B6Y3vJv/wnoKtn+uby?=
 =?us-ascii?Q?opI1zECScfu5TvT7fLGgC/ARtvv8nEtO7TUxfyRsEB4TrUDNIopUzzs6iOVu?=
 =?us-ascii?Q?s+juZsoac69LlPkXAzJ0adqxtSTVLPokmSNJLFjAGs3wzDfD/VLU8QYGtx6s?=
 =?us-ascii?Q?p1U1zq0oTqDRfKVxJ9Olx+xUOANUCGPAYu74RcUJ96g6SXHI6NCvzYAO/1UX?=
 =?us-ascii?Q?nXisXcAVPgeevwL3mRhB4vaVcfzN6jpAX/8u8IdfWgHcF0y1HGHUxSZTVwBB?=
 =?us-ascii?Q?el4J2DMTfMxQFlpT4IIjPk7V5BtZsBpnzrkqxOVi+yDfzNy0YcN4I+Z10RsY?=
 =?us-ascii?Q?ODITRl298GHAqbwCky1luYJTdb0t9N+RqetCoHOqhRPY/05IjHxOhQ3U4kUm?=
 =?us-ascii?Q?5uhWjwFzTs5WzMh3kMxaMBHs3E+JPwrm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7160012c-56c7-42f0-93c6-08ded8891d79
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:27:35.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7702
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8880-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C2FD6FD308

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


