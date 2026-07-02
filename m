Return-Path: <linux-leds+bounces-8881-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8fdqOBbmRmoefQsAu9opvQ
	(envelope-from <linux-leds+bounces-8881-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:28:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9A6FD31F
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=iC44Fb+i;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8881-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8881-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 006B63034BD0
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8213A5459;
	Thu,  2 Jul 2026 22:28:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011036.outbound.protection.outlook.com [52.103.33.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411A364926;
	Thu,  2 Jul 2026 22:28:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031316; cv=fail; b=rJYXkJLiTJxrUaBKzavON4rX8zSZnXwlUzGUw672OfosGKIA1GrR/yNGtlSubWTppIOMNeFcg3txIWBUs90o1th1I1gp+DQLexfNyanmYqhszyocvNEeppLeBPqpwvmHesO9qOuWvvKBNGv1NiVOr952YIdJVyXI5+JY2eye0vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031316; c=relaxed/simple;
	bh=gv4S24SIfmjccWXfFDobqSUttsQ7GCI5DqUviOBJC1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eeZv4gcTFc01iQWfRWXQx1O3CBTul6MUCvYtqN3awC5WHVoLYnCE9I+82xZq85ooE7p7ke4hPB8CfoFYLZGbJ5sYG97NAPDJ1ioLiswC8NUlYRGoCtf3KuHFXaE5IjpAHh3RmxH3/NPZBwAMSlpIL2On6bLu4/a2Dh6bijkA4RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iC44Fb+i; arc=fail smtp.client-ip=52.103.33.36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/CP6s8LjTAQfT6S02z1++kZ55o1nV2g0UiYIOzw3ZA1fD6u9L4AUp8SVMS13gaSIoEeUfp7wLjXa1simvNsHtQck9G/f36ZvdBHPcYXoXXlwN8oN4WXjIIiaDWJ0tY8lM+f5Nr7TqWjS9g8if6dT3cYMGdXct51vcrOw+tqYqLGuF5k8Ao9mes7VnqDZT/nVu5Ye9ARAWFg2DZGWGdQoQLLGij23bk4+sLiYQU2vLp1Fc460oUQr1SOXP9dtJw5EoMiF3aMMclRcIKX3ynL0NOsvXzlGiERsdu0t2PKs4Ag1mBLh+W+x01H3HG/9mW4bxC/92pu32vKqmy1qi1VSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXd9sCub3s9fxyymvd2aGSdaHCMgbPfgeRI25qe9tMg=;
 b=t5WaTPJIpjYYKDYDXnCBmUk9GMlcHBDsOqtNukNF6dYMxqfnzzMTVKCm2rVuFb46oyR+kHmPS/rA+++6f1k1CDlmB0k1v8EhwQomwtOJNMwuUcI/ccZTm4UhDqTLqH0MOmMXwjid/zPKzL33JDHA179K6hxro8VZ4vKK86Wt4oeoZIC8IYfxA+ezlAn0/UOIvxrCHtju8PTML58v2BE4VEqx5HrBgzgRanw4PmggC378DBSYULsf7U9gojIa+a9y8uSazza8j7ZaEHPxckudFInaV80bmSVR4PGXA4zEMQ5EPAD9MRMesEhm9ALBUPwXX3Z1b2s+sr5SuwT56KILTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXd9sCub3s9fxyymvd2aGSdaHCMgbPfgeRI25qe9tMg=;
 b=iC44Fb+iJk3WgU8CKX9l/oHOxUGE94wQM4ywhCBIBkB8j+DIt1HEn9256CoyfrFHHvDOSiSbBufJ8vb75aAoiQPdcgFxZmCNzWR6W80dQMw/A+CTaGfYYKeSWdr+9gJOE/w7vyaAcxcrhraMqRItMmZn6sEt/wFlA8rFU2X0AKJ6mrNUMUIIRZDLZ7VzZLR0PXYRN0oKcSTJUHYAwyyBCFOzyFaIRkIaJdss5g+INIuEUVr1iBIC4imxPwc/W+IlZbPg6Icx5cHhdsLzjxFMQ6P6BxX/85AVionej64Im0UUISQYCzHPwFEB/mzXgiV+hMiEXwvdG75LxUaot09Xsg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB7702.eurprd08.prod.outlook.com (2603:10a6:150:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:28:32 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:28:32 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/9] leds: st1202: validate pattern input before stopping the sequence
Date: Thu,  2 Jul 2026 23:28:20 +0100
Message-ID:
 <GV1PR08MB84975929B6ED7CDFBCEB7D76C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID: <20260702222820.89110-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: ff060bb6-cf9f-4d88-4934-08ded8893f88
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRDHdeyC1gU1jXSBmDIFNdsKmcs64fwf5g+LtSVJoHYbBwLl6NSsu11IBHNyL/F7kzpw1gbRcrKC14KvzF75bAK85Sr/PHT3vG4fvychOl4ruP5oKy/I5MvX1ZBXFF/w+F0MojqS66EGjMF5aZaAu292sQWLsPMiawc4eL25QS3GpNdzXfDdsai3X0AobH5BczfvI1P+OFJRfVjgi7uIHJv5oLUpjHQjR1YPN8jIK1aowSgq2SsVevUaaZTb0jkX1hK01aEubJ7dN8lTfigJICQPnQD4QN8l+L0xYsMcbEEDbj1xPnSuSwQzzg7eZih/WUVGOpZ9tggfNmirKUtihNszPLbPl8yq6nUKk/QvbML7IkANkzVbJu4WMdOBPjPB9ClBIZTQMSTqAqi7Vn+OdDE8zXdd8xHcwev/8J6dj+N43UaX+luUb7lY4Di76avCSX/ERQpT78wBlg2dqui+tb1VpFv3WxA9Oh0mob/9zZ9G12k5vaiaUxAKEQhnrlRVCpprvMtpYX12qOtPA8YcZqEpPk0W0ZOTVKbXjnXMnKnanjFBt9OW4HuJF3GQbv8asCgeni557ySvEj4dqsg7ARzXHCp2EWKwv0z7rOy/NsIrULXv4vgk1aOSvMOzkuGhvdFOspGDTonH9Br/xa4zYU63v6P8plwRf7IOJxfcKcqoanVZjDOYMAb1BFc0SLGqIttmoL1vF19S9LEFus5IULmfD1kOOCbXOK4KSqdqes2eQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|51005399006|19110799012|24021099003|41001999006|5072599009|23021999003|37011999003|15080799012|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ATIq7yHO9LlOKVOyvcyB2nBaFitoC2Dnn7AscYrezma5iJSUN9+Weh098gky?=
 =?us-ascii?Q?A7kgrRH4h7K6lgkJVNGa/5blZ7CF+NdhFwIxr+CX4vhgZu/30TVpqW6T+Nj7?=
 =?us-ascii?Q?y9PT0YVE5yTqEcfIKGFcxPDXVx9UajpW1pTpSCX21mwh5krgRA+t3GN9jR7J?=
 =?us-ascii?Q?XuLjhXGEY+2i7MrCPIZOQQCrpfRpb4Elo7+UqBrh1TfRucbdGpEPC5jCux9F?=
 =?us-ascii?Q?hM7IO92uTA3AjJsbpw1ZWl6TjuiB4rqiB26ujXzrhZXCX5g+xhg7b6ZqJiVa?=
 =?us-ascii?Q?yhJewyYBUhoYXJoXJQpYPa1dcpOJA41uzmwO8RtBKEVkMWRn4aC3LHaelgJJ?=
 =?us-ascii?Q?/2VgPJOWRpK2BIePHLO992mWBY+KGTIS9v9RvDJenIDNegpNIt1zPzqhT6W6?=
 =?us-ascii?Q?kqIXsc/RN/kX8bSi+bmTeaKLiS7ayyrtvsTyCNrcO3V7bxnZ+hT361dc17b6?=
 =?us-ascii?Q?LMbu2lt/fTeG8ZKq3vPS8horxrJq1z46QAexjXy0ugWvy9+FNfVw8XCla3EF?=
 =?us-ascii?Q?niDUipy+1LSH+g/jIrbldB//sEN/+xFq2yfRKPtkZgtpsxGKxuWpM0GZD1mr?=
 =?us-ascii?Q?P2ymbDvCQdo+XxYpopoZb7aD7SmsECFs+mg1aBLetMu0fTjrHyIC1ZTc6inX?=
 =?us-ascii?Q?FfXwzR3XlzgmsY2U/2pBqSzCdAm2/uhDN8u2dMmKkKTQvyWlRjemZFJFbU2U?=
 =?us-ascii?Q?YqNsje3+Wc0NxcERvlJniG46lkOneXqe43KIusrAPvCH+7Vu956lF2DO43p6?=
 =?us-ascii?Q?RXXfOfnTWsyLj521zbnV6TKJDOZUZRsor8OCkuLbDD6A/uXMfcdmw7thxNkh?=
 =?us-ascii?Q?CzEeGf3zfooRuEXysCcOLclYo6o0bAj4gNITM4EuP3DU/MF4mIS1KwVdfoo1?=
 =?us-ascii?Q?ZIscOabV9wgI2uuzPrc3GFavWDbvsCNGnhRibXWsMYTINImmHnYrrdgC587A?=
 =?us-ascii?Q?dZo32sn0y5hO8fvLzYOhlvLYp3dZRwoMuDh1RqPw1wMt8VgHfzX8yUUrdrC/?=
 =?us-ascii?Q?v2gA?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yRpS+OPyt2+KsKuXuWnahYnt2goF6QU1Id3f7cL9M+6Xg38HUCMOOHXNAnvi?=
 =?us-ascii?Q?kYq6GYw3kzEyPBzs/kZKXHa/lsY4dEvJMtpzDyGqo9GCmoUa0wLrz1+MojQP?=
 =?us-ascii?Q?TOeEIRPAiuQXZm5dL5/vID4qxhS8QcZUYmrhKpgvscTGR7pN9MLr7pYZPH20?=
 =?us-ascii?Q?LM6zjxamJh1meEjXFFDDN1hrbv58oE9STcgbLfsJmPokrFKTXhyhtA5ojIdH?=
 =?us-ascii?Q?msw2YVT+NLbCtyOIHlloMUtv7wPrCgPhOrWYaWLq4V6yxRIi2mFD+FeWmyKd?=
 =?us-ascii?Q?D7pAodELsu44qBLbmc9Li5rSJ6m5W7MLgTAXtxRPyrmItSwf6xPGmbAWbNNx?=
 =?us-ascii?Q?6ZruTjiRd4b7Irc/TmCW5Db/w/Tasm73MrAD8fnvb2oUAmMdRI+Qa0rEN+6t?=
 =?us-ascii?Q?iZgE82m5Xl1/u2zosIzEE2yBmXmtOdHXMRZN2blo/PjuDQWzTDE0QUBDtL1x?=
 =?us-ascii?Q?1E2hIfWqfvQZuJWKEeDeHl7OElL+LUSim9s3ExbMBhyJOygFSBc/xNvyJaDk?=
 =?us-ascii?Q?te2BoCuZm+iquvKaZG9QdRyafs3u7AIuUWKmcLwZzZ7xNgy0JqWRnKSfuZzg?=
 =?us-ascii?Q?V6wDB2QDjLbvS1fZDvks5qLVsuP9wTrArxB1tJFoGFO/trrqiTqsK2OObU17?=
 =?us-ascii?Q?xsr+6/K1Ke+0oBMCkMpDblFdOhUF71gam7bJprp4ia0B2VpPSban6muZS7zG?=
 =?us-ascii?Q?huEld28eGoeBThE2kd79YYn8vYL6OI/0/Lnjdo7Nl6WgBg9qwF9iq2e4Ezm6?=
 =?us-ascii?Q?9dU8+FQnwS9XiGjXy3GzfaY8hqTP7Oq7GkwNnbFa1ed+KmaYit2qV6vS924s?=
 =?us-ascii?Q?+VfzlPlaQ1LW3D5TTjhUhJcpjMN9KFxP4s//2paFMyawTpuIutfcPLgz4VRu?=
 =?us-ascii?Q?Ll2X7ihDWS5+tK5pMcbUi5ZfpxwNKaoI99TMooJoak0Pkg7v4z44ecPgKMQp?=
 =?us-ascii?Q?Q3vnSW94hQaYouL5O0wlsXAnY83ZmNYirTVVaeEoIPe5kZXuJXqUNx3RS56V?=
 =?us-ascii?Q?9DCJgYSa7dLQNrjVxGMgEaCPAHHTGQRhQB3Bc1MRMQdYf1UyqLE0frtuhHV1?=
 =?us-ascii?Q?dL+fqQmGfnl/McBsbkZI4IuTxpNmBbjqLz5cf4bLyl7X/lXoNCUNsNZROyLW?=
 =?us-ascii?Q?iW8cBokP3wFIsgBq/UiTos29gsvirfNNqe6Fv/LBntp7wjWVVgjwTOkD8PU6?=
 =?us-ascii?Q?avY55Mx//hSjz3m7lh+D9GNAVPlfA5DU8tS6z4hrqDvFGMhZJWYuQh8048H2?=
 =?us-ascii?Q?GJ53+zJQKRIpRLkbkbfW8ARRNr3XTpQ61gjV3M01iovRalsoRTYjdiOQcU14?=
 =?us-ascii?Q?rbQIHkC3239BrW743Z6uh1sJpf0HaBGJ+3UJMjsuuwioqDRxeiofP3fo/glm?=
 =?us-ascii?Q?hfsEVRAiObhy4DdWyQynNPtb3ZO+wJa3V3Uo7a4wmtkM50RLKYX8b5972V/y?=
 =?us-ascii?Q?OwfxCt3hlAYecIVdUBB4ZGixGZWRF3Cv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff060bb6-cf9f-4d88-4934-08ded8893f88
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:28:32.3743
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8881-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39E9A6FD31F

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
2.55.0


