Return-Path: <linux-leds+bounces-8670-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H5TxAAAKNGpELwYAu9opvQ
	(envelope-from <linux-leds+bounces-8670-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:08:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5034D6A11ED
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:08:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="dcz24Ts/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8670-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8670-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EEAD30D3B71
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2F43E00BB;
	Thu, 18 Jun 2026 15:04:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013085.outbound.protection.outlook.com [52.103.51.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9F02F9DA1;
	Thu, 18 Jun 2026 15:04:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795079; cv=fail; b=kcXSzxGrcJGh/nLvKzZMzThORgZ96tmjSc/UVRuuYIEBypSs/mlCJ+911DgiVGb/s/8BpWAl7L0GgMbT12PSabN8DSpyEOhj2Uim1XOFLmDmzeBgm2j1461pBaGH4rG/55owsT6lcFWEuvoDER0fF2kpg1OuaE6HI8sH2rpDivU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795079; c=relaxed/simple;
	bh=bVb4dVLD73vend957cwaOQmJuoqLbQxSTn6m8hkGA2I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eOVsI9qdIHjGzbV2sDAzeGcKgaWII7pCImkbM49iJjs2f8kA6xZwVNrzwjO2VnaBjxGaI3dOki8xhewZvmDWx/nizWi0oTQYjCLr8qme/snTtohJxS/+6uzKI5vz/xrxaXz0Y6CwxWyUTzOXbumoux4E6+UGIfaGafn+LJKttUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dcz24Ts/; arc=fail smtp.client-ip=52.103.51.85
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh8/JYC3Qb+HunyITP7vggnBU/DE9zOg149CB/gQI5XCU0DCKzoN4stTp5XOQyltL26rO1Fo7pHGiXJC0i8V7iLeITC0wALfgrmh0XTfR+apswvQHcxVDng6HWGxRhlxzC8BOoNF2rtkSwTkAjx73xkoFYYBxq+nN9EOnR3/bKJsiNtitlV5IVmZY/oHyk6Xp3iPQXyGr2IwZqJomLplwLoh6fLxSkYhXYpY8hlxdkMK2kbK6hTLyi3fgyjxUsR0NETY1nWMWomFTKw+CNV7LXUxRL0lE2wGNk2Z+UNxhQGMzw+11OWHa9WyskNyl4NPJTyiNxkaB+Kui499mMGcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vcg4OSoMCyykZ21QWBIo8kMUu6Ylq9JH7KgYHtiFdQ=;
 b=vkNMO2Z1zQdhLcx0TYrCBU5q54AQiYLGkf2P1xsFdp1WTuTOvEd4ajDWrw93XJgYH18FQIKOEqJYxVqiEnO3oP4aD7rqxGXpVaJwnaqR3Xww7aWYv6c6dyelBD3QQUF+3+07ha99gVwLbN84iXz8hdISuqgrWE73vut9a1XnzfC2xJDP6XKWNvC71F++2bTkFUraS492D3XI4DK6UrLXQt+Cv0E1uQkzd7DQcB6vhGSVm6JHNhtkvr28iJr9MgUOy+H9omr+h/TTi/GzKzW+fufze3VJhFc3J3XzmLEzftl4CFyTyIE1k5v93U4eIvSPn+/EeYfdo4bi3EpPNO7ljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vcg4OSoMCyykZ21QWBIo8kMUu6Ylq9JH7KgYHtiFdQ=;
 b=dcz24Ts/NbaR3WloMUZYZE49zBawCBfJEKe4il5QRriYaAkmdVJzkolbIqaDHJs38U6yM66q0rkbOFhKxz3J1mAxMhwZPQ12iinpRsKZLI+d3nDNUpKsfbpEfxzJa70R2RoYJshYAO0ZJofIqhg/2EjWSEYOv5XBjC5V1f7jhRJcbDMrWSQe51kwN2hlnc7ec5GHrxICd4fqcW+lH0jTEiesOlU0YQktRfgL53174CoUcM+dP34AtlRNyp49MFB9CBZBqqKSADinmSnuXmNidQSPI/wMAEoIvyEd+Mc6CHJ9obPLD9Yri3jRlkf9JNKsxEtg9J9aQ8HCQ97j+j0d7Q==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAWPR08MB9995.eurprd08.prod.outlook.com (2603:10a6:102:35d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 15:04:35 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 15:04:35 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] leds: st1202: fix spurious pattern sequence start in setup
Date: Thu, 18 Jun 2026 16:04:21 +0100
Message-ID:
 <GV1PR08MB8497AB347C6DE797FF41306DC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618150421.649607-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAWPR08MB9995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7281adc6-4f93-44e1-2124-08decd4ae86c
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR6INxlMQE5iYvaU7k2c6bQL7aGqs6x4c7aWMXEE9qC7CVYI4UJqw2PZKcyKscckSAdwoVan7BDCjfPkoBmVMjL5fxu0oF6xv+WMyyo1ZgHFv3IVcE+DUoMYPJ39sci8wfVV5XCFqTqjVjtE11FGYCidaGK4wfb5vgrEZ6IOFopFCtlzcLMhL5Dl1WngzBCJpfZhWbtvpcr9953DBZrDWRhHR5fsYAxpi2MPnbPx3rhW+fV3TBDOVZNpXWW+j2rCNlyA+MNx77ZdQ0onIhl00V5M3QyyyG3Ar3wKwtgN5ZCcx2iAEBB+p6xLWSE8hMCemPXhFhHOICxYASnn68IfJj/WvxBvVQ9pR6xKodvzN32G1vC/CGC4mi7l+gg769YTfo8zRadsSDrNHaCEjb5N186rUE6+6bejwBRHPbXLEeJ+HkJVc+vNrzHd7j4ND41BKiHO0zJjaL202eX1zHrOv+HhZUuxzWvLCPoZahsZlXEOJ90lYDIwBQrn9QHDZ49GhU8eh8PMqmJoSLxiJhedcXJDKbNboopuJNmtydVdG/JU+g+82iV5vjz70Um9ZvxCjNqgPoW7vnpRMo574HZ103Osku7jam7pVy9HYxVKkV3+YhwtMRZlc0cv9LMJwKxtjZhv+azvIlrfcl7oUYBcLMYB2170CqClILvpYi4H+boJUxLrwvEl+3LgKngKPubcNkC5T5Ca8fT8IKYxyjbNZXIBFh2+z64HjEgl162mlIywo=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|51005399006|37011999003|15080799012|23021999003|5072599009|19110799012|24021099003|8060799015|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RnJU0izYkq2Pf17f7Q3Zyj17WZeib+boudM7x2/Tnqvb+jZaRaNNvK2xWMm3?=
 =?us-ascii?Q?0fqyH3Ktr/XvV25zlCAYqRSzMn3vZQYgCogeC3Nf4VRtscvLBXa7xtaJwk6s?=
 =?us-ascii?Q?YYPVugSdDTYha8ecWh2E7E5p2mQppiClAPtoc14E8hGsj9g+7C1TooWsXLU0?=
 =?us-ascii?Q?42sxoq3qOomUbyZ/koE0IPwL1ZSkjDF+QGKZS9mk+0KenP5KVJ8/0CsDnDzb?=
 =?us-ascii?Q?qqiLQuNFlPkWv0Zo+3q0nQquRwEUCKV6y4t0FvCX6l5ynpqjkEBrA46NpEFa?=
 =?us-ascii?Q?bU3dLd1OkTrTbihQy6RtUFeltvF+8EHxGOARiblyHShBYGvmpHGu49oGdoYu?=
 =?us-ascii?Q?gytF8Mpes7so+Z7GFbCk7fkup9fQFIzkINgWlk5RbHE60PIgC4iQ5+BR77Vx?=
 =?us-ascii?Q?zHbqSQ80tTa6j52wggnJqc4mDo8IoDxIZUkYz6BPeO4xyb8tsvR3wHyhY9fH?=
 =?us-ascii?Q?CHoZPqsDgcHTHF/k2u9UJpTZRPhw/WMvKoMovvtXOfxhDP81+s0St7iBsA4C?=
 =?us-ascii?Q?Kbgdz+SZn9HEyk2bjlSMsR96sUFX0SomZuTJ2BoI7IPFufLkLRKLLMF/yqfQ?=
 =?us-ascii?Q?L2iNqVqdZUHB8Iq9swMyxSlWZBsb+apeBLGudAS5mO/fOUarNYV6Ram50Bd2?=
 =?us-ascii?Q?qiELqhxOBaCKZ8T1VqEG+49fvUqgcExu2a1u6yjDgIY/e4Wu2N6DdCvHrmqz?=
 =?us-ascii?Q?qf4zQ6RU/OqJyhuc6u1i+s2kBipNO8RQ5INybao1zeOaObhuzCa/QYncP5Ms?=
 =?us-ascii?Q?XlpnEJQTnPAKfoY8iBEoNxFD9BxbhnwR7glXtdCIuS8z5G9nncfPyJaixxQX?=
 =?us-ascii?Q?+uOHuXRX8lnIhISkCdQme6TvBl5lE/fZByr05gzO0htrYSYiTsIgNqUkD9qM?=
 =?us-ascii?Q?5gVR2rWpaMycX2bIcd9gV7CPziDuyGLhM8GyR2E/Lchpf/hZha8Af25xy67x?=
 =?us-ascii?Q?uLbXC38GkpfyIvC0/FroJiGdtiR48rrD4bgbVzmsx6Dg5ButZVIBcgh7Q5gy?=
 =?us-ascii?Q?3NbS?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kUBCpLBN8NdHibiugguPl6pMHBbHwR8s7V4m57A/ViACZ24qXtKnR3FkigVK?=
 =?us-ascii?Q?X8WGoSosxg/tkX643qSBfR0ICABZJuvLC3cLMK9vy9659t5zkIpfthWtMNCn?=
 =?us-ascii?Q?Ot6zsKTabNdXwpf8itwgLnO96l33n+T7R0csfgs9ykpo4AE2TlFfzm0pS+WR?=
 =?us-ascii?Q?Mifc836BPsOp5Z38o+XQBdupM7u3O0qkv9vtgyHU9G6Np0mD6v2AX2W0iN/F?=
 =?us-ascii?Q?fLJc/WGFOYuY4Qw7c6dWpBmvTRywwfh0cykhHgZ4IGltpnyMFd5alpANe/7z?=
 =?us-ascii?Q?I+qeidyD/s3EuTKr9cLFi6SQXoisDeU6WBbOINiUM0kf3Ew47OKzaVg8FHav?=
 =?us-ascii?Q?fxHSdsNeXiqIuJf965X4sHWYX6NCLlxlREMXN9LVxaLtO+pxsmzCd/w4FVHi?=
 =?us-ascii?Q?qecydW6SlyCU/P8BDl2Z2c/RFl23d0K8+U5Zr7bI8TfORDWxMQF5ql4SYOwA?=
 =?us-ascii?Q?Z57p8OOPbWzVmX2EgqsGUFHNscOn27yEiCREhjOm5IEdrBjVMvDJVdlZ07Rv?=
 =?us-ascii?Q?clYdjl3xRdaQuEv9JH42xoH9aUJM0Vh7B6917OU47FssDY8M2lvkz6B6yEMb?=
 =?us-ascii?Q?T+Hbdd9sLy2nCv2sGfw+AtONxSu3clYQagnxpm5cA65QKWLrr9hKONbhOHPE?=
 =?us-ascii?Q?N0sH0K8+7Hztxvo1Td4ulR7oJux3WljCkLtaR1bhnmR+GFPsExqOcm/u15Hb?=
 =?us-ascii?Q?o1KP+9kjStKhK/38VmsxQ4Kz0AjuivKCBABGj/z9tIYhmuEWQIWv+OtfiwNt?=
 =?us-ascii?Q?p6BxMP89B1tvfuN3A1gQcOJt78zTLI6vMRbiux5Ssg+fZRpk9C/UAAXkK7v4?=
 =?us-ascii?Q?UEOa0o0qeuEFnrTGxE5kgoGeucczRW2YkbMqmfPWIUihi8STQ1KxJHc5LCKg?=
 =?us-ascii?Q?vAuearwy6e/UxTe0hretEKFjdaYFzdkeyc0iT4bRs/SL6ymkerSErGkYWq8C?=
 =?us-ascii?Q?GS9i2k26prCZsW4Q3ee5DKjsufOeUt3lZg532ee96pr9c5l/9agC3DW5fBxj?=
 =?us-ascii?Q?upOfDwsyJNu76iCL13DcbL3+XjlWVh+s+lGLpTkjL5LZy9+hrisqijX3Ciip?=
 =?us-ascii?Q?fTr8uVXf9ykvbVlG30nviKHJgN8C2jNAGTtJ3LcKelA5t2Av4PkooeQ03JTJ?=
 =?us-ascii?Q?LGceRAsqT20cs3QOqrxLwNbPoz7SaDrdTb/1cNtKi3FBsBnM7bXM2yHbgIkF?=
 =?us-ascii?Q?BmMVwYh7RBQ9MBogEp6OjckseWqZWNjgeLw8w0DdUUk0Yn45+ZdXNiDyfdsO?=
 =?us-ascii?Q?9RX5LUC9HEpWiPf+3qW7u7bmpoTL3/GjI26XOPMyGmGEg6Bmjw4HGCOMgbZa?=
 =?us-ascii?Q?n3eaLgEcfFv0SjTO54m6Rc40DQBEnJK3MRbjlg8hfBhKFDYbozhxPYFjoTyo?=
 =?us-ascii?Q?WEozGrihR1XA61dBsYzkR2D9jUgspE22jbATeaFzjgRqSrQ4Z3xH0FwbJxob?=
 =?us-ascii?Q?7gHncuwnlZj721AMDGFGi90E5hiWBdBn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7281adc6-4f93-44e1-2124-08decd4ae86c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:04:34.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9995
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8670-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5034D6A11ED

st1202_setup() writes PATS and PATSR to the Configuration register as
its final step, which starts the hardware pattern sequencer during
device probe before any patterns have been programmed. This causes the
device to run a sequence with whatever values happen to be in the
pattern registers at the time.

Remove the write. The device reset at the start of setup restores all
registers to their power-on defaults, leaving PATS and PATSR cleared.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b32d8e716372..168d14566c1a 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -341,11 +341,6 @@ static int st1202_setup(struct st1202_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
-				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.54.0


