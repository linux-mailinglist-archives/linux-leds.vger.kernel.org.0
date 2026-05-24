Return-Path: <linux-leds+bounces-8305-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEBWGQh8E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8305-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:30:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6C5C493F
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CDBD300651E
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F432FE060;
	Sun, 24 May 2026 22:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rPI4oZbv"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19010015.outbound.protection.outlook.com [52.103.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FD487BE;
	Sun, 24 May 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661828; cv=fail; b=OlSRm/SA2HV75/VjP943+xORujflVXojzNpfKZuPRz+RyYcDrLneRWIWme/QqGHvSWDPPvkZAb7pMi8K4gijmSCuOZZXZoWvUG7M7eyIC40uA4n4sstrvsnc2hqq0BDFjn8ogCJtSizQQN58MP8DclEQerUoab4HBU23uUvtm08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661828; c=relaxed/simple;
	bh=qAD2X8qlfIKCWXQkcwlcS80uoJxGRIy9oBW16ELni7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QWm+aZVRC0UX5YUUW0nWFggRD5UM8j4abjiPSgEwT4kxnDVcUCRbzn7xUCvL4dh8FLmZ5uvJ1GnMV9ss2KSYh7GN29lDfGcrdpRFYtmcLkUydDUqzpMOoBud7m6IX1gr7NmHBsr44we7NyIMOcivhx9VIXWmQjG5pvY7E5ENyCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rPI4oZbv; arc=fail smtp.client-ip=52.103.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwvcvEz+OmkJDCgm0E1EXqF3CONClCp/mF41WidCZAEZX/VkJ30d9BaNHBG63/Y7TABK2CGSdHNEcfkbuailu6JVYTShYHSo8hHYM4j3zn3V7WGVeft7t/k1KZSigf3t+LrYizT5ftLgORqlD9DGdF0mCaP1XhxGo/G1BL+JSW5CQi0qMReASuvQHERN/wI0X4fTAmglSKz9KLm+yKK0wu+4mW6r4Rra62uZ4DiprNJpRs/LbqwQk+t+lmZbnx0AvZIlKtNZvcpap5HIj459cUeNTEpj0awT55QCWdN4ZwnKLBSjhbAem4Bd++vWjMt10Hy+ByAdfsjAAVqdc8zUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW2Xc39MAvnYk3TKXNpIpQmjzwz71UOAOA9Ni8Bb8iU=;
 b=Kj7ICeFwzL8yHY8NGMVA23cd4++SxOgsNaMBpolJ6V9mdIGr/sGMQJND0F05meJHAjxhyv9xRXzi9t9P+ry/7fopO1g87LqxWTJ5gCcg7nVFFY/mA5OFea8GatoBEDCWCPwkNjUvp0LK1EHBdZbKTYM2vtxt3+d5l6JaKq5hnbw20CfjKW7iLP8tVCmQ/zNPhTYo3yzLQgf2c5JuJBq/ovtWAl5jgUuhOxxI7qU9QQg3UPoQ8LOyt4GiXRXaoSn4fxHlOtkebgdTevvUL2lgdFO9gwhcEqKMtC1buALXNtN9r2qkcFzchlY2t42BBqEHqhuX/c9oyzi33blK+WcAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW2Xc39MAvnYk3TKXNpIpQmjzwz71UOAOA9Ni8Bb8iU=;
 b=rPI4oZbv47v29crbWjFUW88DvZ7ikUtIWCi2sD8bl3EcUgZfU3VpjSvxPxVUQGm0Kg5hTV+qscoDx3t2sLKK3cURF39iMu1l97WbYRb19xTO5Yt0XvgiqPxkhHCoh8d15J+lLkdlAaXo4tYrmDmhtNAf5wfVuIv3xHi2Wh6GKTI2ntY5pM8pzvp45J86b2QuPcfMm9WA725Fd4/ofYYg58YI2WaEl5rSOR78C09FuWsD6N6N+8eNRj8AJbExqqE5vjp0DQ/Q8p7YBOPPyL23HUf1Xlam1W5IJEZYUiNYLuJ23CqqKwRMcaCkksf+XSAfwbJoGN5mhvHYu6lrmSO22Q==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0195.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.16; Sun, 24 May 2026 22:30:24 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:30:24 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] leds: st1202: disable channel when brightness is set to zero
