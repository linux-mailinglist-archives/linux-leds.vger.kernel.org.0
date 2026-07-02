Return-Path: <linux-leds+bounces-8883-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EkZPMtzmRmpEfQsAu9opvQ
	(envelope-from <linux-leds+bounces-8883-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:31:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7536FD360
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:31:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=AdHM3GIx;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8883-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8883-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C12CB303E211
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8148D3C1F45;
	Thu,  2 Jul 2026 22:31:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013085.outbound.protection.outlook.com [52.103.46.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7603C2B80;
	Thu,  2 Jul 2026 22:31:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031475; cv=fail; b=YRV05x2Mhr3LeIarYvbOV2Vn4dl8ciAyoOTfTKimUNZQbGfXv+nNipWnomlnPgKdKYtBd4RxptyvbY7JFkd/LVp/nmth40UqU0vwxTf9JBZFGIA6+ltAbjmTklTNE7LdlX3KM4BqzXo1LoAmiE7+B6xjyjLoTVxQi9CQ+m83FxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031475; c=relaxed/simple;
	bh=kmyL+kCTZtKyWTDAeZaD5JxkVsA7y53S3itzwOJ2kCk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hph3Ed37jTBRwmQXg5+UcSkJGZBHhDbPdHrEAvMTx33KfaRS/X5OGsJB1DnelX+VxahL0oEBXJ1t13R7ahKVHi4p0a+KJmF0Se4NwWm2MLoeTJR2zayNOGTcT/3u54mZlI5aY6AguzvejVHImWGiAXrhMXZG2NZRiN7c00hE0ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AdHM3GIx; arc=fail smtp.client-ip=52.103.46.85
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgWUiiB3pTRa//T/1dNNM0i5YTRnhc//rKNJOKHfTlO58uPRsh836uJKCZ/uPUpxN80gtF1I0vdX4oMi4hH3mH4GgUbDrEsDNjVleRv3GiNGwpo06UnhcjANTnggxKWf3cUEOtn/doTIqvIaBX47mgTjkd5R+eheyuImNHv0WUc9W19EmDO2r0df2vjqUnIMTWhr6eNxFaOgJwi/+I18B7oeFZzVuzWy7DEfdJo/n5E9x7H+LDjGnOCkCqgl1GUOJF/UIDwfBv75F4NO+XGNjLuls638/kKEgaNTPq0Gx2O7PjyEw55dM4XTYnoIiEBS94hGAyri2HQjuqOayUpK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdi03opXiq9XXnp398UKgcsRMz9eryZAQbSPy/BHqdk=;
 b=KlqJEr04H/Q+xepLdZWcQwtqz2aI00rpoUd+QdIBLxoN3GMwjnsyJDNeO2Kwi/h5SKWsTEjB8vxuynPQ1CDSSy+SqpoNaqChIDBSSvT2yVpUsZV+gbO5v9CFq5kLgT9jla1Qa17HL8covdbF7+c9B3y7NrexAJsAcBMbhghz8JtNrQEE7fvi4+NO5jLszAgZV7fBSk1H1AlitGxc3J9LlT4syFW+Rw65nJeV73jMoQyR9V7Q09hBhFgXu/6mqG8cjp+kI+eNdhRooebzE3KP1ld3e5JowzxuCOtfV6bHFhA4aX6Bd9tzlGsVaNADMeuBO73h7MWQspgNT15P5PQQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdi03opXiq9XXnp398UKgcsRMz9eryZAQbSPy/BHqdk=;
 b=AdHM3GIxPR+X1o9pYhOAt4DyFmdQTASv/D2/6sj6mjEq7YaDYwFkkszMnHKYme7/A0d+BAwFochgKan88JlS6afnCmhiFMqLYg/377jp5XV9P9rZlGv1Ep4/CsUe+LFrL2tb2rQV2pbcx+UJWQjJ0PuRVkonZfI4wKYWwaaogFyQkgxqZPC/5cD6DHS9HOsbd0SBiqInO/JR1rMd0SxgH0VVUfW4J5rHcrV+/2+ngA/ahIt4BGJ+LM4YLhRoIvH6zm0loLjrSf0WW8HTNstMj0g8miHxabEsFa8kd6h0MxNgACi/gMpH29e/CNiXaCA/v09ooZF6MpRtmK/MDy7gbQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB7702.eurprd08.prod.outlook.com (2603:10a6:150:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:31:02 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:31:02 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/9] leds: st1202: set all pattern PWM slots to full after clearing pattern
Date: Thu,  2 Jul 2026 23:30:50 +0100
Message-ID:
 <GV1PR08MB849732C162CFE9E2C525AC16C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::8) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702223050.105138-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 37995f27-7f2d-43ca-e36e-08ded8899912
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR+uELrgSGBlFt5rgleMlMCf4tcCZf0Ob/JrwtoFv7PRehAYnav4VB9nWF6HwQV5Ramri2SfjUjpI8MO49LeYSvQ7aLzzDPw/lJ+CGhe51kOYW+uCMp7jCJZDNlCFpE7DKi73hjI5VWw68gSZ909ApdKyloEK2ztfbaHY6kVZTcbFzUEEQMrX1YDTdSu7bB4LYvq0phAnuQEqoIMvd+dXW9o3Tq6/qWvAPBvPWoTxxOwN8MYkFU1YhZ3568Jec8S+Ty69BSLzy2JT0/U1fRRLbUkEuA4OYXDkoOcid1SKJg3t9Uo7UT+ft5EYVu0rComzTWCrY/mOc7dBgcz0B3pfbx4AL3qrZyNolbmn6OX1Uf1sFsjWa0DtY5ONxdPvZtnWQVjjh/UHleTvPpcf0Ryx4keBbjFiX0XDDmUI+7114nyqV+ymAIyE9ADbVcVbjqKY5k7Sgajjozfwc2Y/y0nsoOJ5GrQ03bCFPpeD2x/wAGydiPGpKbKtsEG2w0uKAxmNudXD7xbKqWndg+65cIz6JxYHwnXI1R4ZDkq3w8En/QQD2TIuxg855vpqcbwDO1pJDy9xzWfUdBZusMktRwtDoaG9BrOTiknOAWqbKS7FFYk6Y4wIMC32rj2/XK9UGTzgXFnJD/oEAH99Noacze5wdlSyH3By98lwilIib12fn0YOWh9Oh7txlGkhDzshFgqJmicEIW3GXEluzE4tu8AuiBuwSfGpyajhDPeIhMD4FGgc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|51005399006|24021099003|41001999006|5072599009|23021999003|37011999003|15080799012|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F3Deihp1KfwyUtNIt+mBi4juOFFnGKJ5PdFyQ6VGDGm82uWx3yvaVdXDp7/Q?=
 =?us-ascii?Q?FcQhpNk1dB547XLdPWGXC4RMgQ15wjpEtEa4Qx561cUnEQRJq3tk1rsMvIAZ?=
 =?us-ascii?Q?38Jb67IRH1IawXnSAnLB2SR/HPKSGm8+b92k0XGVN3vPkb7Vfk3tSO5kheE7?=
 =?us-ascii?Q?XKCEBOwPw7civJCCNMJU9UhZmp4esLvKX1Qp+0dkGwTXEd/rjtZ84ccHUqHA?=
 =?us-ascii?Q?heF+po/WwDkfa8kYHep4aU4ONvMG8fhiXrHXZYrdTZh3Db58R0eSP2WcyCpG?=
 =?us-ascii?Q?puf507yJEuSapnsgQu5yRqulEfFu2usHw/tpJxiSWzxeZblsllXD1zpxHlId?=
 =?us-ascii?Q?x6bcct9UesSUdcQJJrYIeewVAEsmTHE6iU7U/f4e6dhtUrkyPfa/yjj9/usy?=
 =?us-ascii?Q?2+aB/dq5nuwr92HGCkKOE37KdLnfN1VmeADyuoOo41yhahh5cNkW22ppG5mK?=
 =?us-ascii?Q?ayrrCbadlw1JRKBpvpT8qV6STX12Rk4rKH55s4Ifp6BgoazziqEsTXdA3xdc?=
 =?us-ascii?Q?gDtFv5l5+He1p/ga4GarlWvE1oWEWrWqwW7Nfh8WvMkAEesGLcEJHswR3S+M?=
 =?us-ascii?Q?4t6DLutf3nK00AG1OY1gOA/kmcoD7wK9ak0jdePc+YHc4DFSoS+pfiV8emxR?=
 =?us-ascii?Q?Z76OnCZN7ybR+UZtB/9hZvEMzWu+5FKFYtg8vVAU3W5K5CqXeX0N1cLIEuM5?=
 =?us-ascii?Q?MosI1+EE/rv/C51uH+Cnmzr5UITE9NF1RthPzNSPP4namkjTys12xyGtffzV?=
 =?us-ascii?Q?jbkkzF9OpMCPsk2uRndrofVqbLiSJAZCPnY3D74aQofjRLoK3OemVUUAsM2C?=
 =?us-ascii?Q?GCmKX1EMt2NW+xZTcbY00jOj95eSDSoI6smj/sbb1MvCFa1r9h8iT4aobMw5?=
 =?us-ascii?Q?pfnNJKsgD4/lS/hWA0ji2pDArJJwzrtTjF4fSjoDBiQJa7mYEx05nbZlxGBN?=
 =?us-ascii?Q?p9xJ6i5TV48hSGDN3+xAnKPq7w9hbV91WJQ0Wg0NuUSKXX9s3Vsplj9xFqrX?=
 =?us-ascii?Q?exCm?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ot3KKwLnzpTwK5Ms2bBOFWukHY3n0tsNjgfXKmJvGEmzPntHR40Bscb5uI4G?=
 =?us-ascii?Q?zkuh59ZD3QZqa0bQTCsiftAJPIMLTf+eYQD9nbce+11X//RWDhvvkmjeWr2Z?=
 =?us-ascii?Q?KWNEJuC+1/Cr5B9PPuSe7U3yBg0b50LPNe9FPj6fOz3bnBPJQWRdkA4Rg50s?=
 =?us-ascii?Q?9xdZg7pBAsdfAl22xS/0rIt5PfFaTVFbhZQt2Q8Jzyee+bv45Cxa11DsM6f9?=
 =?us-ascii?Q?v2HbjlD9BPNh+z9HcpB2kDuf+Cug6h2o9e+9l5dgMiBhVN3OHhItFS36QII0?=
 =?us-ascii?Q?HSbG0UAfpMpMPfAfmRLfhEB1nrvnnE+IYnqGCqMSr28+3UPLjj153pb9dQze?=
 =?us-ascii?Q?1DAoWVqCWY/19MCl+C2XJ++GMa7XAXsOYGXgwwOtM+qbAjWN8AzLgs2rBXC2?=
 =?us-ascii?Q?EYSRyIvU2IsDcFb+PigtEFK7kYKxaxHDxpb9YeYwkTzYtsuquruQpwH5BA08?=
 =?us-ascii?Q?bINaEb05f6tYDRgPyXgkjdt2dz7Xov4Sb8sgvnC7RnyOLOZSNf2NCSfsNkKc?=
 =?us-ascii?Q?PLr9ysaatZPTT/Vri9qXT53JArrZoakyh+jyZuENtYNuvaeNqAOoOvIHqXuc?=
 =?us-ascii?Q?+8HjKoLs7lz/BLBRrANdUM3Um8qby1+/XA61YtmtY2kyaswerNF3n4z9g4CZ?=
 =?us-ascii?Q?p5EUsl8GwW/iVkD/T6M736RqFTXOMHJRpmCsuVj8qIxC3YygSJOyV1fcZGuj?=
 =?us-ascii?Q?QGNGLHmqc+4++2kijFC3pn/lZ3SUdeT5ZAqjS7++2f1VVYKOMgN/yRM+5O2p?=
 =?us-ascii?Q?E1ETFVNIl7SfbLvyToKE9/kQO/aLFNOiJQJR9ERTo5LUVYOMYJf4W28BKsXI?=
 =?us-ascii?Q?J+tGTL3kZ6pJhEtwjmky2Z3LGmsMIsgGExYYkzAISjwC9Hea8w45WtPIjWw2?=
 =?us-ascii?Q?YjNyIRV+j/sahoJd5mCXnRCk3pSPlyWa6LWbkIwjHbmDqXqxtxyLaomtqxy+?=
 =?us-ascii?Q?6knmBhYhosw2gm0KM0CwXr48pNN23UTcx55LvtO6+NxE7G+lCYeXJQ5lqj4a?=
 =?us-ascii?Q?6vFFLGSx9DB4QtBl1fbEb46FCdDF0VsAVKTJlMLrSb+7V4SOgBF4zDQLonJc?=
 =?us-ascii?Q?2LN3P+tTBXMsPE1piGufjnLPpJXG/VonV390p1jiQHAr3W38gmEkEh0oPS3v?=
 =?us-ascii?Q?U4OYNVVAbYsEGSgzFpNw85u+yrXpb3X4XhrrkmPeZIDar5yE8Ur4c0Z6DAL3?=
 =?us-ascii?Q?BgspFtTyT6SU7PH2CqiyOFQdMa+XVVoUjJFmUcCBGltYIJasC8uJ557df5Jg?=
 =?us-ascii?Q?R4nmwbKzgKiEVVaAmZDbX/OAzrKTqZcBM69et7paxPi2tSsEFEgRzvYbkax8?=
 =?us-ascii?Q?cAWNLEIbrwm8a0un2TETVWdYBkQIdzoMFX5Ic6JMoXo9qIMBxYn5osPPVurX?=
 =?us-ascii?Q?QzWti7XdMZEs5uZxaDy8Tl2G3iCM7YSNdzcnKifxdtxgAVJmil/kqfVbteNi?=
 =?us-ascii?Q?8IMnfy92upHEpFPXmSkgR/qoQWQaSUur?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37995f27-7f2d-43ca-e36e-08ded8899912
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:31:02.6016
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8883-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B7536FD360

pattern_clear() sets all PWM registers for the channel to LED_OFF (0).
In static mode (PATS=0), the LED output is ILED x Pattern0_PWM / 4095;
with Pattern0 at zero the LED remains dark regardless of the ILED value.

The LED1202 has a single global sequencer shared across all channels.
If another channel starts the sequencer after this one has been cleared,
the cleared channel runs through all 8 steps at zero duty cycle and
stays dark regardless of ILED.

Set all 8 PWM slots to ST1202_PATTERN_PWM_FULL so that ILED alone
controls the channel brightness in both static and sequencer modes.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b4adade49898..3203b3768ec5 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -35,6 +35,7 @@
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
+#define ST1202_PATTERN_PWM_FULL            0x0FFF
 #define ST1202_PATTERN_REP                 0x15
 
 struct st1202_led {
@@ -205,7 +206,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		return ret;
 
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
-		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
+		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
 		if (ret != 0)
 			return ret;
 
-- 
2.55.0


