Return-Path: <linux-leds+bounces-8865-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id beOTKfKtRmrsbQsAu9opvQ
	(envelope-from <linux-leds+bounces-8865-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:29:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 259696FC0AA
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:29:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Rui94fxw;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8865-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8865-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B8C73214F09
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF5D34B183;
	Thu,  2 Jul 2026 17:43:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011024.outbound.protection.outlook.com [52.103.32.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB9230C172;
	Thu,  2 Jul 2026 17:43:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014216; cv=fail; b=EvMoH3L1NfDJlNzp8zhgpHPeRnhRBfxbwRbmxKYoF0EoK+PN6NAEWVEidvBmLjz5B/9HyiZzgBTEsxSnlB13Ur4DG0Ny2BgMkosJYAmRQs2O5lt0AgrcIg/KfVHBKDbfIYb+wFf6hbGwDMIv5+W9wUUxgCYGaKPoZr+IeTFObJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014216; c=relaxed/simple;
	bh=LtQEzDPRwnzGMU/z132zdlIac0SDBVqj/150rwWzz6I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RL9ODDXLwGcdBXpU7lrQtjZ+I0Z/mlA+O/O4QDA06Vtcl+pc09DansUTAcKGjULtp6kLp68oKZ5+cq0keF8IwtH7qI2zoLhp8yTR6OQcVKyJVk3HtEl2FT2sE6rOtMOC9FqK31cDSaulo7LE8tbgHwr3o4WEDAlLkUarl7dIGic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Rui94fxw; arc=fail smtp.client-ip=52.103.32.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfrtSqOoOb4cZ0GZkfXaDhhouLVrtNM8IdmeLXVEGSvfE665ry3xgpjlNZ+JztDXOy0NOzO86xTHIYtZPfkhiIpsAKsPGYM2ZD83gOVtHM0LWwVD65c+mJpJ34KBpiSwAVIZ96glKkjidndwlg1yxWMXy/QT3RXebTkvKndsuwSBB8cqSE6v4iJj8USpToRjRa5HyVfhS69eIvM8cSZnSuAGLmY+oXnh7jQT9ltJa1EzuPJ/t0gK9ObTrCq2mf5dLvJBLx8doVIQUWsUvl7Ib6r5PL1Rgd0BUE9B8f0+SybiMUx5TMch+Nu4zTwZx+0YggEnSC8HhffolseCaqai6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oMvvICb97Dl4M5g9Cl6OJfNXVQ6D0xaSch8E3gb2f4=;
 b=MSenZdbZWaVH3Dmo/q1qAefVGras2BIQK8hmCHVAX5NwpXiz69CT9rfIq/rgkphtCaprLBw+JhVzTPsWVpI9/hiIetRhpATMn5ALaCI+FzNt7gk1yt5gIV3eH1J5t/3caQAj74LBCes+/hLnSXOqkv+oHvzRUxPxoj41AvpSYRyWBW/u/KYHhPbhtUlLguYDP8WORy92NAAuGIR3ggEQ5EmX/u2VSj3FXWPEKdI/S3Mb6ukW+VmvtdgJUa1Sbm5bcMZd8y+FeJyDelA6oGBG5d5uiDEyM1/uNJYDfw8N3aCA5IsPlErcoMykCLKv7x0VBMTW2rZjLvTZQ+4Shub1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oMvvICb97Dl4M5g9Cl6OJfNXVQ6D0xaSch8E3gb2f4=;
 b=Rui94fxwUz5aGEE7oFxv/Nwg1hB5NeF6kFFFjycZBPxhZ5WlyIP3sIcV4iUsHXozvS0UOzyB4lLUWBm+GpYGEVT9WsuRE8X/XjfsnxOyIvTXIyILTFjKJS8nVvhwIR0WxP1peY0D32x8cPUC9hdSHLoiU29+Q3V3NW5Legm0QAnF1r2u5zukQp+MxOcrpByDjUFWaQhvLxn51WzX2WR4i60HF6IGViuivLCC+oXtRrU7FSh5s5Q8VgcqlEVi1C6dkT1YyknjZnTQIkz/BJ1VLLGiF3wnD8hoXoQonbW+iEeIB9yylLFB+DiZcnx26w1xWVgZd2juocyZouJEHQkwDQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 17:43:33 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:43:33 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/9] leds: st1202: validate LED reg property against channel count
Date: Thu,  2 Jul 2026 18:43:20 +0100
Message-ID:
 <GV1PR08MB84977B1A5C6CF09FF643498BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702174320.2653523-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4715ee-c0b4-407c-cd90-08ded8616f70
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRABAnnZkaloX5c4/Et3+qtahwJ8F1ooGH1UM/4+o7TGsyNWpp2bb/wz94XAf09ZtICGptdDU7yc9dzJo9eSq1FT/rIE8kDu8xFTPCS97L9XDDR/KgO90wS1mZp9yxW6XpgSLYpxJ5hpmcZbUCw/B59pp1dlzVWmKeYI10jLjgyDtkL22v12rB6OXsXYqvt0JeMrXbDaXp+Cmnpu1y+z7wnnzU8EdLKXvbNbjBiRShS1UGI5h6oTmWOHueOomo3+sn5+09CSQg/DHrBgRY3lfnA+PIrLNopVhzkyRSqEV7hqedySmKauXIZj3osljPU1vgnD+cJdOMTdc8YfWi6MDWHFvbrBp4VopiaQcgNWgmitApHMpPzLUn/CZ3r8glcXZnIdmtopSeIBMrsutJ90MN2EtR2sv9lCaY7AKugwebyEzhEF75S0x1Nt1lVVY/J1FBgg3rSptsJ58pD8B427GBItWXONN+5bxLZwgzT/kVashMfrMM5SPbuknneurP7ZnjWvzbrcUWh4oouANQBWJM3rY4arvEqkT7n5lx/9YKTvnhDZ08qY3kgyC6rjm7QlaZrnccEXPNF8+Ngp1JeSu3a5uZgPyaL8hDT2uVrhoFUp6qxA/wDcXqOSzf666FKLld9OJurQj+J94UkmaT3Pb0+L+NR1V9bdjzrxWYLvnZALRYiZAZfCEVst4R/f+2XE1aNfeMG2Eh+81BmzBKmqn0OobdlfMC7e2ychvm2lYXkb4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|51005399006|41001999006|24021099003|15080799012|25010399006|37011999003|23021999003|5072599009|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5P+W4OOZKvbAFtd00Qf/qAstl3fKrKn5rhqvocGNLgLuzdNy8b+vtSz5ihYr?=
 =?us-ascii?Q?7GUJ2hwlclA43wFLc9c76AdMYKgAvceZ1sTa4YyO4m4qV2beF+kCyTkP2nbB?=
 =?us-ascii?Q?ZMtmsrVAwl5Krjdex2N0rWOV9dx0MyiHhmY1qgk4JVY2Rx60b76hDHCyBklS?=
 =?us-ascii?Q?D/xwQzHeDOCLnSscwWOon50sKIn021nrbPBDmNzOdrWSO/RfEQlCyu1z75E+?=
 =?us-ascii?Q?6o9eiz9iWZvlbFa1vILbik8Qi5ubzgJ0DSvgBGgbbxP4oE/tq56mE4HzJz6X?=
 =?us-ascii?Q?LdMWMVIQTduobpwLhD7/vbl3EkX3x8T9CcUQrt8Sa6V4p3G0JxBMxB0sdGVB?=
 =?us-ascii?Q?izkdZPTvADdypCsNtmmJJvuMR2+vB3dZJRT5T2OB1ox9FPSqHvqnv8zBmPNX?=
 =?us-ascii?Q?ZLjd2QTAAxW0yuDAtTdmIVoeurS4oY6jKO3Cd574mZXffbTEDOleH5bessm8?=
 =?us-ascii?Q?g/GAKthnTk9RGh501mwcGX1CemV+YnWtkoAHicnkDxmbHrYM+yKjBmu4cBZo?=
 =?us-ascii?Q?mgcbBzFUTCD2ACru9MDzRKt25/8WQbQhkugp3QAU4U4zBLwOtclZK1+XtyR5?=
 =?us-ascii?Q?fD5uQbh5wkTsfwAFx8kGQt61nq2BHXroW+GRBc6UApW1kBSFzhBPA8FloAJ1?=
 =?us-ascii?Q?zoEzbhy3+Dd3FoMpnpkakwEqzcj10HSh7IDNS0cqayva8Vdzt7ufRTZqgvta?=
 =?us-ascii?Q?rIkkmGipulsyH+BQTmhcG5NW8xTOL+8z6VwkS1qHLExIXwGG49oAtfWfttM1?=
 =?us-ascii?Q?YE/eD/vcU+1i2vzEcZ4JwITniu5ucnYtZVFW45h9H9NTbNAiBZjm/1j7D60j?=
 =?us-ascii?Q?KTWg1X+L2OVaXMUuRxSvRZYkvWpjOz0HloJaKWNeWKt1mENB06S4/UDUlWvo?=
 =?us-ascii?Q?zuAl+qj188TRD6dmYJGcUObVZ2Dsj9QSyqY/A3Nc8q7/8dNViP1LpRDdn0s1?=
 =?us-ascii?Q?XnCBuh/D726Ian83I/0CN1eLnpNhnlfENOzKF+3UCSjLigxqMQPoOpqt1KWR?=
 =?us-ascii?Q?Ks4G?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYX/DdBilSvTdURFuGohTz9ilF646S3/K5KwLHFrXXiCKEBrYENwbw/y3KF+?=
 =?us-ascii?Q?8PpP6WDNIPTEzDm1y3zdy7Gr/oNkXs6KmxgSXYBSL41BlRxnNRD6jh88fbEb?=
 =?us-ascii?Q?iHWB7+p6Xshcg1dbxt7gYIKIFwUoRBY9i4lL9Sf4WwaGhPSe94nDGiue5IFZ?=
 =?us-ascii?Q?YTwzPYuA0Ugi/bKzrzSCmEMGaZ3p3Boa0825GZu7nSacAYTBc8cwXdgHW+1S?=
 =?us-ascii?Q?WHiyxCrSG32UfJkyXmuxvZxbuDzoGPPvJ7P89CSLPUcLtJU3CF6e8FhdS3HM?=
 =?us-ascii?Q?qfAIOxgNuV9lyNm5sxV4MlB1sH/lUrmtRxLsqMkKKS2hu6qtlSJfPhFA7fSl?=
 =?us-ascii?Q?4XbRF24Kq7kPV0cBfkLAVQHCUvZUJ74ZM63mrWPUMHldXcZvLdLP3S1xGZCT?=
 =?us-ascii?Q?CrTCGn9TEVWpMbab+8E63bw9uzWJ16MT1CsCrkyE69XBy+em20SzGGjIsBCB?=
 =?us-ascii?Q?HniMpmQf9ycl6xqIT0+OIaBBf26qvaWx8lsz7DWlikT7XfueQHX2YoBaz/Kl?=
 =?us-ascii?Q?u8HrID/2gQDv+dCXJjWVJdeCDI2+a1kX8OldxAQsrKxac0ZylVq3FSjMCIeJ?=
 =?us-ascii?Q?b7viA5rdBFrGt5pdRYlcs0hLtjYfZxMSIWygXQkKp5Iz3sbVFJk/l6KtbxHU?=
 =?us-ascii?Q?sTG2xU8TdYuA01+4mh/gRHQNCKGz3iA3iS1PdZ9NnHrsr72hY8kpiYJuCJ8o?=
 =?us-ascii?Q?1eWD/aYmTAgGPrG9kLePTSrGrfz2Agz6zXsicRFVGMglVLLiGhNsWTDvywbD?=
 =?us-ascii?Q?oBVQqZzN7WTh759o1gd65Yt5zHN4A0i5XFQNktlaFCqpJL5IpHL3wwM7RRKL?=
 =?us-ascii?Q?nGo4lNAE/OXK10QAJYVDdLb40YSbQDXCfdnwuTHBURoef69BfNw3NdOoZuuU?=
 =?us-ascii?Q?Gkdg3S0ZvzgsGn339Op4UA5lCoA2iJdjUTG6brJnE/V8gLcrHpD+sTyNirqm?=
 =?us-ascii?Q?0FPe6OzQDlhHVmUk03mOgLSMN7UPx5sRSgD+AzO2qHb3HKnsuYEj4ziUcbBj?=
 =?us-ascii?Q?4gIIlcQccwryeydAWYIBTC5k7c3Q5EJehUU8oMYOLbWfo2bxP1i7e3ylwBPx?=
 =?us-ascii?Q?iWbiUkPfLfYF3gdOE/m0fzhEdNp0kMeqqJHSMoH2jANn87QI3LbKYKlxt+T9?=
 =?us-ascii?Q?yzDuJ101pj15GNPVM8Qf81XsRQslUOo0ic8Y+GHai4Q4i3QLyIelFeoXLj1b?=
 =?us-ascii?Q?OzzVJQnBUvvHERP2gWL9dvEqhBr7OMIL+yECiJ9HXY0IwkpoKzcA5jdyyjeF?=
 =?us-ascii?Q?qecLQlEcotdlH4stfyv0Jo5o1AMBWLsmnrtB0x35GYekCtSw1NpJU5QYy5Dh?=
 =?us-ascii?Q?Z2TN9Q9j2ZZGca5njHhXyN66+GcCPYCfzQTBaxARtDr/FHCWlOVM7Or8jek7?=
 =?us-ascii?Q?M3Q7tDDCFeKnI25PF9qFCvwN7tg3V55wv8hSo/1VsiL/BK/mlgxfxUqIusJR?=
 =?us-ascii?Q?5JCca+Jrdw2+fpRjL84n2ngsxw/XXIEg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4715ee-c0b4-407c-cd90-08ded8616f70
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:43:33.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
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
	TAGGED_FROM(0.00)[bounces-8865-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 259696FC0AA

The reg property from the device tree is used directly as an array index
into chip->leds[] without bounds checking. A value >= ST1202_MAX_LEDS
would cause an out-of-bounds write during probe.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 2ecd36aae336..168df5ecf27b 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -279,13 +279,19 @@ static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
 	struct st1202_led *led;
-	int err, reg;
+	int err;
+	u32 reg;
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		err = of_property_read_u32(child, "reg", &reg);
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
2.55.0


