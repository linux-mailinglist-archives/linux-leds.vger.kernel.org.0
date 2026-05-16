Return-Path: <linux-leds+bounces-8149-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO80DUeACGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8149-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:33:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67755C17B
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB630301A7F5
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024A4336EC5;
	Sat, 16 May 2026 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DmwY7iGA"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012054.outbound.protection.outlook.com [52.103.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB22848A8;
	Sat, 16 May 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941999; cv=fail; b=pX6EAn4s0eJWssbxNpVLWYb6+f7JYHUuaSlKtF0cU8HHFjBxXeIL1kJzooxe8vgbAp7klBjSXPGL0Oj0usHfu70Ph2rczA0CubLLb3h2afga4tgxKAvMPywfohCuqVT0EMw+2joUHzvnI86g4U6ycslIz4rZBFBpWDsuBQ5IDZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941999; c=relaxed/simple;
	bh=DHbMucM2mkLL9WdR+7c4vDXEZf+bCQHZj87q/YF0h0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=etxcxdmiq9ajZDKNrwtrWv/1UOIzjfd8gyBMA73/jh7OCPIKX5JoXveZU1/ANjHwj2d2OlIIRvpWrFOua86ABjj8C3uVW2HJpZlVJIAPSZM66subs+XUC/uFMwg9Oeigcpmy9VAypnokUdm4cUNF/Awdfq2U/kkS+/DWOSVIn0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DmwY7iGA; arc=fail smtp.client-ip=52.103.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPTTgDvf1gb53YYgJuxGHY9qNVPtzxmisPAPYqmX36OMikmGjjamuifiLp3QXdWvX+iaKmoOgnbVYpJDMfs1dHaViNiI8rjbKR0fm2EobK8hx9czA/AXo89+DPnXaCoMCYTA3ZlpbvBxP1V4sU/IyxIwrZ8e7Q3hl5/MQ4HNGc8M405zEvCIyfpzhQtVNmrQgCxYbsmy5vQNLQ+qaCp7Dz6CAWmmCd/ru+y7vjaE49PtMV7gRAydTP8vo0N6fYuuNbzz/xjCMU1+Xi+homk0ahagJDa7rWYEuMDRBJ087+0DJw9PbDaIJ+f3oDhSR9qM7I5Vaq9PlnV8SSbkp7KJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pshWZngVi84iG/d6+aBEAYFAbBRq/p6htRQVw4xqK1A=;
 b=nrh8aYaDbBN04Fz+Ud4iuaqTvb3+2VVvJWrAdfgTSOKyKD8PGB3WZoNRLy82jhhVFC38xXKGQMxxRSDMSx0dS6fNGO0bYCHcv673jOKRRr93kAS491bVhiD1L7tbLHN4JtnhRLQRk8nCJnvi1kMO0jqsmm/j1fdWOPyGGPHZsdY6ki0TP+KpGM32KGPHu4WpRVncUiUsPN19qXBDxJiM+7hHV5GLDJHx4XwIbe620SMDu7SMnJG4uXcO/sqOas/E4Vo+lekl49oLQc7JwSFSyGYGqiN9c8dYZsqf0mxkAI4pXXHyAplVGQMNdaCqtKmYVAryygCTALsw9d/+46VlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pshWZngVi84iG/d6+aBEAYFAbBRq/p6htRQVw4xqK1A=;
 b=DmwY7iGA4snsjfLpS+yKRO/qnD78THX9Q1OT+js55RJbBPj2jsvSgkbhW/AaEyEVOaSBx1VUdRcvUHEMQQvmJ4BIVDPRKPxerqG+v6YWL1z+pmCDf+/tfJc0Btm7y5MRdEF/ucOiEwD7g2swwPSN2u8z48VV+iQVpmX/nGEAaefNr3IUYYJh00LGCqJbuffmnjIouVWR+5VDCCsGYM/VIV2oN/SvBXJb+eNcLkKF4AueG0nf3qljkgTxE6UT3suqfzMFEj7sTx/2xXO1LpRP7gM8DmP4xBICsizD4+B5bwFyCiB5KQIpMyDON5SjYjVuaMpMXkj9vmiQGkJFemsgzA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0132.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Sat, 16 May 2026 14:33:15 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:33:15 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] leds: st1202: fix pattern duration register calculation
