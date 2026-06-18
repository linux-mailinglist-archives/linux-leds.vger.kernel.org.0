Return-Path: <linux-leds+bounces-8680-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /LRhDKFXNGqpVQYAu9opvQ
	(envelope-from <linux-leds+bounces-8680-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:40:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 800896A29F1
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=NLSbh9I+;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8680-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8680-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 983A83073707
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5557730E82C;
	Thu, 18 Jun 2026 20:37:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013075.outbound.protection.outlook.com [52.103.35.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F166D3403FD;
	Thu, 18 Jun 2026 20:37:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815042; cv=fail; b=ASd+mE0IwLiQPXCiBjkr3mV5PzGq/EuCcqKlKdIRPAG8PoqnDEPxCkyG7VHFO7QcxlPQ9wFXyFnUyKW8QU+X/i42YHdqSJ7iGN/kUOETsCouIZPMRGGSZBV2G7Utk33Qwd9rx+Ax199bueg5HbC3ZpxWEBbt+Dc/fX7KFlfleP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815042; c=relaxed/simple;
	bh=bVb4dVLD73vend957cwaOQmJuoqLbQxSTn6m8hkGA2I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CHNnkXLyR062R3nv4pkN3MOXMKJynPXTGkrnOA+LiAeZuqo4jLh9Uq/8n7JIk3EmET0ycjsompqusTa8Kw4UxHJxzjXgACjwnuohduZ4pBZVVFKfxWe71C5rQky/oaDpa6D+prFanG1le11Zybrz7Rc9b+5xk7r7Up8RSHbPFI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NLSbh9I+; arc=fail smtp.client-ip=52.103.35.75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sklhniYpK+7WojwyCBuoYDdCNeKXsETjOWp9Stq9wv7YD91aCQj4f7JPEAeJlTUzfaPwW+Cj5IPv3cBpvAND2TIKfUgM2kitjI5+EG96ztyZh9A/DiVFptekKYlTHqmRiFtQw0QmMtWDIPnrnizOqIUsPxdz7fD71dWECIbBb4ZratovZr4YERhTSgHq40W0ORr6rsweuU8ZuEbYRWmd61K9XpNvPG7WfMghTKg5Ck7dqAEohvVon59hcAvEfUC8fH2yJVWl7EFXzB/YOcyk+b5Za2hKX5ckKbd2bWUVExMdDAZxyr7DYH5xa74bM5ND9xRE+x2qfigG0laAJpF9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vcg4OSoMCyykZ21QWBIo8kMUu6Ylq9JH7KgYHtiFdQ=;
 b=tkOjr0gATGJJ1OIc7IdrxdEqgRveDtEhmbwy50Hw4Ob2fjLl79kBASFKijRBBoQBbtFNfENJk6lZBB+OmXWRIwo+3YID983P1Ixhcp0BcCX+x0guJh9FEJIZ7voW8TsbUb7TYSOLWo0ubv/MMJIqON3bHcUj7cofz/0LjRWuwXtUnkdoqWwpTEql9UompMsGsRYhkdVxkVeuwE5xYIOfysEljCpErXXax8i6XwavJ2rW/1u5bmRu/BGoQXlcCzqJmqGsJVJ7dN0e/LXRjrB+rNfuINNtMUoXA93zPAxjRU5Of988FkPI4VdVgfgEjnLEwAc+eBnS3J2gHKe4IsdtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vcg4OSoMCyykZ21QWBIo8kMUu6Ylq9JH7KgYHtiFdQ=;
 b=NLSbh9I+lMTh6lNhCN0xeYyuoSEVMzr75+esM9OEqgKyA7GIaydhsJe6E5g7Qifiqv+YxASODB77JeN9feGdIYboXFsFlPgrSaPkLK9+zuKQ5yqBacg2lEqUjBvrE4cIzpiQMOGScxvtiFOxyDxJO7GMfroZA4eFUmxCpThI3Au9LH0lbw3A3T8/6zz6BEy7jgztiUYco7zaMKX+/jeUyhDoALeo9LUck+08Zm5VHkXAnUsvhezY5P/okB3vO5YhoZxn9eq+3VrIr/XcQhAqeytf8qgeIipnTrMm7YOmxuIrBR2HHAvu1xnZb/yXJYCO1mo8zUworNLdc5k5TSHlXw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7812.eurprd08.prod.outlook.com (2603:10a6:10:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 20:37:17 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:37:17 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/9] leds: st1202: fix spurious pattern sequence start in setup
Date: Thu, 18 Jun 2026 21:37:05 +0100
Message-ID:
 <GV1PR08MB849766E89B3A92448A607E2FC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ce::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203705.3327017-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: e97d8264-a0e1-4f22-2fac-08decd79635f
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR6INxlMQE5iYvaU7k2c6bQL7aGqs6x4c7aWMXEE9qC7CVYI4UJqw2PZKcyKscckSAdwoVan7BDCjfPkoBmVMjL5fxu0oF6xv+WMyyo1ZgHFv3IVcE+DUoMYPJ39sci8wfVV5XCFqTqjVjtE11FGYCidaGK4wfb5vg8NJcxqhdjTLDPwg9YRChbt9/O83OYqjEoNTuIp75HlsRLJFHeLOaXD00LYRYiPCcv87gbdt44PzZUc2d6jpEeVNdfEfXiAY0gBoWEq1XQHnykKJtp6py2kc3y1yUYc06gVRMoXcNMqLXC0R8I6gzOseZWdzQ2abpHB61CHaUOPBftXd+1+O/c3l6GUPiR61YCYVgm9Do8IbsOFOs46UJkEE4J5WSDlsJ4P70JUz53GJtZyq1wvlOVXqirqm9UOyWiIoLR9ueoJpmYDbm1FjGwJugSmuBnoyIviv6tKGhj2eoZksjaH92/cgBzru89z62lynrSq/SfU/udps6vbacg7SSQxuVDmvnH5qcduY4OCbUjk5eN9vFZ279whM2iJM+PmAgrhMYTH0kf7bX+tKNWl8136IZDXXhAadpgKoeFYYzkSgYnPdLJjvAppNt5ocqQ+eMW1WoR3gV7+uwdrSPlxv5Yxawv7972jFZE/OVZNGhWNq4EHdt0skwLt8cDkG1iP/5zREXuSqJFCKWoq9w7gDRxSk2XdWuPBQ9jXrLqg132gF2gP8mFzrB0RUrriHNV7WuMbgvBKk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|37011999003|15080799012|23021999003|8060799015|41001999006|24021099003|51005399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+X4t7QBgRcVmoRMKgUsHsgDC0O4j7AJLMP/C2P4+cJFueAn37cBftMZJg1UZ?=
 =?us-ascii?Q?hPez+F8ZgDM0WVFyCntq5iX13Vl+n8ROEhVUwJGcsTqeGj9YpIDYVtWrRDAA?=
 =?us-ascii?Q?+JD83ywq0krIR888O3j5wjEAROpFNmQ0YS9T+oak+umlw/CUW95RiMLJnwON?=
 =?us-ascii?Q?NcMvf2XeCVLslcoof3kJHK+DcgeiUf84ljAQaL/KV7zGHnD7D9TJ+e1HqdeR?=
 =?us-ascii?Q?wqKxvKO3+GlAOTUCrdrLgZoBoIg5L3F/clhwhG6xoQBYH55xje1D3VQvO3ze?=
 =?us-ascii?Q?S43YTazZWJwqTP3TQKojWVn05DoS96aBCwFu2FgzgWxp3yxr0PDc9/wbo0nF?=
 =?us-ascii?Q?1DoJ61Hg3tewR5AoA4+TCWa/XDrpGuSNrKlcjeNtIa4joznAugMl4jsnfS2G?=
 =?us-ascii?Q?I/ifpFJYKwpy+xsttf+RHwdYRXc8fURnFXETSSAFJXHEL2/ZZv1PVE8bkHbJ?=
 =?us-ascii?Q?ytMwcq8VbQG+lOzdMW4HhRuTrhkdGjvmHGnlXtGScQHmm7CKQjXQZizuLU5G?=
 =?us-ascii?Q?D0qsVRCMgOjQygxELHjQSGlt4QouoZytjMxdf5FNh1O53IW2OvRbJaA8rLt0?=
 =?us-ascii?Q?Wi1JiDOT4k9qevoaHxqF1B63NDycf6KxzW0Ix5IFw72oeQmgAKv6HlBDg5E/?=
 =?us-ascii?Q?pV84/TrofRjWekDi5afQ9DE1Uf6UlSpuSuKoJuH8AwyxYphZdp+J1IO1NUiZ?=
 =?us-ascii?Q?jbzbX/jpKDfQfXgUYV1KhtsHlCTdOxgnjrKd2/87fhXipB58NZlxtE0cipVn?=
 =?us-ascii?Q?BYzcSSEC30zzx0x9vme8NuB1ffdWka7lreLtD/BDne7G87dN43V6Z2IABXXz?=
 =?us-ascii?Q?JnkX9HAc70rRDJbEEIpHZMgaShC2uy/+wwnbqJmLcH9LYchOu5wyxgxpbwxl?=
 =?us-ascii?Q?XAX+1ZBtC9GyadCNHtSjD3GxMB6+tKDuxZd1MgwGpmf69L454Lyxx7z/ShoI?=
 =?us-ascii?Q?7WyIGKFg9EmOQS1HoWUSdlafoBnf9ZXogDEyB7C+/PWSbfiIxpiZNJU2CnE8?=
 =?us-ascii?Q?eTBv?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7YbzZIr5HtPOaqSPvyKwJWR6u1oDzKwvv9XmqpIC6C+I0+8Hn0yfU/7ZSsk4?=
 =?us-ascii?Q?S+15p+ofB+przh+z0LzjYn2fO2A53NzlBbKaJjKDMfXc+WNbTu4L8T4T96xn?=
 =?us-ascii?Q?NKAJO2HcurjhE0uBjLCoqnaMfcTbA7l5XK6G338R1u81RyCMtMfe1I4yu0Wf?=
 =?us-ascii?Q?YiXLDL4GBlq9olxnEpM3nYbPOOkxUIzLQzMR+3KhHKEWZAUEvPfS13Mf7cRP?=
 =?us-ascii?Q?gWlfb8Ck1bCyQ2Ovih8qFdqIx7biOPLKs0QZDk2O/ygz4A+breI+EVhnWZpJ?=
 =?us-ascii?Q?d4UxTFZ9C9fipZPq4U4q/0MHdF3W43g8TMh3XW8754G1+AWcWa+RxuNT00+E?=
 =?us-ascii?Q?mBjHhIR5kLY2TwCGcJ0PPrFy42wvc13ShND43HjUSZhOUHI+BMQMG0wrTDDg?=
 =?us-ascii?Q?uHWfomeVRJwxXSU0uRQditsEZGO0/XnSShRJMVMubbNOQiWaQZdLw/RPaFDO?=
 =?us-ascii?Q?MhYkZ6ZwcLirqL/MagHR4poY6r6VEfQx0sMzvjOxQUpFpRizvCamzWGkTmpK?=
 =?us-ascii?Q?v88MgeBq8sSBg7b2CNlzFaxkbnr4NHNQFfIg7YyeJ9CIkU5YhFnuuTOiB0Co?=
 =?us-ascii?Q?cbYVIhmclHGQCT+d7Qaqd8a/FaW4nad8A8Mg7CuAYdC1ZhtdRWAY0fZIN0wI?=
 =?us-ascii?Q?B/EWdWTZoc0FxrX53iNuAQyfRy0j2UZLlN1wEzOjOIOArgrNubgQbP6/QahY?=
 =?us-ascii?Q?xgl8PTSYll3v6Os0ZUCQk8hjG4Mow/ao0Blx9svHeHIFaLqZxg8gXXkTdMB3?=
 =?us-ascii?Q?oo4WIF6DPM8AMZsNehORxDoe6r6X1oVGnsutrK4Z5meyylCoqX9Zyj1eY6sv?=
 =?us-ascii?Q?vRlaX+IYAvNl39JkPXvXnG6QYlYWiCFbSTD9pkCQFk9l527cwOfNuIzHefsZ?=
 =?us-ascii?Q?9C9mFvrrQnGNGVpCa/PXXWkaUV8J0LKSDncyPSa6MZI0aUe8IscTrEVcGKMm?=
 =?us-ascii?Q?9UaiqYp01ZARPsPmzV66s63w1ez7l0GdVJnpWAEdyH22KIVhWOa8jQqsfSKW?=
 =?us-ascii?Q?qhrvElri+gXnkkxtG8rfKp8Hx9e9Vp5dhkT9NSRB76HpQRr4OZM/E/F4L0+q?=
 =?us-ascii?Q?C5vpX8IZ8C1bCK6aqTwHwpHmZkS9a19ehwAf8Z1ZZGRZF7J5rij8yO44dVlU?=
 =?us-ascii?Q?pQTd6eIZ+e1T/zO4gm/Uh901b+2mZqsJbAXTJ6bw588yPs9ZfyM4o0QFiynT?=
 =?us-ascii?Q?J1VZlEw8crm/zmN/YzNGgvm5logHJT8Bujsf3Ox/oWdAZtI1w9tOyTewfyMI?=
 =?us-ascii?Q?0q6oq7rAAjqo3G3QkiqCkC6n+FB0nxaAbWqtl0jQLkFhJ8LNCV66urop5Dvl?=
 =?us-ascii?Q?5bfFqmAe21BFEigU4cBWa0OlVcRw29Eu6TTLvroGy4Dph9hk4sV72G4qxJUO?=
 =?us-ascii?Q?x1ZfIcZMK4afbOKEUvD4XxaOLo1tYtjnHQASUqzb1L7pgaUYMHRpgCY6zPED?=
 =?us-ascii?Q?rRLoI3UiA9QuklQgBD7wM22q8y/ZipDJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97d8264-a0e1-4f22-2fac-08decd79635f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:37:17.8342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7812
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
	TAGGED_FROM(0.00)[bounces-8680-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 800896A29F1

st1202_setup() writes PATS and PATSR to the Configuration register as
its final step, which starts the hardware pattern sequencer during
device probe before any patterns have been programmed. This causes the
device to run a sequence with whatever values happen to be in the
pattern registers at the time.

Remove the write. The device reset at the start of setup restores all
registers to their power-on defaults, leaving PATS and PATSR cleared.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b32d8e716372..168d14566c1a 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -341,11 +341,6 @@ static int st1202_setup(struct st1202_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
-				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.54.0


