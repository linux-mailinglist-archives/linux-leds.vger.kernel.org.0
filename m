Return-Path: <linux-leds+bounces-8504-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tt8ABffaImrWeQEAu9opvQ
	(envelope-from <linux-leds+bounces-8504-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:19:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AABC648C81
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=rVfC33zi;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8504-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8504-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C173E3003EFC
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB0D33C53D;
	Fri,  5 Jun 2026 14:11:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013015.outbound.protection.outlook.com [52.103.33.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40140E8E6;
	Fri,  5 Jun 2026 14:11:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668702; cv=fail; b=F+Y4K/ojbavWfzCK8wFApbt8+3BymZaUIM1OF7v/yI9eeyFBYJEwI8cJq8J2STYbx27fonuwvxUKN1/6RErs8Hr4DxM0SBtNn1akpS8vBdkC45+RnbCEpVV7zaYm8Ws+G7+ghzvpOtMpSnCwuBFgDzpF3Nj/aAzml7d/rpW70v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668702; c=relaxed/simple;
	bh=t6sjoDLqKfVLPZk8xYWqlWLaksFbmBZ/f78LlwYwoHs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rjIqqbRQ5HpXf6vF0I80YDYN9Vhs9tw3JXfqFArBi8sQO9qv9ePBnvc4dck//Tk4lJ0t3tXTJ/qIAMVPP45Ek58iSGUoAFdd/5IMNQ9BJ0by8oCiBG135pmWlp3rXxcNZTuLBa2cxQXlSBzdVWPC7owMZpioe+fib884CTje2IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rVfC33zi; arc=fail smtp.client-ip=52.103.33.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnrSVpjA3BdKEbXoMWf/VBRAjw1i5sWl4jMe0i0HlTtj45DjJQg/Y+cQcrnaeuScbqfr3d1fbbhjYUk0RcRMq88UzQTiUXcRAdxnoXb8bQ8n0aIZCESkTrPd5XqY16aJ7IvXHYfA6KZiL/mwfjBDCNh2O7maSWSwJoW/cu9y18GJ2ej26o1XrlwJO+Ls7fIEF+Opn3Y7G9btB3r+3LsJQeJKxr9J4iMvg1JUlHzfU3KrrlqtT/PLsGtmqOzUZRm0Sc4Frpn8drDb8CeQ2A1GQ+iKChvTytgQ93bLWdXU6We7v7mPWaDkZcTQbgxrT0vaSgprUb5+qdpH18+58bOttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPqog3AUm7yfGl2JmWo1GsHsZpM1ATyawNTUXmJ/ELM=;
 b=nnkXw+zzyVhm3KhzrltAUOIioNUDiO8xZmXS2FR5YkBeKG3S2ngThvLS4/uBrDaFxV/nLu1+/qJ/i1qhBY3VZu7Q0QjHJtQNuJOL0DAEPuJQ1Ct1K3BlbFdFZOiELNpRelhOqDIMJLMCGPUKdzjSmaEVgJXhZTLdNR5um4n4j1NYxT1QYXDUBB90vJxtuDyAKXeCNlkOTZdnxzxyGPM/LrkmM/yftzSGlwa9ycDnc6nCgDgRL5MmixnsB/wW/uEMcXizpDEWxtHuESVpFfVRZH0agyed4WWToP8ABm+fxoRGZPHpDuKsq2UX74EAHvo6lbUIvI5vI46sFENcgHZXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPqog3AUm7yfGl2JmWo1GsHsZpM1ATyawNTUXmJ/ELM=;
 b=rVfC33zirtL8j+HM8XbBrS71Dxk7bqsv3rlc9Zj2NNzl3mMdNySE4NpjfZsrqHo6eLLn5nzqP47JVTktWKtcOjs57+jRkUf6FFHLAx6Jmd60pnkD+n7RvVmlg1bBlhitZJWDa7/DB8j0n2d0UH/6frGpHFVRPaMUsvXM/JfWLbAWJpILBmKE6pJJle8NYWrNS9WwnPFV2d5of1wpb7uM2Kf4v9fMbLUhuLi4By23w+i4Q+RdJbk8tOZlTYm0jIush5md8ry9KYHfTnhuX2DDOke5UAXXm57A4ztj3b1nm/Lo1EfxSuBXZ51Y/2vC83kk4BOSHu3x+McU5PtqqQ90aQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAVPR08MB9377.eurprd08.prod.outlook.com (2603:10a6:102:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:11:38 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:11:38 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] leds: st1202: validate LED reg property against channel count
Date: Fri,  5 Jun 2026 15:11:26 +0100
Message-ID:
 <GV1PR08MB84977605E1992830513A162AC5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605141126.1478182-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAVPR08MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: c077c475-e1ce-464d-90dc-08dec30c5bfa
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRABAnnZkaloXQKX6WpXABzSqP7+a/yd2MllOMDy7toB0Sn2FtZS6enxFvDnVgLlSvsvSfPYJhcAAf4dNWpgVnb0+3jIl/THAbePS1Z50s9CnTNriYf6YZut0AYJpJgJu4FfkiRBMQ6ZEH4wgS6z7ZjXqQ056hH/wQ7e8AtnRNSmH9euvfRR1yF8zHdbnw8Z7NahkDzKX90F5OqEV6k4MdzlkIkPeEW1TBYugfztyF+8drKlhXoFUaD2b3G9KoDkA41qR7ZulxUm39yt1GnjB0dRKHpRwIiAyy8NcqwPIwz8gB5VEZUjY7iNr0kycyPeUDnjSgaw60WuwVn5CuhxFl7/e6esk868/3nK2XmLMGmUlvPw0p72MGeippDKfHkTerarCOcgOZxE5kfrLFsTsqOLFV4E/UL6G01UpRO2n/i4chamPyN0P7ugDiCkc7bK73zsOvVGQK/CSX9wuABTBGtA+Sf4dnIQEyfqnW5wTUu9YKUJHi4K6+KkG0kWhwVHhDWFPmFWBU7Wv6oBBuFK6deG3DHglcNxfEDa2QPbBKPgRC3zs6w8rICqFRec5QrCNlf1B9532RYp04oMtjYGYOLQDlNsP1MyJ5i3FhXSSy7AXSdKi1ch3mxTjlw2V9Y/fgmeJbAfz/WxnluNFjJkJdvMT/MiJ+l8XYL5ofCWX9oOII2Orzpn+zD+fxgS0RG5dK0EbRAq+l/mj3aG6nrLpavxFbhZkjxf4//aSq94mcJlE=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|41001999006|55001999006|37011999003|51005399006|8060799015|15080799012|19110799012|23021999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KvxRzooUKDa169ZEliHavOjQdHmTkN55Ct3HpnS1YaTHREuOjDMHQ4doHo2V?=
 =?us-ascii?Q?20ilhTGT0utR6qS3bm/2JmSxwgGYNskvSM9zDnk4RW90kwcm4/qO5fRP36bm?=
 =?us-ascii?Q?OtxBbRVqsRisb7xLyePiMK9aVIr6zFc+gd32DLcC4AgyKzZd9iv/arbROHrL?=
 =?us-ascii?Q?8ustRJdxf6TMiBOoahlcBfDsN8ihtBip7vw1NTyjgft6f0J8WyWS04uOPSqX?=
 =?us-ascii?Q?atWy6veH9hfGRdkHvW5CjhyVXycpBkzDb3U0Py7Shcw3SKaTQmyCi9/+hm79?=
 =?us-ascii?Q?+VArJoIT9phNt/HLyv6sddcvgudFfbgppoTOQO4uZEC81R83jEnquiQrS2m1?=
 =?us-ascii?Q?us+F3jcc51ntpPkgutZzjebsYGiAmmiZAvpuWYFDkJy+1CGcT4n5C2fTWnRo?=
 =?us-ascii?Q?8KcSBRI6IzbBrA81jXJgVrZhgHCM5FzyVFKBMGBIQg292cHvN3nl6/CBkQ+r?=
 =?us-ascii?Q?Di63ZZKBKA5HT1ODiqiAg5JuviT1/TEkKAksU58bb5PlyxjNpJy9gSMawiQ2?=
 =?us-ascii?Q?P8ijJox+x4QPodR7J7/1HjAzE8RYfQszDAbLOdijeR9PJPqyPPiS5X3ZNjZ7?=
 =?us-ascii?Q?YmR1AR4fQnW/Nz/b6LnQTkvdBeIBf5m9cb//JxgHHkyFKkMBUMCS4EG8uESO?=
 =?us-ascii?Q?13smFZBqsVfCuJU+I4rLigfuFyiO9KLGEss7mbbGUx/1XinamQAXZ+pFEcpX?=
 =?us-ascii?Q?wuOyIANs6G21s5xjkyxnyGkUoRShNubNr/LtpGk2ISEq4urnKXGJwfbFgkSU?=
 =?us-ascii?Q?YR2El/vqv18+k41gOFXgCXn9Fipa5AsNk/D3BxF1pBbgcYCTecV2XHNYmmHT?=
 =?us-ascii?Q?en8BSiPEjDq2xRnAwKzGU7D8/a2JDOrdTVkx0jNKi3wc8bSnq381wHsSB/Ap?=
 =?us-ascii?Q?lQa3q3wrvi1MPU923N5L0IPPmZODNS+zjc7mVZw84bQCQVMHBEvG3TaT/gyE?=
 =?us-ascii?Q?Ks+PeRFC4XVKU1iWd8+ex8NjcYexBoFtcQONsm+zg79iwLrXAhPzcU8fbvQB?=
 =?us-ascii?Q?FycUu5mTMUiXv5nFrVMJlyijjVyjJ9ekGcVcxq+6beJOSTs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e7474/8xmHGZ+BnKsGWsfN0OrURZ9gDsMCSONLhgL+UBY2O1G08lYZtO+TMI?=
 =?us-ascii?Q?BjELS/vj0Y3Fkz/EEoIqLABkDuWeM1Jinan8WPCWJHSmSeMxNf9YeDH6syDE?=
 =?us-ascii?Q?/qb5GKB6AdfN+6l6DJB38JuWF2zeoJeOUsYQc/cVyx1PktDTUEwH1lyIK+KW?=
 =?us-ascii?Q?XvpJefKgH0k90T+L1dpuJ7K2J7/UGquVRt1V7VCi4NIq2rRf9jJCM0RX+V4B?=
 =?us-ascii?Q?TQdsgz9C4XwHy1fFr8gkAa69GJmfpGnHkkQeR5plincwfyUCKg2rZ5DMjRfE?=
 =?us-ascii?Q?b9T/YHgrrKjoB56pSbaEWYQriKzjvnWTFHEI4u0ZhoWlCNky0hnNiEmFXlbv?=
 =?us-ascii?Q?OOCceSM5v//CvEiA1J5oTDhmsOEXEmpJ/wn7KA4l7a/3VVuGiTKFmQBcNQgh?=
 =?us-ascii?Q?klp0DQpLLDkHSJqD7FJnmkq114Vq2DKpRZ9cilHYgSdCrCJxIkI42kZSnA4B?=
 =?us-ascii?Q?kuPIV9xQASQbaJpfoZ4vdt6WWzCj5JoTdqJs/pyZQAGot/qZWZ6a77FR60bj?=
 =?us-ascii?Q?J9gg79BTiKGR1LeYcA0VeNavg1OUv5hXlh7tj9zMQrCXDM6mZLGzsPFKrgFu?=
 =?us-ascii?Q?Q+YdjVah3/9MY59DM8riwk6lrwzGtR9caecEFstR3N7zWR04BcKx0Fn0SL/T?=
 =?us-ascii?Q?MLQfvTgXfafTOWOuJIrYNiVxLUnPJsIcPSNcoBLwUtL2HLjvP0qJmlGVb8hS?=
 =?us-ascii?Q?Lky1jC6B6707Cs/oDMyGlm4gZ2g1UygWUtDy55+3vy8acBBOdccA3JKDZoOb?=
 =?us-ascii?Q?lVN/DqBtUVeMqq5SePefKg5+I0uTlgl8mquwgGydbW7QdbcshKvRZjTeT0iW?=
 =?us-ascii?Q?Jts9P/K+AJLh9SsXEI1rh7brNTQB4EnlHUFkV2pb67wmuZDxDe6/vmD9kLXN?=
 =?us-ascii?Q?tst6xh1vRe4Hf4NVVYUTh/efkXNh6pXFWyA3iLYxkPLlOSX/sySSSefMojux?=
 =?us-ascii?Q?DIz9CvOkRmI3FiL9dy9eUWazr19b2X6BvjdR9VNrjitWdb3MTvfRBk4ReRfH?=
 =?us-ascii?Q?NhIej2d0F1IHIztOYXq3LuBHT8IriI1yYk7JhFPTpopnnZJoyqPciUuSbqV3?=
 =?us-ascii?Q?qAn7LafuS+Z69zs/MnMHYMhqbtAujMr6W0QnJxDTrhAI4UnBt/4cP/IsUdfK?=
 =?us-ascii?Q?ucCN6pgwRcHIDpE+2iPqc3pFxtmWnRc95aK6q0dbuRwyORe0baddDe17McXK?=
 =?us-ascii?Q?BTe/LUwkjpp0u7jwUmRtBSEcIvhnnZ6dHwvqRHEChbVCupBF5BjqvEP3cV5a?=
 =?us-ascii?Q?ChyuootHLw2JzBElrlt57JuUJXLirjfASrBnb23E1W91ObDO3sRrStBxjChZ?=
 =?us-ascii?Q?8MkSclwYxN68r46QYwBMNxWwmR6nlBmK/5OKAKW2j+S89BbwKpqtRkCtPTY4?=
 =?us-ascii?Q?pVZHARigCaLqUBaLvHRrEof5BgKUap56iVBq8FkcScTRNRsvYg1lAe+0iMRi?=
 =?us-ascii?Q?0x2Wv12Ap/5fBQubrIMpPptBqYPP/ved?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c077c475-e1ce-464d-90dc-08dec30c5bfa
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:11:38.7295
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8504-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:from_mime,outlook.com:email,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AABC648C81

The reg property from the device tree is used directly as an array index
into chip->leds[] without bounds checking. A value >= ST1202_MAX_LEDS
would cause an out-of-bounds write during probe.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 7413d316d857..d1fadbaac127 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -289,6 +289,11 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		if (err)
 			return dev_err_probe(dev, err, "Invalid register\n");
 
+		if (reg >= ST1202_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL,
+					"LED reg %u out of range [0, %d]\n",
+					reg, ST1202_MAX_LEDS - 1);
+
 		led = &chip->leds[reg];
 		led->is_active = true;
 		led->fwnode = of_fwnode_handle(child);
-- 
2.54.0


