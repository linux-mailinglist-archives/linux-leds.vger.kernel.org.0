Return-Path: <linux-leds+bounces-8861-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 00OoDm6tRmrRbQsAu9opvQ
	(envelope-from <linux-leds+bounces-8861-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:26:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901F46FC061
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:26:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=mNFXRNbn;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8861-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8861-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1303D308EA62
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78334B183;
	Thu,  2 Jul 2026 17:39:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011031.outbound.protection.outlook.com [52.103.32.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D032861F;
	Thu,  2 Jul 2026 17:39:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013941; cv=fail; b=jK/tZSepcmbjW0IDG/UfieIZ+ll1aH8/N5vXgzJG7VrFNYnGZbVtUcJowllaja6n/My+FsCNAR+mswJMVEXK1I56HYsCx49sf3tzik9t8wBJE5t0HJbcctaqYqEw1jmdWO+CzGeK7G5DbmymqEQXn01D34oZrjpw71Yom3m7Cs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013941; c=relaxed/simple;
	bh=MABXPqyuihklS6YFeE7RbUXdsccRjmTV49lUwhacpAc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=re4jgAFPv+0z/uhtk2tg2CtuQXE8ksJTV9TgfyNM5wH1MojgtQ1kDMJ++OCni/7wpmUzT7TYUgZ3C3TANKbBKoHcBp7eWg/RMISi1snQluJQtxA68e5s4CZ+91bL6mBNQwX3y05PbqoR1QmNL5gneCMblfv5urwHPtnzz/ZnqM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mNFXRNbn; arc=fail smtp.client-ip=52.103.32.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LioSCwWZ9jIoPcSpWeb9GBAo5lOWbJm5K1Jwd4UAhOEzM2zXe2FRvc380Yky0Aw/Kr8LWMHA33wyKqa9g1fO5swYPOJ3PrxIFGGJGiFRmRM9+0mS9rPKnIO9TEPAez6mCDnBExFc+T0z+1UBdFhMXWs8609z19WZIaRnnciZQPNOuJzX6Kpye7crSNg5xbGPmWYrkOUySpXdarcXdskRL22Hamm4X+gtEiJsA1m2PimVsXmQxNUz/ccSAnXUINLrVh2HTT6VS13G6vl2/xKJqjBFItAgemTFoUZHubIFnqxNN+bk0eM4p3fzHjWFSicsb4pzoloobs54m4Ug/4dG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt0eNuXdU3v7Fj7Qlvd+xxHx2lIbIOyXpgWa972BIKA=;
 b=LcaB/GkrKGbVCXIQFxinCAglaeI3ramynzoF0PEbdoDPnPJ65QvPKihJsJi5V7XKql2gjQPKvDJ/O/U6d7XLEHvITFqhG/roNIZT4rbean9HuLVJ3DPIPN9FHvXnRcHoMilDWAdLD1T1JSE7H6G7Uf3LVhIUgabzka9u/HpZ+J8a0AX2DjhkhzQNg8sAavb/lDDi4RCK4jAE8Ic+TURmwNBVUM87idrSeJc+gs0bAHJrLhbbcv7YH7PMx1xLfcnl0zPbIWm989hURhl3C/eiMeO+iANYrih8A1zntL7OVZ5tgOzfNDAPGzbF4JsH4yKEYdQVxswzuRFHML+2dXm/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt0eNuXdU3v7Fj7Qlvd+xxHx2lIbIOyXpgWa972BIKA=;
 b=mNFXRNbnBDBsldOpUPxfUowuSxZnexUGw4cbyt0x5AUi47DMEEy85Dmd3/iDgfn+5COBL9G3/NQOK3b9SB5UACpIlLT4b5EC1DQSynSpwakbEpkKpCbfH46hsGwZGWp/oY4ntZnxGTHlfFQzopc9lIeXippLnwctg6QM0zcFPhn++RAAv6g7BDfdpZToqKf/E/MuFLQrkHx+VtMwRwadBc15sBAMj6RVD3cdg6kOyp7JbEjycFoSfpqgWp8+4WZdCT3LMTVLXyzpiKSMyuKyAgBrqXGMPRXtqOCn2zxD4/DV6/D9Q+na5KX6dgcNG2UkvraLtrf4KyKYVfC2dteBuA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 17:38:57 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:38:57 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/9] leds: st1202: set all pattern PWM slots to full after clearing pattern
Date: Thu,  2 Jul 2026 18:38:45 +0100
Message-ID:
 <GV1PR08MB849765352C4031BD2D800207C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702173845.2627318-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PR3PR08MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 113b80a6-595a-4796-5fda-08ded860cb7e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|51005399006|19110799012|8060799015|41001999006|37011999003|25010399006|15080799012|24021099003|5072599009|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnNEcXJPdnlqVlVodkpPbU5MZ2UzWnU4b1ZudmprWHFJMGRKNXlRd3ErK1p6?=
 =?utf-8?B?UmNPQkZOSm1lU0E3R01SRkJGbXB0NUp4REwvSlp5cE1UQk5ZWUpCUFZmMGYv?=
 =?utf-8?B?Z3dTSmpIVjlzT2lEMzNITG5QUjVKVjlMYmFaK21FREFjc2F3RWxkdzNpU294?=
 =?utf-8?B?YkZyQStiQ1h2RVdKWUpKaE1MTTF6YzUxT0gwT2ZrMENrL3lPVk1FdVZNNkF4?=
 =?utf-8?B?QWdKYnR1Vi91UGZxN2tYZWQzbHc0YWxOR0w2RlJNZlo4dFBPNTYxZUdyYlFl?=
 =?utf-8?B?T2Z2WjdPTHFLS0REb0VoQWlsYStQRlM4WDVDVEh6MnhBMXJpamZ5cm94WTNQ?=
 =?utf-8?B?aFptbGJoT1VSWVlUdUwxSXUrQy9qUDErWmN4aFY4dlRmQmtaUFNnNy9vQUU0?=
 =?utf-8?B?OFIwWFBmOEpJNDNhREVuMTZvSlRjRytsMTdxYVZ5RXlNb3lWL0lobzJuNGtM?=
 =?utf-8?B?Ti9RUmtqaEFBdkZvRENRSGxzZGM0Wit3UC93Wml6Snp3M2d3OFBuK3lCR2ti?=
 =?utf-8?B?SFVQaEIxNGQwallZWkYvUW9GV0hRT1hYZDVpSGZOR2lQUzQ4RG12dDE1TEI2?=
 =?utf-8?B?d0cvV1lqQzhxL2tYeHNPQktHYXNaZ3lDN2pHRVQyb29NdDkxbnF0Zld1eVMz?=
 =?utf-8?B?MnA1OHROS2VPSjViU013QmUveG1BZHFtMUtIdWtaSzlBTjc3U3l5WFF1SDdU?=
 =?utf-8?B?M2pxTHBiVTdkSGtYeWIwSEl4S1BDd2VrTVZTaXNxN1l0M1lZWUV5SnpDQW1z?=
 =?utf-8?B?U2RTUk9KUUFZMS84amZWYXFJdTF3SG1mUVZDWUo2a2hENkgxZU1Tb0pTOEVt?=
 =?utf-8?B?bFV0UlZCTngwNXIrTUlEdjJ5VFBRR2UwNXE3OGQ3SDVSZTk2Rnp2b2dFS2w1?=
 =?utf-8?B?Z2kvTFRtNFVvTHE0L2tKUjNJNkhWNGxHcjN6SWZXU1duS0FHaE84dmxBUGJ1?=
 =?utf-8?B?Q3FLWUxjWnJ5L2kvOVBwcER2VCs0eU9LS2tFY05yNnBkWFExVHMxZU5NVGgx?=
 =?utf-8?B?SStRaFhMVE0xdUtudTB0SGR6U2o3aXV0SUYrTHY2MmtQZXNwaUt2d0VWTSti?=
 =?utf-8?B?aU40VFRTZ0NjQ0V0dGt5YWx5aCtyYlJZaUZqcHRvNlFmYzZjY05JM0t4RXNO?=
 =?utf-8?B?NWEvQVBuNjdNbDJyTjhjVnc1eDlkZE9UTEhYbENneFVuQTNaeU5xMjRZZWhr?=
 =?utf-8?B?SldWemFjMXlrQTU3STFuQkVPWDBBK1BKYnlqbDhIMnBGWitadUFQU1k5Y1BP?=
 =?utf-8?B?dnhlY1JOOU0zeUFSZmorQ0hpcWFHVndsMWM5ZHBoUjd0OUpNb0l6WnR1a2lx?=
 =?utf-8?B?WHlFTVhTYW9IZ2xhZXJJemxZaGxRMld3MUphazNQREFEVGhOZno5eUpNTTht?=
 =?utf-8?Q?kmopSVj8+ulXWfmFvEbIA23N0IoWLXMg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dklrTUR2K1A1cStTcEFLMVdmWEZZOXY5b2lNOUhrUlpYS0gwc2Z6aDZtN21a?=
 =?utf-8?B?dTJYQkhEaTVpNDI3KzlBRDZTcnQ1SGRFL3dCRGxvdHpNbkRCRUE5NlpWQUpx?=
 =?utf-8?B?eC9HdE9vNWt6L08xYXBqT2w2RTRFY0pyUHAvTzNMQ3lWeUpaRHhPTEpYU1Bn?=
 =?utf-8?B?d2I1cFpHYUhGVDhTd0Z3b2ZZOFcvRjBUOGtYYk9NcEQ1WThDNWM1OE8zTk9C?=
 =?utf-8?B?TG5qZlNiR1hxRmsxdXFtSU5BWURsTVlBcmM1YzZiNncyZTJJMTlEeXM5Yzcw?=
 =?utf-8?B?VEVwMGQ5N01uZCsrY0E1S2N2QnhaRG92cDlzT1gxQTZ5RkVmaXJTL0ZlTENX?=
 =?utf-8?B?ZWQvQWpBbTNBWVg0Uy9OWnFCTFA0M1g1ckVlVW81Qm85ODNvU3A1eXdsY2VQ?=
 =?utf-8?B?aWhMdnBCR2l3WUdhTU53czZUdERCUUwwV0EzcXo2UGlUWWNodUltUlk0a0la?=
 =?utf-8?B?WkRuV2tFY0tMeUFqclRucWJuNjVDZjFaZ1p3M1d4NE1OckJwNXMycUpUbVpx?=
 =?utf-8?B?M2x1ajhNK1hkT2M5ZDdZUVgzSmFhcEhFYVdWVUoySHowZjQzYXk0SFNXeUZp?=
 =?utf-8?B?bGQzYWJVcnBTbkFoek1aYWhwNWphZ3UycVJlYUc1SXVSVVRtUFhTM1FxeGFX?=
 =?utf-8?B?K1ErT3dlazI5QnV4WVRnUnFYOExDd0dIZ3B4UHR3Qis3d2pIaGFUb1RsTU9n?=
 =?utf-8?B?b0xiT1dTTTNMZUI3SzV5dlBFdGIzVUg2MSt6THZyYmpCODBzTWM3Sm5SR2g4?=
 =?utf-8?B?d1pDZjBROGdqdXNxR2lPQ04yWHkvUmgzbHJQMk1ESk1SR0dSZVc4cWJGeDJZ?=
 =?utf-8?B?RE02bzBTd3U1V2xwV3J5cGc4U1ZzUFJCWkcxR3FFeExLOURRd0p1ZHB4ZlpK?=
 =?utf-8?B?NU45MTNIcjNrKzBQb2ZqSUkvYjVNYlk5VmZBR0ZmWmN5emh6d3VvdFdBUU82?=
 =?utf-8?B?V2VQaTVwQy9mWnVacTZCMGszNCs1aTN1cjhRR1FQMXhqSVBCTUlOMTFrSDU3?=
 =?utf-8?B?YUgvR0UycmFmcmU0WllBc2xld0JqSlFjU25UckQ5bEducjgrQ2dobld4dVdQ?=
 =?utf-8?B?ZVVFTW14V2RRRHBnUHlGYXRUM0UrcHpkTU5GaU5sZEVOWkdSd0czUXVnOVJz?=
 =?utf-8?B?eGpBNWJOR1ZOUUFxNHkwWDJvVmw3NnVPUnhwcDdFLzhUbWt1YzROeVpiaUVH?=
 =?utf-8?B?dTJrQWtzckE0a3d1WU4xMUQ5SlFKaG1LaG1na0tiNzBYdGR1RWsrWVNoQ293?=
 =?utf-8?B?cWd1M3lUL1NnUW5GVnl5ekdJS2NrTlVmSFRFak9YaCtRY09CeWtUTWRMQWtS?=
 =?utf-8?B?WkZ2OU1aSzJ0ck9aQm1hVDFkWVZjOStlMEFxMGVPSytVdGh0dTVwTTNKNEJE?=
 =?utf-8?B?R0tzN3dzZTVjeXFYRkU0di8ydkhGMUtaa3BPS0p4aGFicDBBcDBGMStiSXU4?=
 =?utf-8?B?ZzNXOWdiek9WeEdPMzBzRUJzNkNQS1FpL25hWWNMSEQvM3UyNURJQ2xwQzJq?=
 =?utf-8?B?YU0veUFFMTZwLzQxZWFQVGYzZE5TcUo5a1ljdjhjZWdOYnVXK2JtV0s3SGph?=
 =?utf-8?B?bGdUd3J3b0o0OEcvTHpuZFhtc0YxRGVsNTRTclZLcnNQWDNQa05hdnB2Q0Na?=
 =?utf-8?B?TUhTb092Mlc1TTFWMzNUSVVnNWI1QURhQUxNY0R5RjJoY0RCU3ZIeEIxM3h5?=
 =?utf-8?B?MnNNeTNkeXFLbzB5OXZvQUh2VlVIalA4UUtSbEwvWG1GV1lvb3FrdThUMVVX?=
 =?utf-8?B?b2J1NENCOXg5YjNFZmtaNFJVRGUxYWljRHJGQTd3eDl3YUdjODJYam1QZVF4?=
 =?utf-8?B?V00vTnJKZzJEdTJhYmhDYmFEY0ZrZ1hYNHMyTmhBZi85T2hhZ1p0cGlYTFBV?=
 =?utf-8?B?dE9vY0UwdzJHUURjL0FMdzJlbjkxRWFwVzBJdDFOZ2k1bERCRHEvaEtSK2dZ?=
 =?utf-8?Q?lQfJnypMuWPcROYV+exzvjCxqmEfEV8w?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113b80a6-595a-4796-5fda-08ded860cb7e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:38:57.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8861-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 901F46FC061

pattern_clear() zeros all PWM registers then restores only Pattern0 to
full duty cycle. Patterns 1-7 are left at zero.

The LED1202 has a single global sequencer shared across all channels. If
another channel starts the sequencer after this one has been cleared, the
cleared channel cycles through its PWM steps — full brightness on step 0,
dark for steps 1-7 — producing an unintended blink.

Set all 8 PWM slots to ST1202_PATTERN_PWM_FULL and unify into a single
loop from 0, ensuring the channel outputs steady ILED regardless of which
sequencer step is active.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b4adade49898..3203b3768ec5 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -35,6 +35,7 @@
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
+#define ST1202_PATTERN_PWM_FULL            0x0FFF
 #define ST1202_PATTERN_REP                 0x15
 
 struct st1202_led {
@@ -205,7 +206,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		return ret;
 
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
-		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
+		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
 		if (ret != 0)
 			return ret;
 
-- 
2.55.0


