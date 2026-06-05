Return-Path: <linux-leds+bounces-8502-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5PvbDbnYImpveQEAu9opvQ
	(envelope-from <linux-leds+bounces-8502-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:10:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7964648BC4
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=lq8tLDML;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8502-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8502-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CDFA3023B96
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05621276038;
	Fri,  5 Jun 2026 14:09:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013013.outbound.protection.outlook.com [52.103.33.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9786940E8E2;
	Fri,  5 Jun 2026 14:09:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668597; cv=fail; b=fdsUnEJGo8Oz9PAM3XM7Zmu5dRYpFGT6bxhgZCBXi7soeqsJmdp7uL//uabvdXk8jVs8+bPuPaz/sR3RCUkCqx58f0DwtSkYxJYPLosLWEWVJ3mAQ0EBgng0mZ7rYi1Ts7uLpzW1e+HQtCPWCvMnTRM53jr89MZ5ClH48hHGj9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668597; c=relaxed/simple;
	bh=iqyV1qOVql1vQhhUYX+L6LOZzd4q/3RWKd4EOYzW6Pg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sqgRZJlYyx11plYLMz5LnrXchxcZM9EM3uenb4OUw2vLCld9S+8LIhd4pGzXPYWftDGZ5Du6oQH+FzXsx9sEihV/DN/IvRYpNeVh8Mz1kmH4Rybh6Pb6leZ9af2zhs7SKB5/fvVwYOpws7eQ5ExiHW6OZiqg8nwcmR6CWVFzkWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lq8tLDML; arc=fail smtp.client-ip=52.103.33.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nsqv8lNst/SDv+NCO4G2gqY1/mEvH698+Ebn/36XTTH6XuSaANSYHRPrHMEXnMjdxxewDdQTT152lnRH+m7ME6ZKqokVR9Fz0/e17Fbf88WEN8uJfp+BxFrdatT1h+Z/r0V+Opbwvi5ZPH0mBHd5m+oUxPNQN1pE7cO2iD++gDj//OsBF5ey8e0m2dmi0I0OGlXc0NWAvn4juNlb81iPP/4sc/ibId5rlBn8ETaoyEry/QP8E/Cp9VLBUBPVUlXEVDlt0eeVd8ZByxA9EhJhDyZY9Uk6FSNhF75G2xQDzl+lfNQxZVuP34N1ypXYP9flOkJeq+pgZUjy3VHElIwRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2twIViXjxOgJNDMUSE//zt/pfajVRRrdrEgXPRhnASA=;
 b=yyW9LXSFoA93JzddtEdAhmG+IYY5UWu4dJa17P3vjBvatx8Y9UP0ToGsgafa+2t/ORi/Qs66CDaCfypgH1DDZpQ63+AOba76mlrVKpYFaCH+O4cNj/xNsMbrF+kL0FNEN/7N6xrjQXr9Uf9VXNTuxvdO2VXzBvtzUy7kD5fYOopviePqO+ABBBnWc8RY9aCtUj9snr1eUuMbG47m3Zm3Y3m2BUTcXJu3YfbA9Hv5oQWODvdXK+97IxJZiCmKecTiO7EuxL5nj0GFuLq9Fx/AXR5sSbZu6G2oJ0gBQ+01jYAGmVtxXdXLwj+paV/D1KKBjHvGxNS1uIATQbke7Yd9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2twIViXjxOgJNDMUSE//zt/pfajVRRrdrEgXPRhnASA=;
 b=lq8tLDMLm4BORXcq8WfiIFY8+gcrZCT+gotJ1j1jEOKqJAvp+2/qTWIyXnOVeF9BDwWXPVE5UazA4+9PFitIPlceNKuGU4bG6gEmWWoG7bPkqQKGnKpOZspFnH04iDvfsIqwinO331X8ErcRVuDuRQWIJmd7qo+3zBC8DC4fcOW2PL6gDV1Jh6yeml2nDCnuLXSoPIkr2lujlFPGw9gfMnuzLu7T3vAGNEXX/3sCfomRE4sgkGiqnnKhuWdJZ3IQc7kQT1aXIrJLBOMUZKDqu+BfeJWWqnTfByW1/sDRszimqvLnpDffyrIUwaxbfUBRvuR8OA6t2YC0STn97VhETA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAVPR08MB9377.eurprd08.prod.outlook.com (2603:10a6:102:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:09:53 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:09:51 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Fri,  5 Jun 2026 15:09:38 +0100
Message-ID:
 <GV1PR08MB8497883DDE12BB0CFA180772C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0021.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::26) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605140938.1467691-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAVPR08MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6e8580-5248-4454-4bb6-08dec30c1c05
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRRu6MGbuPdmwBVdZ5VVz9Cb4A2UeGBMui5AMGXs0ZqJzek+DyJypuM91FYVPGt2yHW1huTn6wyb7oqwwmGxl+0DccK5D4QmcxcdplK20qiTFubR1781zNEb4IrCW8QMBJjSy8BqUDRmlhlrspLH47EVnU6RdLV/XwDrEqMUNZHzmDNJx4uHJAJ2pvh3XvHOqmhdijPzVe3lxsKXNj36uPkxbhBMwAXp7vB2u1MIwgbftxC+B9DUmTN/p0BtFt9ZxcqHN83jJXQkAj6YSXElb+FFd2HLGrAqoekrbFnw/T2fOkLW49QafWPHSlme/2dA6U+CFkIUzR6qmBEz9XUsgtiE1A4B9dIQ4jvlQC3M7FIa8f9maU69NhkUFWS5bvm4HOcG4jIEd9ZaVn4WJDeo+eJttSs/UzYDP9UXGP4Fklg4YfLYabyz7M5Z4dJISj01qFl5yFCxXTufVnhZPITOvCDirTNcbjoKTIgbVqWeMvX+k8SAysM6ge0vQR8fALaBE8y0UvEgE2sWk+eW8UqhT+Dv2HrUCzR1hphpfhCkyhOXc72oFzt9KfyeC7oh7wEYmOW4V/yJc2ruMV/JwHD46EDAQv8u/n4Qy80k7X11rSdAEqL4FcncHBztOjooTJWEwbHWfC83O9GRREuUpUNPQpKPcAo+veVdc+CBu16NeoBW5TK+SoKope/6y6qAndkn7YCM9qk9B/isB4VHnEvnkEIun5+QH9IBc0FUzhTymqCac=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|55001999006|37011999003|51005399006|8060799015|15080799012|19110799012|23021999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NYfoNWfP83ZqlhnWbw3AISJjcHMe81YvSQzdq4aDv2SMPoVFnVlNjPQAvFgd?=
 =?us-ascii?Q?jebSybqJ+bTOxhpg16ezr5tISTtHKdXuiFD364p9Mr8k4cY9bEply3vLYzVk?=
 =?us-ascii?Q?SuyK86Z7dO/F7+zDoKlQpkGYtUiOpcmuadvbw7315DUu2GfT3pMCx8WYMyfv?=
 =?us-ascii?Q?zmwzh0zRJq+LzcpqX6zbYHEnfpLmaVweXLrIew7JojFhpnEuq9UbZlA9i7Jg?=
 =?us-ascii?Q?nJKm7TWknw/kvcEjXUdlUCCTluISDRS2Ya6vPnh3V/NK1ns729jr4sjabKVp?=
 =?us-ascii?Q?hrJ3+gMcbFlKJNH1Pie54VfY8PqBZToqpwfiUkM5L/hNsUpxAz093J7M3B3Q?=
 =?us-ascii?Q?xN8A0p27BjCD0RO9BC//4guMz6Qo6Zr3FAJsh4BIxSoML1hWd9CwJO/l7Raa?=
 =?us-ascii?Q?RUTkIw+HwJARLYZH4Vj+8xtC9xxEKjsdRLYcaZSAXIWYAR8shaBw1rgW6cex?=
 =?us-ascii?Q?Yz8cqCgVlOw0VcTdEHah8als4QcGfwz45iovKN6XcfoMJf1g/G5QtvCOr3/6?=
 =?us-ascii?Q?uN5HEXQ15QGezN8H5GOvL5xr1W/DKJC+QYT7WJ4LRT/R49CXGoLdVWNZTj+G?=
 =?us-ascii?Q?O++n8khnxi+tedOM2hGxY28zzvFywCe4AnJiVSNSSd60mektMkGf3kAiW4qY?=
 =?us-ascii?Q?6pKIFZijTNgmRMi4NxkDfOIk/+qWyuwbh5Ml3WJ7gW+qpWQFpRg49p/+Birg?=
 =?us-ascii?Q?PtYY8mSqQDDBuGYqf1UIX7x4d2t6PHpSLoFGbRi5MIxR+zFWMH9X8f9mH42k?=
 =?us-ascii?Q?1gcAf4FJRcQlYDjenpATjPmvZxkFjKvsOgqZ0z43PwxBg3fAd0na+ybj0V2P?=
 =?us-ascii?Q?FN+onmImB/3EFKmDJp40p2iNCfSPKmIR0fZfSgMKABw6bUFUk5P5jFg85SHl?=
 =?us-ascii?Q?dsQzDr0YVm0RGyO2dg5ermtL8IWNN8Vi6VlBlfAjsd5SHna+jhF33XkWuQvP?=
 =?us-ascii?Q?29jyMq2PZPh9l+GdBrXOvQ4TEGm/zpnGcEPz05UIq/b6OlWkPSbeYOG3JM+4?=
 =?us-ascii?Q?3Kdd?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7WjMV7SY4LmNn4x70XNuzkgPNwMB7eQPJXo1tpTGuza+1m2Sp5s+kWoDEcA?=
 =?us-ascii?Q?jedpQWJU1bC3LYc7K7VnP4f32RtZSYWmH5q+d8BTHxASXAoD4ufNs+pGx79R?=
 =?us-ascii?Q?+KefDvD/Gk/0l/2Ny9PZJtGyuRngbal+pAy6Uri2NSRgIpvJHeosGfdZZmiv?=
 =?us-ascii?Q?tXgcEF7VIwd0lkG7oZhMv/Vthf8EI6M3MpvNhY4Kf/hE55xe6SyekKsaNxPO?=
 =?us-ascii?Q?hvIoOHh/9WbX/uHD7W0FzgO6NUUk+fTz1z95s7gEZFkihdfRB2Gsw0JpKIi3?=
 =?us-ascii?Q?j6fL4nLuOCQprcCyBRJ6iwS7hiogRmLm4RtHW7rvWNnmnt+G91zAYRz5SmeH?=
 =?us-ascii?Q?x9AS6XM43gnd7zdVn5EUWdSwb2wP1vNYEuimTHfkreNU3P/hLocWmfAX38QC?=
 =?us-ascii?Q?WUkQ3BwjUrdB6JZ2iWeqF3L8Fkc2d6/DOW0FJM7Ih1sgKBIJ54arIVhST7Bk?=
 =?us-ascii?Q?eVjz49BFiQmcn677JBUA5oaEQ6fqnylHqH5DJ+SLJ5KUm9uKyyHGtVtyWXWU?=
 =?us-ascii?Q?QmYQwuLg/Tp3Me/FXck8hjn37wkbfOhZ0pod5ymE8LHkbofOpk6xaa78jzdq?=
 =?us-ascii?Q?vmOSVMy9j+xAPJ3gKheJGSbiOAMmFHzpDg18xI/59Bxvfwp72NSYdPG25JMR?=
 =?us-ascii?Q?xIxve8hecKpp0KhhScPjI0u6Ik5xoUrvpG3WbBp1XHVKGdGTD8fnbby+LGp0?=
 =?us-ascii?Q?jTKW8yVmeXQHHWaAA6hGhfFIxYP4oKvXDHTy4lSdH86psrUK5KdQJCyhYtHr?=
 =?us-ascii?Q?/2qKDMUyzxI5blYe6QHxzJL30OKRsvwayjr2MNKQzqk8qrEk5ms0IrCGhFmT?=
 =?us-ascii?Q?Ds6K1LsGzRXadrT2FqNLprJBErARrf/k/yqxKITdv+ccF9tOuFYEZcVXbXpm?=
 =?us-ascii?Q?auzYYkOtCARpg0ZtsB6I76IJNfHIy0NZWq0TwMCPOpXVBNs+mUvVH5/DYQME?=
 =?us-ascii?Q?Lk8a+jteChyG9Ts+xffEigcPxz5Adg0MGzqjEY9BMUqDXcY31Siwt8ePYN7p?=
 =?us-ascii?Q?vGu0BcnDeNvqZx0TsyBrEqzy/8owC2ecmWCEXlVUO5dDhkW4re22q00rBmeB?=
 =?us-ascii?Q?ROAzgatZvK9iHbvor8JFazhYuJ204R35yjMFMow+/I1NuCk7Nsf+Xn7U7UxE?=
 =?us-ascii?Q?IisPJCBnpcMMwGxRXO3x82J5OKft7c+jNv2kSSm2M7xzxCBleCLfvSlcDCMJ?=
 =?us-ascii?Q?dswrFdpSCzsntBLPK1sHCsmQo9SoEoKCB6JxVsuMdxzA6HLK6q206P34Bmd5?=
 =?us-ascii?Q?7pfVlASV2POxd1NCe4UYzroUpt54HhBeU09J9oGzyP4tpjzT4UN5TcYTEHUq?=
 =?us-ascii?Q?rOfzmOwPMgKeBFUVSipL134ZEKCmcA1zBsxfN9TJIVb4boSf0xh9hkYR0eTt?=
 =?us-ascii?Q?raa6XT46iB/jzRAXopi3nhPeBUJ24wV/MKKYghBZe4O1mIIh8RovxQrHSxZe?=
 =?us-ascii?Q?JzV5p9W2neZ7yapkb3PJ6OhfmQRcanpJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6e8580-5248-4454-4bb6-08dec30c1c05
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:09:51.5747
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8502-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:from_mime,outlook.com:email,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7964648BC4

Once a hardware pattern is running (PATS=1), writing to the brightness
sysfs attribute only updates the ILED register. The visible output is
ILED x Pattern_PWM/4095, so the change has little effect and the LED
never returns to steady static operation as the user expects.

Set CONFIG_REG to SHFT (static mode) before writing ILED so that a
direct brightness write always produces a steady output at the
requested level.

This also enables basic LED operation without the pattern trigger: with
the trigger set to none, the brightness sysfs attribute fully controls
the LED as a simple on/off device. Previously there was no working path
for this, as brightness writes had no visible effect unless a hardware
pattern had first been programmed.

This is safe because software patterns already run with PATS=0 (making
the write a no-op in that path), and the hardware pattern engine does
not call brightness_set during autonomous pattern execution.

Note that CONFIG_REG is chip-wide, so this clears the pattern mode for
all channels on the device.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168d14566c1a..4fa41cc74412 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -136,6 +136,7 @@ static void st1202_brightness_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
 }
 
-- 
2.54.0


