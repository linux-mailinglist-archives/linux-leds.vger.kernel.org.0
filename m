Return-Path: <linux-leds+bounces-8499-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A7q1J8/ZImqteQEAu9opvQ
	(envelope-from <linux-leds+bounces-8499-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:14:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E85FD648C23
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:14:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=GkN8IXvC;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8499-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8499-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E70DE3020A4C
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B306356745;
	Fri,  5 Jun 2026 14:06:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010017.outbound.protection.outlook.com [52.103.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7BF40E8F9;
	Fri,  5 Jun 2026 14:06:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668419; cv=fail; b=XzrZsMqD6rQYGYbcbxq6FBdUfb6BmM6+A1ktZP7Z7yuLGsLQoeZwUTAq9uBrx4wkGbnbSXk+Oeamzk8+5miwrDnVXQrL6sowyCpMYW3LwCNZeult6WyyysSm9qHChbCkNdGRJm7fw/K7iVzCG4r0zOEEsFOmdhejEy5Hl80EFlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668419; c=relaxed/simple;
	bh=BSeAlxV7CdXRg/WlhRdlHqc7HwcPPUfE7XONYXpCMuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uo8sA3+RI0O7H2YPD2GsAmbIw5/w6pbar2+TNdrLyJeeAr/TEvyCIho4lP9ItBvUTeqLooiZ0NhOI+yVI4Spyy4QjuKD/fDyKn+a4erRIHyE/gClkPnpM0vQ1lhG69ZI8zYcwpLn0Lx0okMbIWoigiqP52bqs2FyE40r6cFoDWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GkN8IXvC; arc=fail smtp.client-ip=52.103.32.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXugwR81UpJPm/g7GfRB1M/TR3r1+WQduKuHQ12+r3wtRh8V4fJQ6BcnAwRuEyls4/ZgxheC/snH8r7WFcjNW9fHhs2sVTFpcO8zypPrZKUHvH+qsyoegYyFQwJ8T4Os3OnSvw3UdankpwIM2pcXCQOIrOXIDVZf7HUoaNE6q4ppMiA98RMmEbpFok9PU5S9FZmHzfM0jckjWsTRHl+z8blmuw4XcfmYlY1ajTfK6SzLiW+g1MtTAeocpo4p7CZ3/rUvZSbVSDSidEIPLnPmTDLym6jOwEpFtrc65g4CjL15YDqF9z7dOvuoAahZF2m68EiDslt18adzJ7+VyXkrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFZXwnbdSXfbZ651Yy8wqhfBjgSAGbZ7SQaQu6l459E=;
 b=F/k7yje5vxqKN/z4XOx/vDpU8o8ztR//xopBXOr/hEDVnp3qAOcKN/hklsr+eOw4lEZWw8v3+gJ5e96vGLs3WBqaGkq+JMV+2RX0lugkC/uUJ1bRZQvaBUmzfuyppy0b3u1nOADtjUmp1nuMdQ/XUqi+3VeYkX1pMGIVLJVwOXcnwx2siYZ2Yi1dqassiAUTOKOIoEKPYKoEkJCS4T5/MqPTH6yiheXHORCyw6AucvBk3j8701Ew2Bs0xJ2iJGGAZKzPmxatSC0tlBqFRvQj7E/U4UecMfo5iPZirEDCgWN8hfJxJnL/AVChcQi4CaQe9k7NBMBmzcJce7/HKdu22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFZXwnbdSXfbZ651Yy8wqhfBjgSAGbZ7SQaQu6l459E=;
 b=GkN8IXvCHzuLFUYCEesImNg2k+PISy1my82pVuA66pOHs3+C8/ZuYWtrxNJJTbDj1FCSBuclaMScHpboxoTvD/R+9TmPVXBq/6vAAIN964gMhMfZvDY0pCw7kPBbmyDJN//z1NId9R0K3ORM3Poy9C6XlY1emPPUCd9vDr5ShMT2V+EvnHmJMQJcCHUPJt4juOwmyg8tppmyM0kM23gAGmsxxLOquTuqyxVDOjrKksTCQ2J9jnAr5PP1cfq354iL+3227BI3xBrNeMFEKPHxJTx/jlB2GFv4t1CR+YjDEbGrv55LJconYuX7Qw50ax2uciHzcK8Qzqr1AEQdAIhifg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAWPR08MB9994.eurprd08.prod.outlook.com (2603:10a6:102:35f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:06:54 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:06:54 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] leds: st1202: fix pattern duration prescaler and pattern_clear skip marker
Date: Fri,  5 Jun 2026 15:06:41 +0100
Message-ID:
 <GV1PR08MB849783FB3418A0DE7AF24236C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605140641.1450779-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAWPR08MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: 273aaffa-c88c-48bd-0901-08dec30bb23b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|37011999003|24021099003|6090799003|55001999006|51005399006|41001999006|19110799012|15080799012|8060799015|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXFSTVVoOFhjMHdvdXZTRWdlaXUyUjErSkYyak1jTWo0WDJ5azM5dUJYWlpy?=
 =?utf-8?B?T0p5Uy83TEU5MFo3L2JSdE8yYlhoMkVhQXd5V1djRE5acldjSXFXaUpZY1Q3?=
 =?utf-8?B?QUExbXZUYyt4RkluekcyS21VdWsxaFlOYVNXcnNSV3BpT2VIQ0cwKzlTWFJo?=
 =?utf-8?B?WHRWTmZNMGFUTHBlNnpzVHQ1UFdEb0VZNS9hTC9URU9UcGpyOFhhSU41anRO?=
 =?utf-8?B?bWkrZExKUjY3VEE4TWpFQUlMUFYyRjhZQmFBdEM1SWxiM1E2aFBQZ1FhMDNr?=
 =?utf-8?B?ZzlVRVlCc3pwUzlMbXh1OVlFU05CU21oMkFhaGRQUENOMDVRWkQwRG53dk9j?=
 =?utf-8?B?MWd3YnNKc0RkblorcHdrR3gwREc1UmJ3K2Q4RkN5RlByRk9SdjYzT1lXTktl?=
 =?utf-8?B?MWpqbXRxU3FadkZkQnRESlZGZjRMMHdJV0RzdERTQ3FLWjRMczhTMytnejZ6?=
 =?utf-8?B?aWdlZjd1U09Uam5Ic0I1aVF5TExDaW1LRzRRTG0yVExIdW96Sk9FOGlVd0ZR?=
 =?utf-8?B?UGwrUC9IRjlndFZrOWtOUzdBK3V3S2tZV21VdkNaWnYxQWFLM3JXbkZnc29J?=
 =?utf-8?B?eTZFSm9zTzVvT3ozTkVmTmdkYlVQTHc5TitvajgwVklFU1RjdDEyTzJxNXhz?=
 =?utf-8?B?dkQwUkQrUndxQ2RRL0xyMlcvMmhPN2VpQ0l0M1YwTVdLcE1SN2FMcmpsS3FU?=
 =?utf-8?B?NWhlWEtwNmdKY2RWUGZSRHprcnowSjJGQjdCazVWd0dLSlJIdE5ELzNzZU9n?=
 =?utf-8?B?UGIxZEVzdlpYcnBsRVdhZXdKcGk3YlVsa3A4a21PRFVEYmJjZTRYcDdya3ZH?=
 =?utf-8?B?MndEYWxMcHJXVTJEd2JKWFEzT0VGZVgwUjNEUXlRTmViTzlkcktLcXJrTnpx?=
 =?utf-8?B?dm1YSTdQNSs0WExWLzRJeWk3bmMxMnkzamZtVG1YK0oxb2ZsRzlaM05OeTVz?=
 =?utf-8?B?NUs5bHJUR1gwNzUxNksweGdGbDMwU1FodEEvV0h2dUQ4MWYwTCtzRUlyOFd4?=
 =?utf-8?B?amJxMndRRlRoYzVXTUxCT1ZLeGloNStCc0tZYVVIdDZ0WXVVc0dhVUp2cVZk?=
 =?utf-8?B?c3p5Y0N5VUhBZDJuNnJkZHE0N0ZadkFlR1ByNWR6RlFJUUtBWGlGZzJlbnZk?=
 =?utf-8?B?UlBRd0JwWDFZT0x6ZFRCZHg5OFpBSTJpREwyUHMrTmVPUTlHQVpVKzg3QlBi?=
 =?utf-8?B?bGdhT0tLdlFtS3gyWjdMRHA4Y0gvbjd4bXJQeXJGYncrcnBHQVYwaHkwWmtz?=
 =?utf-8?B?a1J4WmFXTnBlcUpleVBpTnhMM0U4T0tycFNQREZ3THFtT0hMQ201NXRuZElM?=
 =?utf-8?B?SHBqTDViM3lYeXBjd0ZWWExDSTNhRG9EWFV5cGFZYWxiOUowRnYyVE9sRXlp?=
 =?utf-8?B?Y1djUW9nbUZNK3NJM0xCeGIxTnovMCs0UUJiMVJuVkJlN215TVBrN3p4clNs?=
 =?utf-8?Q?KuxV7yeC?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V09KTThuSnJBWHdmZXhuSVl1VDM5U01pWmFVR21EMGdtUVVsSlBWS2QzMVY4?=
 =?utf-8?B?VGx1RVpuazdWQmNBdVUvb082SWVIK1VGSFE2dUphd25ESFlKaG93SHhUMUEy?=
 =?utf-8?B?OFJvR0d6cVBLVFpZZmkxTnk0UjhRazZYbzlVNXhmUWhtUTk3UVUwbkcrcmZ1?=
 =?utf-8?B?bEJFdzBicGN4akxMM2V1NGYzNTl1S2NDZDIrQ2FIVmMwdG5yQjJHRDJCdnlN?=
 =?utf-8?B?Q3g1czlibGJyK01yYWx2UW5qVEg1YmtLaS9uSjRuQzhEY2RqMERxQjYweU5O?=
 =?utf-8?B?eXkrbXZkbEs4MXNKenZxaFFJSzV1VERQZ0ttSUpHbGhTSmJ1Q1BCYnhSNlBL?=
 =?utf-8?B?T1ljOFpmUTRWU2t2YUR3NTBXTTBja2YyTGM1T096d1g4aXBaWk1Td1dPWWVl?=
 =?utf-8?B?WDZUVHNTeEZPWXB1YkowaUJxcm53bnJsN3J1NUZERy9xeXpTcmNhdEVjZUhm?=
 =?utf-8?B?V0ppMExnaTh0djFDZ2ZTa3orQ1VhVmZXS3FiN25BWmRHaURFRUtUUmdVbkVq?=
 =?utf-8?B?SHlxZU1IMmJ1Y3ZGTEJ4V0hhTlVRZ3ZlZDE2cGZzc3BCR3BSMEw4S1NRbCt0?=
 =?utf-8?B?ZzdQNjZEekFLNG5TMWszck9uYTZXYXI2WXJFRGFROG55dU8wV0RmcHppZ0V6?=
 =?utf-8?B?VmZYV3NvWGllRlhQRU05ZlhxbFNqb3R4VUZGb3k0N2hrOFlPTWtyNzNMQWdC?=
 =?utf-8?B?MkJBYk54UGltRWlTdFBvcEdMdEJPZmUwa3o5THJ6Q1hzd0hlU094WnNEaHp5?=
 =?utf-8?B?WWlTS1R1TTVvbGZEZEZyVm5NeDNUTXZJMU1aRVE2ckw3djB0dHpyRW1KYXFD?=
 =?utf-8?B?WVVBZy9VVkNrM3FKVW9BTy9CVnFIbDE4VHIwUnRXc2o0ckc0K0o0SXRxMkZr?=
 =?utf-8?B?UlBqR0h6YUR5bFBLY3dLTWJlTWx3VWtEbEhDZ0srZGZoVmNPZ3pNWXJqSnBm?=
 =?utf-8?B?L1pjcUJzV21oaVVNZ1pvRFlvMitFck8yeDdPQk9CNk1ORVNiRkFXZThRUzVM?=
 =?utf-8?B?THlqMFh3MFFZdEtObTZkWFlyRlBHSWgvRWs5RVBoc3ViWDBteXRxdHBsWThD?=
 =?utf-8?B?T3lQWk4rZkUzVTdtdTJxYjhhVU5kVG93Nm03SWMrN2ZaU29ab244VWpRMHU5?=
 =?utf-8?B?U3o1eDFTNHk4bUJlNXdmVDJHTHh1Z2dBUUV5L1JQRG9hMzljeUY2TXQzR3Aw?=
 =?utf-8?B?eXc3VUVGeTU1VW1OYmYxNkhEamVDR0N1aHpxNERDZDg0Q0VpSmZkdDJzVUJq?=
 =?utf-8?B?R3pRblY4SVRSc1lZZU0xWE1nSS91cWh5Z2hWaCtIZlQwY1VtOUxNVUFlZHpk?=
 =?utf-8?B?K0FZM3ByK1NsTHV1bUlVZlNaY2RXTktqOHdyTGdIdEJFLzROZXF2UnpyUm9s?=
 =?utf-8?B?R2dqREN0L0ZQbVhHOC8rZllLT2VSRUJKUzBaSWpPK24rZ0IxN2kyVlNWT1JD?=
 =?utf-8?B?WGcrU2RmNUNwU0YvZ0I4UjJrTVQ0TkVKMnM4MXB2OGJkWTVqeElsRXFJMTcr?=
 =?utf-8?B?K1ozS3JZM0VDUUlVNndXNGNRZDR3K0hzK1cvUm5uTTRwTHNBOVJKSkE2UGJM?=
 =?utf-8?B?dUcxSE5MYjRFMVp0eU1uN2xLY1MwWHNibEkxanFQZ0JybWdSUTFpV1Z3bFdK?=
 =?utf-8?B?UVZkTTJDeXNWSG1WUEE5NHk0L2VkQ0Zqd2t4SGJmVzdybEROWkY5R2RKL1Zp?=
 =?utf-8?B?RndyMG0wbjNxd2NweWRUWUNDcXZZVFBXbkRxQTd1TEg0SDZoRXVCOE9uNnlG?=
 =?utf-8?B?Wko4VGxOS0YwWjRNaElaUlJIOTFMM2s5NnQ4dzduNlRBTzFaTnd0eFFrTUlR?=
 =?utf-8?B?Szlza1N6a0lobndrQkJadkw4YkRFUnNzbTBwOCtMbjJLMEI3cVdGNVRXR21q?=
 =?utf-8?B?a2NFZkZ2MXNQeFNrUURJMTJRM3ZPemdxZ09OUTZFQkhDYk1ZMkRwZk96cmZv?=
 =?utf-8?Q?LOuGHNCBOe2H0fJ+M8+/AP9J7xlvGD1y?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273aaffa-c88c-48bd-0901-08dec30bb23b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:06:53.8907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9994
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8499-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:from_mime,outlook.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E85FD648C23

The PATy_DUR register encodes duration as N × 22.2 ms, with register
value 0 reserved as a pattern skip indicator (§7.10). The driver
incorrectly subtracted 1 from the register value:

  value / ST1202_MILLIS_PATTERN_DUR_MIN - 1

This caused two problems:

  - All programmed durations were off by one step (~22 ms too short).
  - Writing the minimum duration (22 ms) produced register value 0,
    silently skipping the pattern step instead of setting a 22 ms
    duration.

The maximum duration constant was also wrong at 5660 ms. The 8-bit
register saturates at 255, giving a maximum of 5610 ms (22 ms × 255).
Values above 5653 ms were already producing a uint8_t overflow and
writing 0 to the hardware.

Fix the formula by removing the erroneous subtraction, and derive the
maximum from the register width so the relationship is explicit. Update
the documentation to reflect the correct maximum.

This exposes a secondary issue: pattern_clear() was calling
st1202_duration_pattern_write() with ST1202_MILLIS_PATTERN_DUR_MIN to
reset unused slots, accidentally relying on the broken formula to
produce register value 0. With the corrected formula, the same call
writes 0x01 (22 ms), leaving unused slots as valid 22 ms zero-PWM
steps and making the LED appear off for 7 × 22 ms out of every cycle.

Write 0 directly to the duration registers in pattern_clear() so unused
slots are always explicitly marked as skip, independently of the
conversion formula.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 2 +-
 drivers/leds/leds-st1202.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index 1a09fbfcedcf..a2353549469e 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -17,7 +17,7 @@ To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
 - Min pattern duration: 22 ms
-- Max pattern duration: 5660 ms
+- Max pattern duration: 5610 ms
 
 The format of the hardware pattern values should be:
 "brightness duration brightness duration ..."
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index a750c95ef3f8..b4adade49898 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -31,7 +31,7 @@
 #define ST1202_ILED_REG0                   0x09
 #define ST1202_MAX_LEDS                    12
 #define ST1202_MAX_PATTERNS                8
-#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
+#define ST1202_MILLIS_PATTERN_DUR_MAX      (ST1202_MILLIS_PATTERN_DUR_MIN * U8_MAX)
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
@@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
 
 static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
 {
-	return value / ST1202_MILLIS_PATTERN_DUR_MIN - 1;
+	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
 
 static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
@@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.54.0


