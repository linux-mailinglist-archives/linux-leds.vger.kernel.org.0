Return-Path: <linux-leds+bounces-8146-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DlytM2x+CGq3sQMAu9opvQ
	(envelope-from <linux-leds+bounces-8146-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:25:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4415355C0F0
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9295D3002D77
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612982773EC;
	Sat, 16 May 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="sdxz+izN"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012059.outbound.protection.outlook.com [52.103.53.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C66D213E9C;
	Sat, 16 May 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941544; cv=fail; b=BpqtCku5GOq/VEhvd3HwilgpELKRa98fmTrsb5rhnzA5o1/j1hHzsTQ1E3pNLKJbWU6NWXbbMvMVALdizHyIrvN9xOtdbEMRM6GTC3jNEYEjMHEb+fQJahkxaG9+BgOuVJoa5CwUcv+LJx7rAoqTmcRO2vzQZd0R2gp+Q+w9GIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941544; c=relaxed/simple;
	bh=jbrN/ob3IgQKs1JBD2v+VFqvlU/yvKOvTN4UkJeGxVk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TOg3jZdQEkhkBoaMJ3WNdwUQvlxoTFJ0ROGCAK3W/Y4+jpb8OGeB66KGZG6jTXNQjxRJO9ceY+rMhAlh5QmzXE0p1MI5uUpmWKbWiNE00/17liqAMFp38r+Q2/C+IoGVRk/m3jxFHgx1xvvIMvrgxds3xxIVXHeMM849S2/LpAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sdxz+izN; arc=fail smtp.client-ip=52.103.53.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6jhvI3OsuOKyKGUAsBZMq2jfgBGAc2Uk6KEbeZrPeODq+CLG5jVw/X0kTse5Hbwr/eT/iwvjyNB9w21aQHEvLLWjWajM6H6aH0qOimGnSCULD2qZMwWfnwR4ApVuyaEy4ilEuncNzfJk7xTQEPg7O8NiB0SmyAy4YA9A7C58xLwp2qwcWWls8zfnBfXZTSbFQ/IbRIW01CHk24eKGiEaVA0nes6zPO60ESZQpoedjsLDbBH1jrOsU7b4X7FLoQMF/826VyDOfs3oUR7ui9U+iNc3JyWsD2PrtgvWxSD5YDGs6dqcuZ1+kgcIcbXCr+OVwvZfsruXRa/759W0aqUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcDoHnTl+tD342I2Ui13ozxRDYkm78qo5oeWj8VdxXs=;
 b=QhMdTdchETPgGEDTlDrjCATAV7fnMGXZsv65o8VBK0rhCKOrltm2mHyaQLHCl017/CgSKId+tyK5o/9jCChOg5P9Xlb0lfEzwxfEc6nQTHYwA8jUCQg9SfIwxa9kPKWOSsiqRRjen+iCcbsLj8yLMQNcIUKlXOg0R8JIeJmMMd+taqQUC3ji3lfrunaX/FWS+b9duxqv98SQ672GCNcmkzOlsuEa+rfCrh2N1eBrfF9Bw+ZATC0ju0c5KCYYh8eJB6OEh9YHnc7ABWGUlZtUm/XkXdJichD+YNm+yqPCXHXJF8XaR8l9f49w2G/Pz73LLBt4cyuo2mmpLD1jg8d+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcDoHnTl+tD342I2Ui13ozxRDYkm78qo5oeWj8VdxXs=;
 b=sdxz+izNkVoLM3J1tnEVxmol6nglbkYSJNx5VqAKhvyhjchyMQRlxic7h38shTO5S+G97rqTnvUKhSJ9mT1PZesSDhgEig53OvMCqyJIsJvnkUgd1NVGivgmRlcSm4CIOckTxuEHzFdPErmKhqzFWh6Xm7DzJaWpmiKeHx2jkEPbWJEhQTG7u7wmlsEHH2hXBIEtBhx5F+fpucpa6HH8S/rsHU2Fi5kI3I1JJ0vKJqxXoZpFMQPbHL2wOywAV0bBYG9MfskB30rUDD0xc6GpigL/fsiw9ES1WMUJoOokgC+3aRhH23I2jt/89YJMefJULKMJq7ur6TLMWlKGDo0NTQ==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0132.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Sat, 16 May 2026 14:25:39 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:25:39 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Sat, 16 May 2026 15:25:26 +0100
Message-ID:
 <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0399.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::27) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516142526.1580199-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0132:EE_
X-MS-Office365-Filtering-Correlation-Id: 637a10c3-f4ef-4b07-8569-08deb357009c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|8060799015|23021999003|15080799012|6090799003|51005399006|24021099003|37011999003|55001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVpHb1VPVmhtNDNkL3YwRTZ4di9mQWx2MHBmSlBnWXhTbW5vdS8vemlOV2g5?=
 =?utf-8?B?a1RnQmZkT3N5eUtyb0tEa1Erem5LdGhGMnZraFc2Wlo3ZXZXVWxwdEpxejZC?=
 =?utf-8?B?a0FZOS9Qb3JvZ3BLZmFOOTM4L09ob2wyWFpldlZWTThLMmRhcUl4eDZtU0Nz?=
 =?utf-8?B?Qm1rd1hDc1JoSk1mSUJteThCWWlYNmdDSEt0d0d6dTQzeU80RTRCVEFZcEdF?=
 =?utf-8?B?NnRNMk1QV3hLQ2xGcjFDWGcwNlZqejc2WUdmdHlBcVpMTlcxZzVFNVhvUHVo?=
 =?utf-8?B?Ukh1RWhzVnhXMnBtUkRJdjVwSlE0dGdONjdXUjVnQ1NldGQ2RVgraWhVNkpa?=
 =?utf-8?B?MWFrLzBnOXRaSmhUTW1HU3M4bDZPMjV4aTdCRlRtTFg1L2ozTE84ZGVBODlh?=
 =?utf-8?B?Q0w1allhczltMk9HOTRkVVNkWVhnbXlib2dYYWdSNVZ3RlQ3RGR5WU5vWG0y?=
 =?utf-8?B?NnQzc3ZtK3NDUC9SOFdkZXBwYWdJR2JzUUticll2SzZDdkJvYWZ6K2JPOTQy?=
 =?utf-8?B?M0RKTjB1TjNWVXdjN3VNczk4Q2RoZUo0NkVxOVRGWnh3NXY0R0hLT0V3cU5m?=
 =?utf-8?B?QXE0bkFscmVsVzQrZ1ZSaVNjMkdrRXhtbURKeGdtY2w2eXVubE1KTXBXTTFh?=
 =?utf-8?B?ZXcxYUVxT0RSbHF0d3NLVHlUVkx3V3FYQkVYYkVPdW1kSjJlb0U5ck5oT0JV?=
 =?utf-8?B?eDJMLzNjdVgwRTFtUVZYZmhPR1UxWmFuTkZFNlJRLy9QMHFHajVTU2Nabytz?=
 =?utf-8?B?L2pjT1pjVzBNZGRSZy9mZTY5Y2xLOUd2OHdRV1JScVVLVHpuY1czZmhUeW8x?=
 =?utf-8?B?TG8vOU1CeEVzSVJnZDdmN0FRaXNaTXRlQkFEekV1V0FpNUZLeVRDYkJEaEVx?=
 =?utf-8?B?b01iZ3BtMmthOUE1MWxaU09IR0RscHNWNDM5R2s0UFdhSmNxbFh3c3ZDdWJM?=
 =?utf-8?B?a2hvZk1MakhkTWRDcEpnYXZmSnRnQnRjMVhGaEwrb2RodldPNm5SUmNrS3Bj?=
 =?utf-8?B?UEdZTFkzUjlPY1ZIVnJ6TDIyYXlCaGthNlcwaW55alVvRVN4alhYSFJjME5p?=
 =?utf-8?B?dEJFbWxlekpXMEdISjlBU1I4L3ROa2Zud1JEblI0NEFsNkdsbHpoMG1HZVVR?=
 =?utf-8?B?djZXVnJQcndyUmR2YkVQRDk3bC9HYzdjK1U0YnlvRHNEKzJ5QWRyQVhFcGdQ?=
 =?utf-8?B?bUtwWW5Nb1VoQzhxaEg4bjdIM0dDSkRmWFpvdWJGcEtudEVXcmh5ZGJhK2xF?=
 =?utf-8?B?V1VNYjAzSmpBdk5OVFd6VEZLZm8rbXVjWlVFK29JYnc3c2xrVi9FTVJKTjkr?=
 =?utf-8?B?Sms0aS9wZEtHTDdBUjJJWFM4RDdKWGJqaDhIdGFXajNCS3Bnd0xIOFphVWxa?=
 =?utf-8?Q?7hASpzhDZ8+qjorQzR5UK+ZZbbA2gr3U=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlpxN0NVeXNzRE5YOHRLNWQxeHpIdEZSd1NZZHpBbzhZN3pwWnAxcndCTGhU?=
 =?utf-8?B?d3hMS3RDcndIbWZnRFBlVTNBNjJ1bWJvL094YVRyQ0VXTnFQbEdMbktWVVVI?=
 =?utf-8?B?NnNMby9kZkJHMk5Od2FXYW5sbkFWU1dJUVZ1LzNPejlFY1R2MUhzaXJhRVB5?=
 =?utf-8?B?NmdmdFEyZEU1bSt4bENITjAzc09GMFJWOWVuYUxmL2RPVWRTL1JZcDNuQ1ZO?=
 =?utf-8?B?MzF0MFMrWUJySlhWZ3ZKYjVnK3FwN2QzTWdhMklQZnNaUHBuYVByNkJIUjEx?=
 =?utf-8?B?dnEvQ2VtUTNQR0RKT3p3d1d6OU1MYzhYanVFTzhxR3RWSk0zRTVXeUowaEhr?=
 =?utf-8?B?MjVIcGFybDBiRXJlWm43blcyZHAvSVoyelFabkJsakRRNW8vdXF3Tm5XZFNN?=
 =?utf-8?B?TEMxeDBla3FFNFhPSWY4T3pqL2NDYXo0VmFabUx4dDZybVorUXFDb3lodEt2?=
 =?utf-8?B?YVFWa1JMQUh6MWl6Zy81R0NsdHlTU0xuK2RrUVZqaituT0J1TG9GRXIySmZZ?=
 =?utf-8?B?UmUzUEJmUkRva0dZZTAwYWs1b1VLSmFKVGxJMUEvQTBOVmRRK1VpdmNrVThi?=
 =?utf-8?B?SVRLb2tKbkk1aWJMNzZoNGNiNFMySld6eEFMMHJORmVpWFoxSXllUTlaLzFa?=
 =?utf-8?B?L0VQV1BZMnRuSXhxS0pIYkJ0Q1J5UU5nbVNEZVFaUEtiS2E1MGxnS2YzeFlj?=
 =?utf-8?B?VXplaXkvRHpoSzQrVFVDa3Jtd3AySEcwNmV3T1NtN2JCZ2Z3SmVtbVZJdWNp?=
 =?utf-8?B?UHdEdEt2TnB4UGNyd2o3MlM0aEk2S1hCQ0F5dmF4ZGFVL25ISkN2WGFHSjFJ?=
 =?utf-8?B?aDR5eVM3RDBxRlp4WDZ4MFVHR3Jyb3FhVEVqV0s5WjZOV28vK1EvNGNMMXNH?=
 =?utf-8?B?R1hLS2JCdHRVK0hQeUJRbUliRk5sNm5lcm9kKzMwWHZJMEszMVVQd25KRCt5?=
 =?utf-8?B?NXRjTytGTVdMMWFqR2ZjTHB2bUs0MWo4Rk1XeU9BS2hmeFJ1VzhQQnMzM3Jy?=
 =?utf-8?B?YU1ickRZMzBWYXczblN3Y0dadlp2WGJxUnJnMGhiMXp1UWt2Z0NzV2dWd3Rx?=
 =?utf-8?B?QWlwWDNGaE85b2dOajJmMXdaUEhuS2JnQlN2N1QrVVpTWXc2N0Q0VEdIM3hE?=
 =?utf-8?B?cjFDVW9RaHJ6L0p6a201cE1KRVZCOUNaQVZYK1BHeTF0dnA0WVVjdnMyY1dJ?=
 =?utf-8?B?UDhMMDEzVmJnVXZzT2VLWWFtS1lNRHd6MUwyMm9VVm5obE8rZ0xkWnRlbmQ5?=
 =?utf-8?B?dVZPKzR1ZVVITmcyRjJrNDdjY3AyVmM2RHlxUndxVXZOVDc0V2I2cUlKQWFm?=
 =?utf-8?B?QjZJWE9XM1ZpQ2dhc3Y2SThXZnU0UkMvbjBQOWhFcVVmVS9HQVdmYzhEU3cx?=
 =?utf-8?B?SmhFSzRXaE9Kc2ZnUFR6NlVTRnFsNGs2RXFMMXUyUlpBN2NuVFdnWC9QVDA4?=
 =?utf-8?B?R1JDMFZRbnhDSCtuL2R6TWZYRkkwVHc5eW9ORGM3bG1tQlF4dzBnMHVoTklO?=
 =?utf-8?B?YlRwZGMxcVpITmVJd1I4UEtZQlJuL0NYdzJpR1FjdWdwYVlZbUQ5UUpyN3pV?=
 =?utf-8?B?YUFHV0IxQ2JhdWs5VGRVbXRzeE9VeG9oZ3MrME14TXFzWEh3TCtXOHhmSkMz?=
 =?utf-8?B?NmRtQ01KdkdYR0RJenBoa0pjYlQzY2FFSjdzZW1qdnJvamdrd0x3M3puU2NB?=
 =?utf-8?B?Si9DRENQQklEbWhmZUN6QVUwOUlSRzZySXNwMmVNVGNmeXBtQ2hKdVJPWEhV?=
 =?utf-8?B?OHdTZHk2aEx1L1pMR1V0ejRhV0xqYnZaVzJqUE1RQ3lzYWk4SjR1a3o2eFND?=
 =?utf-8?B?WFRRdWkvbW1jRUZITFh2bzN4NXdNbForZFNIdEVBRHY2KzJRTk53S3orNThG?=
 =?utf-8?B?VkEzNSsybTJvVzZKcFJrZ1RRRDNIa2tsTGxielBSN2FNZzhDSnFZZ2Q3RmNY?=
 =?utf-8?Q?9+zxkBryYTFfELemU6FkNQY0pIgTlWdA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637a10c3-f4ef-4b07-8569-08deb357009c
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:25:38.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0132
X-Rspamd-Queue-Id: 4415355C0F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8146-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid]
X-Rspamd-Action: no action

