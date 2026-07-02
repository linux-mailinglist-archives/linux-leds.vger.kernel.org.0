Return-Path: <linux-leds+bounces-8860-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Cq8NfSiRmruagsAu9opvQ
	(envelope-from <linux-leds+bounces-8860-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:42:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 454976FB8DF
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:42:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=QWRA4QZq;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8860-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8860-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAB86302B830
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99D634B183;
	Thu,  2 Jul 2026 17:38:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013085.outbound.protection.outlook.com [52.103.51.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331634FF78;
	Thu,  2 Jul 2026 17:38:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013896; cv=fail; b=XrczFKICpPapnJ4aGUw3I+SZ2TcT4jf0gu8Yg/pv77/N2ZrgRnpy9RbZ4cGuam7+xRsEAYrztbKX6TeFC2zRjIAM/4a9ThXUOIAxqsZWLeIsqYj0H+6P0jLnw4hT2U+DhxSdFbryO/dN+d5L1brk/ex6lXwWzJQZjIr+cqysv8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013896; c=relaxed/simple;
	bh=y6ZriouCkezk/WIbS1eWC+nHIUnBDRkSrfHoLsJCKcQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSizUfeU+6+znPRUhzB1RNgCGRLF7mLxqflA2hlNt7x58/MoV0rKA10BNfTnNU98fnigs/dF0PhJmfHy3pzpqlGvr3x0p1jtixboqg4hv6uWMvRWkhEe16tRsbvGkjmXH+KzgMP3UcEbsV/XkDoTjYToHKXv1nfUatx/tUQ5g2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QWRA4QZq; arc=fail smtp.client-ip=52.103.51.85
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a26osznJk5QJmPBSSs9UEcEAKBPP6JrE+EpSJpbN18BQ8Xcq7buhyVw6NWyuBQIje3qC96kOthyoNxcVrSTbH0GgST8xwzMS4SpS/rVcWwtvKmnYF26hbjzvzn7mHZAfVTwrFpqnOnhq1UtgC2LSb1cZfYW28Gb6va1J6wTAyNazB+/S8/3KxF5eHGxdSjdIbuCHc6py9sgwlnK/HBvsnK8N1UqAogPCO8afEeaOn2jD5GTEgAN3VM62u5FDrEhZYOww9sz+gvVMThzA/2nccRp6ikAsZCIfbQzPzNYlIxIsXJ7JJio7ti54uMEt4rVX+geRPfIxpRE4HonFikDYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMc+EFeg9X1zZU6eW0NtIQufBh7TLS5qHw7SRqNyT3g=;
 b=fk/T9GvF/DB/hGrgIvhNRv1lfKgEQ28PNfmDtu55IKNfQtzEqKnV1urISGHjXKYfDPIAPMAYt0CNlPkEqxVFK2nXOxSP7ojKcQyeStgaE4dee3qCno3D7QP/irrsiwx7YyZmX6qqnOabHN/Eklzknyd6jVfDKLFE9zmS86hOFfkmo/65OZ/DBJfTTu+UTs1UGcIxyGpxPJu2V5kaTPIj98S1hMn3kmzyfD+Onb+r4WOW6QrBDbCbHssnTfaHNULW5fxM7U71T/FKCHfkztJ+xVArCLD1vKGgrGaa5wgYWX4cSf6LgPtD0Vat9P/Pv7BN+vptk8oayUDNbbYVduigIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMc+EFeg9X1zZU6eW0NtIQufBh7TLS5qHw7SRqNyT3g=;
 b=QWRA4QZqOdmjLmDl+5WoO/AQh9m0E4G5hgR5del+TqNbRhD4TlrPc+Z/Qg2npDkrf+8PLwdPGTdZM0VT0ddLvwBe36RrRluNfrNwgOrGmjYAzKxPQdO8DCN+hn49k7xug7/6VtGaFgETpj0eLww66+dzAIqWXEBZrTv8XT6I5QP2LXudEr4AJIYi/hXNe8l/LTxvlc1OnBp/+9NqQvWggAuGz9/veob8h7H1v7AEqfIo+NOaoSa5lx04vZv+Qmx2v5hgJjOLRK+a22NWHnyjCRYZE+GMh17X6jr5LHRC6dzTDhq/yMOahuSprZqKTSDkrVtcp524vgJm2PeyJ16gBw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 17:38:12 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:38:12 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/9] leds: st1202: fix pattern duration prescaler and pattern_clear skip marker
Date: Thu,  2 Jul 2026 18:37:59 +0100
Message-ID:
 <GV1PR08MB8497E6FE3F611C57006E80EDC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702173759.2623047-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PR3PR08MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b2337a-972f-4c3a-ca43-08ded860b07a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|51005399006|19110799012|8060799015|41001999006|37011999003|25010399006|15080799012|24021099003|5072599009|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S09oQy9WaDBlc2RNSE8vNi9Scnp1T29qUFV2cFdKQmhJY1RkVTlYUCtDTGdU?=
 =?utf-8?B?VWRNSzV3cC9QMFJEeWhJR1loY2NLUEduQUtzOUdEbWJwdEtxV2RMMHB5ZFhz?=
 =?utf-8?B?YTNhZmEyaHNzODVSZEdwQlRUVjJBSXFVVUd2NUlRNExTTDRHdnBSUTFQRUgw?=
 =?utf-8?B?S0VlN1JmVEZXd1F1K1g1V0hsdzZrSS9FeW8wNDRSRkk4ek5MZTlsMEF4UkQ5?=
 =?utf-8?B?SFVuVWcweGRvM1U3SGpKV0NmN0oyNlM5cnVTWWM3SW4xU1U2bHlHWEFjSllm?=
 =?utf-8?B?WjR3aTJPa2dFK0JNT1MzTlBDTFpRQTBUT2RXYzVub0JtaEdHQ1U0eG55akZj?=
 =?utf-8?B?QXU2UDZhcDRjQjFSZmNaTnBiU0RnRXc4b1BwZWZGQm9UZmpEaGkzSlpzWDgz?=
 =?utf-8?B?a0Q2T1U5YW5MYi8yV1lpbTJEaUx3ZGpoa2FJWm9HV0VTZks5Z1VJeXNVVkxM?=
 =?utf-8?B?cTZPSWd4Rk1zV3lLLzhKcHdzS3lRYUZIYVBveURnK1NzVmNLemFWcnVTQ01q?=
 =?utf-8?B?dnNIaFI5ZEtwVG56c2dsSm9MMWNWVXpJRmpBS1F0NWY0ejNmWW9XNVY4UGpR?=
 =?utf-8?B?cXZWZGFYKzNZVDhaMDA5eUtpRCtIbzZsN1RhWWkrdjFoZnFzUWkwQzM4OGw5?=
 =?utf-8?B?TzZaWGRsRHBmWE1LbWZRRnZ4ekduMTV2UWNEclF5bU5PeTgyK2FvSVQwSHVU?=
 =?utf-8?B?SHBWeGNhQjlyd29MbU5FK3RPcjkzcExuaXFQQThrVTVZV2JYSTVsa0tqdDMz?=
 =?utf-8?B?NFY3dlNJSlQ4Q2hBRXdPT1ZaN3Bpa0I2VlRvd3FRd0tCUzhQR202MUo5ZERF?=
 =?utf-8?B?VktNZG53dC91NE9YWGF2OHI5VHU5SzkrV1BqMnpVY3J1SERmMHNtYkVIREN2?=
 =?utf-8?B?YTk0NnRCanRYKzNFMUhONHBSQXMvSERncmMrV0x3eW9qbzNkS0JQQk1HSHRu?=
 =?utf-8?B?VWJaZEVmL01IVXpObkV1REVDM0w5Y25zUjJhWDdDSzhOaExHUmhFQ3lYT1ZH?=
 =?utf-8?B?ajZwcnZZNEphNUptL2IyUHlpNnVTYVdUMTRjK0R6Z0VWZHZ5TEJLblNwdzdP?=
 =?utf-8?B?aEhIL3d6VXhPWWtrSHQ5RHBPemxMUnh4dHp4WkgwckludEppMFVpM3NtSGJj?=
 =?utf-8?B?VFNFV2l0c3pGNEp6UUJNanptNlR1NFkzcC9iNW1TcG9CRWVvUE9LSnRsSnVC?=
 =?utf-8?B?Q3NqOC9iWVAzajZ2S3ZzNytkTWdscFNsbnM2WFR5QUNVQjdhcU96Qm9sMVFB?=
 =?utf-8?B?OUVsLzRMUGlIdTBtcUVqMlVuQzJTQW5WalhLTjQwOEdCMG9lQk5SNVpVMHJP?=
 =?utf-8?B?THJsZjdSSkZqdk9FbXNBNDlFeWltOGdKSFQvZVlkWUhUSXlhSzFvbWdZdHBE?=
 =?utf-8?Q?A0ER9E99zLGwcE/VY6+06+fWWqtAm20g=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vlo5c0RZOXB6a3ltdyt0V0JEVjRDcnIxUXI3VnJxYndHeTE3M0dKbko5TTJP?=
 =?utf-8?B?YlEvTnhwWDRWSU1CTUNxbEVZQlhCOFkvQy84RHBCNm9jejN1aWZhMkloZ05v?=
 =?utf-8?B?TEpSZmdOT2tLNENrWVdja1JKWEN2c0Mxc0VPSjRDQVQyRWRVTW1EWkdWcWNw?=
 =?utf-8?B?cytlV2xZbzI2bG54czVmMWtGdldaRnNzK0dGbTgvM0lJQlZONUE5S2R2UndY?=
 =?utf-8?B?c0ZLc1FZbWRwdlJMbVUxNWR0NXBlc05QQm1Xd1JPSHZJWjZZZ1ByUHFJOTJS?=
 =?utf-8?B?ZENJM3U1LzdyZ3g4anRvSFFRbmtrTUNKTzdCTGpTanZYQ1ZZVk1qQ3hDWlp1?=
 =?utf-8?B?blBCVFNzR242VDNGSWgxN0hiMHcvdzE4NC9PRWE1WUx2UTNoRE4wSVUzK1RX?=
 =?utf-8?B?L1YxUVdXTmRDQ0hlNG80SVl3a1E1TnI2dUkra01Dc3hDZnBpOWNlaVdRTThR?=
 =?utf-8?B?OW9LdHE5b1JSTm45Q1Mxc3QvazE5YnlweGU4NTNJelgzRnVKK1JraGR2UXoz?=
 =?utf-8?B?Slk2VGt3R3oxSEI5MTV0NUxqMHZTTXc3R2hzT0txdVg0RllMK0luT1plQ1NK?=
 =?utf-8?B?ZXo1NkRlNXd4ZXFsb1RxZXUrQVFYOVdIYUZEb0RCYXZHQmNTY2tzdW5MbXBQ?=
 =?utf-8?B?SEVYY3lvSzAySXpzNXh3c0VjQk9LQVRTcFlEaU9TUzhnUG02V1Z3V0M2cktB?=
 =?utf-8?B?MUNDdTFPdFNrZWFudll4QncxVVZPMXg1TXMwT29Jck0xYnBNTHUrYi8yZk1D?=
 =?utf-8?B?bkY0T0l6N3VOZ1g0N2NDbVpyMGg0ZXBDNWRrTS9WZ1prZUxndVAvYnBscFRn?=
 =?utf-8?B?RzJDaURTS0FQRVVTOFFXUXZVQ3pOa284Q3laQlQyMFo2ZWM2QVhQVUxEcUNU?=
 =?utf-8?B?d3J1d3UxT2FNclc0TFB2dWFXS3VnV3FSUlY3VW5FRWE4VytmSyszeTB3M0hN?=
 =?utf-8?B?blNhaXdFTTMvYnU4Vk13b0pkbUI2NGhIcG9mQ1EvMmwrdmRBMUlqeHV1c2ti?=
 =?utf-8?B?Z09mYVZTU2s1L3dXbmNCVXhFOVBRVzQzK1cyZDgySmRaV2g0MHNhWXlwS2hv?=
 =?utf-8?B?Qkw5bmpnRXlnNytPVmFyZmRrcUpFNHJjM2hvakZhMG5EUkpwbU5jd1ZQT0lr?=
 =?utf-8?B?NGMvTU9QUm42WU15TWRnSExyb2s1UENZL0djUVFPN0xOTmtqWlpDVWk3cUxG?=
 =?utf-8?B?aGJsUVV6YXBVUHRMUzhmaUJEaDRzUFNRcDBMeG5wVXB3SG9XOGJBVEJUcjRU?=
 =?utf-8?B?VWxzd1ZyVlAzU3lPZmdHYXd0M0lLdFpBeEYrR0NQcXVuV3lhOHRVcWJTWXo1?=
 =?utf-8?B?QnZoa1lqTXFnRFAvTXpGVGdLb1Y0YW8rY0MweXh0dng3ZUJ3M1BxTGFaajdR?=
 =?utf-8?B?V3VBdW5zdUdkK01VeFlnam1QTlFtK21RaGVxQUVqNWtBbHFVK3o4bFJsWTg5?=
 =?utf-8?B?Y3A2RXp4anZFN2JZQTZ5bXRFaGk5L1FXNnVLTjRXKzFsTmVEZ2ozbHhKUHBJ?=
 =?utf-8?B?bEQvRkJVMTlHSW1RQ1FuWnM2dnhFS015QkNPYXZaQ2dyM2RITFIvSG40R2c1?=
 =?utf-8?B?OGYrR2dWV0YvSDlsN1hScjFVYUJSZGhEbmgyLzVFMENGd2hycjR0dU5KWlpi?=
 =?utf-8?B?dFVOR3dSU2IrejdUMG9WNWJaam5OdWdLOSs1UllHaTIvT1ZiT05McGJpQ2F4?=
 =?utf-8?B?UHBnMGo4Ryt0ME4yaVd4Uk1hQ2Nqbk92MkRjWnl6MGNtZzlKNVErbWlocnpp?=
 =?utf-8?B?SGkrNUtULzlqS0N5UkVGUllubkY2TUJmeGI4UTBoWmpQRFg3aldYeVNsenF2?=
 =?utf-8?B?eU9lSThBV1k4YjdOTjBmelFaK3lOaDUvb2hybWtzeVUrbTlzSytSZnhTZEUx?=
 =?utf-8?B?b082VnB3SlFiWGw0NjMrVlN1MjRvOFA0c09ySnZsUmZJNzJkbmpzNldrWWgx?=
 =?utf-8?Q?EurWqIe99yyzrctRIE9bPVVOeS9IJyts?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b2337a-972f-4c3a-ca43-08ded860b07a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:38:12.6255
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8860-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,outlook.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 454976FB8DF

The PATy_DUR register encodes duration as N × 22.2 ms, with register
value 0 reserved as a pattern skip indicator (§7.10). The driver
incorrectly subtracted 1 from the register value:

  value / ST1202_MILLIS_PATTERN_DUR_MIN - 1

This caused two problems:

  - All programmed durations were off by one step (~22 ms too short).
  - Writing the minimum duration (22 ms) produced register value 0,
    silently skipping the pattern step instead of setting a 22 ms
    duration.

The maximum duration constant was also wrong at 5660 ms. The 8-bit
register saturates at 255, giving a maximum of 5610 ms (22 ms × 255).
Values above 5653 ms were already producing a uint8_t overflow and
writing 0 to the hardware.

Fix the formula by removing the erroneous subtraction, and derive the
maximum from the register width so the relationship is explicit. Update
the documentation to reflect the correct maximum.

This exposes a secondary issue: pattern_clear() was calling
st1202_duration_pattern_write() with ST1202_MILLIS_PATTERN_DUR_MIN to
reset unused slots, accidentally relying on the broken formula to
produce register value 0. With the corrected formula, the same call
writes 0x01 (22 ms), leaving unused slots as valid 22 ms zero-PWM
steps and making the LED appear off for 7 × 22 ms out of every cycle.

Write 0 directly to the duration registers in pattern_clear() so unused
slots are always explicitly marked as skip, independently of the
conversion formula.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 2 +-
 drivers/leds/leds-st1202.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index a750c95ef3f8..b4adade49898 100644
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
@@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.55.0


