Return-Path: <linux-leds+bounces-8863-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qMFZDk6tRmrNbQsAu9opvQ
	(envelope-from <linux-leds+bounces-8863-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:26:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ECA6FC04A
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:26:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=a69oUzq0;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8863-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8863-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 383C132547F3
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D98363C53;
	Thu,  2 Jul 2026 17:41:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011035.outbound.protection.outlook.com [52.103.33.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B237A83D;
	Thu,  2 Jul 2026 17:41:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014081; cv=fail; b=kAYuIpKzuCzNiG5Q++HirKsEYPqxgoc5VEjrfySHBUBW898L5wZwK8XDrrFf/2Io0n3xxOT2bbbI3pWvgLuu2RBJzj1Ha6dcpR3WLfyJ8DFg0ZBhn7xgXS2wFyAHsvECh9OnwihfeEmvUmEjEGA/jW2crNcaxiuU4KFkDslbx+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014081; c=relaxed/simple;
	bh=Cpt4b9S+AH+wXrbq9aXygEZTDTcQxOIVHPo9qffitfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9FuEIdYdc8krXJg9+q8ebqtUW4SfGxlqE1rLCJ9XN85MA6ZaElK1hoqoeHX4oAMTuGkrn0Lil26nSSqUec8WXVBzC4nNM+j4fa94ib/OGKfl3SigTEWwqDxJ2dyjSG9GbiOd9DFtTo3CE2YiFKfotMoF/JSXJ3/q8gFquWHzvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=a69oUzq0; arc=fail smtp.client-ip=52.103.33.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcnzS+ze7hlHNAD7yird4TECypNQZL5R7Y9H1GxMm/+zlCnW5ZrTporwFnrXCm10qnLejRxeqQOUMUeMr5R29Tdg/KA93eKL2BQ3swFOW97JNpfM6Zw5XFXsmVcovdYC9vkyKGqYU96DQhhGIe3AePSqjFcV4YNSMH3ZMkuqETW1UaWo8V5MeEpWwZV7jZ0pibDTpsBLstxUjmUbR2EeFJp7sWxMVkNGaUOcW3gBEu0DOuuT9rXG6ACjYGe8GI/W6EhTs7EXr9t6vQfpj5SePGNUI358iEPg4kZbzRhY2nByyH377Pl7Jmz39a6SfM5dAcNTJioaXWoTvOg3PIbJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcXiasdZnSD4KvPs3yDBRSduxa9v0dJJRbA5I2c+IGI=;
 b=epsk39RVR753LLvJZW8eUZuui/qVohWfL4sYGOCPckikIpKofXpa4qsnuWaOEoSEHUihRLxknTGci0O4uJkHFwPLq30rJpQxcaFkwlR/dvEZzY68VfCkA4smLDaayaXZaAjbRcgQVHVcJsa/x2t/MUQmDe2otqWI91UcayZyhwPFv3VRsO489s87BQXyY2B2M2CVfeAx6b9UkAuTQQ4ulrwZsen8e4hKFLU9yAfwh+94k/qzmxMjx2v8nZV8A5JIxJcGnrKhfXiVD005gWn5b9+e+ONqD3cluuc3m38Sk/hLCd494zrMJHi1JbISQqrra0V+7NX3nkVMgzIgTx1/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcXiasdZnSD4KvPs3yDBRSduxa9v0dJJRbA5I2c+IGI=;
 b=a69oUzq0EyNDGL20vaHwOSmESuePXbMwspngzZMw18mPpPU3X2YH9w+YfXsSJtPypHfaZyDRlggavM2EhW8AeV4bwa8B2dAgKh1550uadg8l8fkUdWL+Mn1IeCgcZ8B7+QetY3tC+idGg84006HfH2b5eufpxjqslgAPhj2OcfN+RREwyuz341C9L90ETvhBVKrhIroCX4ipB2OH0Lt/J2YPAB6SFSHgHwRFcxkzIQKoIWUrrW8RJBPN+V8rJeVqLxkMgTE2ExdCeJn3pPUNgtkkMQubKNip7OzBGdZj2IoafJ1LreuNm2fHYokZ2Qo5S/To7wLzfNpEiR8io6Sr3A==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 17:41:14 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:41:14 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/9] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Thu,  2 Jul 2026 18:41:01 +0100
Message-ID:
 <GV1PR08MB849785BF89E2291C387E1AF4C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702174101.2640255-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0490b3-f0a3-43ca-9e61-08ded8611c7e
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRRu6MGbuPdmwBVdZ5VVz9CV5fEc2HtLQMGyN77NXRJzdxEzkpqDbw7iqlGm0EfzNXKMmBrXb27nnIw+oH91M3VNEY72aV3dV5ff3U06Q6NH4xEjDnyVJUIefmCoSkQwAfzBqjT+9Di05uj5Mp8qjZC869IWi1ikJZFGQH5Ai4ScsiMcfBCqSSD/sp/Zj6YquOtWBlcaw8mhGXQ62TX7HOfyoQfePL8THO7Jgd8ADJYvcvRV8cMbn4uLo0O36SqiCbVXy+itdk8hA/vy34HWjeC+AN3UfjBBnxIkn27Dq/eJiQaP1P05/FhaUY2E+J344X4Q+6aK4hoJ5W02ObZgmaNNttG11V2n1M+QkW2HTlA5zDSIE01hfaqdREC0bOBiQ9At/7OV+qJgRY/R9OLNeAN5RjjXBDDIHkY/q1PYMwo2V7YBmqtzo/u4m8N7bMfd9teg6o3bu2+6LjqoDWvIy2A3zOydSzGTvi7PLs5QnK7dZjFTkzQLnrNPxlXSORkuHlsB0oWWrkeu65gsDKCMKamlCIXjIWysy1KUZk50HXLOMYAmx5QgXo+xhtwOW/95e0TDyXdWeywSxuirbtWZhK0yvhjEyGk21VmNcCI1e0BSTwx4niBFEVNAq5PlYHCHPPxed/2hexEPpfKH2TQyjxixHpAYbeljbgB7pihYcRNZJ1hDnT59/PbZOQ6j4SmkQiecN5wBZHA/8ifzSrD3TJ0LCC1FSaIwuZN2xMS3g4Jw0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|25010399006|23021999003|37011999003|5072599009|51005399006|8060799015|19110799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kdjeJT0eKTGCbZ65vLOUfJagBykOJT0/0Gp4Xrzg+SACLrq1HwQIzzcMrGLz?=
 =?us-ascii?Q?7nOKFcno/8tjBAZcQdd7GulFMT6KsDUo4/g4jgUQ2p+yhdiYz0za1qqs143+?=
 =?us-ascii?Q?ghJYYrwMwCVBpBn2Fc7TSSFv/YmZZnz5MLBQ+B7T70wSBzkaEL6a3b5XjidU?=
 =?us-ascii?Q?fuPzlzvuwu9BUUpbG/cHesQwAHjnShhPKMZdlZk1XY2N/nUGQosI+oIs4avi?=
 =?us-ascii?Q?M63dx5bAy5IlGmksz2hY18Od+HN/mn+NMtILo3ch/eX1CRF/O7VXuMo/INHF?=
 =?us-ascii?Q?aHA7przMfep4oremyVVsOkr20ly943QyZBaIFMdo4p1V1Cr6+MLtpxgGSFZb?=
 =?us-ascii?Q?bbQGt7x6Vq8sk+wUaKl9S4ORhM4UsS3I37Z0GVw6bCE3KubbYOXVGnJUPQkm?=
 =?us-ascii?Q?couJzFUS0pmoZQO8HwQsq1oYHbIXz01M9ub4ctnvyDVggo0AE2+NDQfbzFF3?=
 =?us-ascii?Q?kOPhJXpWE+nP4JZO5IWc8cZ/lErapMlb3fAdZA6+IkkBX/V6Oe9j4ANf1k+/?=
 =?us-ascii?Q?oCh72REAtpXDzctCDmwe8tqhAKwqGCQaEgyRthcrA4iCcUAazWpsXwNVXKbF?=
 =?us-ascii?Q?mz7H7OxJOJMlGNd6BfcQRDUW1h53aK2qtceNWtWFmZf32+SwTK4arV6m+dLn?=
 =?us-ascii?Q?iZiD7+OMYYu+wzMMCyFtiRX9uIfHm4yEaIoMH6duXUydbKsKlP0qK99mKWXu?=
 =?us-ascii?Q?bSxdRgzER3zE+ifqA46ufDWsJC1kAeUfUpzdeBhCyhgKeMYaYH6iGRkq24sH?=
 =?us-ascii?Q?h+ifZyNzaekcwfuqPSF/If9jZ/MTYpoTdHfk6I6pwnBVPBf/xwrYQ1gqIIt5?=
 =?us-ascii?Q?N3LPqO3LTYzpmcOXBzGmFm7Xeokakb9WAQwVkzvCv19+cFULf1U82MUcVtdz?=
 =?us-ascii?Q?5Lle0GnKNiAEx7vHx0Noh8Oq5w+J6SzsP5vGw9Ri/jTOliJojciVRyXXNkSI?=
 =?us-ascii?Q?itwK95YpJvxM8O821yJhbh+ULNhbHd10VBqCxU2PYzI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UUB7GugjoXVxbWkzUpVp88DRegnoG61h1kq9ewWDvYel61WPQbP0OFgKaDKn?=
 =?us-ascii?Q?UbT0yrwybi45xPb3JvSgRh2ERG9EMTwN24WiHlhmdAfL4WRpKrgz8nuSbjXe?=
 =?us-ascii?Q?50rm/tWpSqsIug6eIVQ5oJ284t28DYdomx2mxwLjSqUbqPp6bZZNsr/3ZehZ?=
 =?us-ascii?Q?fi1oUOfpsgq5bjf3Vltcud2nTBTMpLaOZrIfEKrK/D0uti3q32qFZqWYw+6a?=
 =?us-ascii?Q?KLbIi7ixbunKnhZpZf5wFDg1w75pi2p867u2IBBCNwbxfRLSBEuJmEOFY5JR?=
 =?us-ascii?Q?ck8mZbt/oHtN7rPo3qCdrI/ZuZe6wczeM5y4rY7jSgp0d1rxxzyHyYYfl8Zt?=
 =?us-ascii?Q?Q5TnteotbbmpZ2dURCE6Aviy6KI2AE0pAaQsMUdJgQomGrr4ZfwXBOe5E8g8?=
 =?us-ascii?Q?B7b8OJHhAX3lz7o0NxHviUBb3JF54Vc8qCd16Xe1CXAY2hKpKsIHu6LMNL0e?=
 =?us-ascii?Q?b5cw5xDr4grXVs/ITt5TZh7mY4FKPKuRYBMiFD7MXIKIOx2PEs7i8A44hIAK?=
 =?us-ascii?Q?t03e254Q8Cjl5kriQE0vFqgYFJBSysultutmYkRDtWOooF9E8Ogt2ZrVQiTJ?=
 =?us-ascii?Q?s1NXeo5BS6NmDcQ59SdPJOfFlQGz/OLqjV6aee0KcwXvf3mVGoWAL/dMOtKm?=
 =?us-ascii?Q?rA4nie+IvFl3z3eXQC6Pg62SPGa4FcLVQXemNem2Z85jSiv9a4bHd94NyG5W?=
 =?us-ascii?Q?t1RUyCUwPjX7Jo+UC7CvJKmlKirUuNAa2c5nvTaZM0jyKb2Wjzn5yTiIvc3w?=
 =?us-ascii?Q?/V4AMk95ROuqrI2dP0+eC1dqzOoxzdPUAA0E0FqByf4j7wU4e69ONNOkEYlw?=
 =?us-ascii?Q?5bhg/pzT6e9iYeFfV2+UDE+NqnRX4hO6jxbdLnnMYB47ZjoNLT18MEl5yTM5?=
 =?us-ascii?Q?CVhoX3aPMw4zQoHcp1dEP7ajxnTiIQoUzuKWR9A7wJXAKXwEHF28TZuDtLJr?=
 =?us-ascii?Q?GN01jpkA7fbxmepz/LWGJgWl6if03IHhLd/sj6F4oLutNgDSFNtx/STPSRor?=
 =?us-ascii?Q?gl90T3koUCqIKfl6NXaHuIDQ/waSg9QD/fXI+LzIFyZXRPwz7vOdzhVpgOkg?=
 =?us-ascii?Q?06/sWKNqClx9/ymUx/FjFddAIMivB08Hl+TXb5mnM7OWuEj1HctL4XU8caHO?=
 =?us-ascii?Q?3n3o8TnLDnqU+hpRfRzNzXSSB4c2GqSJ/i8FbU6W8jxk9IbQbTreOmzRWY5k?=
 =?us-ascii?Q?mVT36QrM5Jk29ASbdJEsTqinpdlxO6qwFTrwme19H4C/VAbXl+YQYtmSh9Mf?=
 =?us-ascii?Q?CtNJ4e0vmpkvEnDQhkyyRI4dLa2QFsNpHbAfmdaTqOiitiPoK8P/Od13Ao0E?=
 =?us-ascii?Q?C4maXNqORNdu5YZXhucqZ6w/FI+Oe2Euro18xteJGFtEkVRyEkERBoN+T1Ns?=
 =?us-ascii?Q?6S+2RA65aDTVNri5D9RgTlkWHkxh3ntRF6b09jwQnR+ypG8Q61HWU2PeC3gW?=
 =?us-ascii?Q?IpONgJxpvgmWgQHiUf/zQvrHIhSdLR9E?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0490b3-f0a3-43ca-9e61-08ded8611c7e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:41:13.9579
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
	TAGGED_FROM(0.00)[bounces-8863-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83ECA6FC04A

Once a hardware pattern is running (PATS=1), writing to the brightness
sysfs attribute only updates the ILED register. The visible output is
ILED x Pattern_PWM / 4095, so the change has little effect and the LED
never returns to steady static operation as the user expects.

The LED1202 has a single global sequencer shared across all channels.
Stopping it in brightness_set() to force static mode would halt running
patterns on all other active LEDs.

Instead, set all 8 PWM slots for the channel to ST1202_PATTERN_PWM_FULL
before writing ILED. With every step at full duty cycle, the output is
ILED x FULL / 4095 = ILED regardless of the sequencer state, without
disturbing other channels.

This also enables basic LED operation without the pattern trigger: with
the trigger set to none, the brightness sysfs attribute fully controls
the LED as a simple on/off device.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b8a571282900..4909985ade04 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -136,6 +136,8 @@ static void st1202_brightness_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
+	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
+		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
 }
 
-- 
2.55.0