This series fixes several bugs in the LED1202 driver related to hardware
pattern programming and brightness control. The issues were found during
testing on a Linksys MX4200v2 router running OpenWrt.

--- Pattern sequence not stopped before reprogramming ---

The LED1202 datasheet (section 4.8) states that writes to PAT_REP and
pattern duration registers are only applied after the sequence completes
or is stopped. When running in infinite loop mode the sequence never
completes on its own, so these writes are silently ignored by the
hardware.

  Patch 1: Stop the running sequence by clearing PATS in the
  configuration register at the start of both pattern_clear() and
  pattern_set(), ensuring the hardware accepts new values immediately.

  Patch 2: Validate pattern input before stopping the sequence. An
  out-of-range duration value should be rejected without disrupting a
  running pattern, so input validation is moved ahead of the sequence
  stop.

--- pattern_clear() leaving hardware in inconsistent state ---

Several independent bugs in pattern_clear() left the hardware in a state
that affected subsequent pattern or brightness operations.

  Patch 3: Fix the duration prescaler formula. The original formula
  (value / ST1202_MILLIS_PATTERN_DUR_MIN - 1) produced an off-by-one
  result, writing the minimum valid duration (22ms, register value 0x01)
  instead of the skip marker (0x00) for unused slots.

  Patch 4: Write the skip marker (0x00) directly to unused duration
  registers in pattern_clear() rather than going through
  st1202_duration_pattern_write(), which operates on millisecond values
  and cannot express register value zero.

  Patch 5: Reset PAT_REP to its power-on default of 1 in pattern_clear().
  A stale value — most critically 0xFF from a previous infinite loop —
  would be picked up by a subsequent pattern_set() call in the window
  between pattern_clear() returning and pattern_set() writing its own
  value.

  Patch 6: Restore Pattern0 PWM to full brightness (0x0FFF) after
  clearing. pattern_clear() zeroes all PWM slots as part of the clear,
  but leaves Pattern0 at zero, so a subsequent direct brightness write
  has no visible effect until Pattern0 PWM is restored.

