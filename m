Return-Path: <linux-leds+bounces-6694-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIn5NS4fcWmodQAAu9opvQ
	(envelope-from <linux-leds+bounces-6694-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 19:47:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5705B7BC
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 19:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 94062B699A7
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 18:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FC733F37E;
	Wed, 21 Jan 2026 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="Cp4KGqYG"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020117.outbound.protection.outlook.com [52.101.69.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18642338584;
	Wed, 21 Jan 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018351; cv=fail; b=liI/Kfo2LNTB0FF4tCTUqzay42Q2PCyFfoiclAs5fMdxc81NnL8dkJdMs/NXgCSVPpTNXZzuZhoCAN0Kf5hV/PkhLd8aVyNu5J+y8W//U0wQPGPZhz+JqkBiu3ZR6aWWoC2MpL3SH7UpgoolaIpRToFmwRH7HC4V89BX911NrnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018351; c=relaxed/simple;
	bh=RW74ilIMq7u1nne+yMkImyXWBWaHeOzoo3jZ76AhoQg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T/Ets2zcf5pe4sHF9+exMBOvead9utSSw8UuUGmXOqoXpDwoNt7h7qFGZGhS7uz36+ADrswhgUDByi3+ZOZ8f6RVRf4b1eG/NYF98oQ64vRiEgIdoWNV8FrBUF2jFgnw9AqoN9kqeT+Ws87mHfoF6TpmpwIwCGtuxFXa0+KwAnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=Cp4KGqYG; arc=fail smtp.client-ip=52.101.69.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+ZnysJvw0XZIaINwlKGe9UN8uM8+HMjf6shGuHH2AfORnx41QlE5Z191P5BDprluRY+hcHYd/X7NPPst1NvVHxxdm+koNo0rbXkfKLxQ8n8R1pdxJ0Mc+kN+GjIqF83czWXcPvdxKdgswpODk9D2hM34Sat5cTyiemKDXfBfpNWebdSVtUvtX+nj51lGeoRurAJ24hLhDlrpW6GCAlVxMYT6LLQ0OAmrD0t1RokOgZeBIfWAj/L31sZZc2M6sZt9kzMl2avUPLNhibjhKPgM+hD/LBohiGNqDFNdEGbNRtMv2Z3LDNQtGmkwNbKVaifYEmG6nScBKNV8vDBS1f/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4E659C6UTMMkAWJRpvh0w9u/AWt+iXCZ6XJKLuy648g=;
 b=vfGdAfRzjHjPAl/nkyjzUE01Tphi5I9QCtkCc1nbVlIOrFe4AEDB10pJhwbPcb5PXarA/+lYQL14TSdE7qRVqnJ6NX9xRd1uUt09P/wQWKlJMGOCFRF3evB5QAMighplB9RAGqPj/s4sOxad2a+WcWo96ueoObO7QAmxm+C80hWkocKBeN1K5Lq9MtNdLwBaoxVjPicpWDsVvZfABq8rqqWDlZtcVnoTrpYXa7X1U79MoBRp8anKcYEl164EUntdeNdwk9gx/ZcMpMYOQfPqgRv+YXfDUtOIoIfNV245sfCmVgEelYCL0v2fmGcE46EBOTrtsRYt+0kzS2chODCYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E659C6UTMMkAWJRpvh0w9u/AWt+iXCZ6XJKLuy648g=;
 b=Cp4KGqYGu3FELoZeqNfr1Cyr0ZyLqYaEI3my7Aje9A8VM8rNh389or5Aj3X5nxVIvm9jrsP+x+X2ItSrPAWOZ6RE8yTSbTF9ZAmFtxiLCAy22a1Os1HhGjIwQx0azaiiJfySj19B25/NwYAnbE8+RVl0NF5Ss7pLcEA4V0WPVLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17)
 by AS8PR02MB6534.eurprd02.prod.outlook.com (2603:10a6:20b:253::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 17:59:03 +0000
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::9fdf:6182:1005:2168]) by AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::9fdf:6182:1005:2168%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:59:03 +0000
Message-ID: <5603114d-4cc8-4d7c-96ae-838e70e5e385@prodrive-technologies.com>
Date: Wed, 21 Jan 2026 18:59:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: group-multicolor: Add support for initial value.
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com>
 <20251214152116.GC9275@google.com>
 <26676694-ec69-4fef-8337-a6c7ceb1396d@traphandler.com>
 <3ae26a51-ac87-4e0e-a7ec-88132106580d@prodrive-technologies.com>
