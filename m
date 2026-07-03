Return-Path: <linux-leds+bounces-8917-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8OMBDcqWR2rabgAAu9opvQ
	(envelope-from <linux-leds+bounces-8917-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:02:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12D70190D
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:02:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=WiwstDNb;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8917-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8917-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC58B302C1D3
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 10:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F289235028C;
	Fri,  3 Jul 2026 10:54:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013073.outbound.protection.outlook.com [52.103.46.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91800380FE0
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 10:54:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076087; cv=fail; b=UwnceFcHU6AukY85HWWsJhXB/vYheLrJWDPp8hknHomLnW1a7IuV1wAoBV6ZR3oKPiv5r9/Q0RiXsywhWMpSDFTvhl3R7z/QBBZMh+5J2t+QNQI8BRtiK/BZjdql0qIRPxM+9am7Ks4+PRTAIzprM0olqN0IJo5M2XJhBQQCH/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076087; c=relaxed/simple;
	bh=VxA77ZiStT8QamI59PnQn5icIlVJsInZddgYkHDVZhU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=HF4YgTXx/CNcrrkFIBAfgXWKWpP1KuryDTyYFFWK3JjLIBxRQOF1Ss1SkWmsgNkhOe7+QNzl3f9O8B2lZsqWYE0nR34c2yhJoww5ZVX7RGxPfyuMEAQpC8ajWfTOYjwdEH1pzR/VlZELQo/CypPjV6UCxgotQ0p1QK8jaqvV26s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WiwstDNb; arc=fail smtp.client-ip=52.103.46.73
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKnJbsTAeoCaSDm8M8cUEi37x3+icf9hG/NRiY7RwxxFkiFwP18OUPHh0ci0QwTy8+sVSggBoU2wj2fo0lpjpMo6lb+RDfrxhE+AKow2uAUk4Yt05hu8+XKcgpk6NEIZNo2y7kEn4pkx5C4eu5PtyUlHRZaHJ/AQdP09BxsNr7WAo26OKa+V/0+JoievnnF7R/HT1WGm/Wztw30SPJW+q5ycsngKI0ZK1iqTPwsG7uH9xUYopZRSrvF/6V2Deqw+CcTnYFfWBKvTPJ3miT/UQRnqxj2A7oAa3BkhlSehtA7ltv0mDpr/FgeXgm2Fd7mSB06hlohL57izvo2eM+gX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxA77ZiStT8QamI59PnQn5icIlVJsInZddgYkHDVZhU=;
 b=I71lejFbS5W4OQq0BT0xi3e8J6GGH290aFZ7PU7lgPmQr8oLIsRNKl0SA5ImkLRbdRGqFqBX/kGy/3HsvfK2NFNKZDGSt/O/twMKJaJ4Q5byNnqy1IRO6V1++q9DoBr2hEka7h1lbr7e1tiB08PmvD/XfXwIzNMfY+GKc0bulDIZj4Fui32cIicoI1uLvitUgzVzjo0Ec5zbnKcegS+bkuuVUENRdJ/uxgbljW/QYT61CBgGK9aC5FUVD62WvirSaukUDF5sZ2jkCH6Xvz4nS3CvIqX3PUHEZMM97hOKL/7KKXuNiJcDxSUm3v6YobQViyJ/uYEtBQm70o0FUvTeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxA77ZiStT8QamI59PnQn5icIlVJsInZddgYkHDVZhU=;
 b=WiwstDNbyjyfXGxfc+p/38Mfk1YyJ+KpbBv/r5c0trj5qAw1hMaAW9iNnMxkhcTjnq59ZGumOZP8KQZouMhT+7Lg9SJEkxPXIR2KA9PgR3slzEoqfuHUeUeYz2KytWNhLy4xbqlGSrmwkb18aQZSmBsPJSBMHWWfbtZtTMFma53WMVFnXZtY52DQ7UYdjsRbmmeml7rKuMilhXW1insKgYk4MdLFL4f6Di+l3OBZw1R9rSj1GB/fHoBXhG3JGpF/l4AXgqBGt1k3G7SgAEibcInozsRnpFmlOfhgWUGCoWhCHjb4z2ycOnEHAUchts8TDYop3qXqUVchknfOOEveSg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS2PR08MB9737.eurprd08.prod.outlook.com (2603:10a6:20b:607::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 10:54:43 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:54:43 +0000
Date: Fri, 3 Jul 2026 11:54:36 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 3/9] leds: st1202: fix pattern duration prescaler and
 pattern_clear skip marker
In-Reply-To: <20260702225048.66C8F1F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB8497C5BEF8AC4F56BE6C076CC5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB84971D3AF982F4F707A378F0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702225048.66C8F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0370.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <a7fbc59f-09e0-13d7-b281-12428aa215b4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS2PR08MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebf7fa7-bf42-4eec-d2b6-08ded8f17d35
X-MS-Exchange-SLBlob-MailProps:
	zZTkHIKWWP9ynys4vMVANsqrUe+CJJVrseoOp9i+J9Gxp0mYsyz5QUMvWQA9t+uYe6K8NaMZ4QQtlIjDOH6AAtbfqTwBq5Lg3RI8z7FBZjx9Yg6aY6DvcRAKAEZoqtQAK26l/LyCYNe8ES+cLxPC8AHKK8bziF2V6nniO45XERZKMyqym28rOQd7crObkSByfUrS9qvBKiAiu+eJMBV7+xa6whEX2qqxQ+/+1IznrIiqviqpaqZQi80OUlR0VrB0pmzmj9A3XmoPM20NPP6G9ELUbOAs+jDKLaCuKQ0nlniyCeUEnp0xfEiHmFKwxCuU/HOqKEURPoG/WncHjEPi+00k9qVgRB6wdNYAxPGb/eMVUZNLiIGbF2fUI2pcvqUYqqdhGUetjxvsQ5cEDJo17vT0RHJAR4SBChCyV+OMH2XDNY42QeDiQvk8VIEut0bjN3kU3Scc+IWVwpNjPYxhuLQs9/HBbh9CMWycwet3mx2Wm8kGcS6UfIOgE5wHxf+afpkVp3zdytvlz5Bs2/AVtdEoyaE4uVb950Ul8pyXyiYyr1rPZtulzYRqM6+s5i3r9/qo9hWwEuJ92PWGm/ck+nPEsrQLGm8fZUiWxdvlgAxg1AEYhBeGSW/m+n3EEGVPLScBhecV5sCu+rDZ0WPZ03hWVZbQSybT0sABiDIWaAE0w+g2qdv7RA==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|15080799012|23021999003|5072599009|2604032031799003|37011999003|19110799012|24021099003|6090799003|8060799015|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RCxoAI7OlsQBNjJcoCK/GapVgEJCy9izq/nI3e5N1h9I3C9qBJC3lRNkTIWC?=
 =?us-ascii?Q?mA1hp4310f3dhuYNrHu0zGpd5U6aq/+fe/6UePRC7GIUELoywMaQyvYWcF55?=
 =?us-ascii?Q?RWeZPb6DExldw1jzgBIafFjYV8WQX6J+f2idV0jJROnwRRiasMiMtvECkRGo?=
 =?us-ascii?Q?duRX2op+nZhwl2S/BkW1CecoXjNcmeBpzj1YtBbwGm+JX7GJGquCEAMRbxgb?=
 =?us-ascii?Q?heLh4+FpmJ1VKUJy7b4ePvsoyjNfkaKS3YPE47w1wcV2ZKJPWaB6fumifzoU?=
 =?us-ascii?Q?ciposKVFBnNnsYVazqA+yrAT6YeEFxbUr+D34+24sz93JFUBekZw/VKKA/3I?=
 =?us-ascii?Q?ayv8S2HNCPjAis5hnEpMMhLFLWIZbd0m+zP9A5sgitrUEtvae+LbU4G8oep7?=
 =?us-ascii?Q?pRR8Gf8Izv9W0GE+Wzmg2jMg5zqZ42vLZ5vkauJwCNaQ2b7pQeSZUbJDBoTn?=
 =?us-ascii?Q?9Nrclax7TPdfoMJ5emrDChdaUXtaWt8MHR8P57EeWor6XjewAoHeplfF7XYK?=
 =?us-ascii?Q?kEiFGlsWMHqQfvGQ3JsIL1nAeXQ06aELXptGXqPlTl+Vj8acBDhXoh3nZSDD?=
 =?us-ascii?Q?pxk0YToz07M4ed2PdUFutvvR+alr3981CJ9tOdyvlhGKzpuVrE3+hG80iN5M?=
 =?us-ascii?Q?nIott2JX38tDmSYhOmcUsuNH2rp0uo5jdYWhu4RF+Vk03tZZ8p+6OdaLZ7yD?=
 =?us-ascii?Q?YZhD2/6xRbb0vsN+pv0XPPKNq52KSR+sp9m8RFbfFWXO8EDmkcLV279LRWjQ?=
 =?us-ascii?Q?RkCv8l6BD8lM6tp2cU6kmqxdLzL7FtmPXfTQmwsR6Gz7DyC+wuhoaFSSfF+z?=
 =?us-ascii?Q?Th8IW/w7+mvQCQXt4jAARtFqqze0WEN9sRDNOyJwkTYb418WEwUPzfpG0UNw?=
 =?us-ascii?Q?y8N2QYH+YwIBE1R/l2H5X2xAajEq+cdttgD57VsnVgxbl6wETQpLW40ZNUuD?=
 =?us-ascii?Q?Pkos1ZOG5Kjta6WAEbkE93C1KxQkZujYDbxd9TYogDLPLtMR+IWqKA7EtA6T?=
 =?us-ascii?Q?hshI9sQVbBStNhVagOwmS6pB3a/f2bG/x/9NciMD01S6Vko=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vgx/WckJYS1jxi3iiWDVRhuJBMT3fG5rClI8WSCOuIcDJ2xCEFeDZGoFaCqn?=
 =?us-ascii?Q?JbvSUqJ+xORviJRq3x31SgF3gVhTHkFuL3hP3HjpylXKvC2iIqo4LSE4coNd?=
 =?us-ascii?Q?oZCSI6rnhzK6I2/AEqbAKTEO9sc8X+YUXkJxfFKnS9uK2gOoZ7cgv4xoAMxn?=
 =?us-ascii?Q?Khbdk2b/l86prQ/id3FW7Eu8jMPuZYWihw+hOUmpIxaENu5X6F7jwciWLIIf?=
 =?us-ascii?Q?U3EgYib7RUzMOmSzxDihwDeNju2+nltBI6MmgqEkRODfTOWElOWC6UWaUBaF?=
 =?us-ascii?Q?5trNy0UaM3zLOU6BBC7DPrZzU8R0ax+j1EB0X+s1PlblK/wLeQBS/960g23H?=
 =?us-ascii?Q?hrosON/uRu1a9xrQghx3l4FQsZ9gBVumGFOR/6pwJt3V9RvPT2/yL7NKyulC?=
 =?us-ascii?Q?DlcFxOLednVgtP03Ysc7hbepN2Ghkil6Szoh8PyEi6QK9xDNmyqH9m4Uf1ly?=
 =?us-ascii?Q?u1VdxK1d9KyGJHrmDG/OavvQaR7cVnbVKeAlzB7F3His+r7Vwursvqb08j2w?=
 =?us-ascii?Q?/nB7tySmencXl0Ltt3vG393jnzQZGS8jNvzg44PoVTcjMPG5vi4EIdIsxwEM?=
 =?us-ascii?Q?4LZdFQEg/9Z5sn95gHNTogwlBnB5hYxMG+AJmfDH9ao6iX2OZvQqtHjw/kmF?=
 =?us-ascii?Q?RMkR6Qo2yQm0VbQ8zSc1vKs6GtGvdUH+Y5LoOMpzYY27swZtycDBA9IZczX8?=
 =?us-ascii?Q?Dl6akRLAuThDe1a3LZKIEjRij3+EBN+7lr8RZJ82em2NB4mvz5bZDZ3gptEl?=
 =?us-ascii?Q?ReC20lFA/QP1tPh8dFWmjQe3H4z9tM8JDBh0XTJjOgjDIuPPw+5E0wU63drH?=
 =?us-ascii?Q?wcAfXyLx/f6J4zOdQLlFTjgp7jgQ0YpqkA8RDKLZmLryBIEd2KRGasBavmEu?=
 =?us-ascii?Q?W6ynboqL7ppLI6Kpg5W9vpw3OYNiLyEqYkYhVGHycVvIAozwwOXq7pOa9egm?=
 =?us-ascii?Q?dmhU/NqSKRR6FYmHnQABcjwZVQXIp8CO3xannZDZmIzJjHMOmHyRRS04lZGc?=
 =?us-ascii?Q?SWzYKgSpBKFzwqJPUgwzoDY57AFBGUHCRXQ/V1EEfF/BZ+7lkxDJX/X5DFpV?=
 =?us-ascii?Q?OsOzhcDMi52UL8Q+bhEo4vp8d/qB5ju7DKJ3DOHYOcGPWv7tKv0XGme9sfcD?=
 =?us-ascii?Q?vw+SxlG9cYL+wJq3F968G3HXBiZtNH19hm78xG+cUGzyrQNDF5/sOyahomsJ?=
 =?us-ascii?Q?VQR2V6s8z/Zt6yd24WFllQ8s/SveUKuhrqKNc/Xtg7/B0wPVE/LIzgHamVzt?=
 =?us-ascii?Q?tMMs8zhO+/jjlkMsuUakJkSoSZYyBJCu+BKIA8z4uMKjGT21C8ETrAzybQoU?=
 =?us-ascii?Q?k6eNp3U5R0kExvPm9Fc2qJnsktN0qHyfsrGmB4wnxeTfHUP0hr+ZebWLwKFC?=
 =?us-ascii?Q?Aud8Yvt8FhkL5XPOH2vujZmrdwnyZsYt6DVXU7aKfuFOetvQ0wm8vEg2/KFj?=
 =?us-ascii?Q?J2v1d3SLEA78+qZKxNvdKY8wnfcQ6B2f?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebf7fa7-bf42-4eec-d2b6-08ded8f17d35
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:54:43.7094
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8917-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD12D70190D

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] The driver improperly maps the single global ST1202 hardware pattern sequencer to independent per-LED operations, causing destructive interference between channels.
> - [High] `st1202_led_pattern_set` does not clear trailing unused pattern slots, potentially executing stale delay steps if not preceded by `pattern_clear`.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

