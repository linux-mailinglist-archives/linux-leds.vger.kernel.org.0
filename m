Return-Path: <linux-leds+bounces-2518-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3795C2FF
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 03:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8370728424D
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 01:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C4B17997;
	Fri, 23 Aug 2024 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="EaombinK"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2075.outbound.protection.outlook.com [40.107.117.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F3125AC;
	Fri, 23 Aug 2024 01:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724377755; cv=fail; b=ehuiCDwMspLYlSSU6Kn9XzVxDxTlFj1Fg6XXVIzbQICWysuqeb7xxjGUCHuJxy7COamUVLYOUkdE78XKLl17gqudZ/dZDp8fslrqkVg2vle5iMTr/JEXZjHFIBdhRPoGrboQLrNnJx3cnJUXr4pzquRhnjcyDbf7XT2bsJlzlE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724377755; c=relaxed/simple;
	bh=XAU+wGhHaxWdwwUYRI5Rr9IL0lGoEjb5q/AL0L9lcnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AsEsgWuDVj/rqCSWrxyLzj5kJmGkDBGxmU4KppjHKtfRM2qZBq7x4F14+HQBrNGzljsctKR1bbyzMbQilRxuuB/MdSTaKwPX8s3W6cjxCra1KB8fLDo5RCjUA4Qh0KbLfOhIWVZ2Nlqq0VFJwOTeMDWZFs0vKOu6Ms+UxzyBOd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=EaombinK; arc=fail smtp.client-ip=40.107.117.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcjpZ0fqD5g19NFoNmYPNoPnbCWfBOWCkR2KJBLX+s30wu8wfBzwTdGJEAk0dGkF7/+AHhxwtjMzAccH2u+8W9Hv8861Qwe+eUhbcqbMTQxmST94UUWQh+XXfZ/jz+0yNgR2mEm1iK9MYhkH/Q4TBpe1lHFqc8Iuq71Is4uO/dAMrxsYrVwYpqTgtb4Zmt0w0MFotodlYRFNSSTVlX3d5E7+MEuzJe9AahgDR/EWthUe5xBSuGl/L3AzapyN7GQitugjvPQWkus2U83TqvbvxCpng9NCoqjZ86/T5pjjZfEdhnOczIeBLmsBuvFh0Rp864oy8Y8LhCnkssbQjS9g/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAU+wGhHaxWdwwUYRI5Rr9IL0lGoEjb5q/AL0L9lcnM=;
 b=bGY34algJmhNSfPo3GmzFiJl3rltBgI/hp1agiDaetAXW2l0PsGwifepJh25I9eIjH20u0vqCSLLslgABvHas41igIz0b2z5SJ7aJ9Vlcm4KQ/1znKHa6YCITFkbZaRSqjtNOVqq1sJ0vGeBjaiARJ0hK04gC1p4/bhv5lFPNA8Qk047Y1e5JmwoM4QcK8WE+LkrujpOHC2QwgwGtj93b/84mr4N7pwjS6U4jew/dri+mWh0O6CsJFyZO8eLAA4obkiqy3IXDkIJjs/GztUMsZMvhhJti3BZBudOd3Z8s+uiDfVpYnhc50oe1TLH4Y53HaamaXi8ev0ju8QK11h57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAU+wGhHaxWdwwUYRI5Rr9IL0lGoEjb5q/AL0L9lcnM=;
 b=EaombinK6wI5eSfLtFeKiHaeIiHe7WufwF73tlwl180LSjTK9wbiYk9Zd0aAiITfGALDPNTDIYsb9+yseUVoYGHTMjzZWtylJh6c0ktquvuKBpsbntTfilZvlCo2rk3CusG9FpU5eciK8E91nJbVAtrRGLc4U8zwPRL2qoRpZkB+RWCJ5opbYGvpBI4Hav0if+WBxNJDlus4kxDB3ldIyrOwnwD0/OUJPT9x9owksYcc/zID/ulMvE/kzTxvcL4ankqDTLZxKxHnHmffNMoSbGj5cNwMwvsc84tEfj1MGPN+OjLj6tdyssI3uUBEI+ylHk5g/KDohi7sjkB/pPu0uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5458.apcprd06.prod.outlook.com (2603:1096:400:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 01:49:10 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 01:49:09 +0000
Message-ID: <b3c2dd3e-56c9-441a-a4f3-d98996a9e8b1@vivo.com>
Date: Fri, 23 Aug 2024 09:49:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] leds: lp55xx: Use devm_clk_get_enabled() helpers
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240822020339.474715-1-link@vivo.com>
 <20240822135045.GL6858@google.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <20240822135045.GL6858@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5458:EE_
X-MS-Office365-Filtering-Correlation-Id: 2911d668-528f-47f4-e624-08dcc315c7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dStLWUxEL21ER2V6V0gzSkFqQkRmMkVHUmJ5Q2RNZkxkeHFYZnlnS2VCWVFU?=
 =?utf-8?B?TCtjUzFDVGEwMi92YXRua2ZKQldvSWtJZUorMDltQ2lrSXIrV2l4TUt0Y2hq?=
 =?utf-8?B?TEw0SUJnMXlsaXZScGJWendkSVlFZnhSaXhPWXM3TVgxbXJJSmpmRGpVTzVP?=
 =?utf-8?B?THVYTWZWQ3ZuTllzeXB2UmdMbzRrbHFNWjdrTFRSWHkvWFpIYjh4S3VhaVNF?=
 =?utf-8?B?T0M4enE0by8wQTc5NTlORDlLWG9GejZZN2VZZ2d0S05Wc2c3anNSOVllOGxJ?=
 =?utf-8?B?RWRBcGc0cWttTStCTURudjdFZDRhQmFCOTJBODNDclAvWkMyN0hlUWlLall1?=
 =?utf-8?B?Yms5WVFMK24yeCtDd1pGME02aXdIUnJsb1U0R0p1ejBtZFk1RHdDK0FYMVZB?=
 =?utf-8?B?cWo4Z1VHZnk1SmFJVGZKdTB2c1l5czNERlQ0NkdBeG9Rc3QrMHczZTlGSzFq?=
 =?utf-8?B?ZThHRHBXNGphYjdQOHNsVERmT0M0R0NDcGRRMkFBV3hLTVVQVXRIVGNSZlZi?=
 =?utf-8?B?ZWZpclVnZERGbVVKZ1drZ1FLS3NBNGUxOEx3d0h0clF4N2RHMDZaaGVrenpU?=
 =?utf-8?B?YktRWDYwOFJWcTNWOXJtVGVpRk1wUU1mNVZVbm9hcWNyNEsxbWpUdEo5OE45?=
 =?utf-8?B?ZGdwVGlYRWlxa3UxVCtwZ2djdklMWGExcG5QallTaUk3YnVEQk1lWDU2YVZY?=
 =?utf-8?B?TW9WZWtFNjNyL3NhK0xFMFBRRDl3bkM0NWtqT2N1bXU5bURCMjlQOUZwazdQ?=
 =?utf-8?B?WElDUWVTTS83OHd4Njgwb2ZDbHhiTWl5YnhkdFpuNmpKNnc2clpCMHVFdTBl?=
 =?utf-8?B?RVFta0ZDT2ozc0tZWW5jd05IWUJYVTRpYnV6SmM4akY4djc5cHpIbUVYWHdB?=
 =?utf-8?B?SytXR0VTUVdUcGZRUDZkb2pWenlWRFo1ZFBBZjM1WlpxK2E4bVQ2c0ljM0xI?=
 =?utf-8?B?SzNpUzVXTWlOWWhiY0gzZHA1L0FpbVdWcW1VSjE5RTVFcXhKV3ZZMzI4bnFX?=
 =?utf-8?B?ZnJIbUJNYXNVSm54NW12NFRGK0F3RTA4Z2FES01aQ0tRektMRVdmMU9qU0x6?=
 =?utf-8?B?emJseXluM0pvK3g1bzhaaVEyR1o0aEhHTUdCeG1Zd01ZTjUrdVFMZEhZem9M?=
 =?utf-8?B?YU9BbUcwVmxzdWVWK1lmTVFJYjc5NGNqU0h1QzNHeWVDL0V4KzRjQ1Z1YmZZ?=
 =?utf-8?B?bnJ0K3FmN0lEb0ZyTWVIWUt2am5zN0M0KzVBdHZISDBJSmplc21lMEVCc0tl?=
 =?utf-8?B?RTgyREFvc1VLN2piNU5nVmJNVW9xV0RvOHZwMnVDcDlRMjdRVmtMVWxqZGlx?=
 =?utf-8?B?elZtRlFrdDBjT2lDdFJLeEQ5c0lDWDRyUHpVWUtmWnBVd01Vc2pDczdtMnVH?=
 =?utf-8?B?RmJTRlFpMEdVak14QWxaemFBZzIwSUpNVHRGTU9mM0NYdU1Uc0p1UjdDdjln?=
 =?utf-8?B?WHErNWlZaUtoQi9OS083ZDJMM21EbHplWWQ5aTJHamZvYjdBZDIxL2pHYXJ3?=
 =?utf-8?B?NDNiWGpHQTVaM3h3WVlGZmJtQmhHNGFaazB2Y1pGaE83b2NNdFdBODFNV1kx?=
 =?utf-8?B?S2F3NjhLUFZMM2Y2MjJxNFphQU84K1MrdEJGU0hRWmJNVHV1QXNZd1djajVM?=
 =?utf-8?B?NUFKbERicjVkTG10TlhZUUJqUkZvNm9pbWlFSzFocDFremZQa2tpblhvSS9n?=
 =?utf-8?B?cGlESDFXSC8wWTkvSitOWW1BanBCV2VXRWJtNGVDZkM4U016dkUvZ0ZidmxK?=
 =?utf-8?B?TjdhWDhOZzJ6UjRnL216b25jUGhxVmlZZHZNTU5RNkNTRnFORTNwQmdhRHlu?=
 =?utf-8?B?M295dCtNaXFPdWRQNHhDR1o0NnF5TjNVSGF1VVJCTmF5OElHbHVFS2NxR2pE?=
 =?utf-8?B?QTV6VkgzZW9zWnREWDQxWXV2KzU4YXdoSlpYQVJzSVZUS1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdrQzdoRHBEVVErNTJSQ0lkMEpvNWRqc1IyRHNaNXlhcEg1MUxwM0pmRFpL?=
 =?utf-8?B?YzRTSk4ydzhxTG9tb0ZxZENlR1orUGdpNlk2dU04c0puUDBzZHRMdmJLbTZi?=
 =?utf-8?B?enBrd2R3WnByMGtvNEp2TEptbmhzc2NaUElCbmhpT0QrczZFNFdjb1BGUENY?=
 =?utf-8?B?dmo5WE01SzY4aDMxeWJlbENVQktkdFV2bzBmczVySkhkK21CM1N1Nk1aYXQ0?=
 =?utf-8?B?aFZuMmpYVFpldEVIMFcyWVBoREFSQWhJZTBwZXIyUFQ5NmpJTWs2VTNSOXVV?=
 =?utf-8?B?dCtnTXlFUGhHTmdTK2k5VDdOU01rZG9OK3VmSlBrVmRVbW4yZ052d1FoclND?=
 =?utf-8?B?UzhySUg1TGE4c2x4M0dqSThjVUYzdGt6bno5UkJkcEdZT2ZuMCtrd1JlZXpJ?=
 =?utf-8?B?VnFKcS9rSmtRQlJ3UWhIUGRGRVphdU92eUZVRUNVRlA2Q3FZWUN3UlJ2ZEhq?=
 =?utf-8?B?Y2NwRERDOGd4UHZ5QkU4dVI5UWtpN2ZGU2lHT1ltajZSZzIyeW5LQUlVb2xQ?=
 =?utf-8?B?R3dFa1hzRkpYVTVWV3RyRlNUNVFNRGcxOFEzcSsyYktmSWZWUXRqS2dpZ2lv?=
 =?utf-8?B?S0pPbm40YXJVTEs4Tzg0d2h2ZkZQRkMySy9peGdPMElhdU9ieEVac3dZcUkr?=
 =?utf-8?B?a1lHTWtWeHpqZ1ZlRFYvSkFjZ1Y5QzdpaGIrTkNPUXA1MDlyVEdTd3hLNlU4?=
 =?utf-8?B?aTJzcXFsOEhIV1NpMUFzc2g0WnRadlA3Z2dFWjFPN1l3V2xteCtIbG1hZHd6?=
 =?utf-8?B?TVJKNyt0Yk4vK3JDNGYxclcxYjhheUZ4Z2pNKzRVSFEzdjJuNlA4ZlFrcWMy?=
 =?utf-8?B?VkYzQzNPQmQ2UGd3b00zZWZ2Ui94VU9xS094SG1ZN1pRQmRvL0U1T2drcEcy?=
 =?utf-8?B?aW1jcDdwVStqcnpiQ1prU2orVHdGRnJYMzc1R3JLdFJpL1RRYXRidW1rZndF?=
 =?utf-8?B?UkVQYytJUFNmSXhpYlZGZ0l1Nk0zNDRRVVFVZER2dC93VHlxdC9JWlFaTmEy?=
 =?utf-8?B?V0dVNTV2eXFXOGx1U3VlR0dYelcrKzdQYUw0WHk5N2FGaWpaTE40T3VKdUJv?=
 =?utf-8?B?enMweE9ISWdRMWlHNGtMQkxrZFBXcXhGMWJUTXozT2JyNUpzc3M5d2hKRUZ3?=
 =?utf-8?B?bXFGUUVtd3dONk92cjBUamhZMVEwWElaYW1vcEFBenNmdnZBdmY1cERWaU8r?=
 =?utf-8?B?VzdRTmxvK0JaZVVTUmtoTHJkLzZ6RmhucE9Ya2ZjWjNmTGhLeUZremROcXRJ?=
 =?utf-8?B?S3R6dHdaSHZvNkF4Kys2ckhPR01VT0MwWGRYK0JsRjJnL093VENJcDRBcTls?=
 =?utf-8?B?dzFFTjVjaUtLcTVHWVRlQTJMY0xJK3R0M0tTcmRmQlA2c2FTc1h1K3N5RkNL?=
 =?utf-8?B?UWpCQS9lK3dFNzJlY0k5M1pEVE1RVjdubjF3anNOQVorajk3N1p6cndzMWd5?=
 =?utf-8?B?SmV5YmFhN2d2dGNvZFZrUjJ0NjJBNEdQaUxYMGlXNzVEQ28yMElhSCtXbTVT?=
 =?utf-8?B?WVpwUy9Bc2RNaG1GQVpaL01YQ1R3Ujc0TUtvMnJFdllsTTBvUUwrY0JhU2tO?=
 =?utf-8?B?TGNYMndXQmhaMVZ5ZHRVb0NDbUtoTXUwMlJwbFVXK0pnd2o5UEJDTkRuY0Rp?=
 =?utf-8?B?N0liYmRSa2hsUmQ4alRPWWprdVlpaStZbW1uWnJlc1oyTFhKb214Q2VzZ0hI?=
 =?utf-8?B?NHhtVzdqeTBSS2lpWFNWaVI1dVJKSHlLOVk4OGRvZEIxOHd2d3VHTGlYaDZz?=
 =?utf-8?B?TW5uWHVQZ2hNU2tOTFI5VjFmYWN0VFUxbVZVVlhUeGo0Q0pVM3RScWhnWEx1?=
 =?utf-8?B?UXFGQlFnM1UxQmJBMTBJMURjN29mVkVqZTVFZHNBMytGamE0QzYzaUIyMHRi?=
 =?utf-8?B?cTc0bW9sL3QrSGVnb0NuWkpDcVBJZmdVY0ZUYTVrcUJxNHg3NFhWMVhvTnJa?=
 =?utf-8?B?cnlZS3J1c2c1Q1VDaE1VYS9rTGdjWEZJYy9NVjB5RUVnc1IwZ1FjSDBjYXE1?=
 =?utf-8?B?VUZuMkp3Z3dRMjRGeHVrbU9TVVNDZkhaeEF4MGphYmNwdldKV0NNVUF1UTla?=
 =?utf-8?B?Qi9IMkNuVlJ6SG5sS3Y5Mzl4T3VvWndXSzZ5Y1lhbnpLL0JwUnpKcU1HaE5l?=
 =?utf-8?Q?lFzgXx2QqIk2YMTgJDB8FHyaZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2911d668-528f-47f4-e624-08dcc315c7d9
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:49:09.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymxgWU3ob146syO9UXZOmWsfQRhJLkz3CjOJpcDE9lvnuyukEqx65kQpntJZKvt1pnYQMpsI5WSv7S5go4Tplg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5458


在 2024/8/22 21:50, Lee Jones 写道:
> Sorry, what's this?

A suggested-by remove, which Christophe JAILLET recommand me.

If v2 accepted, maybe you can ignore it.


