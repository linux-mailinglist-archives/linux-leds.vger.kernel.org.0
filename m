Return-Path: <linux-leds+bounces-8684-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 59Q7FVdYNGoEVgYAu9opvQ
	(envelope-from <linux-leds+bounces-8684-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:43:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B96A2A65
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:43:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="i/lFoBrf";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8684-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8684-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6901E3007E19
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C32343D8A;
	Thu, 18 Jun 2026 20:43:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012011.outbound.protection.outlook.com [52.103.32.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7732D0605;
	Thu, 18 Jun 2026 20:42:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815380; cv=fail; b=kGVcAKRGfei5XlEQtB7R790UZfqcHdouukG3x881fBCm8/t1FZgCATyx9blKMjIYYQQaVJr6y+quUbfebtkxmZxJ7fPzMVDMfSY3ztsommI3Ya981Fc5dWO2GR16/TxqrJW58BQtL8f9sw1Mb8z/zos5tfU2ZqGmyfmd3YhLNH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815380; c=relaxed/simple;
	bh=2zfe6zbAFR+zEWd85z604M6BDQtc8vNMH/lm0F5FFZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PAvC9sqKQeXMPUDvXUeJwCzifc1unhFn+4A3EkOp9V0wM9IehWSTkb/zF9L8kOtUkcXLI/2/sUU9rDKZ5iu+g/Fhhxfz6HLxdfbItJg4RdMX3Bq9L2ehp9uMITSz5AqV+jZCh0Lk1a1wkcB2AlIKJa2NwE81jgoliqtflOzdKAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=i/lFoBrf; arc=fail smtp.client-ip=52.103.32.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeeEsyU2mQn7ojwRb/EDYOlFeGQdrSbAMVbZdez1OvG3wDZS5hAAKiBcM5F7nBPatL5lqvph2Sg3V3hBwRDPdnR3kxRmSgO9gnKl3+cy+bTkcoeifLGLL3AEl4UvlZNWtB6cBBJS+5kP9nRIxOaQAjoRHSIANIZ5j+zWVjfM1AcgcuXP9fAwzAM7OrmrVCT46COMOMScsgYUcjokazBABwV+uZCWBfM+kU+liaxOz7ot72DB8c4RTOS5NwWzC2ehDr3/O4l6qQOqWL6R40xN01hb1FZd0zs95w3EtkqT50XPYDDq419J30/+CFVWcFaoeSGPYFWiaMUKPPBWy9fbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=tZovkUGs0+R+to8XP8DkId4ohKzpg8GjH7fyB6VwH4LY9gHVpVeKSxSaQaj7OEGYPJGI12sdgCRTvG3hPapSm7/5zy3fsY6xA/XFCmjW+aCVfNosNcvt7WBys23lxkznakWCm9MR84ttvBDCpri6lKZ/knnWJLU6vjIsEvWDXpSJiYOBd7MAduQoOmtsYOYzKkvjT25kBQ2IYcAlJ+AEAOO34b5pBd7vbxOdzEyJ7f9bRrq1lWCy8Rk3E8ujdohzoR3rwBIDsUkWaIw87KQaTbWTMOvAAdera3x96vW4l1nSM5fdaZtSKa5fjDKxzdrOO5tjctvw+xOWsTRhCf2zNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=i/lFoBrfNQkm3ZhO35A+4bfH/iLqxxsQwuxgo0I6ZCh5y4s4FaPZ3YkMWGoOlrHY3WofZYJWMbiG2Fv1NZJCIJclYrtnPH903UaiYJ86LeqNH4WqF9uMZAII50MVIhqWkfu/baQ4Nk2kMaZod2cuITx8G6Y6tQ6Kp+VQHk1EuEUoZb+qfWHH/nJ50oNItRVpv8PneGSvIXRpaYoF3GI3BfA2TVkydMRQJ2Z/lN90HdL1M5JkhbllLgoi9ZodA/SUKOjBLtP4DAu0AtExT7qhpC2CXhJVEwFzPU88n1D9WrGNMwfNJi/728cLx2GjypbBMXHDMszjpCJRvlFH3J9EHw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7812.eurprd08.prod.outlook.com (2603:10a6:10:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 20:42:56 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:42:56 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] leds: st1202: correct and extend hw_pattern documentation
Date: Thu, 18 Jun 2026 21:42:39 +0100
Message-ID:
 <GV1PR08MB8497D935DC6F9DF8F5D7B97BC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618204239.3359613-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad5f623-56f8-4197-45ee-08decd7a2d4e
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR6PHCjnzsIAw6NxEVRJnHq5QEiqHor/TL9DzYXm0xnU1wiA+YIyeYq2AmXGcrjaEfyZ16Dn04naMp/XNHvASoLxrk6nVA/fKYEh7a9deIhyRh9H9i8/EChVPgzvnjhmXA+xU6Apl0pzfeGSSuFf7q2V4feAzIkB9YYXzPKnSJ7Uupn6btWHe34SKo9urudrkduiipWYUO2R03Jgn4QcGf4nwp31VhvCLN8iBrh2i6sMqDDfnWg+FptvYK+yY9y2rCblE7re6EBMEdUF90CR6oPyyJkfnIqXbhr3gRyTSNp5lfYHu6vfnlkwZbpLkVRIGcOPpV90nZSZSPKu1PHqgSwyhy+zkZZT0jolBh9wnxp6i661AUu6YN5zw6rVGb8Z0DvxmZ2iBAwI1Egrg0gMPe+AdGds67nJ1uChI7O0OLVgR0irISE6qQN8cvyurp05jlQiw4bGPOE++kZXquQIZYQSUpYjM25gzUz5PlBK9HNxD0IKq+SrRk3g0EGjO4BEFQKZKUy+pRPT+H7lY19mHyJPmjoCQMZIYNZ2V/DYhV+lrNC34SPlduToFhdDJhDCidyNUPI3U4LQ5EDzzMidXEf1qw9ybkswv0kGbsUFw6KqwZwasNbHSKiD2Gd3ec5kzea5oaOLsgBMMRYP6fmxm71ca5UhV2yWyuD+/nKfD+0OVZniCCI63j9lF3yEKT2sHU1APAg0mRXIfL4ZH1TEMk9TH0I4VJYLJ5Pi1yytztIQY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|2604032031799003|19110799012|5072599009|37011999003|15080799012|23021999003|8060799015|41001999006|24021099003|51005399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TvWADlOg9At1W+sJkFv6dDiGn2J4YfJU0BXQ2bA49I/n78nkLb6QXf5oAjab?=
 =?us-ascii?Q?FLWV4a18Ikj3I/3HvujX0FQFbPpyKc/S2DuzNeiNfEuD3xjamIr7+BV75QTO?=
 =?us-ascii?Q?jsX6860fQkAq0/ujH3ZFYbCuwdEHH2LjHuhtB7gkiMfXvhSDLRpOU+N/amqk?=
 =?us-ascii?Q?IXhDv/iz8M667+CVH5zq5nqDSZjkRDYdfklgPOpfX4QlgEhJ3BqO+t7ljVER?=
 =?us-ascii?Q?1pF6wI+HHYsH3ULALrftMQHu7RSaoG04qPZ13hZVzI1/2/5OFUotyz6IRdnH?=
 =?us-ascii?Q?TxCqglwEsgqLmz/rW5L8H3D3m2GD52Mw4tpfsOMGL/Ggo5JqgOlqvhJuyw6a?=
 =?us-ascii?Q?u+kkHl6mC6ZcmwYz2piKaWlR4dD28SYJtQRs8+offFyocUsSsh21KrzxwAEs?=
 =?us-ascii?Q?OkY5ebv26ldP9Ua8O4yyrgS0qrpnq6ChV6EJg3CLIxY4mEbJdmOh0zd/UGeZ?=
 =?us-ascii?Q?BACD6be0yROuCjt51VcHml6LK9RXw7DHarWnLbdyb8pbaMmQBFzo9M5DEuEW?=
 =?us-ascii?Q?43qdA+VyPBCbeU6gB59zJJWwYgvHTDtbleAEb+vsnr35JECom6/YGEe5ebRA?=
 =?us-ascii?Q?jF9H8arB+XpT/pQCFUusQWxae++Zqa8VioiX8LLWHZNvpVXgIxA4U5FigyFN?=
 =?us-ascii?Q?29DhFf7DM5YbhFlHuNrsXX0foMwA0vKlkkVh2vEjd6ppFqzttkT+F7JOfhOM?=
 =?us-ascii?Q?TfgxKtZRdjo26O9mmkKCytJmDySMkSN9vn+sfthMfnwlI4vpoOM62lJd9qpk?=
 =?us-ascii?Q?O6ae92KC5yddpdZPoIig9xSpnK3KcYlta0oJISSi/ayaz1ZumJlxKTBQoiCl?=
 =?us-ascii?Q?8X6mPcT01JPEvF0gH7GLEU2wENuaFg4yjTtbpk42KrzG3qFgXfbzcCIGzHD2?=
 =?us-ascii?Q?tX1ksnO2R3gWUoYOFctCaBHF8PY2n7BgJCz7Exn7FH8CKkgSK75awgU6jMJf?=
 =?us-ascii?Q?5SzW7AcvoNtASBijztopJGFfg0gFLzP1waaVpzGhxlp9GMcT/Bcvl4nRtv0A?=
 =?us-ascii?Q?pVZ+jWCDKwch2VssMfWDfldSiTGTzi9IGm9hZaUbC5jr9Ho=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JK2Fv1ya7n0Ah7chah/pEZW/VWSeCh/urge4z4o6rzrKLCrlywkQQs/9udep?=
 =?us-ascii?Q?AdI+oOwHvSJDlpBXEOW/NJbnXB3OpVz2qgXgWNUIIVgo9ESqliptO1tfWZ0n?=
 =?us-ascii?Q?ZSviUR9CYU+ozOmHLvhfwU6AHY/4DD1cPcXm6B5VuguTQRdL1X/QeofmBfTd?=
 =?us-ascii?Q?0oOMaguc2jJNQV8LM7vtx9QVM5UgZ7GG6wiva9I7x6GvKBTu4BlVkcwOq56t?=
 =?us-ascii?Q?iHFMISs93V+0yqwWCWfbg7l4XrlgcO/mUhY2lLBmvkDMlrG8V6aqhQv6UENa?=
 =?us-ascii?Q?8Gef04kA21gmlutuIredxIfmXQOwvjgp48SuW0J7wyl3hS4pFALH1XdnOgWb?=
 =?us-ascii?Q?Tj47X8trYWMszq65APNeGCKhdsoS3zdkmWpC4+sAoLxz60SH8rm2ZOE1dvqL?=
 =?us-ascii?Q?lwexnYorBKf9nvJSPNs5TvmTV1D530FrZtJlFMP0EoHPZUkrunG2UJQ70gnk?=
 =?us-ascii?Q?y6vdh4GK2QCJnlXfwvDphJXr3uA2im2dpW8es11KiuYZJvWw5vImqErxhQwL?=
 =?us-ascii?Q?7+hdbb4/YVmlmNf7nNIHzUrhaaPRWjHBrx2Ou7ijGRMDk53iAUnuW65ry2gn?=
 =?us-ascii?Q?hK2EqqmE8Q/XEWEk0UdGpAezShQoGzWIQo8Vj4bdxHH8DGCB3QkRZt2cjgfX?=
 =?us-ascii?Q?h5Q1AEL5rigMa00plyQbNAWAK7q8LCAkxWeXx/GHanSZ8Gyf2bdJAxgam9ga?=
 =?us-ascii?Q?90ja01Kn8T9y01RedwuWhfSeLYzzXL38f9EgROG0useqpWnpxhZmsAxp1tj5?=
 =?us-ascii?Q?exLNkOft5X1j7XTE3bq9svgwZUNB8InpYJ4Ewi8ZIINyOabC6KaSoDlq4BBf?=
 =?us-ascii?Q?GtCWXZVLlfxZym2B/LGvaJYApd6qD2FO/qaZEexzphxRGA3SfigXoOanllkx?=
 =?us-ascii?Q?zFFpEAJ2MZIBrvqIR4JEwc5rZlRBRGp61k8txipyBc+5Nhev87rF4sCaOv8a?=
 =?us-ascii?Q?akkQjJX1Ig7OMivdOO43QHxutaWa4uVu8el2v3d3W6JmCnYH5nJW5Jgr/3gU?=
 =?us-ascii?Q?nCqw0EF/uzicalzYWAVeCOwZiBAVVb0uHtf/HmNOw8v4OCsZQYaONLzCRrky?=
 =?us-ascii?Q?C/Rb5q9wbdBBRkPikkNCcBqen+F64CTVemOX68n3+POJQ08lbp7A7xuHModm?=
 =?us-ascii?Q?UUOccewbp08rBn265grM4GDT6HHFkqsXxYRhG8A9EZHI9Xwuy5xl6kY/3IfF?=
 =?us-ascii?Q?XjlbrDlGHI+FOuHhgm+GXNgs8yNgI8V12lLDfqg5R+BvRitLZRbthVtIvGRc?=
 =?us-ascii?Q?YOouiVbAlGIqEnevQDzX0Fqg2j+ytqhVPbJ2GK0X73o7Qq3zBqQccdmxNoTI?=
 =?us-ascii?Q?18vEKZWpckLjW8QiyPd3EIFVQ1Jn+HwfAlnBRZ46oxdwMBOs1Vh8xQqURh63?=
 =?us-ascii?Q?mrbcvZRU420y8OHjNbFfcm98Sa1c6PeS6YHefYwEwspH83OgC5cpViFdbKKi?=
 =?us-ascii?Q?9uAEe3ANRp+aExR9XudIDDCzxaEt5NII?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad5f623-56f8-4197-45ee-08decd7a2d4e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:42:56.7003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8684-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A57B96A2A65

Fix the repeat section: -1 is a valid value meaning infinite repeat,
as accepted by the ledtrig-pattern sysfs interface; only 0 and values
below -1 are rejected. The previous text incorrectly stated all negative
numbers were invalid. Also remove the redundant trailing sentence since
the behaviour is now covered inline.

Add the brightness range (0-255) to the hw_pattern section, which was
previously undocumented.

Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index a2353549469e..ed32eb3a27d4 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -16,6 +16,7 @@ in terms of PWM duty-cycle and duration (ms).
 To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
+- Brightness range: 0-255
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
@@ -26,9 +27,7 @@ The format of the hardware pattern values should be:
 ----------------------------
 
 Specify a pattern repeat number, which is common for all channels.
-Default is 1; negative numbers and 0 are invalid.
+Default is 1. Writing 0 is invalid. Writing -1 or 255 repeats the
+pattern indefinitely.
 
 This file will always return the originally written repeat number.
-
-When the 255 value is written to it, all patterns will repeat
-indefinitely.
-- 
2.54.0