Content-Language: en-US
In-Reply-To: <3ae26a51-ac87-4e0e-a7ec-88132106580d@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0257.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::10) To AS8PR02MB9532.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::17)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9532:EE_|AS8PR02MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc4b302-5d18-4579-2008-08de5916c359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak1PTm92VHVSejJhRVlHQXhjVFZPbFczMUpKSDVDbUd3cFhDMWlzZ0xaTzFB?=
 =?utf-8?B?b2ZTenROM2FQZWZJcGRxTXFWTGVOd2VENHIvVDZvUWl3bDVnNkZrQTlGNlFN?=
 =?utf-8?B?SEd0Z2cwNUtPQ1ZzaExvcmhsdG5zU0pRUm56aVY3MnlsODhoRVVDeFpCeDdH?=
 =?utf-8?B?WjJ5NzBVMnJHR3RBazhXYkdzN2dhdFhNYitmRzQ4b3NTTkhEd3JKUVZRZ0l2?=
 =?utf-8?B?d0FaWlRDaE5jUE1EaVpobjlaSzQ2OThqTytoWVBESkJkV3g2SWZabUdWK1Ew?=
 =?utf-8?B?Zm45R3pYWTZsZnNFUnd2SlRVMHpKTnJnMUJOQWM0aDhMa2VPRVRnb2tpOGpz?=
 =?utf-8?B?cGJjN0RSZG1FWjFOTW51L2xQeWsxOTdWNmJEbGlJSSt1a1g2YlJjdWEvUGlD?=
 =?utf-8?B?NnN1WWRGRWdnVGtaNVlwRlFnV2FLOGZnK1pNQU9oelNuYXFaZFhIVlZEWmIr?=
 =?utf-8?B?NGdITWlYcktERlJrdTRqdHpUek03UDlBUkh5d01Na3ZMWGdZWjZ5cjdxWm9n?=
 =?utf-8?B?N3E4WEFuM1VoaFR1ci9teUxoancwYmswaU5KUlVJMTZhMFJ6YWVVNHpQMEQz?=
 =?utf-8?B?TE9tSVczSCtxbndJcUxDOGE5YzdPcm5jdnBPcWszTm8wS3hiV0VjeDB5d2V3?=
 =?utf-8?B?TS95M3NlY0xoQTQwVi9iYVVIbWs5SDZhTU9kcThZY1ZxMnRPR3N3T0EyZnNq?=
 =?utf-8?B?MnEzYU9QQXdvdzhLL3Q1empPVWJEV04wb2V4MGEyaHhwRUZpd2FSd3V3Nytk?=
 =?utf-8?B?QmhJRUxkOUt4TkF5d3RmV2ZSbFZVam1qS3VhSXJWWHI3WEF5NjE2ZlpaR1ZQ?=
 =?utf-8?B?VTZaVTh3d0hOZ2ZKNXlCMjJ1bVBRcm1Qd3J3QlgrVGVtQWNXbTRUNkVMbTRm?=
 =?utf-8?B?WnZqYVVQT1ZLZUJ0V3plMXpxL0ppb2JxSXYvcHdtUXBnU3A1ODFXQWduNmVQ?=
 =?utf-8?B?MlNBUC90OFE1b2NJUFFKOXpGd0IvUjNGbUNXNVZRdmM5RTdQOVFlbHA4OUN3?=
 =?utf-8?B?K0pmYWJVeEhCUFRPMytIenRJN215bzZlL0k0cHFLSGNlUm13bmNYL2NHTkw3?=
 =?utf-8?B?bkd3TGJnZVQwS01QRXlMVElLOUF1eEp2dXdjcmFJWUVwUEVvSVhYaytHVm5G?=
 =?utf-8?B?cVU3UXlBNkpkT2dxeUZ2bHoyZWV4NTRVeGQ5TjY3NzlPbXpUYnQwVjQwTS9D?=
 =?utf-8?B?d05aOTRtQ3M5ejB3NGNreGRhL1c3WWVMR204T0U5N3BqUHFBb1hIUktlZytX?=
 =?utf-8?B?ZThKQjBsR2pkU3ZzMVhrbTNWRlhmRUZGRzN2eUdRMEV3SXprdjhIUFp6aHdQ?=
 =?utf-8?B?TjhzTGYzamVzVStvcm85VFZsMmZMZnRKQm1ISER3dFROdDEwTGY1b0JsSWtu?=
 =?utf-8?B?bHBjTlo3NzNpQ1ZtZ2NRMWFacWJOTXJ3V1VDcy9EWTc4eWx4U0h6TmtYbk9m?=
 =?utf-8?B?R3dPRmNsNy9neGdXSFp5UkV6emxueGtsL2NTaXlVUEkzeWloRVF0ZVBrVzE3?=
 =?utf-8?B?Mk5EUm81U1B3RkVieS9rdFhQYmpJRDdkU25ZWmF4SEJjZkR2a0k0RUd5VjVH?=
 =?utf-8?B?L1FVdk5COXA4VVpxRkRMcHI0dDNzWkl1UmRCQzBicmxCcDl4VVE5ZUNqWnZR?=
 =?utf-8?B?NzkwM2ZwRCtlUGJ4MlRUYzdtNGIyYnNsdU5hUE5OdmtnZGdBWlNla044YlZB?=
 =?utf-8?B?N3B6TzRWNVhva0NFZGRhTmcwVnA2TnFKTUtsa2JPdHlNdk5ZWGJtdnVjMFJT?=
 =?utf-8?B?SWh2OVJDNkxhYmtWalpqd3BDMy92TDNXWXpKUXlOMFgvc055OFlPaWZPZWlT?=
 =?utf-8?B?dXBTS1ZjcDY4TmN3NDYwRFNVdEhUSXQrV3lFTGMwenFLOUlYSTQwcjZ2T3lm?=
 =?utf-8?B?SEZFbUxEeHBrWWhYRjVBZTkyRkpMWmVDdXBHMkNLRytpQnEveGRSb1AvVGJE?=
 =?utf-8?B?d2tsaWJxV01CTDBKZlNONXZPd0xncGo0VXlQRlVlYlo0VWFraEpBWFlKVzlM?=
 =?utf-8?B?d09YUmRTNVdqdEN0aG53NFkzRXk3dmlsVVl6aEl5bFFuWmQyc2JTNXM5REo4?=
 =?utf-8?B?UkIvNGJGWEMyY09LUnFBRjE3UzZ5d3lWaWcvTVRVNDRBQXltUGQvMDVaRlh2?=
 =?utf-8?Q?1Ncg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9532.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzMyU3BlM0hmZnhPNGlSU0xyank0ZjFDUDZlMGVBUERhM1lSc2YvNnpFVmJK?=
 =?utf-8?B?YzMwNWFyczh0R1ZnVk9icEFlZkJzTkpBVzVPTFpjWmc3QVo2QkQ0blZxRXBR?=
 =?utf-8?B?V21rckkrYTloRTdMZnZHa0xaWWEyeEV0QjQ4RzYxS0RKVE5mYUlJd0RQTU1V?=
 =?utf-8?B?TTZiWVdxV2ozYVJzQ1BWKzNwQS84Z1RrSmUzYTdPRkdFb0krWHE4RklEelZ6?=
 =?utf-8?B?SUR5TFJOTHRxanhPR0g1Zi8yWlgyY1VNd2F0c2drRlJnZ0lVS1h4ajV0dU16?=
 =?utf-8?B?RDR1Mm9rTWl5dCtMVnEzTXFLZFc0ZkQzek9PVzh3aEk4UFI4L2VjQzBRTUtr?=
 =?utf-8?B?Y29mVWVLM2UrQk1GN0JlemcyYkIxdGR5Q0htUzlLemxZbWsxdmF0QjVtUnpG?=
 =?utf-8?B?MEVHeFZCS2xkZU1UZkxxeXhvaVBvRUN2SEVwLzJOTEZHTURSd3NKQy9CSjho?=
 =?utf-8?B?U2FIN21KQmJpYjlObVBrNHgyNFVTWjA0REpmdTBBRU1iZkZXRmVLdjMrWnUw?=
 =?utf-8?B?aXB5cXp2MEZDZThaWEE4SnYyWTQ5cCt2c2dFTkYrbHl2L1dCTjFEUXNIYzJ4?=
 =?utf-8?B?TUdjcGNzMkdQOS82Z2F0NFVUR0JTZVF0S1BERWU2RTFBMlZRRTRSYWRabVFw?=
 =?utf-8?B?ZCtnOFpIN0liTW1YYVFqTkNNTGt4R3FoS3ZBcXFCK2pSSDJLU1JaQklOSUFo?=
 =?utf-8?B?TU9Zak8xejYvZHM3ZGkxSWxMVWVIS3BXNGxvanEwTzVtS0t1N1c4VDZKb1di?=
 =?utf-8?B?NU5BNkxWVDFwUnZ1Z1pFT1lLRGhKTUp3SXk5UzU2NHhTTHFZZ1JMUjVtRnVE?=
 =?utf-8?B?WWdHL3IwU1RNR1IwanhJandrZ3VIY084VkMzb1BXY25RY3RYeWNIMkd4eTNF?=
 =?utf-8?B?MUpTSDFrYytFQ2RiSG4rODFYbEJVazlxZUVFWTdva3loUXkxTktocXNOSGd5?=
 =?utf-8?B?TUt5MG1ESU1US2l4MlhiYkpLUGY4QmU5eW9xbmQxSGNNMVBLM3d5bWU5eVdz?=
 =?utf-8?B?OThZbjdGLy9IL0kvUkdIT2JaamNEaWo5S3hSRUlDK1cwakRNT3JWQklobTdV?=
 =?utf-8?B?UEtteXpNQ0d2eWErdG5hOWFSb0c3SDV0VHluM0YyRzRnK1RscmZVQ3VPaFdV?=
 =?utf-8?B?eStDV1BTMk5pRlNZaEVScmwwRW91T2tEb0t5NXV2Wm01VGxuN2RxZHlsQUJj?=
 =?utf-8?B?MDhWdjlyNUhhcFVnSUJQVE1RVlowMmtsZzBrdlZCMHFQQXlQQ2VXRVpvaHpG?=
 =?utf-8?B?NmhNRStUMkdFKzlPcE5uRFpyekZvK05lTXIrcy91WnNVMDlLUkF4WWpWaEdk?=
 =?utf-8?B?YkN4OC9oVVJuRklsTmhCUHVoUDhNMFNoanhwc2JyN3pOd3F5WTUzQXAvTWcy?=
 =?utf-8?B?R25zdGk0UlBDWEVmeE1nQlVIbjBMNUYwZmNjNkYyTDdXdjJZTVpIOUVDU3hF?=
 =?utf-8?B?ditacis1Q2tTT0dYY3pyYnN3UG5VbHdBY1M4eEFWd1ZSOXNLSkdaWTJKNXkw?=
 =?utf-8?B?NW9HWnA5OWFCd2ZqUVhKc2R0RStDei9LRExxMytQRUovTk52dzg1cjBKRVhJ?=
 =?utf-8?B?ekhmeXM0SXRrWUdROHJzbWo2bWQ5cS9lYmJDdGs1cTdTckZaTENDbFNrL0FG?=
 =?utf-8?B?VXBlUG1VTTRpYkJKYVBsclhoQzU0bjFHaVZqcUphTTBENUV6bytJTSs1OHps?=
 =?utf-8?B?QnV3N1NDdnpXR2lIK2VRcWFFenUzZjhpREVjSjZnZkhBM0w5eXhhRjNodHNu?=
 =?utf-8?B?OSt3V2l2c2tUd1F2SDZsWElwOEoyVGlyM25mNGM4MkJwOTZmQVN1cS8rbWcr?=
 =?utf-8?B?UHNPeHUrM0J5MDY2aGRBdGYwdE1wTEFlY281VVo5SStIdWxIcExjdmhxOUN6?=
 =?utf-8?B?a1E4TkNKTjh0RlJCSHl0OXdaSUxVRHpFVHZRL2xrOUhEQXM3ZitjV2RPV1Vo?=
 =?utf-8?B?U1R3UVNab2tnT3dnUEZZTWt1c0hNRDRISXJsK1hCV3lMRXpUL05BQ2xKR0FL?=
 =?utf-8?B?c2tNdWxzWmVmMmh3Nk1EYlZsTXJBN3ZWZGd6ZTFUakZ3VXczSHFldGdnYkpR?=
 =?utf-8?B?V2R5Nisvckl4aUFIejRqcG4rTmhWc0U2OEFjemphRXp5Y3M4YTA0RkpFMTNU?=
 =?utf-8?B?YnRKZkNhUnBocVZPK3hOczFKMHZpKzl2bVptZXBVdFNUaWNObmROYTZaTkE5?=
 =?utf-8?B?TzVGcGNFTnZSSUo4UnNEK010RFB4Z3FSTDJEcXNnNHBmMG9lSHJjbGFCTlJC?=
 =?utf-8?B?Q2dRSklQRU9lbjBQY1dibVRtR3RxTjNhSEtGcjVOL3lCMFdQSDB2NThsN2xU?=
 =?utf-8?B?KytEeEUzbWZUK3Fyc2p0eklVdyt1cVlaL3ZBVWJLS2VhS29FdzVsNTBMazR3?=
 =?utf-8?Q?A63/xcmkKns0w4ekAUPM/08GR/tYXC/G542MKpqLtLsHr?=
