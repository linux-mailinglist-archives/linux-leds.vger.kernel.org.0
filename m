Return-Path: <linux-leds+bounces-8681-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w41GOkVXNGp3VQYAu9opvQ
	(envelope-from <linux-leds+bounces-8681-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:38:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A046A29A3
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:38:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=bIuzYq6a;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8681-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8681-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A8603040946
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D562EDD40;
	Thu, 18 Jun 2026 20:38:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013087.outbound.protection.outlook.com [52.103.35.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5988318ED6;
	Thu, 18 Jun 2026 20:38:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815107; cv=fail; b=Dh1pt4LkTIVKTmIYYQCTsX8WWsuq0EDM9BiId4ReLJnO6NoBLK58med2cuWiL+1wunXAR1M2sjJkr8A4lEA68wMrV+dpLS/GqEtKA5mCvS+Ax2YNYnBoUKUa9sPZHDD8Y4VGC9jniCg49/SRKhflWrFT0CZIivLDLfcePJjyLpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815107; c=relaxed/simple;
	bh=iqyV1qOVql1vQhhUYX+L6LOZzd4q/3RWKd4EOYzW6Pg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PphtsMwtx5XDfLvmAxoMnwilcyOanDjOBy3Q5lladmCGftAYnvJjRknwtNirTp3fiWse5h/ENJ/70erxovQYYeBjowdhcFelnQudqIRVKq8GVYKKWhxk0YUTVrvXEXSAmf2gEWHQNccgf23GvLV9he4w+I2zMCcdMikWSYQnsIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bIuzYq6a; arc=fail smtp.client-ip=52.103.35.87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTZ1CwTMMfLoPN21NR2Zy0J+qX1aiM9hM8tcwd1iFXMY0zBmNWvdUmRAVrJxqx5YKjD+P7x434I5nsORySFP0fQujWmgfa4TJnz9FbaK3K4/jtEnthOzokUYP3rxqXEQnek8AjMa3HXwDb/AKT1MTh7YHvd6UhnsnypQl/CiR5ItCqUtOFhW7JLt83HIR7M4IeWiYIUT6mB6yZOILsgHZiqiO6bhLd7mML/1oooYDMma0TKkxKzFGzJjKXETqqKnk1k2KtE1nozjxm16lKIsY17kiWoHQ6HxWe8iqmpkUNp4QFJAh2f+70ArHtV9qL9wQLPYLiG5WIOozrJDg1XENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2twIViXjxOgJNDMUSE//zt/pfajVRRrdrEgXPRhnASA=;
 b=VTweEq7eRO9XQpNHbeVcDSqrDCHybUZ831vVj9hpzLbVlw9o2pTLeT3F4VmvmMA11tZAuAtFYteYTt50/EpSmk+IIHwcUUCI7YUM52JUiHel6rmpgBqjutRokK0au0IR0wqi6RY7qPzAc8qeoFhC0K9TPRjN/v8NisK0tgCTo6WnZdIq1wQBJreeq+5+kCDu4m24iqCiGfr719N2kWyen395qmO501cpsUoe6L68FvC3LMP6564Zx+4U03rOMUXozMppm7WvPbp1M4YrCTri22azR2C/85Sa/LwWkMqmzUVQWCpEJ3UPRHzHwxBnxNR3371lLNsYfGCoXyhPfIpvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2twIViXjxOgJNDMUSE//zt/pfajVRRrdrEgXPRhnASA=;
 b=bIuzYq6aoZzyL9+Z6acEK8njfyL550XhtwpMQGPOmlnHxdg4+sfmJu3PbM9sklju1oUMxIYEQmlpPlqaJq1lfjC/X2AJChtzgN0AZ9oEJqYOc+QnNQZdxiVTmMgNtZBFWmQyZr7vQxw7+kaEIP0L9p8UH+5y5NuCoZbo5aHQnSd6I35syhD42f75t5lr+CjbdsDyokaitWkJWnd2B+Mqn/NQkPBVsCLNz7O0Hip6dC5obj/wsMHCPvg69SNCYNKZaVFz66FnhH2wx9vWBhPM7Rfn2rs2X6XFOHxxVSSm8ri1n+jMcU9QNGIWqcd6Eb1ebg99aeIa+RdAHAPALuNapQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7812.eurprd08.prod.outlook.com (2603:10a6:10:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 20:38:23 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:38:23 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Thu, 18 Jun 2026 21:38:10 +0100
Message-ID:
 <GV1PR08MB84976D1498947A8698A8D9BCC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203810.3333246-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b37627-f311-454b-eda5-08decd798a2a
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRRu6MGbuPdmyIrH81glu717q1rzxlv3RkutChtMNmoVsZKOlNAzTfOh/bJQ0K7zRpUeDwkbmKxO7ADBjv28AwYIUJToI8V+7RJgebk/zVxskZWAAei8iHre38+GEh2UEQbEahncciDVogPpRMOxQMVr2yhZSv5+DqWSK+Fyu8XYSPj1o5FDZ3w5b3wVtDfRAqVaTvx/3n8X5a1IgdXK1Jep7zX77cB7tIsfNrTYtvuQmiRb9wqLQpr8urNWNDqnUVgjRY8X8ATZk7VoTLAJEsYBNAF9hAjKub6vrob/ZKb96L4xNTA/tyFOzsZvS3T7Ba3BkkYSbGbbVvuDx4urGIyiBdO633kbkj3FOmmjqDWCsI4sp9FZC9om4eHn8fERoAfx4SkrwsoUAtfiK30/4flLBpBZ9b7ikK1DJcjTsesuZk7X3LUiNeOUT1jtG5jO3Hdd15/vLMUHgPpxWNwmcn9asi8I3JjZ9QcWILVId9RYbIdNStEOG67ElbOxzJZwHOMa+npHL/Ejd/hNf+DV6Gdm8ajIYF7EFWQaULG15Vcp0PDTc9DytxG4tB19qfIGdUyZCd/8uauj+q+Eyet8nOrn11i+ULDKskgLDMWMCMN/7ho0/Ry22oRGBvTGoSf4Ttee7lr1wPRPUNw7f+kG8jAauX0231cZeRxZILR1mkLOl88VZHSXw223VTHl2qs3ZQVcbED164Nd1DlSjBvU/Hm99Uy398SxR16GuumXaOEMY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|37011999003|15080799012|23021999003|8060799015|24021099003|51005399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3XZK/dQwYMSUyM6DYlIt965fboKSA01F6iq0BPA6fX7RtABtB0jXiv/bqiY5?=
 =?us-ascii?Q?JX6bhIx6964Rhm2ts26ij60pZ9DWofFLnsZ4ONDFdbwD/yahFpa0GMy3xlDb?=
 =?us-ascii?Q?mRr+8ga0NwWJyAhsRGO8GY5ZxhEZLyZGfowfx/47q68WtLGP2PnCW/jeV+jL?=
 =?us-ascii?Q?HjyLJUlnb+lzqxzQpkl4piO7griETOyZ9D+U0EgTw3qnpg6BXlP7LNQ8gP0J?=
 =?us-ascii?Q?Qd3UyjVcWNKDhEAzbF0/YTN/MuOUWKpSGK4voqaOzonMpkwcunN3CDUUmwtq?=
 =?us-ascii?Q?7rMSp+zsieGq1VZuwIGI+TKK4cX0tBFQH3EP+o4tafh0ekRIU6BlmHY7k2Py?=
 =?us-ascii?Q?iZezTNinHkkBHhuUOOzMsDXQTH44gKIDP37v5+qdlH+MCq0Y9e0CStQDxpf5?=
 =?us-ascii?Q?nZPdFxwgV0D9ptdESnWMt04d4N3OTnI/jl0LgOOSJhersq4LDpYWb1ZtSGep?=
 =?us-ascii?Q?cWSjBcn8ibkhRtln9adFjWSSPzlZfaAi6+Gr7D8uwgablc7/DaLiYicWOxyO?=
 =?us-ascii?Q?uTI+3a9PW9hyb7EW6A9djZSMoRJtqsjMNcvxpT9pz4doRU/gtt2dJVx7lnBt?=
 =?us-ascii?Q?EmML0NNAbkD5kurL1FvHHE6AUYq5VsB+d3Y96HIXD38+2e6VfF/EjnxrJmbo?=
 =?us-ascii?Q?FSKgEK0eV4enhMWeHbtvjXVVZk6RCSq2L02pVeUtA8yBmNT8NRPDdbu/Zyhn?=
 =?us-ascii?Q?7AGtP7IhCj3iMUSsfVeyUqimMdAO67UyzsDXESl7LnRRiYIg9TRDq8M4OH7+?=
 =?us-ascii?Q?p7FCJ9n56vYi0rwcehXnw4zxaNWgwNi/qeDH4UokY4B8YJuMZCkCInamw+Jb?=
 =?us-ascii?Q?7d25G1HU7rtKToBZyf6NjqjDjPmgUQnBaxoG/O3Z1H1x3wyGB/SjFJsFTclF?=
 =?us-ascii?Q?bJcpZM+kTK4PHfM45Q3TboZhS+3d9RiNAX6dOkljBh9IyLhBxVKqJPzwsCdi?=
 =?us-ascii?Q?THEgEMPAGSVKSS4CQk9rkfBiqF5DXVXCKIX3+DhxYXM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yh3xtV9jyZ1dERM/mD9lL+tPcSIQYI2Af3tcLDfrmna0oursgJQBZPEPa+oC?=
 =?us-ascii?Q?j3EKEHnh4dFWmbiA+lsDcYZg2kp9S+1y+t6lWJaUBmvLfJhTecBfv00SktPn?=
 =?us-ascii?Q?amhhhgkL1e6gBYe+nfbpAjVSa3fso5xQgkWOVneWKADirkU6Tc4Cnlqw8QLU?=
 =?us-ascii?Q?DLjy+k4ebOsMjtCrBbSXbaAjIGdgOZDVntBjBWF0bQrHOzXRR/YSt4WYG9nX?=
 =?us-ascii?Q?8pbu3xsaPl4Lw/7HbcF6yriFqkCbG3gs49z4E3EMwMrdlp0kNuVABO9O+l66?=
 =?us-ascii?Q?9zUJxwXE/IyPLLEayOqlt+2YRSRKOuitUvG/PZ/68ZulOFMjBeWId1hr/uZi?=
 =?us-ascii?Q?rDtPEBAku3CRgqGMKxrovPIEXvnZ9HmhU68QdHUFHd3H0QuG4adkOcHYZFs6?=
 =?us-ascii?Q?QtarNtZGlUgLni8aMdmWEyeGS4TUrOoOu7ByfHTm5/YRVn6xWbrIyBlz1S0k?=
 =?us-ascii?Q?qvuaMgZKokkh1jSRp29XEOxlGwjy4/WiqH5UzobDnpHUXHom7qkIK7RkgP8p?=
 =?us-ascii?Q?lU3/M+xrd+qUM2Nh3q/ESVeQGgQ/2oSE/eH+AOE1qlcPXiqFspFVthIXANIl?=
 =?us-ascii?Q?POnJCUf0B3istITE9DpB4BsQQy0SIdmfKnayZ7TnI/ku+t5qjNpLoRIpeMxw?=
 =?us-ascii?Q?3wdK+cpkfztZnoOl8iXJFaaKvbCeoJM4aD8lQzzTQICz3IXQmBzp0t8eV+2Y?=
 =?us-ascii?Q?kRQi5sbB2WnLnNhsZ51mpgWJ2k5csl5m5F3TPkPocxGKtfhPvWWJYTWQx6OX?=
 =?us-ascii?Q?/Ub6sIRpaF0ghjLu+Wkgmj8qW7jqWkht+YFbsIz3YPdHGu/D999bTW/MPWyH?=
 =?us-ascii?Q?9GffjTzyBHJwbP1qgVn4aqAdKSghCqiThBKpZ2gmrr7xL3BUNQ5uGPf1Cwm8?=
 =?us-ascii?Q?Ksi5czxjA4mgFmjhaBHXCSbgJayvuCkWfQrhqCE9nPH/A+gBmyWNGwXuarD9?=
 =?us-ascii?Q?3D676ZJ3SFJ5hImBsoBT6aNLvDC6OwJmdbXb+uZ1J+vEm0Y33XZZa22NRyaM?=
 =?us-ascii?Q?erRD4EEN8H315EDRTXkuO4f4u5OZjtBNgY7cLrNjhIjVQaMIiD+nG9AD8dd7?=
 =?us-ascii?Q?cc1qa5RNZ3a0SPkeakeozI/zBActmNOGzucDyTxnBbNLQrpJJExuzkWGF1hl?=
 =?us-ascii?Q?actICBOqVsLHVeayZ7UG2acE4Q8FLqiR+bdZsKLnHqLguHQE0L/mkdEds3Pc?=
 =?us-ascii?Q?QiWgPZIra0FEzeMcQophsxEi/6NRP0EqjMuJI5rZ6nz6uTsONQlt6HWYMFeJ?=
 =?us-ascii?Q?foNWjEJLnWHRjMSytJzjKUGfTcBj0ubyjdVJVlnFLFdlL2zqyBdNQ2f5x+vW?=
 =?us-ascii?Q?r8IYXBsNqDswqwWCP2IRWaazxn5P8aw7pOnSBuhUb36RyFGYnWXWPzR/+UHs?=
 =?us-ascii?Q?tT/bfPNMOdXAG04NJGfJawKTDYK0anQZ0TecenTw9B9eD3yKa2NbkC1wWKOZ?=
 =?us-ascii?Q?ngNjmd+e5e2RiJUJtr/YIJRw6s7lT/Cy?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b37627-f311-454b-eda5-08decd798a2a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:38:22.9618
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8681-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8A046A29A3

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


