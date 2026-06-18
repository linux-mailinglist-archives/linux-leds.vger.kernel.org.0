Return-Path: <linux-leds+bounces-8674-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PWrwE6EQNGptNAYAu9opvQ
	(envelope-from <linux-leds+bounces-8674-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:37:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5886A147A
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:37:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=WKHWDHm3;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8674-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8674-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4DA5308F34D
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 15:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592F233B6DB;
	Thu, 18 Jun 2026 15:34:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013081.outbound.protection.outlook.com [52.103.46.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53833D4F3;
	Thu, 18 Jun 2026 15:34:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796896; cv=fail; b=IrS/jeHXcMHsfpw6sOJG7ng9VH59nh6jhzkd+MoPFN6Mjl8yyMsZYaSzzyL1av4InHmJtqArcNXiS5lcWLiUff4kTKZLqVqkV0QIvzvLUD7/6876spy3Xk+5ZgNu9+bBjoXTZWv4sWm1nhAdOqZAtcPaYiNNrPyCFjIPLAY/6Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796896; c=relaxed/simple;
	bh=2zfe6zbAFR+zEWd85z604M6BDQtc8vNMH/lm0F5FFZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hPA6kaOmXgMMkSbak1qcqCG0SYiAAMHow/W0Azj9rqE1PSC8+FpDz6TQf7snYzDJUuvPnbzs30KsZuL5S1p/ukciAC0piPlS+9HhxL2HZXvg5PKgAU3t12Q1H/L0JlXMYc8Pw7AKS4/kIxWNC5IJvwK5X7+l+Ymcn3Vk8a1npc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WKHWDHm3; arc=fail smtp.client-ip=52.103.46.81
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR/Avw2+oxXcZodBr+Yvc4Gwu3crh35I9iJQgIxDKoUumXe1Z4q4aErTiy0lxxbuuoY3dFRrd/NWVqgtNfXABUrfqRIV+jEfNoxsbfEMRXWu52MF2ffWwxH+HtF7Hx+BPp+8KX6gCOT6IihLt9IIeorRfDq2wJYX+x+DUbHRh9GRWtobN5hfAWiWPZjzSx0yPhQFn3ewoEhSJP2DK/a8ps2z8mc1/yeJepBnRshb1wINZBp4eYEdAQebOwOEllieshj4OWQrwSfFQyslz4DzWAv9LT0Q2R7QWmWm7L0yJ2+bGktOPpDBc8gmfKbHaSPtI2KuGa6dD9+RZhtjSL4ilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=QqXaz0jY1mFOKcfUgmb4/ZRLMm77kHzlLIcMisPURtIhezLNh/L57DjfuNObyyUJ0fg3dzTrZZG1INYyTm0n/5Gk+L9wOx0erOk1bNKPW+IVgkPWY2efLwvF9v2C+GsAqL2Rob9MHAk86Acxd0j1pXu8A/i3hmHU1e/yifvn39tJCoyPCXWZFndhGkvw6pBpbIm2NlTNA1XXnnPHdQaAlvtLevEWchgxgZKwgWfRnzaFHelgTaMM8pAwOmCWgvuLyGQnzuGMYrD81S3frguNDuz7X3YHoa+tNEhCsy0asDy1wJ++/xE038rbn42YO2TPaRuiPDBaLpLnaYmXm18grQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=WKHWDHm3OeG2GPhjxR3qXuzZ6/NYAyHeULwhzowqV7kYuIftyj9POkCXeAb5FZr1faH4o3MjiyrFYx7dV5cEqO+VEHiXrRlMsVpBFvMJdP1TEUoI12GRejXro34rMZiKnxIjx+9sfbz2VNRitqwfomedtFe1fEmaL17EINqJjVtLg9nmwdqajlRlcq1pgRv1YICOKqdWLSzenm2NsgN45NEVLh19hta2T8s2ej1u/wiCRLANPv6/EKYste+FWqFrSD0B4yjMiTxL1Xw2KMKGHQWn1LBx3ywDSz4gMg1iCxCqRqycAhFB7tq71oq1Wk27fPUxovmro4RzCstL4KSQxQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAVPR08MB9603.eurprd08.prod.outlook.com (2603:10a6:102:31a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 15:34:52 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 15:34:52 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 9/9] leds: st1202: correct and extend hw_pattern documentation
Date: Thu, 18 Jun 2026 16:34:39 +0100
Message-ID:
 <GV1PR08MB849741FB5DCD79BBFB7E3EA2C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618153439.968945-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAVPR08MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: 699b1f11-6b14-4f63-70c3-08decd4f23a7
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR6PHCjnzsIAyyePrUtNiZh7mPbDxqx57n7A3SbQeIw+IKAM/9DnXDx9XVqlSztSZi5ZCQ2l/6G+iNhqfCdBdqH/trcbGj9asj4526MTvHqz1zOMMbEOVDrbHdI82AMLVslWi8iJJIzTtcDOZKx2s+SoBEa/aWJETjfd40hP4Ao905wHi1zJpdMx7sX7Xh32Pmv1UZod2UKs/6ur4mc5KaS/hUHmGa6pFEu5D7t/JjH/wx41LSw95tfKMDwIFX9f50rKY/g7t04MdXR1auMu0rGNUpLkVAQLXijxS6p+CNmNs1A1HaiEFqL90KL1m7ELxOgrBOUNjZhXp8LXYO/ufQpsWJypkzEN45/OvjjSBt5JR1Y1DYaxC0jV5ew9FRN295VxH3usx9/DJmooXIrqsq5rDmSFsGTdMNbAdBdNWdsWsVi1MrqDn3jV4EfJcPT2sS9XQcQPAkjAswf5jhRL8UUpRSxKjyFH5Ahiznb5u/snXOoUvH2JTXTj8QCYKdQroD58Rk/uAfbG2YUf1lr7lcST+JZqnnaifLEjTjQ3MY2su56oGCwjVKBdTIDjDZF0/JmeYtbcC2Wdl7i56+3YwcEp1PLFkYbWQRxvBqVeLvbbphoKQ/VjNpfiggMPKJ6TgTK9UW6famJj2D7e+h/Ntzfu4FFofCoyZ/sIXn8VdHjXOGua3pxPq2MqyHzzgoQXkWg5zuqvKwmER59ROWFIVPXN5iAVpOESK1V2TSNycI3DM=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|41001999006|8060799015|19110799012|24021099003|5072599009|37011999003|23021999003|15080799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9tPi6+gOpYIHzkjYijzuDz4210Hx28u+7rvMp0u+0P0XKnH5CqslJqlcjE4L?=
 =?us-ascii?Q?mA3SIRzAC8YGYIfQ0SUrkTDuXlex597luRfvhXodBsoz9UFEoJ34H5THeGiV?=
 =?us-ascii?Q?X5aM+dd/MY7/E3/PDReRS7BSPfVhBZWKkBwZVL0bCaTSTldslTA2BYLxAN7z?=
 =?us-ascii?Q?ZKyOv/m4pJzds1dba/b2ojk6lrkZeyc0/DPebyIKVxUxxHOdDfsuA+Bdq8bF?=
 =?us-ascii?Q?su0j1ydb3K2GMfMqQt+bHEYd2thSvyZ39ZLtRyhS4lOa78FrM2BzZLHbmhZr?=
 =?us-ascii?Q?lULyaRWYffh26qvs0vt09O19irwdG15jEW3Vmb7TpkbCaHkWSg5ljz+QIW4R?=
 =?us-ascii?Q?EkgDLoxtQawK5YifXBC0G/BVh7WueHozc95u5P2HXa1aBrFUppnji9bx5w/D?=
 =?us-ascii?Q?uSb6O+b8H5GCVVwRl9env5W/1pWop1xougdvcEp6p5C1Q0M+LCAa8qFDyieA?=
 =?us-ascii?Q?datXg9c1FtDtdQodBARYteMwygih8C40f2W9AwrC6zzJy72oquWpXbR66Nt2?=
 =?us-ascii?Q?urwxbo0CQIScd+Tl/hqHiQLtPCkGhf/YpLT1/uaxfpVRdevBap8emUdO1bKv?=
 =?us-ascii?Q?2SRvRsuSP3lOJWRo0dBt5RY5u1Q3vLTw1nq9OZwsZ8nz0wb1X5aH1zQPK+Qu?=
 =?us-ascii?Q?MNlmXaPipc7wv2L6aTAw1DWzGAd4rMHKdMeCoHaSzPnFX4XC/vlI7QNSQWLK?=
 =?us-ascii?Q?o35ixmebEmCCDRoaEIU8NBIzatTmGRvxopNzNCj8OMVdpd6XjKEZ56fKJh1T?=
 =?us-ascii?Q?T2pxgDQxSADgwnr+xe27fiwu2lMUco4cOqraAKgzYaW8XU9ArTmuKByhr9cB?=
 =?us-ascii?Q?lb2mAK+oFPxaSTm0PhuVuiDroSpDdzsq9jqzDJjYs4yxqZL9e8mIf1OzrW7m?=
 =?us-ascii?Q?eBigBs1xoksZ6mCklQdYLFaQ+yD8YKPbcHw5FHDXdLLPigDJAfMm0xcnklpY?=
 =?us-ascii?Q?oH8ER5wG78LHY7brnvxa6l51zLfL53tzt42q78yh9mBSx47ZVd1/OIvSbM2O?=
 =?us-ascii?Q?lu41?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GngU5gV98cTyF+//QLrubmkWOYohwEFN+UBdevWAOUckwQR09IRXVHG+JLaN?=
 =?us-ascii?Q?cu19mI64thF5v+l27EzfZzYm9qCRnjYFRkV6qRj9g1u1mLQ+Ogxf2ICfeY/c?=
 =?us-ascii?Q?7cV9S1NBgiSo+cp6XqU28SBjp8cLClMymv5PkOI7zu37Wb1tmBJA+Vqs7/zp?=
 =?us-ascii?Q?NPTIx8Vow6Ux3C/BiY0VO3SF5WmTTfX9b1UGNrllof0Hd5VWhbux4/JzhfLT?=
 =?us-ascii?Q?FhH7CoG15NuwxFGWLy15k3RbXXw/hF4z1nigwcTEY3knQNGAsPQRq0BwDvRH?=
 =?us-ascii?Q?XGnkLA4a1Xo41UTOPHA5JzTY0l+WtlWmqqcwUIkMiTTiysM9O9xHgRC9YKXQ?=
 =?us-ascii?Q?BjC1yGHtMd68JlwTieYO90gjbvXkl0i0LhcbQwLPvuixwvR2PHoOrVfBuUwI?=
 =?us-ascii?Q?LYhjrK15LHz0B1cMUmDQwIP0NTRjs2NYA5lNZ4UqHMIcwxlkDu5uL3HCaVsq?=
 =?us-ascii?Q?PTATxKV5CCslLxDbu9CwAcNN9VAamekFDxqeWve/TULFZTPEC9GiaqUkEWBB?=
 =?us-ascii?Q?Y5ZpJ4JNaDppmoZpVeqsccjSScTUOMfvs4Tf6lLEalGPbu+/7mNwX+u4tBFC?=
 =?us-ascii?Q?v0LxPYCP1QsIkflvmgGjfTQgj9aHC2r8nF+dtIPzcS4phfQxN/pzekHmp920?=
 =?us-ascii?Q?kH7gMb/9XCF0j3KYL2mQBynKB3y01ET2/9cyv475Xe0cbH58bDRpj70wmvo2?=
 =?us-ascii?Q?eQjdPBN+m7xI2X/AnVjArRAw4LxKqQsxYyN6Nv76V4X3JHrPLYZg1jtz96EJ?=
 =?us-ascii?Q?lSaPc9OrpMbPXZf8HutyHUlScjNb9mi8tZ9C0FdMCjjjNGyq1CSEcqdVszce?=
 =?us-ascii?Q?FZz4t+IcOqK0UgjHs9tMfd1te1MWGysN6BZNoShGbmBJBQRuLb6v+7E/12p2?=
 =?us-ascii?Q?aPfBP6sHrjp7nNyEp5HtNP3MPmZuSycsgSAoO8CXXD4ixHvo1d1uvOcWPuh4?=
 =?us-ascii?Q?1mZ+GhIAongzK1eMCIr8yHYR6lXMu47QAmXIN2bjdcVbpEo62FGe8MjjF5Ts?=
 =?us-ascii?Q?rAKXYm7HnhfL7Cez/RMH+d3k7ybfSKVxLnstJn2ZjKn7fm2pX0bJGvnZ1ZW0?=
 =?us-ascii?Q?9LlzG3nhUWRna1DXLHzyiqz7yO+ibP1EKI4SdZ3VE1xIyt9iaSudrWZijFXo?=
 =?us-ascii?Q?kjlm1QI4vMh3I1yZ+z/5MTNQTtjZNVdksi72/PkUhW/bTaPwlGBXFR9rdnbU?=
 =?us-ascii?Q?nmQGG4VlZhgB2Fpnd0qQZ6Ne7XuFgJgZkrip+z7nG5gogWn/ilu51SQwecNz?=
 =?us-ascii?Q?xhLyIfFPY9TbdtwHhPKbnKvczxn/mjrYCC0l4qPg2vhPLi5LhvlMPdODXvuJ?=
 =?us-ascii?Q?gazc+/B5t5OiLSM+WaehoB5FD+vukmFPp+k+a3Ls6z0srf+W0ij/3O7NQ6yj?=
 =?us-ascii?Q?qOfMvIADalyvc+r7DH17KI1UKTof5fwrad/bM8e66oSWX5QCdqb/zLgM/2A+?=
 =?us-ascii?Q?uCAcIkbET4H5SIEqf0YZnE47iiQJcMRs?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699b1f11-6b14-4f63-70c3-08decd4f23a7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:34:52.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9603
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
	TAGGED_FROM(0.00)[bounces-8674-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD5886A147A

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
2.54.0