X-MS-Exchange-AntiSpam-MessageData-1: sAkLxIlG6Yb2ZQ==
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc4b302-5d18-4579-2008-08de5916c359
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9532.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:59:03.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AVOVbUNKXamjxJ4qz6MDIpFkT+JifhUPr3v+joDQ1P3VokKZCLG6reijMyb4iKPnG2FFFZO2ISQqvYr/4Ja/wQGt76Y+ST4aKvy8PmWQBwd4glunx4F3dtcnAS5kvxQNV0FaKzojrNmI8D/sNysaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6534
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[prodrive-technologies.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[prodrive-technologies.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martijn.de.gouw@prodrive-technologies.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-6694-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[prodrive-technologies.com:+]
X-Rspamd-Queue-Id: 4B5705B7BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

>> Hi,
>>
>> Sorry, I didn't follow the discussion and I'm not sure what you're trying to achieve with this patch. So correct me if I'm wrong.
>> As I understand it you're trying to capture the current state of the
>> LEDs at probe() time to set the the relative intensity of the LEDs constituting the group.
> Yes, that's indeed what I tried to achieve.
>
>>> Adding: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
>>>
>>>> When the driver is loaded, it turned off all LEDs in the group. This
>>>> patch changes the driver to take over existing LED states and set
>>>> the brighness and intensity in the group accordingly.
>>>>
>>>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>>>> ---
>>>>   drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
>>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
>>>> index 548c7dd63ba1e..a12720d73f188 100644
>>>> --- a/drivers/leds/rgb/leds-group-multicolor.c
>>>> +++ b/drivers/leds/rgb/leds-group-multicolor.c
>>>> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>>>       struct mc_subled *subled;
>>>>       struct leds_multicolor *priv;
>>>>       unsigned int max_brightness = 0;
>>>> +    unsigned int default_brightness = 0;
>>>>       int i, ret, count = 0, common_flags = 0;
>>>>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>> @@ -96,6 +97,13 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>>>             max_brightness = max(max_brightness, led_cdev->max_brightness);
>>>>   +        /*
>>>> +         * If any LED is on, set brightness to the max brightness.
>>>> +         * The actual brightness of the LED is set as intensity value.
>>>> +         */
>>>> +        if (led_cdev->brightness)
>>>> +            default_brightness = max_brightness;
>> Storing a brightness here is a bit confusing. What we're interested in is whether at least on of the LED is on (and thus the group is considered on). I've would rather use a boolean here, like is_on = true
> I'll change it.
>
>>>> +
>>>>           count++;
>>>>       }
>>>>   @@ -109,14 +117,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>>>             subled[i].color_index = led_cdev->color;
>>>>   -        /* Configure the LED intensity to its maximum */
>>>> -        subled[i].intensity = max_brightness;
>>>> +        /* Configure the LED intensity to its current brightness */
>>>> +        subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
>>>> +                            led_cdev->max_brightness);
>> You cannot use this computation in all cases. If the LEDs have not been turned on, their intensity will always be 0. Maybe the 'is_on' flag can be use to select which computation should be used.
> I'm not sure what you mean, if led_cdev->brightness is 0, the result of the DIV will also be 0.
> Or you want to guard this DIV explicitly with something like this:
>
> subled[i]->intensity = led_cdev->brightness == 0 ? 0 : DIV_ROUND_CLOSEST(...);


Are there any additional comments on this calculation?


>
>
>>>>       }
>>>>         /* Initialise the multicolor's LED class device */
>>>>       cdev = &priv->mc_cdev.led_cdev;
>>>>       cdev->brightness_set_blocking = leds_gmc_set;
>>>>       cdev->max_brightness = max_brightness;
>>>> +    cdev->brightness = default_brightness;
>> cdev->brightness = is_on ? max_brightness : 0;


Shall I go ahead and submit the proposed 'is_on' change?

Regards, Martijn

-- 
Martijn de Gouw
Designer
Prodrive Technologies B.V.
Mobile: +31 63 17 76 161
Phone:  +31 40 26 76 200