Date: Sat, 16 May 2026 15:33:02 +0100
Message-ID:
 <WA0P291MB0385BF8B6B267CCED4D6C77EC5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0407.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::16) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143302.1616718-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f845ae6-cde1-40a2-a623-08deb35810a9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|8060799015|23021999003|15080799012|6090799003|41001999006|51005399006|24021099003|37011999003|55001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFl5UTdWZjBTOEE0SjUxUldIK3RpYllkRythUnFHQnlIUEJtaVI4S2l3U0Jo?=
 =?utf-8?B?bTZuYnpqQlhMYjRkdWxmQk14WEN1WDE3OGc1eVhqRVZGOFBZdE90NFc3MVNr?=
 =?utf-8?B?N0RyV2FPSUVJLzRJYXpMa2kxcGwrZndWS2V1TkROSStKYWtvS2NDM3hXQjMy?=
 =?utf-8?B?MDM1NDZwT1UzNGd2UHpJN2NXZFh4ZXNqVFN1bGVXWWRzdnAzNk1KcEpIRzNI?=
 =?utf-8?B?cGpOaDIyZ2FWT3hFMWxSZXBiMVJZT0pETXRCSlA3cm9rcTdZelBxWWVCOEow?=
 =?utf-8?B?Z0taZXFmaWFOWXp3QUNUaUcwMjFKTksyckYxNzBEOFBWd2EzUk9QQkxTL2o1?=
 =?utf-8?B?cFRtWkoreERGSVE4WGdDUzgxbllPajExYlZLOUlCcDZOWUt2VSsxd3IremNH?=
 =?utf-8?B?YThva0VucDFCbld2aTl4anRsM1NrenExWDJjc3hJMkFPaUpIQjBNYzZQQWxq?=
 =?utf-8?B?UGJkbWlYWUFDQ2xrYWpVMmhPZ2tCNHcySjE0NENUOWsyVkV6UVV3MjVZTU9p?=
 =?utf-8?B?dHpPRWpzOXlwR3ZTMDJyVGRaWmZBUVBaa0hJZmRTZndVUDVEUmNEVmh0dXJq?=
 =?utf-8?B?WEVQdjRnNkh3YmE2MjdGa0Z2aUhSVWIwWWhlQ1hqeElOdzhWOUtSWjZJVWdI?=
 =?utf-8?B?dmFPQkIyNzhBZjFWRDZDU3VjdzRjWmhmUzhUWE1yT1U3Y2wvS1o3cHJ0cFMz?=
 =?utf-8?B?ZWJKVE9GaGlGckNBK0VLd01iT1B1S3BzeUo5T29IbllQREpPUWFnWkg2TWxS?=
 =?utf-8?B?U21DMmRUZXp1SjB5M1crOUQxMXZkQTQyeXFhWVRFbTh3QTdkcUh5QmhORnVI?=
 =?utf-8?B?ald2KzZoNTBXeklEcUVUR2JRUk5YbnFIZGplRDg5L1ZZcGxtRXhURCtkZEZs?=
 =?utf-8?B?dHdpTVludlVjN3MyWlhIT1ZYT3hvRG13QUhlZkdZcGtUVk5PeVBNODJVd0w3?=
 =?utf-8?B?bWk1TCtKVjNqOS9HNlkyV0Q0ODFiZzdLQS9jbnZsdTErSjRlWkt2NHBnU2Zp?=
 =?utf-8?B?WFhlYTM4dVpiWGU4bHc1VW9ta1EyZ3pLU2RGQk83K0RtMm85NTBpQjNpMUZZ?=
 =?utf-8?B?TUVTOFhHMWlPWi9hVDZ1QnJyaDk5TFZ5cG5hTWRESjlMUzZ1UEFIek9YS0Zo?=
 =?utf-8?B?b1NUVmZ3UEdkTEdxL2JIWHhKR0FLQUxlV3NselpFd09JVXg0SGR0V1MvNEc4?=
 =?utf-8?B?VlZ5SkZiL3BsU2FkeTNHUUkreExJbHRkdUkxVkFPV3FDZHJTZzFIZmtDV0VB?=
 =?utf-8?B?RmU4eVlDdTFQRitlTUk5NnFGY004Q0VBZlZRR1M1cDN2NDMzRlFWMlhUamda?=
 =?utf-8?B?eTZybmg0OWx6MjVoZWw2WkdmanFQeStTTmp6SUJXaWdvRDladWVOaGhEaHpz?=
 =?utf-8?B?UFJBekoxTnJNVGo1cFNSLzB3VXhJUyt2NkV4ZDdWcCtLWkdSVnBmdUtIMStx?=
 =?utf-8?Q?v0yl3H5l?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJOVE5UNXFEWHF4Uk9Nbmw0S0tWNThJU1FuSHZhd3oyUXNETkhDV0NSODdn?=
 =?utf-8?B?Q3FmZXlMcitxVDBseUdwU3NwaDlGNlVYR2UrR0RhWENCaUx0RlhmS3g3LzAz?=
 =?utf-8?B?TUM1SjlRSEdTSVVUbnF3L2crci9kT3YyR3hIWGxwNFlseERER21UQ0VoUEFT?=
 =?utf-8?B?UVVhSXZSODdxSHZ0NXd2dldQMktiM1F6cVdMbzNDTSsrZC9yWjlBbVdFaUtZ?=
 =?utf-8?B?dGFhZUt2a2tOV1QzSmNJZDljdjFRcmNmSXlHcGhLc1BDS3c4MmpDdVQvQzVv?=
 =?utf-8?B?NFNhUy9Xbm8zRnRFQ29tZEpseklSLzFaVWtzaWFEa0Fqek1rdEtKdktRVmNG?=
 =?utf-8?B?N2JFVmtCMTNyT3RTUUJkVlRTSzFqd0VYcEhBdTRxNGdaakQ3bVNjcmwvU1la?=
 =?utf-8?B?NUd4ODM5NzBIRG9nNVY5SUNOWEJMMzRaR1MxQTJYcFp6TTBIeGhrWlRjbDc1?=
 =?utf-8?B?VlprdEJjV2NEdUtQMTI3c2dWblllQkswMVVxRXpZeW9EZXZnT2REWENSQUVz?=
 =?utf-8?B?V3ozLzVSMVU3cHRTOHZNUC80Rlh3dDZVSXBaWmJGTVVRUTFJMFY5bVRMKzIz?=
 =?utf-8?B?M21DRDhMdFdqVlhDUkE5VTUwK2FsTllJMEdUK01WS2Q4SUM3RmJ6UUpBYXdN?=
 =?utf-8?B?cmpkMkRIYjh1K2xVUDlSejNldFEvbHB1SWVxRmlBQjlMc0lHa1l5NWNqdVdL?=
 =?utf-8?B?SFNOMHM2U05xMzJaN2cyVHh1eU1XT1FGdDNNV1JtWWRQQUpRbXhGWXB3djdG?=
 =?utf-8?B?ZDNEeEliUU1acTNXd3JONEtxMHBYalpjNFU3b0JDRHpLUmhBdDZzRUVSeDY5?=
 =?utf-8?B?WDk4MVN5N1N2YUc2emlDVTdOMjJXYjZHeVRCTXp1YWNCaWZNV3N3c2VJcytR?=
 =?utf-8?B?YmVjZCtrRTJ0RFp1ckJsZHJjb3ROTnRXTWdnbnhkUkV4eGF1ejBnSWZLQ3Ju?=
 =?utf-8?B?ekJPSWFOS1JNckNkdlUybWNpU25xbi91YkVzMVViemdmSXpnbXp2R0lVVE1M?=
 =?utf-8?B?RHBQTW04S3ROMXh4TXlOWExFWGFPdVkwRC91WW9QSnhzM2UzaG8yd1dYY251?=
 =?utf-8?B?cjJVM0Jla0cvNkttanRvcm5KVkdIditvZllQMU9saDBZY0M2aTlPYngxUkc4?=
 =?utf-8?B?aE1wcFc4UWF6ZzEzV0pqODBxTmFlVU9KRWJNNm43MWFBYllRK3p1S3pERGUy?=
 =?utf-8?B?Mm9GZDBkOVljbEtyN1BRL1J2NEU0bTVFMG1zZS93cE1rVlJ4bVZwUnM2NW0z?=
 =?utf-8?B?ZCtsVjIyaHMxcWtJVHRVanp5YWUrd0xXY25JT1hXaUNMK2t2Q0g1S0VQSk5p?=
 =?utf-8?B?YzdmbUJtdjRBeUp2OXRodHVsVE9PNk83Tmhxdk9NYnRaY21weWVOdEF6Vlpu?=
 =?utf-8?B?dG1CMDAwVDdtMmh2Nk13amFvcStka3U0NW1lV2RmWGJ2KzRzdXc3MGxlaXNG?=
 =?utf-8?B?M1p2SFV5a04vZjljU0M2SFJLSVp2cU53VmtnQlZlWXpBRjFaNXM0aG1YRW9O?=
 =?utf-8?B?elBCK0pMbktwb0ZNSFh4NUFEVWxJZXFZUnRZQjdncTZsYjdKUkcvR0gvOEhw?=
 =?utf-8?B?KzYrR2crUjJHS0ZmeHkxbTZOaDkwQUdVYlNkU052Y2lLajVqWG9UelNNdFQy?=
 =?utf-8?B?czhuM2xMNGpCeS91YWdSMkFPWnVxNi9pd3VFdC9NbDcxaHY4SENIZjRWNnlO?=
 =?utf-8?B?M3JOVEltRmYzNXV0VGJDSDR2VC9hTER6cm1hQit6K2tjbnhhcVhEcmdEUTdP?=
 =?utf-8?B?eXg5cnFPekNhcWJISjRTNTIzUC9jRjRRa09qWDJwbjFDYllwSjAzamh5SWRk?=
 =?utf-8?B?SWFGMXlLcGlsTE1ybG1UbjhGL05IK3B3VHMxVDdVZktrUGNUTC8rZ3BxNk9l?=
 =?utf-8?B?aForbmdsdDF0eEVNZkpXckU2WFVKeFl2bmlaKzFYSUhUck9iN0h0OVQvazZk?=
 =?utf-8?Q?JFlP/npvri2iMKTks6QotM++HgGe+qYY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f845ae6-cde1-40a2-a623-08deb35810a9
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:33:15.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0132
X-Rspamd-Queue-Id: AC67755C17B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8149-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

The duration register (PATy_DUR) uses a direct encoding: register value N
corresponds to N × 22.2 ms, with 0 reserved as "pattern skip" (§7.10).
The driver incorrectly subtracted 1 from the register value, based on the
assumption that register 0 was the minimum duration rather than a skip
indicator. This caused two problems:

  - All programmed durations were off by one step (~22 ms too long).
  - Writing the minimum duration (22 ms) produced register value 0,
    silently skipping the pattern step instead of setting a 22 ms duration.

The maximum duration constant was also wrong at 5660 ms. With the correct
formula the 8-bit register saturates at 255, giving a maximum of 5610 ms
(22 ms × 255). Values above 5653 ms were already producing a uint8_t
overflow and writing 0 to the hardware.

Fix the formula and derive the maximum from the register width so the
relationship is explicit.

Update the documentation to reflect the correct maximum.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 2 +-
 drivers/leds/leds-st1202.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 5f4238181057..02db1006fb53 100644
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
-- 
2.54.0


