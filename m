Return-Path: <linux-leds+bounces-8503-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0PwoJcLaImrTeQEAu9opvQ
	(envelope-from <linux-leds+bounces-8503-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:18:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC8648C73
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:18:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Y6fa8PHd;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8503-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8503-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8153304A6F5
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55808364058;
	Fri,  5 Jun 2026 14:10:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013077.outbound.protection.outlook.com [52.103.35.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D334133C53D;
	Fri,  5 Jun 2026 14:10:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668659; cv=fail; b=Lu8U2lzBMyXLfIcQoQM+o1L9MYGGsOWRiN+NzXcNxJa+WleVf1Nn4/cZiuQRarmQ/R/ET/9Y7JLIzyJYPii6ujTyP9R38Aq5Wr7D/ppZKUbSMleLSKBwwGYDyt1hmLL5hpf3jcP1BuFxpkEkD8X91lNaj2w0KL2Z3EmvTZB+6vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668659; c=relaxed/simple;
	bh=AMUQX2ohxEmF4+rSP2fsc0oEpvlDQJjwYe9HDwZAwaw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EeNEcJh9t3EsAi0dfefTWauSx24caFhz4m6YGP6ODYDOHA5ojTs2AHjIn9O2APKTn3jepSBJiskiNHnWk1mDAX80FjtBeb6CD7biUBSCX7pr9RaXWqBAXgsUVL2eSmK7fmlYQUsvJeEcPm3VLb/Fn8yht8wNm+CDSJKUiljSERU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Y6fa8PHd; arc=fail smtp.client-ip=52.103.35.77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pP7SFFbi2iqMENUFeV39ptp7Zpj3xddkIp7rgDTH38ezwJ9Wh1u9BatUjcE6WM556chj69ST6ccgqtvMXpymuK/MROaVi7RAkHikjiXXJaXDlyiUTh7jdxP2w0msHUi6t9iGLU5pKtaXS4CKgspBdIpUvxua2FycbBRDaSRo2rhTjsAfKdxv6ocILP8UQEK8JZA/+kZR4E80D84Ldrta71EmTQgqtvAbbWG74vrPDf5UZRGui400Cbarw2E517M5rZtsAU5g/xCMw8ztwIZNaQejdeuFHiNBFHd6QiLNWuzLgB4ybdGsqL35qgJIUIdrfEbewDsV6mNOzuKfw+9oEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuZU8gpaEIPzjGsy86RWMIVs8J+Y6v4V4zfEXiOi53U=;
 b=Nkki5Ekemr6l2Mb2cVqjaI/NbQ63alMrTWlZJkmNxO4QRpwodf01zv7138v5H7Aah7pUMewYu3DR65AyI7ZGG/kQed+UY8UuMaDmDPAqzfIN4XjEBYFgBjpnryzlcPlFgralDjY8tXL+PafEZYS6Dzl2b9rlJvIdkE73TVqPsxQAaSX2krUZTJ5RaZU80kZACsNRyzfxPllEh6Iv37L51U6Z/XlLhkNfk8F/wjzLZZOM60ZIScuYWQYu16zIwp84AHiF+txs47pfeBY3okIkumDxL1YKKYpFuam07cpeYBTlOsHTPrjQ9FwSbjYz/1UCcrqlyWzMAmxclaHvKepGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuZU8gpaEIPzjGsy86RWMIVs8J+Y6v4V4zfEXiOi53U=;
 b=Y6fa8PHdODi4fHl6GNxTsm+o8WIsVMK1asRC9hDMiWnEZcQpXqSVYHMzAjdYPfToEG6RiFPz85EFjDkcu5pOE1iEkZg6e2lhUqbbe/5bKXtN0JiCYteH5Z06BHUrtG/cYGH20SfaWDrUjiifh9JwNTTFUdrfPuU7HiU29zQsqOxGri9sCd7qkNRX0hNw1GD9PkBCHeRJMtttiHkMr/F9m3kWywETY43Hh/KlDXoVCsu9Ir5KOnQin691Rm6attpqYqsziV4H8G1c32IixnX6uUkzKFprCJUAuY4qMmpqpT9d0toocSh1gtxqgVKdbsqicYRVQ/UBDbcx2fcHeZn0JQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAVPR08MB9377.eurprd08.prod.outlook.com (2603:10a6:102:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:10:55 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:10:55 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] leds: st1202: disable channel when brightness is set to zero
Date: Fri,  5 Jun 2026 15:10:42 +0100
Message-ID:
 <GV1PR08MB8497AFED1E0108CCE1756CCBC5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::9) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605141042.1474051-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAVPR08MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3922ed36-11ce-4603-568a-08dec30c41dc
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR1sEDWlVmUlC0b1QyYfSuYd9kc0vdgDucSPb8MEB5TBuxc8G/v4c3uLbVj03hhmWjiFHS/VTX57pXJbbcq7IgqB2UBH2FlmJCeAau9+Z3WsrmfkDQ44yiDkVkVcAMXUOc7P1aJpFnj6nZc6CYMZyHL/YQ/94HQddc63uR7KEPQzUbQJRFBjEQfGblBzWNn6hdEF0/arzDTr781jouI87daVPlay0HYp6esqsWKdU4PKSAFCci31U96fuVf0CxVRjR8xxeohk/cBCL/lUGMlazX1ArNk5N2l8x/ppE61xy7rPzvap/zNiD984L5jzEQ9Myh54muzHnA6SUjy8wMZSwfwgcnwA0Q5W6SyNa2aFv83v8G5Ox3brXEQBRz4t75KrT+wrOE7bC1QNfstq0cU+7lJSRIUHc8JyZOQ6M0fYsTx7YCkjlVD4/vZiCyTRzkQW8WnMMfzjd1OWv5gwR5X99hmm2Mhc+QqKLOfyoVE3i8it3gKBH52QsTD3c61LQNq9fkRMKLKm6VRX+rP8ZkGDPjvEC9C/coFVtQtK6ItKnSMc3J9/4/XQL/J41hn6Ec4cMdSnawJmuiPgboUy5KseOsYaBPRoMO/nZ/nmBdB7nLdYj9jG3VexioTp8jYOUeDkgAXjvG0r88ESMcjKTHcNi2A3GzB5r9YC4xO8KJNuThOuaYTLaU113GkaqVHYKwqgXhFEc1jku/mVLoadm6v4J1B07hGKHsjA5O+cNLXx0srA=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|41001999006|55001999006|37011999003|51005399006|8060799015|15080799012|19110799012|23021999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T1B+I7ITe3W1NNKcy0ybQLDu4btkPYUWdaJBb/2czS6tDWxrigxc8JI4+zg4?=
 =?us-ascii?Q?9FWHwIPbbqKh33+SJfMpCy4ELpe4NcC84pnmaxlFEbZt6lMGTxYuRyhT/rqG?=
 =?us-ascii?Q?JzIby4a1NPuCoVdlWcTvRbsB5MMNuODOCu76vNWaaPueisS++wvQRL5DIbx0?=
 =?us-ascii?Q?aaUe9xATAJSrHhlLRoz6rqWBjp3ynWpMRRgXATtx4jl7Qha9Jvr9mFI/m75F?=
 =?us-ascii?Q?eN8kn81gpMqCqDncl82Xc+mBLimKnjSZmPBsGvLmzjodRgbl2/H6wYoaoYIW?=
 =?us-ascii?Q?I+ARCGFNwmXThc43WZPi8LcjQWk3EcisEebS6c/xvOWpwkpytvnozaucbgi2?=
 =?us-ascii?Q?mlacORdC5cxuC4GYdvfLNSuWlqJqURBkeKsFLgP88KrMxTAuMKLmgPUza1gk?=
 =?us-ascii?Q?hDCa4lADR4/TN6sYde/GNGQZBF0hKFr30kO7Jm51QB0E7f/sc+M5q8ibeR1Z?=
 =?us-ascii?Q?CFbemhLlmHlYkJcJFb4nZzjyzyQ5v6sk9LikntTJY61TzDLFQY/JF65jxQx/?=
 =?us-ascii?Q?rw5ehHUtx8VIoTEfu3W6cgNhlqrziKgdhy2HS+yIMPaqsvE3py973OVhFdfa?=
 =?us-ascii?Q?xcQ7dzJ0zk/tAJ97elXLWyJJiHnhR6EDafFjXxXXy4vUH0Veaa6EnU6zUpM0?=
 =?us-ascii?Q?QZOZoRd/1CZsaYcr4jQ5m+6E5RFmB6bOa3JW8Os84fOlkYS4woLFuJlpkULK?=
 =?us-ascii?Q?+7iQVwcJfNA8+NLSGiZudwPyKWrQnKZI3wQpLETLXZjqLJDjakAemiB4TPj2?=
 =?us-ascii?Q?OLo4L51SFGR3yM5mZZltoESV/+qHBpILU3m7rAOhx4mA/g51B5iMy6s8h4Uc?=
 =?us-ascii?Q?68HcQ3d2XoHijGzQBEDsyy2Dxrl6LSlzbhaXiColQvKKMOhO9g9xJ8sgh6WE?=
 =?us-ascii?Q?34IqOsGhgxG+M9nOs0coApWRMS+rqyHqBwxa+OYbQ8WSqWYt/KWt6guTZLHh?=
 =?us-ascii?Q?lQ0vGkEWEz+2z/fy9QGO3OOQTfhwG6xC2EWIvrpXWw0eqHk0igBiBJuImJZa?=
 =?us-ascii?Q?CFZCh4AsrJ9jV59YyQpP2Gk3g7fu4zbtYA36pO0vfOL3+5c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IvbwiyKv09OJoJB6Q1eG+SM9KpoYCcekN6MFgiLTZvNEAven8gjLfXbcy9q8?=
 =?us-ascii?Q?DZdLCSAQY0Tz3XvYdra1Xqe6Rey591ypshP6yOsuEqMqGsR6SzQirJkIgu+U?=
 =?us-ascii?Q?eoYNs/swEmjFrRAWFBDE49FPa1bDIOJHAmR657qNsEc7DG0iss9sb60Ax9sv?=
 =?us-ascii?Q?oLaxL2dFrX59Nj9OnofszLT2ISGBgJJhRIRRbs8HXTVW/UBxPB1y3fza6m58?=
 =?us-ascii?Q?YPHFn0ulNeM+W4zsmCegbX4QBbD9yow+Ue87ou8LYrcYFHIxsDBh4oYwAHu7?=
 =?us-ascii?Q?w5bqAA3mJBU8TYJmt61311G/EZy1h7yHo8oaRZzrccPpx+gnQI9xNbANb7Iz?=
 =?us-ascii?Q?jJwTVaG+JH+jERnIBixWaiO9fjuAhZbgTp1K2erbhbZjb2xU6Az4tpmTCszN?=
 =?us-ascii?Q?QN/otDgf+YKqbP19QeovLf3wm1amjnnsMbQ1l5UKRor8vWIMLL5+oT8GoHkb?=
 =?us-ascii?Q?hGhTY95f36r/hdRWi3x/MOAQov0Z2FmIG7/t81cwYp5WrxbymFWwTyAPGx1i?=
 =?us-ascii?Q?kYZzSDYJJlX4UJeFrndIySoVb/FfTfFA5jJC02aIMCihobIhGXaE5r+tzLOg?=
 =?us-ascii?Q?AHdRpwepN9/FVpfN6Kx73k8oex22MwwXZrgAX22jdYkJj+t+/Pi6+0Vv/N5u?=
 =?us-ascii?Q?lEbSZHV3aeKneZxfIbwMYapzzm8SCNH4pYYqWNdiEgc0KJCQPjXY/zWVyl/9?=
 =?us-ascii?Q?rals8hcmL7eX8R7NbI/ncaG0lHddLMkTv1Nm0I7vTkQnICPqdIUBINyoNzMy?=
 =?us-ascii?Q?KwP8VaViK6oP1JpVgRaMZj31g0zODJ11eotJX6ziSfPhV5pYzMdQFQcpqO/M?=
 =?us-ascii?Q?Cp4Xmc63LrIB/jgvRczUFff4y8BuxuIvv9bOTy0dxN27dWfadnFcsTw0cfpb?=
 =?us-ascii?Q?4wPmiIwdljAyq1H+CGdMii3d/0raBITwpJ/7dwuKOtWp2uzAeoR0gQmxnXwa?=
 =?us-ascii?Q?880taKgxQAJoX9NOLO/RTaWYHOqvrMhOyrgqM9ufdjJkzvfOFG4NbciosXog?=
 =?us-ascii?Q?pp2GEB02a/2uvnwG+8pe4CzlyP4KjbzdBsBCYZ5WcD5hW3rf4TXlH8MpcBrb?=
 =?us-ascii?Q?vsqunsSKhKyXopE5m5LJz5Of1wlnzff59WN9mfQSvuMaLwBGyojddmDkgH58?=
 =?us-ascii?Q?yn8PKk5ilToPzPtYrCJ14NWB293lo3i8t1c5OyjBPPnc6Mp8cSB3up4BT1Hc?=
 =?us-ascii?Q?OZV5OYQVSbNgSoU6fjf2VvYHK0Grb2e6CrzKco3hUSLQdqKPLjyif6+toM7h?=
 =?us-ascii?Q?O8lTKNxd7jHtD5K8V+aQJJ+Ez+M0ZLbf9rNiOtErAZAqbvv52FE9jQFFOPbe?=
 =?us-ascii?Q?mzKk0bok+0V0Os4+GWDOyhTo/6FbdxKvf+N+UeXla6oog7Bmo3QFGmH8XX9t?=
 =?us-ascii?Q?z8dGMLMTv8BfvPW2wDYOwSvZCgG9YY8LDCOh8qUbt3y1spPibbX0lg26o004?=
 =?us-ascii?Q?d+EM8HcjS1kMfnJwba/IRjQAz0jOIlA7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3922ed36-11ce-4603-568a-08dec30c41dc
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:10:54.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9377
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
	TAGGED_FROM(0.00)[bounces-8503-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:from_mime,outlook.com:email,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EECC8648C73

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4fa41cc74412..7413d316d857 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,38 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -187,6 +160,39 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
-- 
2.54.0


