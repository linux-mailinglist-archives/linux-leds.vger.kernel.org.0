Return-Path: <linux-leds+bounces-8671-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5rDDNUJNGozLwYAu9opvQ
	(envelope-from <linux-leds+bounces-8671-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:08:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2326A11DB
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:08:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="LHROyN/S";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8671-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8671-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93335303F9B3
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 15:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F6B322527;
	Thu, 18 Jun 2026 15:08:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013083.outbound.protection.outlook.com [52.103.46.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC23800;
	Thu, 18 Jun 2026 15:08:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795282; cv=fail; b=Fm5MS5esANGJL3bULQvv54weDRkg2odF/BQXaHQkfbm3HrPWEDjJ+u9l9wMX98f2agadOX2bfCVBugaD+8qbI6UdNeS4FOTPQBXwXq5qS+7eCL7tiq/1OPztAbSWwV7w+/GNM+O4zsWglFB4kZk9lm7KiLXdy+Oa2KzuFSGAkXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795282; c=relaxed/simple;
	bh=iqyV1qOVql1vQhhUYX+L6LOZzd4q/3RWKd4EOYzW6Pg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k90hSf0KoD207ON1TanZLA2JOxgsDKyN6VEJxpmAPHFjL+ZUoM7i+a5KmTkgWXAOFDcaClmwJh4k8uh1xt01lmPF6aVDJ/cl9ijBXIpH33mFmH8y6XdVCi/y2qt2eSBAhaQ3hmVPw/Eaw5bukuXUpjuj9uLtBzCFQDoxPF08tkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=LHROyN/S; arc=fail smtp.client-ip=52.103.46.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s12XoBJxLnjkzQaWY4P7V/BuZ9dhY/bv9yNZ4q56sSY6x8NBU4a8HC7vmL6/P4Ix+UqLuOlB197NU9SrNstLNLm/w50y4sCaIbyJ1wnU8QQfUWDA7mDu4MGbe/MB9DEVscfDXorTaiQdsq8WAjworevXv7LXTAGLeDRp2vLZ8BLkw/82IgahnGXK9fSTPgFec5pz+nI+citDFD0LGBBbWDPhlI/JtiBJU0wQ57lhhU562WZLmHx2gi51neGtfhzqPOBXICZ0J7VqXV7Mlxb+7ojH0LzhJkQ7prsXnUlt9CCi9WcgvTVKMpGvWWITQioU4Ya9DUMg78TCbtqDIQbgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2twIViXjxOgJNDMUSE//zt/pfajVRRrdrEgXPRhnASA=;
 b=C7q5B2OzFfnN1tozJvAt5urFJbE6FZzJGFUoIHDS8IQ2JJMUWZMFIdFaTMAtGqCyniiKsqfz/oOofS04TfPHNTdG8Jr/bxuVMeMAGQuSjtoL5el/rcWW7oAoy/ak7EVD2O/zD0k8ZyrbnJXKp4p6AD1DooWTF9l4ltEHpEiaF0JqPAkJRYM+CL6eMQ1+LAMWQKlZJvTzx2fC9XELpUC6aV5tMF+vJZjfzGYMkHRBsGXMQNEY5hE2GgIHODSXnXTEDorpLdsm487ol65TbNjH90VX4IIx5ZQw5w4k/JtGUy29eAp8OnAfSj0ZoNkz6baoXZc2wNlemD9TGtOz+rF9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2twIViXjxOgJNDMUSE//zt/pfajVRRrdrEgXPRhnASA=;
 b=LHROyN/SFtOVsvRCzZezp8YZgYNYWzbFiAgz+CO7d1Fj6SoaPqkLPtEdTLrD3+tts8zmHKEiA0PIZXDwMBdNJ2lDylIxug4wjodZ2UPb97lKGie9JJiGG5sXkqiVsKJx2x9KylTrNpMxesS1qH0A0TafBPkkRDuydHho6DOZikadDylnLbFGaEsDvvCViS5t6fLPRD0GYkzqI3TQai/xW2JP9b/ilrnvcWKM9QMVV3jShL04SXMfw+0RZgcdtgaj96NmtUz+gsPqSMGR4fRNvJPE8OXYNmQ0yYU1yRYnuijYb17p/t0g3wr+xGS671d8QZgWxgGuDCBRgoXOFxyIiA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10160.eurprd08.prod.outlook.com (2603:10a6:10:496::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 18 Jun
 2026 15:07:56 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 15:07:56 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/9] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Thu, 18 Jun 2026 16:07:44 +0100
Message-ID:
 <GV1PR08MB84972E778DD46B3EC33CC3C4C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618150744.668620-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: f33d562e-517e-4566-465b-08decd4b60af
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRRu6MGbuPdmyIrH81glu717q1rzxlv3RkutChtMNmoVsZKOlNAzTfOh/bJQ0K7zRpUeDwkbmKxO7ADBjv28AwYIUJToI8V+7RJgebk/zVxskZWAAei8iHre38+GEh2UEQbEahncciDVogPpRMOxQMVr2yhZSv5+DqWSK+Fyu8XYSPj1o5FDZ3w5b3wVtDfRAqVaTvx/3n8X5a1IgdXK1Jep7zX77cB7tIsfNrTYtvuQmiRb9wqLQpr8urNWNDqnUVgjRY8X8ATZk7VoTLAJEsYBNAF9hAjKub6vrob/ZKb96L4xNTA/tyFOzsZvS3T7Ba3BkkYSbGbbVvuDx4urGIyiBdO633kbkj3FOmmjqDWCsI4sp9FZC9om4eHn8fERoAfx4SkrwsoUAtfiK30/4flLBpBZ9b7ikK1DJcjTsesuZk7X3LUiNeOUT1jtG5jO3Hdd15/vLMUHgPpxWNwmcn9asi8I3JjZ9QcWILVId9RYbIdNStEOG67ElbOxzJZwHOMa+npHL/Ejd/hNf+DV6Gdm8ajIYF7EFWQaULG15Vcp0PDTc9DytxG4tB19qfIGdUyZCd/8uauj+q+Eyet8nOrn11i+ULDKskgLDMWMCMN/7ho0/Ry22oRGBvTGoSf4Ttee7lr1wPRPUNw7f+kG8jAauX0231cZeRxZILR1mkLOl88VZHSXw223VTHl2qs3ZQVcbED164Nd0vknT47SmPw2R+sjsqiqxFQhGbx+OWrIk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|51005399006|23021999003|5072599009|19110799012|37011999003|8060799015|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XAn/Dbhamx6+/ubyxSHSL6IULlkczVdOn9C3Fj+ne9WAqUk3Iq99sORVDuY3?=
 =?us-ascii?Q?3hzuVOF8k4F6mcqoOonjuWhJSVY6y0Tz/wJ1lLuvpwmKgBHNx/IP4hl7OEAO?=
 =?us-ascii?Q?wd/n3LG6PDIjR0URWsRVOKAu3/c6rtSripF6rA5eXMtheQmEsMmqmBQl5dd+?=
 =?us-ascii?Q?7r2iTcslfkKoH7yevTTbwb7i1UBHf+SBk6XBtQmGAwE6KIQ2RuuHN+Sr9LgD?=
 =?us-ascii?Q?Zm+90ko3mL6Sl0z7wIYF3qEAdog5kdFmN1+wCDNLRpEudVFjYvjCo3kGyEMo?=
 =?us-ascii?Q?0BM57m4RJLVJs98k+0PWLBN+FS9QS5JTR2XSUiHxUOIQyqFZ63eNehwOevHJ?=
 =?us-ascii?Q?XPhBgOQGncQnRmESbbaOKzboclh6Ehz4UfLWzLsWZLVurd/ZEuMA4c1kMfvU?=
 =?us-ascii?Q?xcD5+jruykN0b8Nhpm2Xsqutu9YnO1fMl+ov+4S7wd+uvH2Gb8NKdYhhVFeI?=
 =?us-ascii?Q?VnWN5jN9xCbfqJ0DAynJ4/lW+nme160Yf0tBUaKw2syodPEaOq0/0K+b9hYn?=
 =?us-ascii?Q?gTvMh68is47oFRX3uWoDtrnIEW4fkfPDEwzsRuQFqK6jLJPgG7Jd8x0L2XRv?=
 =?us-ascii?Q?FA5th8USWvdgeQCURkT2foAQFYYhVhirH3FAlam25TiLHorchFsE0/2UeV3T?=
 =?us-ascii?Q?NfrqXNrBJAlCMBCaUHCFiGkFcXdOjmaYG/V922dwkIb0KdgbyPb9SvagIoVP?=
 =?us-ascii?Q?0I8wC0EnOpPStfXexM4v3PKbDX9B4+sffJbXB1dD675BEI1B47UQuhEhIKRt?=
 =?us-ascii?Q?zZR1EATBY6laaxYp8vCSUnOlmP1BohrbIcXUofE64cKDEaTHsnq1avmtILqz?=
 =?us-ascii?Q?HU4e4/llDzZIwKKFjreRkP1HAmnl3BQTGGM1UbfI2OFWv4rwZZhQATBtw6QY?=
 =?us-ascii?Q?bMnazgoiM6MLYcHAtVfB9V7kb4SryqrkSqqkm51gjsRxYREHH6WBQ5OPmZXX?=
 =?us-ascii?Q?bDaqoIfX9zJjyEoQi9PltFepOJV/ZeAs41/hDBRF3vE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ahmnrmg79adxUqn7v/fz6A1neSAOhFt/SFntr+9TJ5qR1UhGkqFRB6Z49iac?=
 =?us-ascii?Q?GQl0Q6yae5ac8xHje5tpfWvmtImmapLBXae8XTGtNoSkBU53sxqXmGtgGuUh?=
 =?us-ascii?Q?OHGo+uWUd2A3XMJVlxe24XNYBE3MJ1kU+RFMdZ/k5TUsrTnLHOq9xWtOcpnR?=
 =?us-ascii?Q?Gy75z44yV5uFaA+rdmt5Ok+psmY9jrRTlsMuE7/NvE097B7WvC+sBtrp6LMT?=
 =?us-ascii?Q?likAmW+JQZKucLmSR3XrZVHEFR+vQdTAqEHYr6AZol65GQCSoQ7YfJ+jS82R?=
 =?us-ascii?Q?6BqrFZc3m8AvJtIEHOx+5De9lH4wohj2GzGjGFtWC7I4WMcFvZp0a+1mK/fw?=
 =?us-ascii?Q?oclzU7mfUDZzu/yvgfOEJB8JvNWpeOHXedA5P8Sg5KZ+fh5ReHwroI0Qefvx?=
 =?us-ascii?Q?G2Ho2WkOqB0bf1gPQ2uHaFzIX2WceF3uDgEGYOp4yTIdpf8aY1yOaDt8+mCg?=
 =?us-ascii?Q?pAcFdV0icsl2y8EbdCnvTCQixThd+3tUzt33X40/5/KNBZtHIyqUVwuvE6uM?=
 =?us-ascii?Q?R7C4c0y9GHbimdGwB5SyC/YFJIZoCPLDp3Bq633ww6gIWtwCy+zreBxd4g2C?=
 =?us-ascii?Q?saN9TE4VW+U0TBgKQG0YYXMJynResv1pOFuerv559WEAUDxwOXVOzOGgylWl?=
 =?us-ascii?Q?9ZlvWdOV5VKSWI7LjiAojHxbhYpmb7WGfeh6/3HyaUwOi8bSBFZL/NKElQxe?=
 =?us-ascii?Q?BtdBw1EHV/EgYpEb2Vl6eQzJn6FioYsqeHYYy5XVBZ1qkCySM0yVZjw+oRE1?=
 =?us-ascii?Q?tq0ekWk9kYGuIiXnp33J5NOYQcfQfmBIRifaFNX5airkT2q/4sPK25kaIlWs?=
 =?us-ascii?Q?PkWXpSagB9B6sVbqKgxzOTGYCxzZIOzeyaeEpfjyYv7JNoWceMbs2LC+ENLK?=
 =?us-ascii?Q?tOfLHToAyj/F9WLAw6qglN6ieQVB8b32MseTzKfkIcIteyAhkh9DUhiMPi6s?=
 =?us-ascii?Q?I0N2jMVljIoFa+0iLpoTvaqv6hlfAIJDKTMtq6BEygWGHM+lIh0nrCPf/yUX?=
 =?us-ascii?Q?5XQipy829sTACYOn1i1ss+SORL7Pz75YvD73BptsD/1jM72JlC8h6XbM3iaS?=
 =?us-ascii?Q?WUmqYnWnvaz2dcpcbtkqeK94QFnLyzGPguun4JZnJXUwR87XOEdZoQwVaF9f?=
 =?us-ascii?Q?4YegWQrLD77mstJ7uyBfMxGSDwLp606xArXl5JhIs9VSQnxDec0Ti73cgVB/?=
 =?us-ascii?Q?+CZp2ETwn4p7h4s4P2T9PuiNJtyTk2LeEqgwiCj0xrRsya0KciLBD4dgETfF?=
 =?us-ascii?Q?a6hqJlYyfQnNqZ6jW0RUnQbMp6w+7lM004U3We72YnRC8LUbUWVarLbkNUNC?=
 =?us-ascii?Q?DAjpzm8QsXK/Fgx06+82e8ZD/8wwrj+v2mKiPbTY6YBNo82DgWvls/vpszyC?=
 =?us-ascii?Q?AfwnGz3CIYuet+nP1Vj91ohoYoYXJ2KzH8FnXY0615s8StHrDPTytPw1JvQN?=
 =?us-ascii?Q?lvlxwY4VZ2hguoLB0LSYlWS8jQKLoemp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33d562e-517e-4566-465b-08decd4b60af
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:07:56.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8671-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A2326A11DB

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


