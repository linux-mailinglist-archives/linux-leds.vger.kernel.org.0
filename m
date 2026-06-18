Return-Path: <linux-leds+bounces-8677-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5nS9OkRWNGrvVAYAu9opvQ
	(envelope-from <linux-leds+bounces-8677-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:34:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DC6A28E6
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:34:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=TGt1Bvhs;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8677-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8677-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12CD23004C79
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C2C30E827;
	Thu, 18 Jun 2026 20:32:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013080.outbound.protection.outlook.com [52.103.46.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA96258EDA;
	Thu, 18 Jun 2026 20:32:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814752; cv=fail; b=PhaFZMstcU4/VTbBV3B23/bN6krG10umfJX5s9xgzL6UFi6F06xyw0ekH1R+8Vn9ly4VcDvhBrXPT+5NeKL/n8MLMXg9ydiT/RiJgCDvHyi4/c/4NQDZ3lbXQEla4yV6j6ps/2U2FcwkPYgUcL0WrgN1Et9m1bqKNMRTp8+Fobs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814752; c=relaxed/simple;
	bh=MZHou7e4nBm13v+EHD5RZjAHKBD12CFWkQ0tAVtniqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QBV1GYDIHQBPdQOiPfGFFJOll4slnDb4Xt+9l2NP9El/+99xK3gu0ZuJrMVqniofGoYAitQoL0Slnz5FYwYhSQ88lCf+f0mQXZP3pW/6LXukV5+8+tjfrklddyLvYSvPunvdohyH+UpegqdwtxTVhaDb+QvndsuxXixW4pIq0BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=TGt1Bvhs; arc=fail smtp.client-ip=52.103.46.80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWrqZfZGh+xgkQlv1Ev7l4oCPOwsa225ArYKNP53BucsMwOl37VBSEQKdnMfFPqkSjkQ908llRxdysML9drm2w67tVmajIKNuWGVUs27S1VwgwZnlseO5mduspgiNM45R1x7Np9RTGMLu8I2Ebynj6m0EF9ThG8DiIQDj+1ySxUyrRNkpR6mnRggkChYoq3spv0EyljWXktRbvyH4aLhzMRlCbzNjeNT1OYCH9hrMeZMn7+mIGK5OBtxHtjaHPBX/IuL6UIaNDEGj1sRNTkSchQplhA4B1ENM6nsh/SPQ4cX5BZBVsbzfd9T75UoSzkK0NeH2/LcZxJk0+EEN7QNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y1duXiTmQqiDM7fRmEVsTgMdl6vl5ewNDfio0OFOXU=;
 b=gspMqVZVwt0NERy+8hfzkyY0ogJ82oMr4/dJpEFSm9DjDR8cWEWxfMObr+IvJNGw+KK5joOU3uX+8YiE9vpqREoo/fOy+92KxNNCnl70vJavtPKpIwBRufHbuTmQQDSo6dKZKUKqG+8l2tGWxuSN1w5RyJaRSxPKkQQb9lNMVYUkI+Akw4SoJGvHmGpXfi1pkJUFSCKkGNfQk1JbfCrlVmKnGih6whap36tEgziQppQY8sTM8FKRJn3FFtMyKwe6HXLmWcUF0N6XwBnMXqBPVvElNnHfVZ2ksIpL+/rGhhoKyC0J83gqY4skqYwiw3s+IvxPYJwCS5eUTaysTlBvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y1duXiTmQqiDM7fRmEVsTgMdl6vl5ewNDfio0OFOXU=;
 b=TGt1BvhsWHExzu8aqilEi+Y4ItHNWNlhsLBuCinSsVidQGmg/9DUYi9UtSGaX75b7HsZo9nDXLMdZnWvajxZDE6GbReftAJ0IBetpn628+hacw+IpWCR/+N14AzwVufW7Z9acczE+HTK4D2igtCouX/qmye3Djdow1tcDZNqrVRnKBZSmiKB9XKLWrHDijssccvsvbKTRCboL8C6xenN9y8Tt4+KeWDe6neMiWZ0LwV5g678hiMbIqF+1KP+cKqBy2TbbJSofyG8mC8CYs8Ta14twygZqjw3YYRRseMXivvuLrcLP7h+0hKftHohRmtTi8PqsPJadfzS1BMkZxM+yw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA6PR08MB10545.eurprd08.prod.outlook.com (2603:10a6:102:3d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 20:32:29 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:32:29 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/9] leds: st1202: validate pattern input before stopping the sequence
Date: Thu, 18 Jun 2026 21:32:16 +0100
Message-ID:
 <GV1PR08MB8497ABFC05885EC565CF21C4C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203216.3296746-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA6PR08MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab03ee8-fad9-4462-9b52-08decd78b71f
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRDHdeyC1gU1iYwJhDTimu1BApvUE0qLYHeTR3ugdOORe1j7Pfavx5J83xHi222VY5YPZcAoD/Ve1tpaRdwluTyqLJWm5wY2F9msM+W1lUQYCpBz10pCQyi5vcl9octBN0cMC+3h7iRb+A6VIy9H1pKtY75XYuY9utatPiJGBROjELaAAOr6gGjrD6G9gfk6+HiwtuBcbk0NiOBnQWejgZ857uI0cqzf4RDmkJg4ZuPles/ix6guEo0cqa6UemxniVGhhkaf+dWwqDukIaivPDytb2hYOFPvECGpUzdXgw5T412hhwulLgeQmHQZWwTiCbqUgqPm7qNZ9XNj5WFhy2FayGO+WvtkzKDFse67HAiOOshUReNpkn5Ist0EUHUILxpa84X9pN5yz1r2MW6GNXY3Vy+hVFP/biDonnPfhB5gHqm8Rv3RoH9Xv/rNgkXn/iaJgo04ro4dJPb46i2/rA5RjbkgVVUqXZASULxsmkFelOO48YUCDJVUwoUvItfOGjHHzNi7xu79zZT/0wxbPODg37H797DPbFR4nAzLukizGc8f/ir95Ot38PeoH2HY5UtiE/BoT3u+uHUiny5YX0KFmsGCS+KJ6pPu+Tx3lssBC06yse/668312we6F/GYDwz/+tMj9ZVIXazxth/D30Z36/8lODGpmAi0YnBR9XhjIvtjYbSpT779leaJBmyxaEgBEbR6oBb1/u8OEWa7Abp34a4CjaaJQzj+WOaGmLDUk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|8060799015|41001999006|15080799012|23021999003|37011999003|19110799012|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GxuvpChWFGxWNZ0jw/2K17DDB01OpG2uhCS8m/AgY0x2OemU9NTIoDCrKm1r?=
 =?us-ascii?Q?E7GCiRttXPWrbhb3KnQoiuE4Yi+uJqM2sbRU8wzrML66sR7CjFPLkgNU2dN2?=
 =?us-ascii?Q?vYeaiSLYHj8K6OvvqPBsV+Z+0CpNgEE/bYX5sSNHs3OI/63okm71zh6N7O9v?=
 =?us-ascii?Q?am+QDmi05Vu6toFn+PpWSyPCirlEVo4lkD91/ZXpB7k7UHXUB453MMAO9DnL?=
 =?us-ascii?Q?NgZTuknWdmqqwwF7SyPCSTNtCFMajnlV4Il/IxBqupAVg8lmUnsaaVXkC03C?=
 =?us-ascii?Q?hF5kU/+a/GsFX0oSh1Z1CI2SlPxuyFbuFnu9MT2uoHxFuS3vYHzC/FkoQz96?=
 =?us-ascii?Q?IifU9iSA9K4BuKZYKX9qVLZO1fkFWk8vHD8AZBlr6OQZpxw4gd8PBJnCdUmK?=
 =?us-ascii?Q?PXuKrJ7MgX3Affzsl0nzkwRqdSANX2qt4KoCkKF/ol2gvYjAznPbSzRduSo1?=
 =?us-ascii?Q?ZAA+MafLsSr+sJjsqWx3Z8yyChKb2O90IvPGnyfsm1WPjIROH/lHHG7R86yl?=
 =?us-ascii?Q?2P+jmQLRAPpM339pf+/Hl+SlhtlPIFEFr3K8zEThPHjUfczUx3/T/MV/oy5r?=
 =?us-ascii?Q?a7qUsxlcMWHDwwBBP3PNhWIiQpb9B1sj4gQUNf66W7DwuWNIDiA/7ZKeSjEi?=
 =?us-ascii?Q?rJs8Qn8BUUXSVsOAuePv90D4E8qgOhqIytT7gNUgnesdW3PmIYt2VkZsdZep?=
 =?us-ascii?Q?vMIM4jCYnvLUPfcW1m47ciUyObLkDn6b5YxomcJP0p7u9UHTe99pOt2KVolM?=
 =?us-ascii?Q?mD+nKB7SzfkCC1hBHSWttrYEodspTF1a0DsMzKQdXr3kKn2rLTsvNAf3uW6b?=
 =?us-ascii?Q?8hfGxtnf0y94ZOd407xGToQSkh0GpJtDdUUp8yTM8gRO5RpzX7VxUoqyVycr?=
 =?us-ascii?Q?L9lWY3bqP/jjvf69VBoswGMsURrq9/mI/6/Ojdgp1AJPhJfYUBgNjDdfEba7?=
 =?us-ascii?Q?72nPJzHiHIRu5PTSxxfvpSJwBs6C1is0og4kZxc1Kl7ZhDkriksziMlxglZy?=
 =?us-ascii?Q?jRH9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iv4NXBz3Sp1Vey3A6POgmRRsM4NwOAGg2drpCmwBN+LBHiMPomYsNzWuh4Nr?=
 =?us-ascii?Q?V8hhXi1l9LyEV7gqTymlc5JoUN/1Lbw229iMfrRfk/Dnn0iYKb23Q9Blr7r8?=
 =?us-ascii?Q?Rzduzsp9cQESdOvBxv+jkIoH2iaAu7p6cxBwYvRRhquQis5pu93znysBH2mV?=
 =?us-ascii?Q?EtDf2YyecODG0jVRoTmO7o0lOtVjc1ff0XsDKo/9vQacrHJA5QhC4u/rOvXS?=
 =?us-ascii?Q?8V13dxv19yFOfFSpEuuZDa4LRgJzceGv/3yosska2HvOWtdkFX9P2YFvgnN+?=
 =?us-ascii?Q?U7EPqgnwp2gTbKmB66+iuQWDlcMijUAtDzbJPDGhId+Da0MGYih0m6UFeO0d?=
 =?us-ascii?Q?I3nKtdqt0ac44FFB7Q7QLo1EbPsjSMfBnke+aAW0BPBlf6fgTy0MirnTa2+V?=
 =?us-ascii?Q?FjAEJUFgqnpDG0Zzii3kJ4NqUUAe2b5LLzAePhSRZOQ5KXSbFjrhXNTe1IGy?=
 =?us-ascii?Q?CLsQK0OJszhjzg7ahu+sXw+Jy5d0+kkUkIkR01jl7Jeovxdb1l2Us/YSZg+c?=
 =?us-ascii?Q?v1oSfdugB+8gXRn/R2DBX5j4B18euN8wUB0vw08QRMinZOnM6jpyqC3T7z7H?=
 =?us-ascii?Q?tXQjQl/NsUjxNqxSZf4cBWjJ+mkpeCxBivJlWy6hBl/TuYM58nm1AyGHwAKn?=
 =?us-ascii?Q?HzL3kp8+k+h+YV9aQb122VeawPfqbhQNpvEu4p0C9+ub9Eo+j3REzRor2RTE?=
 =?us-ascii?Q?AaBlSGz/3skTF8kenu0JMlv93P+zQp/dlYN/pl6OilhmBKHQkY2qXb0DImQs?=
 =?us-ascii?Q?k9oy1sFZHj4xozfsGX4FBZr04co7cXHlbILtzbHI3ZM6UAc+vNcyTbJ45+u5?=
 =?us-ascii?Q?pk9we+Bon86oAEd63/xlhwifG6rWD34r4MsALF4waT43YCHQGccGrvla+li8?=
 =?us-ascii?Q?hercpH7qsWLxnMqqRltFFsijCIlWdM2fd+PKsp85FJasNPwoZDhp0qjKzFeA?=
 =?us-ascii?Q?OeuUmagr8roaaWC9cw0lcE1LSa3COOmu1syEcc3NLEwew9spV2ThcQuSTpXO?=
 =?us-ascii?Q?aVelS8KHjBjejLcyMcCeeuWTdtyvbsVB5HmflOkQQCLYjvJU8cJEzhx+60h4?=
 =?us-ascii?Q?zvAn1d71K/w30VzVYlY3Kf+UEyzzYGp6tRKXTSM67nEYQjO+nEhoRVT253Is?=
 =?us-ascii?Q?/F7rOBebiGRWb6dq0/Fak6wW36R/H4jglWmQAZ/moNjOhoa5gh/LBUd8tIOD?=
 =?us-ascii?Q?ceYPWyG44NIm8HBgi471AI1LsyPq+2SZrscmStlNAV/uoOL4/MtDuDu3JqvD?=
 =?us-ascii?Q?IgKsMyFAUSZeMpDgbHcnqPzlhJEJziy7YQovb+/cRAEHhIXmxXdMyhyw1RHi?=
 =?us-ascii?Q?NqzpuXfI+uFfdxPo2mq0fli29a6hlftoV5Oz6aj27UoPx7PvVxxCq2Kdvkxd?=
 =?us-ascii?Q?zC17J7X5OQ5ga71DuQqCygJQJEx5PrvTF6rTO90W4IWeI4EQslLjWXFb4o+t?=
 =?us-ascii?Q?U/tqi/IC/W817RoMRZb3IrjWtPdLoHNK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab03ee8-fad9-4462-9b52-08decd78b71f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:32:29.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10545
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
	TAGGED_FROM(0.00)[bounces-8677-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,outlook.com:from_mime,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D6DC6A28E6

Input validation for pattern duration is performed inside the write
loop, after the pattern sequence has already been stopped. If
validation fails mid-loop the chip is left with the sequence stopped
and partially written pattern data, with no recovery.

Move all input validation before the mutex and before any hardware
interaction, so an invalid input leaves the chip state unchanged.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 316ed8eb054f..a750c95ef3f8 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -228,6 +228,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+			return -EINVAL;
+	}
+
 	guard(mutex)(&chip->lock);
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
@@ -235,10 +241,6 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 		return ret;
 
 	for (int patt = 0; patt < len; patt++) {
-		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
-				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-			return -EINVAL;
-
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
 		if (ret != 0)
 			return ret;
-- 
2.54.0


