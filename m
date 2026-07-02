Return-Path: <linux-leds+bounces-8862-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Hk/KIitRmrUbQsAu9opvQ
	(envelope-from <linux-leds+bounces-8862-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:27:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA06FC06A
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:27:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=h1Rac+af;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8862-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8862-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEF393182520
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607B837A828;
	Thu,  2 Jul 2026 17:40:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012008.outbound.protection.outlook.com [52.103.32.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC9349AF6;
	Thu,  2 Jul 2026 17:40:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014012; cv=fail; b=oRnqOKPJ3APdGYsV2smj0E+Xbj2xH1zooUmHg7Um/Ojsu/2zhQqaZps+d+320Gezusw97hKyJapXwiCcnlB+4I2Gj3Sh8e+whZBgZM/u1w2vfGq1E/aA9G0QK1xZZ4bAbsd1PGOaaRZyEAaXmAcV3IksZP//GEVzSJRHPhKY4U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014012; c=relaxed/simple;
	bh=Azb9etV4g190fid+xJO+KLpByBBdmcWGFqpSwfU+FtI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R47Ak32IpsdFWbEi/r2DfgikOfC1dmxrnd6SdIoGOYB5Em44Fn2CzWRiP35CQasOZ+0oC1KGsBBwyteIkwIY3IbNuF4tgGO7B3wBu5o7my11TD9gjkxPCUKPJYlg5/RSXIhRoOcZKKRInRcw/HpgCKYj1vLHdUMsIwaiD8h28I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=h1Rac+af; arc=fail smtp.client-ip=52.103.32.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCbwrlEQTbSQptic+x2El5E4EDPKJywvl436GVSFITYObAISEI2AnOUTSOAvTec5ORWoHUyGMluI3HRvgRm3VahmDkcszrlqG+t1vJptscoIzeRWwyIq28W9Q0yBAa1E8WWQiI+jIgkgkssxXRp+SJJNro1GTSODPkwzrej+H8WHlkhEejOkbBP+BTgvCivOaH8/hq3vTix9fcSu03ip1+DeblRE05/TILnp9SvqZyKj+BEYAp1ALtVpDgP2dXMB0Q8772D6XrQvpwsgrCZtqhSn2dWRee+TxWlMxtd5We9ayM4j9YZkL60AEeXuIKaJTNYhQXyjHX82vneY6LIPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsqoXhdrrZa6Edc3n+lkiooHsalSV+I7cegZGqUELJs=;
 b=bfn0yEpglBC7tb0it7SMczZeY7oAZ+1JrGveo7u0qOzm4HMSSbey77Vxnc8OWFpHGSPd8fySEqVptDfuqIxI3XD9xa0CwAeuTy29lNbOGth63wk9Pm7JY7otw20UAqCoVH3rLd4BMKYRrJ6+hnLMoVdM6pPitVfs5Ip0CIJLZRYL8sJ7ufCNzPeHbJ2JEgh9Ks6O5XMmLaKU+mZ2dqnybGDhAd65avtz88e3HBc7sBwHF+K2NFapwp0kEgbZWYWkJ2GiJ0900rcJgvCP/3YqGL84Lk97H8ru7uGSairMh3/sBxdiLf2bFYcJu2JT5gebtnjKRvLN69rCSPUmHAY9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsqoXhdrrZa6Edc3n+lkiooHsalSV+I7cegZGqUELJs=;
 b=h1Rac+afwLD5dAPh/SNGcAOcqkeWVzu7QGlru7coDEKUQ8CtoK38giBqaoShvWQeAiDHTRlnWm9ycrEux6eiYDqwDTcW94ogoyDCEbkyqYsZImJ3LsV+Dky6eNK3R0Qm0d+8+878nh8M0BeWPMe+xvedsB2TMma9ZTVBkt1zwVS7mByfThk5LVHTbXggQUiP2Y1Gt7ZLUAXckq40exp8UmoXsn9qnTHyrccDnrTocrmmYr9xy3b7buN4oY+ia7HhKpbMRPdmK+TPJ0qB0V5fvYyo1dh8AvaIbcHygWktw3bXQLWhyqwaXHDR0YGj7yHtjH2/H/rlMkiyw4COUc5sRQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 17:40:07 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:40:07 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/9] leds: st1202: fix spurious pattern sequence start in setup
Date: Thu,  2 Jul 2026 18:39:54 +0100
Message-ID:
 <GV1PR08MB8497ECDF070E9D82D0D2E983C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702173954.2634013-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 357702af-390d-44c4-5cba-08ded860f4d2
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR6INxlMQE5ibdlRRlUWf/AnztFqyRj8/P/ggSngZR01AUmPNZo0KmE7Y9pNvUe9eRkFu6We0TMuIMoSGzuSK2QhRH3wKoLLYNK6q2NL7cMw4tgE0WEyli2gVcJJc5prZGzH6M9k1g4WV5SnyISfffujviZo7aLnSmSMqT3rYtFiIa822oCsXntLq5Gjn5ODw9hk2oVb6z5DitPTmPYUKd4tqKwbbU+BRusNrQdCjwYDuDN08VYOjYNk4KvPLT8UOSI/yrrFzR9iqJ8KEwFWCfHNgx/qIN6TMrY/mEnLOTZwp8mOdYQtHygE3+QIw2PKnWJz+4HERodbfxR0udTKPrFcsTvZXEZJbNlWm1mr0Re9UyDYhxfM1ZqY0hgbyicIMO6ZrqegmkJcrgm9HxAbS+3TEF5lgcLaxHcDIAQZ2jnHSvRX6Po9huIGuktTHifxUfN3WUwVYzJWXHbJ0DRmzb9Te8qXC4LOCVexxXJVtKsVodS+AkZMEAtP1Iy7387EB0KWiM9NXbOLAqJbINu396ybwvGGcXc/D5lfExK6j7yXggmHV5dhLpMeLaLnDRb+AW02uafIJYe1HjoJ/11mc9Guj7Oo4md7niixGssFR04LesaKIncgdWzjUkZ0MHeBiq3a+qQ+OaGX5FggdXn0oqNd57ousCnErbaPrF1fF7wcCWJJJ2S/kTShScYrWfyM3xbxaxEm/UyRUqAk83T9So3yyM6Ac37VlmTUiprE9JKOk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|25010399006|41001999006|23021999003|37011999003|5072599009|51005399006|8060799015|19110799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b0OcJOe5kU5iFz8o+Iff3EvrladB17KlAml8OnEe/KprEHSTRZ+XsqtGYguD?=
 =?us-ascii?Q?mU5vF/lMfb0JnY0u+E30p0iUm4LA8RuSAhqdJPZCedkPLbC/hL8UUuBAbhqV?=
 =?us-ascii?Q?eQSmKt8nZHhgJaEE7UL0aDbGgfs1iZ2tDGRl9eFhW212wSYcsFOQCGjt81su?=
 =?us-ascii?Q?hTz45JlzViNLS2FHHxTkzM1l0gkZk9CH2JS1Qmj6Af5GJDmyotMrIAl1rI2N?=
 =?us-ascii?Q?QvdrBLMS7gDIaWzi3jql3SKOWqJM+VzrH+RB5F6mDKM/Dm7l7799XJB+d1w1?=
 =?us-ascii?Q?6Ho/9E/Jiza/JoAZvmAtYnMx5gxEKuQL7WATSRaZQWq4fg4DarmJnVOrMThh?=
 =?us-ascii?Q?FNnop8J1IuuWeeAHyTH+RPKY63FDL8UH9nwBqsD2UG6c2xpsbvI0SskDG1iF?=
 =?us-ascii?Q?0KdCs9kPZYDY/p7hJRI8HJUqTL92Dn2BPkyccBl0j+iUCtE5fy1MYdgQViIO?=
 =?us-ascii?Q?AQQuuZ5RtDtPsSaApNEWKlsoYiQg9ilKRV1hGpFMi7CBO/bDhcKEzmJPX58V?=
 =?us-ascii?Q?MmYC+uE18mfPI9FJxZf9gfv8eHn9d5MQKz/Z5Jr6yM/7isjfFcUEcL0E2Yf/?=
 =?us-ascii?Q?mBi0Ri7mk7T6tPho3FN5+FMLxSeptynUH2wR0qucW3AlwNMIQ7YtW0+xGFfH?=
 =?us-ascii?Q?dcHBzBDKxoVZZyk5SXxNKBtX3jJq8SMHS93PNZMHaXUNFF1RqSAZmb94I8Mt?=
 =?us-ascii?Q?AgWYA4C3i1B1Y89669QYuIH3+8MoroA28PfY32Sq2VcJ/2m53f4Q/ro0hMmp?=
 =?us-ascii?Q?1vb37QcyewbMHFZI90Jj6KvFGHzYC9NMKzTWh1ePLAXUqbzJl/B2piDZaP7L?=
 =?us-ascii?Q?VbvmbAUoQkpE06BdtJXAgR55hGaUf28KoIV+MOy0Z2DXSNWRKWu6e1sFQPTG?=
 =?us-ascii?Q?zevGw3gMAgeYN0T27RN9W/Ddtq5RZQyb0nVm0Hf9nFJ8qPOMMpDFC+3UR8li?=
 =?us-ascii?Q?DE9XKJ5on+qbqFKuscp0bagMAzqWo8y++O2TRVE/tNJhTR7gzeZhZz0m8JDO?=
 =?us-ascii?Q?K28v?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ryV5xWBU+tnbRzWrPZK8mJIhV+fNa+zn69FELtO0wrRM/UGoX1M3+lNTVV1x?=
 =?us-ascii?Q?R8QXMW/OHCbnpfWTI9ljX0aMTb/cLRRAiqSEpawbDHSoxhKTSs+nxrgFX2f6?=
 =?us-ascii?Q?2FdhLI277cZ22t9h1lVmtBv6tZVkrrtpuLxujDEMMwR/DJq44m8OMDQlu/Bw?=
 =?us-ascii?Q?bqpArHlZZIzppdEHetlftzJZ1MhjN8BLQTrcHZnNvtF+k+MLrufUyWKq4igt?=
 =?us-ascii?Q?QKJdPqg4h9lkV9aJXoOQ1CkyzCNIe9WkAHskmJ3mR+OQvOgXO/mLYJWbLYqS?=
 =?us-ascii?Q?FPe+xA+NSB+1spbuWQ5rTNcU3TgHIa8IN4EUwzYejnR77TXVIozQGTgsfky/?=
 =?us-ascii?Q?A/dcvIVg9r5tr+DwazpCb4pvqzhaYBO1Ngp7OCFXUFIjKD7zCUdR5SQ17VOV?=
 =?us-ascii?Q?600kd88iUlDOTyDfpDyrGe1h/yHNnypSqQ/Q6z0LuGAt/aazTDqHLSfJPb1L?=
 =?us-ascii?Q?rwS8zhd+w1KiPh7dNqoeSOXRBFw/OYkJ9awKPq5LAZeteL1lAmeBWVXVhkGc?=
 =?us-ascii?Q?myL/4Wx9fTOopkY5TCHcG/VKLKimbGwC/dsPhCcxA4yiRzhgZTlt4AqUnpo7?=
 =?us-ascii?Q?ce5z7smwhP9bxURzK5y/BAR5fisdFlo9aFONql4Ok9g5qR2fIvkeXxwSHA0A?=
 =?us-ascii?Q?GUzhmB99yJtCbu/o/3lLQzt1RD1X2/zRJSRw6IWg2RDvwVinARRb2t02s0N0?=
 =?us-ascii?Q?xXWCcIM6Lik0UZzp7G8Vd/ZT6WAHlVz8NJhLLU7OiXOPcY3NWKighultQFUC?=
 =?us-ascii?Q?VVrcFU6MehW8CJ+PD/NYDM4M88j8EzTuOksU5UiY5XCjepGT+JTEEj5TABZB?=
 =?us-ascii?Q?ZofvFpHj6cmLdoRlhuuirUjT6od+ngiUstIT6bIgiZfvoK2IWxnGgDbKlStU?=
 =?us-ascii?Q?3imtiAm+6vGVtOOThnamwREBu7zHNy4e55dV+Fj5YYuSSQgbWt2NeWWXnWCK?=
 =?us-ascii?Q?p1MvFGhSZoUdjGLJ3l7GnmRuL+L338+GxOutFLGZGbna/wtQCdM9NgSs1EW+?=
 =?us-ascii?Q?pzcfysiCTA1JPOENR/crnwbXKjx6FvcAxSs5TeJyrHUJpiGdr+YtIszT4eLH?=
 =?us-ascii?Q?sTEZwp0BVXcbDx1RuPb6laU0h61LjbCoiRfcX1itKIiiynSQQp++qfEzzSfk?=
 =?us-ascii?Q?A6nS+7hqtlyZu7ghBg5rJmAtf82Rm9GTgC4X4V4caPnMLME1daN4RHIGtfXN?=
 =?us-ascii?Q?bWiZjeD2GRihpkNcpEvA668Djb5cnUBLI1aT0ZpO3L5vyGuTto290cKGgKhA?=
 =?us-ascii?Q?ORum0yPVWjgrr1OSQt7hrcE/huQ8i0jhsHNaqTLRqm0v7kKurA9msYKCgPME?=
 =?us-ascii?Q?8oHVqi6JAaYxbEJhXv4JkPKWhY5e69ITCTw+TCEPNPu+S9QyAVK8jZv1aV0b?=
 =?us-ascii?Q?K/Txw/ijwCvrMDDfN/yqj7QdLfy5SK7/t9o9uJVD7VJVjAdC+xbgciye3uvQ?=
 =?us-ascii?Q?19WS9SdBW+RRCUnwcdeYTAykb1Sc2QuG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357702af-390d-44c4-5cba-08ded860f4d2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:40:07.2591
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
	TAGGED_FROM(0.00)[bounces-8862-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02DA06FC06A

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
index 3203b3768ec5..b8a571282900 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -333,11 +333,6 @@ static int st1202_setup(struct st1202_chip *chip)
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
2.55.0


