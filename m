Return-Path: <linux-leds+bounces-8507-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qRPgExTiImoaewEAu9opvQ
	(envelope-from <linux-leds+bounces-8507-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:49:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A181648FC2
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:49:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="rfviGl/8";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8507-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8507-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 225CC30B7F58
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4A33B7B8C;
	Fri,  5 Jun 2026 14:41:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011031.outbound.protection.outlook.com [52.103.39.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74910287510;
	Fri,  5 Jun 2026 14:41:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670473; cv=fail; b=m5SgxT4duQ4Q2WlKPejusnKhVkH7KBpLCp+u/imUXt5l/492Qs+Dv741mv0ivN2O7lVwpvSByXC3Wesk1mvAlqI7ftswD8RuRaZSjGpiM9Nab4U58FEDNoMZpXu1lHnG3QKHRDE2exAXpHdKenHCdL5JPepsz2HWMjmmpYoz2XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670473; c=relaxed/simple;
	bh=xqMqisMqvejSed4suE42ZIO3nxbqdoRMyOvXAxUgO7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LrGTpguvHYy85D+vRg2NQPxRcK+HPsWKH8aHnsTUzydZOfOjrwZsqvAhAP4xV7u0AmeezOXiz9+C02/34NPXHoFmddSzHorOsDiMaH0H/zpmom5L4zi7jnhKbg8y/aYoWRhafZ0CKDCrnLsJaw/GxA1RNF2cGMsnr/UB+rC5ICA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rfviGl/8; arc=fail smtp.client-ip=52.103.39.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO3eA68OMAVilpBI2jqc0jttwWVrpmkWAdXxF3w2LWWcRYF8mPNuBrP1epNy5w/HeCVOTzce5niYnRsyx3SRMpqb27RNwvQD4veM1sixeDRnsy3vmotpcQ/p8JdSSjqVxuLbUzUsbLfa2vN3qy79EEQ/IAcbLlF0wbwmKxWrLZBEPUhee868yke/sNjmWynfFyTsRr/5waNeawtNiBBxTgFK7qZPs7Rrm8vMGe3k3g5FnpGNy2kS9mHNxsRdoqW2id4bcbW8n4cwIhoFvIasmmnlPpmpsxb1QV+Mqo8Wrj1ePd8vfb2562s6PxVWbHnTccctkdoHOb0qit8JF/n8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqMqisMqvejSed4suE42ZIO3nxbqdoRMyOvXAxUgO7k=;
 b=AeIULzg7iFi9Htws57qEaNtQcWg3GhmYMlA229bFOtysQT/PzWmTHFBG7qdwFq0oSrfcDWAqgZfXJR5LFYrqZmwvkL83W/BHuCXQ+K110IcCE4SUmKLqJeXMdIc2WA2EY06SXnwqx+CL/LE2KsB+dippgEAAN8ilgYneGoTUtyuBOs8xM0TmnyTqBfnRy009DeL1plOeODYjdkz7op/aB69bYJNvSmAKMZ2rgppAf8yR4CYh04Q2z/73RoWXbY0WPtqj7C8HRx4XPYrkssWVotXhUX0H1sT8HPyNYq33ie3S7tKJeByOTnkTU9hIUz9hu9GSU9KEkO+HglSimWIwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqMqisMqvejSed4suE42ZIO3nxbqdoRMyOvXAxUgO7k=;
 b=rfviGl/82rxoKw3dgbP/e4U/vdYnu5+oG2/QEkGL3vHSoCtSqmhLmHUWuzjfuIoaf1qgBf0eb1acoGOaTwfXiHTDT2ogQqWRLHbpu625lVsgXasUw8CYjspUhClYOz0ZvXjQlgowFQ2/doDVtS5kZBZ9dxpVUcBquexn+5wEVZkNnkdjQL80nY5gmji8Mb21J92HRSdRprrEPZbcjh4JiFOdUWWEbqW4001QuIEVgb5LAoG7R52xi8HObcLFKH/c+8fDByyTBYAGtDEAAKe9TwroFv9ONe30WR5ZxqUYe+OnuWbz+FoaG5LP4CChpcXMr+yNnHfsw8mTczXF2OKk3A==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8195.eurprd08.prod.outlook.com (2603:10a6:150:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:41:08 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:41:08 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Fri,  5 Jun 2026 15:40:55 +0100
Message-ID:
 <GV1PR08MB8497E0AAAD89E83C7ABAED04C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604152016.GC4151951@google.com>
References: <20260604152016.GC4151951@google.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605144056.1647751-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7435e1-0801-490b-c78e-08dec3107ad8
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4UIQZfVg9R2HPmJUwrk0jNp16dkJcTZr0UDoZbmDUlNl7mkqdUE8DXxBovQ2bVaMTjkc0jsr+8R0wCVsfCFZ0Q6cgLv4LuviLZZli4m00ruCPAT2FXV707u8waUDyLqkpBjD74ZbfBD57hWqTj13uqAnyXP+hXQzMGzHmvE8lUis0ZFiGI27P0pskA6oolBIWxpwjnzeHROpt7EAkNLv1Wkc1xPCdU/i5P89vUjhvdLcZIXNF66CgogFDoK+JS5mV/nGDssN8gWKictxI85+UlHnEO7O9GcQLcgDp8LSK/X71FIai0AdTxfUqf9cCxt9NVNWWBIpcVNQLIOfueWeniLTE/O/ayDpZ3sp0wpDmEJfr/wiyPVk447MKjTxSnpWHb6lCegLFMyHKBFgotgVig1B1YftSeGhNxwG/m/s3fFTbwRNvVJ9UcdGgMjfjfJfgxNsoUpmpLQB2YyvVDvO7dMzMKu/D+5v01U761XoJajdW4b5H0VjdflT3d91/unhDOUOS9u76FkgtEydnfuI9vIWFdfGYpTswqQ1OcWAICCdsufUzw0zzbGtdzTXJhhqSW5K/YimT113jcjE4+GThGIIjCnvD9+H6f70JZDSjsGGLJpoixa3XWkZKyVsXYGg+YWohQZwuewwvJQqo9nWMNBqA5+WGyH5Boqln/OT1AsPzvbrRlgkxraHNz8gldzcflNN5gRx3OKI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999013|19110799012|23021999003|51005399006|15080799012|5072599009|55001999006|8060799015|16051099003|24021099003|37011999003|10035399007|3412199025|4302099013|440099028|1602099012|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pQXXYtJEPie4CYTbT0khZNqF5A28NxlFKTLpHJMTYu2PLhMPkBvmL2LF5Gfa?=
 =?us-ascii?Q?HSjPVHtrpSsth+kaG5Q6XCW08gvlWr1QitcWSDJky4DzMaqmJ8LvqnmmW/W+?=
 =?us-ascii?Q?ipmHLBeDnQvU0e1K0xyTJbP0RoCf0y8kcU0Odt/rro+CdrfM2NJS23tR+4CH?=
 =?us-ascii?Q?jRcbzCoBs+hKhPS421ZNoMJRNbXPDF46HoG8Itfz7RPL8CuGdqy+Tbxx3I89?=
 =?us-ascii?Q?z+J7IpqTrnHLerDQzQw7NJqnHK0i1PXCEZ3izfTbihxdXCIpxXjH6VkmyOGU?=
 =?us-ascii?Q?LYLPZdZmMVUc0z6p5oPCojmaoQG97rsyGmaKVxMFuaWibdHHEN5177MnChky?=
 =?us-ascii?Q?Rcf1tDe8vuHEnuzBrI4/7dNq+8FRsurBO0vW7FVifi+qDaq00PQ4Vl3oxuRl?=
 =?us-ascii?Q?7/D1ki0gh+ti10ihB29HSA4eXagm/t+MKZ2PWL+FSkJXQ0ySUUjzsTQQM7LX?=
 =?us-ascii?Q?Ih9+mHCIJ4AjZFAyMq0z5trA416lAvuK6TY3mHATcXUMzDvIz7JfjYgpRAj6?=
 =?us-ascii?Q?8/Jhznu0Bp8WBgeKOYAeLEjzoaBNHU8/H22TfFKpzPwIBs0+MRUaFqfg8Hrc?=
 =?us-ascii?Q?6xMrwcd2VuFBFKAlThrvMddQh+0jtnmoorzAj/DtrsLSbiNudpzMLGL6gl1T?=
 =?us-ascii?Q?jB4EfM+H5iXXyGnks8zj6wIz8bdFeJdhSCcWbawCpqz/7vGr3obLJHtwqhMX?=
 =?us-ascii?Q?zqdwR0VmNION3memxUvsvPw9j+CRwFGyFiaOzJt2MDhLCVN79Xpf1L+bdwIm?=
 =?us-ascii?Q?G+c+I+IrXTZ4kDSEWW/QWmrLovnHCcJadI4CkXe56Mdvhg0vo2pbO1ddtw5v?=
 =?us-ascii?Q?hU8KeYVPZV1HqxoR5HeIrOhg8VUo7GbrdpOWvElqnDU/AG4YMz+pUVls5P2M?=
 =?us-ascii?Q?5voltkesXicQfPUg4FP7ENzPd/BNbcvD4Ro7RWn5r8cTvm+PyGMfINb8uma+?=
 =?us-ascii?Q?SbX+wY6H6Ex9jtC2OEIlUUU5d0lWU4bt5vHQ0IpwNTDNCqcq9ulCo/tZFcwF?=
 =?us-ascii?Q?GwSEHR5vkKJr4OVfVqwBg+0BMS32LnfL4YRFtscAQW1wT9EnKs2MOMgr8pez?=
 =?us-ascii?Q?rmr6mz0+wF4RntqQ0FX0YfDlrKMM9ethEDIB2mHddwRGRkGMHqOFYV2MghxS?=
 =?us-ascii?Q?0HjUNHJQ18OUZKdoU6CQmk4/SDjTDwplgvmz6LDkhSOkh0Hw/EhW9Ls=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ivlGdLqwjgvledX/JAJmAwuyIOQyHAzbI4KaGvnK51uKe17/1N/01bJV/jg?=
 =?us-ascii?Q?eY+MDpZ2xS4B8Op3V3VhRlq5HQd3voGw5qcVAbJfcE9KszHlb9qvaU1QD2VF?=
 =?us-ascii?Q?hb0x3mM6V9UWbxueFI0PpCq00KJCX56xipy5WEecTsXhbRsrImXCCurya+hk?=
 =?us-ascii?Q?c5KzkApE0YSCpk4Gts/4NDz/hxxtCcD9MJTK4WzNGYkCyNUFV5OSSLRhLsBx?=
 =?us-ascii?Q?oKYUlMA+y3c6OyS1rJUvnm/9i17VSnoE8u1N879oqHnl3H00qmuVQU3SC3AL?=
 =?us-ascii?Q?r9O1AcAbAUwLVMzLaZEDHfhtRZwqvIkBKkIVQfLFApEnC8AAJ5khuLbzpGg5?=
 =?us-ascii?Q?eJ+ySdTxTYLygG6hylWq2KsDvZYCkTMQ5C4BIHRU6XXwgj5P+EK0+BY2nZo9?=
 =?us-ascii?Q?hz9rIxeAHdPkoJwL6A611E1JWZtpB+3rNp1tT8Lj5TlCbBbfqbb5Rs7EZBJF?=
 =?us-ascii?Q?4mQlZ4+nMDDqUGCXFCpqVEZqeBG9DL0Z6bpzgCgKsod0pi9fyd/byVBD+avm?=
 =?us-ascii?Q?ffOMK0wYVVYCHNEg+kOhkDz+CI5RXwH8xJhIM8TstaMZ3KVNAyjodtm7zJia?=
 =?us-ascii?Q?ewz7z8rckUvXRW2e4rL/UjayqtQp1m2w3kQIShPaZYLMU7PXbr6lhufVq5J5?=
 =?us-ascii?Q?gTz4cm0WQg5gX2Ki0medW398dogl2abtf7GzmortQTy9tZNLpwQOk7GKWrlU?=
 =?us-ascii?Q?oGVAByKefOdjcAzt4h0b8PbHwSsta8n0TPVR0TQ+dQpaTxSiT+nwSPQL8S9e?=
 =?us-ascii?Q?sXnVcZkE4dESfZnHR0KUeYEGVjSkXhcwAgNQQT6Ncw2YeRDWV/khSz6+ySdu?=
 =?us-ascii?Q?aekgkZaOQccVWYtjPDUUDTbKcnbvmyX3M7Uwmh0O+tDxje555q9QVzWZLXuD?=
 =?us-ascii?Q?SIrKsqmQP89hso/54WuFkMmNBO7CuJIArW/8G2Ta0KeSIUn8Q/SJTeJ3zyB1?=
 =?us-ascii?Q?+vo4RR4w4puPVrPBWcIGF4kFfeYE3PkeoV6JQoPipCm+Aw/M3U7A7V+EUcJH?=
 =?us-ascii?Q?tEdHZOl8d+w6ZDSlk8qYTzNY+JtHquFEn2d22+RduHj6UcbiEd6y+dSC5y0m?=
 =?us-ascii?Q?oiK1yxMlETCTiVGYTFlOo4vQCG8kURducxsq6UQiuulJIXyMcmqttMfHVXIB?=
 =?us-ascii?Q?4CQJn1ujj8hdgsyL883sC45hu7uHjEG/EmybVActqxdKCngKRMWpYllHXrio?=
 =?us-ascii?Q?1cpsQcoSo+h5RkpIj4YcZPTWymKnWgK9ip4+23lf9SrdEj3Rur4T4KELYMVk?=
 =?us-ascii?Q?I8ba8r8XZw4nUcPW8tK9e+0zHalUQQZNTrP+9NH9Eo0PlaHC9PM4iIfOzl08?=
 =?us-ascii?Q?tb0PlTGiEPVCa9SgkedwfBiI1Zlllv7cAf1Y4Bhti4mzyua5rhdGSprJx/4A?=
 =?us-ascii?Q?3vJeWze+HpYikK5PeHBsVJPQtTKsXf5KKg73TXyJJyuOhVJxw75HmWDYvG/m?=
 =?us-ascii?Q?zo7oibMCRFi8VY7c0RfkFpMw+KF2gq5d?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7435e1-0801-490b-c78e-08dec3107ad8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:41:08.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8195
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
	TAGGED_FROM(0.00)[bounces-8507-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A181648FC2

Thank you for looking into this. I have sent a v3 addressing the Sashiko
feedback:

https://lore.kernel.org/all/GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com

The changes specific to this series and a trivial bounds check have been
addressed. The remaining pre-existing issues flagged by Sashiko are outside
the scope of this series and I intend to look at them separately in due course.

--
Manuel Fombuena