--- Spurious pattern sequence start during setup ---

  Patch 7: Remove the write of PATS|PATSR to the configuration register
  in st1202_setup(). This accidentally started a pattern sequence before
  any pattern data was programmed, producing undefined output on startup.

--- Brightness control broken while pattern mode is active ---

  Patch 8: Exit pattern mode in brightness_set() before writing the ILED
  register. With PATS set, the LED output is determined by the pattern
  engine regardless of the ILED value, making direct brightness writes
  have no visible effect while a pattern is active.

  Patch 9: Disable the hardware channel in brightness_set() when value
  is zero. Previously only the ILED DAC was zeroed while the channel
  remained enabled, causing residual current through the enabled channel
  and a visible dim glow on the LED.

--- Documentation ---

  Patch 10: Correct and extend the hw_pattern documentation. The maximum
  pattern duration was stated as 5660ms but the correct value derived
  from the prescaler formula is 5610ms. The repeat field documentation
  is also corrected and the brightness range is made explicit.

--- Testing ---

Tested on LED1202 hardware via I2C. Register state verified with i2cget
at each step. Correct LED behaviour confirmed across pattern cycling,
infinite repeat, pattern_clear, and direct brightness control with
trigger=none.

Manuel Fombuena (10):
  leds: st1202: stop pattern sequence before reprogramming
  leds: st1202: validate pattern input before stopping the sequence
  leds: st1202: fix pattern duration register calculation
  leds: st1202: fix pattern_clear to explicitly mark unused slots as
    skip
  leds: st1202: reset PAT_REP to POR default in pattern_clear
  leds: st1202: restore Pattern0 PWM to full on after clearing pattern
  leds: st1202: fix spurious pattern sequence start in setup
  leds: st1202: fix brightness having no effect while pattern mode is
    active
  leds: st1202: disable channel when brightness is set to zero
  leds: st1202: correct and extend hw_pattern documentation

 Documentation/leds/leds-st1202.rst |  9 ++-
 drivers/leds/leds-st1202.c         | 95 ++++++++++++++++++------------
 2 files changed, 62 insertions(+), 42 deletions(-)

-- 
2.54.0


