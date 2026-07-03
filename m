Return-Path: <linux-leds+bounces-8915-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKKAJQSWR2qWbgAAu9opvQ
	(envelope-from <linux-leds+bounces-8915-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 12:59:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD0701866
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 12:59:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=N2D7zUrj;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8915-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8915-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CF2B3161C02
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A1D331EB6;
	Fri,  3 Jul 2026 10:52:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013081.outbound.protection.outlook.com [52.103.35.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B243B1ED1
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 10:51:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075920; cv=fail; b=FTU5XfyUKHXr1CPrLVggHdZAMZynIvywrZH8UoblWxh9LHTzTYUro+jjebSLYQblN6ar1iYKHQpvVBcP63Xqj4hda4MTSS/ak2uSnPpa4IKt1+XdbcyQ3fxzFpZ6mgB0rn+IpObZCCwc/JXwclYUnBVPLFjBO8aF1hHPCaIvUX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075920; c=relaxed/simple;
	bh=XSaupvPlYGcT+3KqSFAfjPdmCH3+CeWc1dOI8GhLJIA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=tIb2Kdtz9bNJRio/Oz22nzCHS0napt/FZWacRu5O+Hxt5Q2dzX1YppJh1PrJruX+SmeynStSW0TB0Z22CaziprNyDiUUFwuXNcuvqp866C4GxSA2BNefS2DAgvWpbjvfWZ05xHZ8oSzCH84KkOo1ZlOfx05x0IAKZIUH9GKWDtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=N2D7zUrj; arc=fail smtp.client-ip=52.103.35.81
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZFBUBD3d2mw6SdUxqojle/1j8AgKECHcfcNMTiyZpY7HeF7zKi+DUzo8z/hWvXwKXMLVS3L/i4SzWMaGwifdEME79gFDUrnIGwW9TyenrveNmX8GJcc7zd6NlMuAjTgF7OkAu6wU4zDCHYzwXhQiUWSO2paS8Uu77t8gTXQvOole9r2lmIaXWYxdiLJYhw3CRfvwtgJVBXWy/T0DiHkpo9naYcxV70Hpuvzcm0Sy7Ixr2DwmA0rHdVYdgN3Ve2pBt1ouhQVtBemjHrCMwRNVeoY/lRsw7vv3TtPP5AXb15Ihc15D1GsVYXjAD7U9IkAiaw1XWdvLeE2p10X0Te0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSaupvPlYGcT+3KqSFAfjPdmCH3+CeWc1dOI8GhLJIA=;
 b=Zfh4L7gK0N1jT7PrdZm7TABolvVJgaY0d+u1VEDfK41UWrMQUdWZ3nn0UjtotmLsxqiVFRNclF+WsruGJ++/3goCd69FC9WeLBQYehEnJ7hVvSeNhqnk3HloxbHHkbhBgh9X9WSjvuqkcmOa6LKxtse2iSUvx9iC8vUCrR5tSavjqwdTaW+d4J9VIIFtRD1dQiTa7iguH8YnhsC2kWeJQ8Rr1jNHkQtGWhj0Sv2bnmBD/dzJz4zZ+XbQ65Breqq72fuieTIzQwc1WY7aKU4ACaCZxw21Ocrqplhi15yM7mLczfNHwJwCLNHKpNOzl6CTxM2A9v3LIAdTeJYap3kVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSaupvPlYGcT+3KqSFAfjPdmCH3+CeWc1dOI8GhLJIA=;
 b=N2D7zUrjYmkTn1seV3QcWbG+ZrP7ud61XXbbhzI+sMc8vE8ywKslkIg+tl8Lrnx+PLlcCgmtvZYIBRvC/LGr5vueG2iOeEUfbhR6AeSWrehTauDHdj3RcEeCBhLhWX/O60WXawkkB8CYg5pGrUvbGNOcMo3nWCNB3hv4TmSwW8/4vXtdzKet9wA7RF7EnCxwP6QFwAil5y4rlDOIsK7lsc+MxOPQNSoD3+B3ib3OeOebHW/8jc+9wJqWCUIgyj++nEBJw4ydc5CEa5TAdnlEFRQaSGsAXKLp53/K97BELcjzaUzKz8cB2Qji2C0U566eYs8YxlAb+9uwWf9y376OHA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS2PR08MB9737.eurprd08.prod.outlook.com (2603:10a6:20b:607::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 10:51:56 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:56 +0000
Date: Fri, 3 Jul 2026 11:51:46 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v7 1/9] leds: st1202: stop pattern sequence before
 reprogramming
In-Reply-To: <20260702224852.7EF2D1F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB8497AB195A59397CADA8D4D7C5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB84978D0F499774773C7DA1FCC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702224852.7EF2D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <4d5c6935-5913-9b84-424d-2e46b6dd7cc0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS2PR08MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 353d8a40-de1f-4fdd-4562-08ded8f1189d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|15080799012|23021999003|5072599009|2604032031799003|37011999003|19110799012|8022599003|24021099003|6090799003|8060799015|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M4kJCfWuetC0zBqz1wjQFPfVbKfHwv6KPohK4YJ6Xg/9DiFA7NwQCF2RFLKH?=
 =?us-ascii?Q?9+jRLhenDSTd937HCZ1J25uwrLj7MMlpPjsASBVC4qXGCV0MmVkQUBnZ83Fi?=
 =?us-ascii?Q?03cryUysBF8e3/SiFq1d6i26td/4oXK5eUzBMfFdja18HMT6rple3gUNibrP?=
 =?us-ascii?Q?ZmOsqiaKE7SrbNKbaPxGCUdQvJc/IajpVm4tGCM7teKrR0WDuISY74zPzayT?=
 =?us-ascii?Q?QhGJPs60n8mo9VOUykjALb3zxwD/cDyOAHpyDH5+i/h7xO7fUmX4v9WjmsrD?=
 =?us-ascii?Q?bH/VPysqmtDbnVptW3ANDT2VDjzOh46Gtt+l5UMF2XEIEl4UtZg20qRglzB7?=
 =?us-ascii?Q?XmE5dtQokT/6ZXJjSTwP8CoRtaj6ez/H5vb+2Ue/Gv8o2GJuqUuzXwak15Iq?=
 =?us-ascii?Q?Mbg0CgkMfoL9c8bzXnmZ/9DZzOrRoWNnj9J6Hn2cfShQxt69il7POfbgDspM?=
 =?us-ascii?Q?qQPKOXvPWX6VrVUEdjX9kj6yvxkOsdmrzKmm6UgDYNQYN1W2YkzrGOa04NMz?=
 =?us-ascii?Q?YtJAdRxf6H0Vt8JrHq+vtaAedHgxAJMeK8J0h5ylCJ9l9ratpYTVVktxxIb2?=
 =?us-ascii?Q?gq4C+p4+YRV+P0rxfmkzkDjJGdmfeWdeO8GcrSU0C7IWdl1xEoTWskFWi3GR?=
 =?us-ascii?Q?meIcvn9oEgbBveC1Elvl48OX+4pnMLrJd5f7X8tGROWM00orTj9x36rte66R?=
 =?us-ascii?Q?UIhm1ei5tJPvs1Y8GdUNQoWhsl0upxu3w2vEG3zEGnWWd4Li3C2aLy403k70?=
 =?us-ascii?Q?qhaM5nYBkXQy3cOrV9dn/7ZtN9la/ylIQ1DbtMX1iVgDL8AO6Hy4NCqqIr72?=
 =?us-ascii?Q?hjkroX1RjctapqjDefahr1IElsWZysPCl85gMmokIDL+0t6X/HYEG9DgyOCh?=
 =?us-ascii?Q?EOxV3OI5Yszj9twIhYDWv3OwelQbAlRrawMaCCWY1X7Sd+5K8zcpn44yU3BM?=
 =?us-ascii?Q?AyZRx8w12WFaUA4u74x9HX7wwoEUYxpksPP6fw76zw7M0aZpYoAn45V30cOy?=
 =?us-ascii?Q?ANYL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PQTkROonk8tcfSjC/L5Mt+SjSIQwyJsxZYmwSSlu/MEgoayR5sBpWHp8KfwA?=
 =?us-ascii?Q?gFeAiS9Ai+AdqGxXC7orpbE6i4cZs7+FxDwqxW+iBVhvpE6V+LCPygzJZkdb?=
 =?us-ascii?Q?JshhoT2iTj3LYuK/NqfF34+wxnp1NtbT7FLht+AAqx8sMAmUoTeg9SqCrT+J?=
 =?us-ascii?Q?UU6NxmZQHnVDtfSMAtELZVltXh3iN86tdFis6oNYFnQaoNd7dPQ8ozmJyTG5?=
 =?us-ascii?Q?q+xmofyxqO37UL7d1qc5DPd4AlWTXhPvujo6/1TefIK7N6F4fOhs8PBDj/Yz?=
 =?us-ascii?Q?oJHq3xIvP6V5kaHKUBamny5/HhoGng1hYeFTKdqpYKF42hafyzpdQs1uMnRZ?=
 =?us-ascii?Q?hcVOI5L49uECP0siGgV6NqXFONPSJgoLl4SwMLJv6G5Gl5PAmAboWuyotfii?=
 =?us-ascii?Q?kFYp6CfaqJeYyMNFGbVOqpPdY4jXQLJGEhclDmKpYtLOjz41igOmDgB6m5PK?=
 =?us-ascii?Q?8Dakr3JzNmeWDYmWWbVCs7EqQ6s6Eqa+wCSA2PHG97kZINFMbHiloacRxVAW?=
 =?us-ascii?Q?pmVoebRPJf72QzhdvyEdMjGmWKaFEglv9BILEJ+48yloVMQ1yJPgkR+/j2MH?=
 =?us-ascii?Q?ZEUy4DUy70WQ0GVaounziDOQGVhoGEGFOq7UWJSEn/tTOJu4+MzYaaBMSLXV?=
 =?us-ascii?Q?9cNs2YEtj1Bd6ctwHODFaK78M2NKwHhBD/UY4ejpf4crqEcHL0JbP61q2YL+?=
 =?us-ascii?Q?Vl8fXxOro31HngwWnVeXeYkW2S5ChwK/iPuL4ncMiVphp6EfEMS2FSLvtJ8B?=
 =?us-ascii?Q?KGuCJufA++PDPtmWyqou1yFT6+OgDTlnDAHqBj0IDrYO6MFKhn1qyiYMI40q?=
 =?us-ascii?Q?KYstZJcF87VjZyIl2SaAlFST0xf8RJfvNLqt2I04+M/Rg6jTHQGNzZgfOzpv?=
 =?us-ascii?Q?rNTZng125PRmK0AoJimBxJu4GUBYpFz3Sdt4LsQcTzSIr8beKPGPZjt8//7G?=
 =?us-ascii?Q?rRwttcgB41czc48HsbN78pDofFzfGS9zgHizVGEf891PO1hsq8GqQvlT4hqQ?=
 =?us-ascii?Q?igZPOG0l8vW3RvhbV0u8Gfn8r4rEtxR14xFXWowYRLazTUurZ83gPQyc10tk?=
 =?us-ascii?Q?smBZQhZIDSfZhRrJbiJfIaymPwH4BbvSixOv+nLJELYJQ+mV1TtL429IRLvY?=
 =?us-ascii?Q?GHGmbJyDfofJ4k9ah8hozMSG3FgXtRwy2xOlilq1Xd8S5629JJanvmsDfvfA?=
 =?us-ascii?Q?k5hbGUfX2VZuezi6zfegVm2iSaQ5qKWIo8QfGM3cI0uLEZxHA607PNqD0Sv2?=
 =?us-ascii?Q?Rk9PCzFMY96UaB0y9CzI/5OsZn2I/ZBHVwqYY25wncvzvkLd01p66H46AQ8o?=
 =?us-ascii?Q?+julAucJIIM7T7heX2jruDcB9O7D6NUR4DkOYdij9tA2Rz6hv8gd9tpUgMWo?=
 =?us-ascii?Q?2AWj4OcUR2ow8kyJnxxsDgw0gQnz3YfVknxILjViO+EtCMDve+HWnbg0yl0v?=
 =?us-ascii?Q?PW2UcXjo/DWU0qHMC0GaYsr0NJ0vqFHw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353d8a40-de1f-4fdd-4562-08ded8f1189d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:56.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9737
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8915-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:dkim,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06BD0701866

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] The driver assigns a sleepable function to `led_cdev.brightness_set`, causing panics when called from atomic context.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