Date: Sun, 24 May 2026 23:30:11 +0100
Message-ID:
 <WA0P291MB03857AF419D28DDBD8BD2FEDC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524223011.393542-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0195:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cf03d0-ce8c-4afd-6b80-08deb9e40bf4
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayEFd6bE9WNU4GTjq5AfDX0kjlb/xELsEbJhOi5tITJzHfqL0DUsQiaVURwqaYB5Ncss74/q0cZUz5a7QTDzvcNSjNGgPm775Fqjcd/iBIXxxdWqJW3/pKJhyfyKo7M4f+fXlbVH7LPA6T9BCfdM7yij7GmphocA7vJlTexbeoIQV/fV38+xhCBt4BI/nj/WYFvoyeS6k/d3UlHs83h7kwzrgUoTDktlXPutRoXPDUeReJFBOATeNR6MYmN9sW5Si1X4GHDubgBCCgwssnkl2hCiqjmmjZHbpplSeNf1Xi2fDzN5XDg7AjKuZTW9llUWLkD/MwsKU1IxUNbmVhKjQTaini9XbRELxbmxOLSeXmkDe6jAcLyliyP/ghj+ZFD2CBmC9V1z9HwlqxZBFti1LBd/xa1FRhiFJMqgnsugnrcw18L6PiZDN1ahaLisCD2l3qzoFi9gMVbxtqkXiKSjcdhrCCTrGm6IQFZb7pmvjtiV86JLjxC2L3ZWh+nSKcI6mgumlLanmkTU0vQACV9qP5LE/BF8MNxObF/mbXVskwhzNXis8wII10FRzO/JIieqDzJDuYAUDUC6HgmNJ7FJP2H2uS6p0wXhXw67QFn0eVw7TL4XRABfEYObopVnxFUyjCXEUPY+8tUp5eU0KSmzJlpbTd2SwWA/9sJmgDU2BwZEF9aeyFG3W+WFGvxQGIwKdwWXS7KH2exL5s+71MkwbD5ZEIwj3CW+cf0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|37011999003|55001999006|15080799012|5072599009|41001999006|8060799015|19110799012|24021099003|23021999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?moIcdFKkFgylnbJBYweeIHlUvkezuEIKL64bxtxSWg+KEdwtZe5Aa1C+6UQM?=
 =?us-ascii?Q?5VlFfHK8rQIiYgAi27GLb5Bmjsy0rrXYkH/sqt9/0aOQg4vYqdQR0g8jnRr9?=
 =?us-ascii?Q?w53+aAhyILisXkCidUvkEEHzipARNY16TFKjMWXjk+UGN5THJAjS9MtGPJYy?=
 =?us-ascii?Q?e8z5fVtXnWhbty6Z90e+IaT8Ok9z+PUKPLaVshIjLIDJtXMwnlI/5ftq5lEh?=
 =?us-ascii?Q?1CWyQ/FVyA8QaZV1RipcorSfgIkBqzugy5edrbS/eYmIIaxsjurQXFblUjlO?=
 =?us-ascii?Q?hf/hAGFFzLjNW62b6tH0ktEKxxAGveeMxvsC+FYLgh4b58PCoIJoeRwMG4Jn?=
 =?us-ascii?Q?5MP9pyALJhT+XlNiXBcx2rqdGS/2Z+Ixma6vRx5xLh/KCCwnd8pZqxSjSJZL?=
 =?us-ascii?Q?5EvOcuexHnlRtpTVEIwbgYh4333ixvrsZRMfW134DyHNFoNJ1JGvo610iM8t?=
 =?us-ascii?Q?8T+9MB4GxIDLXhEYKcYJVjNjhx1Fr0FYtWL2jyaepDN93ubnwJhV5jynHKHz?=
 =?us-ascii?Q?3I+yBbKszpjXbbWCa1FMTkp6hdlnDsnvXdEnl8Y7re6TMOfEIyOHnnpcw7jj?=
 =?us-ascii?Q?PgXke8aEfby+ejZVFgAscd9qHL91CtO09xyeBf6Waku1u/EASK/wR4XXVz8Z?=
 =?us-ascii?Q?M+NHOqr0cDn3rHQP4BgFnoYc2oAS86/puP3Jlcla2Gw+Zuy3MTang1lyEXB7?=
 =?us-ascii?Q?PL9l2D7v4/hI7AHNljDXBJo0Dum15joyjlxrvIi804Xcli6t6n1QXe5NkBSi?=
 =?us-ascii?Q?VtIJqT/Ncia4/fHZW3zMwkFingyc6I3UJlVge/+lGQGJPuhVLYC2m2cjY8Zj?=
 =?us-ascii?Q?zJ8xO3uG9edYi7v4gEiNA42xZOIatap8QagvoCsh1sisdgLn3T4ECuc3tYi0?=
 =?us-ascii?Q?ZmemDALbPiRaj0vODeKrjxQYMmeLeN+H64ZE97n+0luxOJ+RoSEmDWsPtUZc?=
 =?us-ascii?Q?Pu+KjsXnMpcx5uoOcpOxgYffSDmagF4ktvTHuvv4XFhWWfLMKjaSAJ0/MzoQ?=
 =?us-ascii?Q?sM+YmUKVd2m4qtBroQp+lVDHQjwGZYYH9ncwr4W+fAT2hYU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kUzV7UEinc0ejtF7gB0sBr0VVb1RScHvnrXONBAWCYtLB9o0U+bx7sVGb/xw?=
 =?us-ascii?Q?n2R9ArlMbkj+lN/uFCBejUXYWWDJXuTmjvFkCV5tRpzGzNnILt7stvSpyyEo?=
 =?us-ascii?Q?H92/acanhBx4+/OvNuuKli/bBmUcbrMKu5oZ+bIRiEFyPOte+bOWfNzJOqOu?=
 =?us-ascii?Q?Alxgw8CN8r4R0WTcUvrVfK314Z8OGqmCJ66pEvCV6ggt6EGK3bRBcDtpsySl?=
 =?us-ascii?Q?6qlS8OuiD55aIKa5IPlzNWbq6BxO72Dhcs12TEjEJ6cG9zpbDs8eBff6V1Vp?=
 =?us-ascii?Q?OFPX1ljW2Kbg5LvwimrPCHb/6WMDBWP0LES8b/lckags/2yVfqDYqx8nQs+T?=
 =?us-ascii?Q?YgerwbScuYK/zANEJEEOXXIdLU4xBob5u7UaxOnCFU1LR5wEZfqrMryGf+77?=
 =?us-ascii?Q?8VAw1wOfX427T4EjJgroKDllFwzOE7Btudf5T+fxrXuezKi4pqgmgORgesdw?=
 =?us-ascii?Q?v3mIUmlL9DxdAF1oej88FOMEbo1Bcep/6N27Ko7eUk/+J3H2QaHpTm8u22QS?=
 =?us-ascii?Q?gOJ2YO57SOu91iq4OOAEQvENnfc7wDvyHbEXbAv03Q6igiByAf/VkqNUYE+b?=
 =?us-ascii?Q?DAEu5adyhMDjJyT4AHVKUs8AfeYEU+nkHvtm/cvY+lJSzsTiJg3tpeA51az3?=
 =?us-ascii?Q?6/wooQrBDp1bnZERnouFgVWDDQc0depDZ3t8NeRQIfaRtJ3xm38PI14JVaIm?=
 =?us-ascii?Q?4KXAkyrBNW8hoOfsCPH3896oOGadbP1Zbamm+axiNAxwEqhOFw1LbzirJecx?=
 =?us-ascii?Q?7cLh1e2zWr2SrGwecpYJJhlXEU5pYapC20+/xXSBfTD+e67+JOFsWQGneSET?=
 =?us-ascii?Q?hQlJNS2ciptLzOOrD+FUi8jrxyGGiSPx8gd9BxDBj+oaF8SSyv5K52MBAtxn?=
 =?us-ascii?Q?qRGRV4Z0G7WDMu5EH97EW9d+bGOUPPNmS32+eDeXGYpFJ2K6ou0jJBdFrIZT?=
 =?us-ascii?Q?3vYsf5DxkXUImwgPILThQDFuKTzTu7ndkgW2QfWNCqf0QhzfukvYx6lm9cXV?=
 =?us-ascii?Q?T2ZjxQrQuctRrXK60zkir3Q4pw1k1aqYHPyytynrEMvLmfbFzxmIW4liyFOf?=
 =?us-ascii?Q?MWHBBnNtb1fodiRugHxed/oMbDxf47N2yJaasH/CijnAM18bZGUpTpANkEjp?=
 =?us-ascii?Q?jX1b2Bnwr3Nr130T96Cxt4ZG2vN3ja1sAS5C769zPe5FdOoz+xH5d+l8UnG+?=
 =?us-ascii?Q?ILhkXqBLrEShVHxaNdIDG9kROXx3XHU/WutHwiU+ixSjV15O4TuZq+j1MNnF?=
 =?us-ascii?Q?lUnEXO/wdSz5c7uYWMYqUTN91F4NRmITJjHaO/kkGesIHgxg3A5fSkGK9G+b?=
 =?us-ascii?Q?QtxwYvdhJ2osOEYpdMnHv/sEG6dK/2nuLw3JyELk6394Wb4a3oGU4rFUFvQx?=
 =?us-ascii?Q?xS2X4wc8oaqh+xdQNAZOQLZ1n5dUWSAU+01tCb9LzH85Aw9lhmp6LqVrspue?=
 =?us-ascii?Q?h1o4KGjqY3Xz6z+D01tZxZKOigtk2eqT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cf03d0-ce8c-4afd-6b80-08deb9e40bf4
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:30:24.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0195
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8305-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D8F6C5C493F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index bca2d9a80b63..a3f9057408e1 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,38 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -187,6 +160,39 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
-- 
2.54.0


