Return-Path: <linux-leds+bounces-5049-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82796B02ADA
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 14:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC60A61D0C
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 12:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D671927510A;
	Sat, 12 Jul 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PGF/nyog";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WSruwqv6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADB1F5EA;
	Sat, 12 Jul 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752324910; cv=fail; b=QPuS1kDYr2+KusEYIEFPz5y0U3jcJlu7AO/lzOZwjYE96YnN6hc9agiEWNnMDGT8cfvltfW32JaPpQZYPcvAIYolYOdaBG88ICkXqe/d24KufMehn1EPlUEAt8WMUdB34xkHgzxW6S+0Y0B6hai0SaJ5CTZ9v+72H3EaEGqmLOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752324910; c=relaxed/simple;
	bh=Nvh/0mzW8EY8sGkHxOinP6T4Q9UjMX1UTvaZfL0Ggk8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OwYvDvpCPx2YM0ZEKbuY3tfocuAsWG/c9+LSGYu1nSwNHeVtA9L2UdJvwbxtkewp8oMybR6VS1A40FLXYdmHAJme4/md43FeTnPLqqA4m5leo6Svxq3TqUBxZJpg2okvdgVWyEpo0xDzQL2JKplTdVYUQpD+D9VbnFb1PnmAl1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PGF/nyog; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WSruwqv6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56CBfkt3026964;
	Sat, 12 Jul 2025 12:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SDcemIPJwZdp/klXyunOoXnBH0GoUhe6rZol/Xw3IbE=; b=
	PGF/nyogXyBFxI9fWE3HuCj5HekUhdGNMVJwjXkzpJJPtElS3AOOrSdBWTwSRGM7
	mkPrKfJZloFx3ujTXQ4ykAQguEs436xceQ/Dg3B/gtDomgzzvUhIGOri+VppQECW
	XworAcs4MLQ/G/jnW5dMtVIzDPcz8/+CpweqiLfvtMAWPoJa059IZDNrhyoshHEF
	0g87DeMRD9UPwfFs+Qq1t+iA7n+frRaPpJtzIf3HBI22ozxIaB6waS2kVRpz5Zyc
	nA1ItYUIkoyf+Cwmsqlf7s96k3bFXIxEHFJMyijeulJY/AJZiukVlY7jKQjHcPLj
	58nI/LFDQ5z1VBBwrgt4qQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4h1mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Jul 2025 12:54:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56CAExm4030334;
	Sat, 12 Jul 2025 12:54:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue57385y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Jul 2025 12:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiishuZkygQEI5WS1Ub2rEJLq3H6k7+zEnr5Sf2rRzzwverCn6BdfNuba7Iy4ET6aIM8RlT7tP+k86QfS7QHW//8B9aI+JVnaSzsrAiDnZcKBOTdUGFWGlem9S5R7A0yyST1CKwVDCeAC9commofdPzQmVBdzjayJ8h6hdR0s8wByr4jhYiOO9yuoeenriq0ExmwtSzZuzyJWvG2dBrXMejdv80h4rgFrh8D1R+aChU48rD7het3lMxrknXFjX8BRWKQuGQcdjEczTgEbFNtaYcqvUwC2VPCbonE4Hj61w9jdytNTkTfLDWAG6zrQ/fPmn8iUK7+1b03Q+95uO0lyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDcemIPJwZdp/klXyunOoXnBH0GoUhe6rZol/Xw3IbE=;
 b=vBwXdpG0EYWnZw+2fkpC1Fr/eXdIm02J7KphWQqOQZWZM7cF0P+wgfZGUlvU+HSH6gu5km/szBilDUSJTQNg5EVrK08+OzUx8TX1N8M+V1lgNerLjHi+GoFoVA9PwHrUReis2OZwikqeWm8ayanPLBLNaD0A+kq3TaGpZAilrEwjRg7Trt817tqYm2awfWM6nDI37LV9Ux1868pp6OHZ0iv3WzctSUj7Z6vuHmJykK2lW3ODMEHXeDt8mgCl13NBBgNwHUr0MDbbCoLuq11sbOEKzwKWinYrEi6J5JYEs2nB74cgiz6aFczytKSDstY23r+/9p6p8oXQePtSgA0XgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDcemIPJwZdp/klXyunOoXnBH0GoUhe6rZol/Xw3IbE=;
 b=WSruwqv6F9NDZcDmb17cstcNf08yyAQ0TIhhQBwmpCyYBQ7+ynWij59622ods9wO2AtjmF4kIogAE5ywqsLei9MSxQpTYF5emZbnMyNdL9Rq6pxc5UXwyBQDjDFoDHpUyuLcUNRW7NPLiCREPqSQvCvTcw+WEX0G9bnTgMZxSk0=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SJ5PPF7BC0D55AF.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Sat, 12 Jul
 2025 12:54:42 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8901.028; Sat, 12 Jul 2025
 12:54:41 +0000
Message-ID: <533f0f95-69d1-4151-9987-84b7702179d2@oracle.com>
Date: Sat, 12 Jul 2025 18:24:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH 3/3] Documentation: laptops: Add
 documentation for uniwill laptops
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
        hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
        wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, lee@kernel.org, pobrn@protonmail.com
References: <20250712112310.19964-1-W_Armin@gmx.de>
 <20250712112310.19964-4-W_Armin@gmx.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250712112310.19964-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::6) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SJ5PPF7BC0D55AF:EE_
X-MS-Office365-Filtering-Correlation-Id: ed488aca-6106-4884-9ad1-08ddc143447a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0xOekRSQ3lVZkxQLytoZjRuMWZPQ2ovZ3lROVFQL1ZtZE4zbXV3NTZJaVlw?=
 =?utf-8?B?UjkzRlQ0Z3RjNENyR01Qa1BzSnVZNHZuNVFQY0pYWjV6K0lmSEplNGhIUTVP?=
 =?utf-8?B?V1ZDVVQwN3FDc1pjQ3JaS3ZvRFp4UWxYb2lZVlZsTkN0RW5ET01xUVNmK3Bx?=
 =?utf-8?B?K1ljMnJHa3lRaE1mbWxtMFY5ZEJRMFJEYXJTNUlyY1hNcHdwQnZRTFBQUHlq?=
 =?utf-8?B?dTlBTlNUeGpLRUE0YU1Ha3hUYUExcW1Ga0k0WU5VMmR3MWs4WDlhKy9mMnp4?=
 =?utf-8?B?QlZsUnEyd2pQMVdoYTFCSHNmWW5OTG1wSEdnN2s5TFlaMlVhUmxaVTYybXhj?=
 =?utf-8?B?UGJHN0l2dDF2N2EzaC81M2c3TWhSMUJnMGdGZjE0dWZBajF6NHFhV25VSnBE?=
 =?utf-8?B?SVg0dVBxalJlRC95SjM1SVZjM0NkSzhLZ1lTYUx5WDZQOVh2NFJYdmpDZDdZ?=
 =?utf-8?B?anJrdzQwUy9DNVphZU96MjhxL2xobkdqb1ZtTWg1TWxhM0NKOHpoSE1FZkhv?=
 =?utf-8?B?QkR3anFWbnd2aUZIUXNRMnF6SThDYTBUSUZ3NVpIYzdEamtOdXNtUGF1NHlt?=
 =?utf-8?B?QjI4OVF3RkdQcHhhaEV2bEdYMlVtNVBWOWFmdnRHc3NwbTJCbTUvVzUrV25m?=
 =?utf-8?B?ZUJUcFZmQmlEcVM0a2FTT2xJNy9ONmhYbVFscHBDVDg2YjloMEpZKy9IeDE2?=
 =?utf-8?B?M0lSUkxHMkFQWWtYRTg5ZVhieGV1eDJVUkVTbUE0cXFXQ1J4VHVPMng2Zysw?=
 =?utf-8?B?VUk1ZUFNSndpcVVFNk9JaWJVcDFaejhsaUNrQ3BGNU5USE9wb3RIMityNy85?=
 =?utf-8?B?d3N2K3MyUXhjeGYrK3UzK0dVWkIxV1VNalV3QWZoTTU1WU5ING83azQzWkJH?=
 =?utf-8?B?UlpuempQVWF6WHlTYVdtam9obGp6cXg1OFBuVVk1KzVYS3E5U1B3bFcvbEJj?=
 =?utf-8?B?S1NudDdGMERsWWJLNGlvaURnVFQrbWI3b0lUZnZWQmFnMDE0VXFDYThPWjdC?=
 =?utf-8?B?SVdnbDZOREx3WGh1a1doN2Y0N2wyRnBvUGIvVHFoaktHRnZWVjMrQVUrZXh0?=
 =?utf-8?B?bU1qeHN4WnhzWlFjZThuUUx6RUtxMFNhTWx0OGx3RGNaUmNEYm1tSDJuRERY?=
 =?utf-8?B?UUVpMUdoRG5rd3pmYkl0ekxTWGVhVFZQZ2FwajZaRVRmY0xvWDVHL0NvdWNO?=
 =?utf-8?B?NFRTZCtIME80VUVNeEk1M0hpOGFITEtQUjc0NGxqK3FVYktWblBkSVdGSHdt?=
 =?utf-8?B?TzVxSUlXSmsrS3RGZ2tVZzlsM290bzNTWW5FU25IQzYwQlpwMWNNV0Q1K0ZN?=
 =?utf-8?B?WndIMDRrcDRIbUJWS3JpMStoeWVqZDhlL1l6UnNMcUs3OWNOS3hGdXRCdk11?=
 =?utf-8?B?cjltcXNxYks5WFg1R0Q5U0JiYzBsOEVCQldlWFVGK3lNSlRCMWNab0syNlpp?=
 =?utf-8?B?eTBVMCtGY1pnQ3cyUWNjMSs5QTcvL0I5TFVBL05ETDZGaFRNTFVZNWk4OEVi?=
 =?utf-8?B?WDM4VUVZSFRHcWV1NnFIM1A2SXZsQXNLRTIzUFhBcVJUYm9CN2kwWUVoUzNX?=
 =?utf-8?B?OUV2VytHd25FMTBFZkxyRjQ0TURleWNmZmt2Z0ozTjlBOXJVYzQxQmFmNTA3?=
 =?utf-8?B?eGpOMUxZYWhoVnNUeC83OTBMeXJpd0pwd1JsNkxPQll4b1pLRm5ybmV3bjMy?=
 =?utf-8?B?bXZ3NjcwTjA1VVJQR2hZdTQrNm1lOEJrZzJpY1JvTmdnb2FBdFR5SmJxWXYr?=
 =?utf-8?B?d2o3Q0ZmZW9MNjdNbTd3OG1HL212UlZjeER1cGl1NkRPSEJtckpQYUh1d3Y0?=
 =?utf-8?B?eTRKVkpnQkMzdnZoTDIrUUNIVXloeXFDS3NUUmNlRzRCK1EwbGMzTjcxa0Y2?=
 =?utf-8?B?U3puNzJFaXZXYVhCUWZXU0QwUHl6Z29CNll0dkZ1WENwRGhIV3pCbkhueXB0?=
 =?utf-8?Q?nMxaYl0PC3VIWR59IPcUGdguXHwslZEJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUpWQWlCeXJZWTV2WXBLMDRVTVJSeEpFMDBQMUN4NkhCb2tPcWF5dWxiSmV2?=
 =?utf-8?B?SEhzYllhTksxaXU2VFFXdk5yQWlDQktwZlNXY2lHN2l4Y0g3TFRoTUFnc3h1?=
 =?utf-8?B?bTFrQTYvbjM5aEdEY0h2eStpbzBud1ZnQk9JY1k5TGkxZWw5cGlMcHhCTWp6?=
 =?utf-8?B?NS9pRGNZSFZIL1dwcVFTbEJ6NEcydHFlWGZOOFNHdHo2SnVRQlhKVEhpZ2hH?=
 =?utf-8?B?Z3NoZHJvVXdvWmhMa3pvbHh0c3pNMU1yeFo3NGRRV2hraEVsbUhtMkhaVHVj?=
 =?utf-8?B?THM4c1BKVmhzeEcyUXB1VXdyYjFkUnVERnlJanpyeDMxcHQzeENpMkhhNlIz?=
 =?utf-8?B?eXpHLzkrYnFJMklLbjA3eHdvMVd5Q1h0c3FJNWJ6ZGp6NU55emViUGdWUWNl?=
 =?utf-8?B?T3dLeVRSRXBkT3FwNHBZWWN3eUFIZW81TFBFekdSNzVvK29Td09Ra2UwcWxs?=
 =?utf-8?B?TmtteDJKRmw2dDZGUXdWeFFvMlZLZkFzSjArNk05d0xaTmptdUdvRlN2M3lG?=
 =?utf-8?B?NllzVjdYTmIwZVZ1a2ZuOWtOdnZOSm5jckpFOVhtajlTRlVJMVpocCs3OFlF?=
 =?utf-8?B?citaOG05V2ZCTk5HZEJqRkVsSW11clFmQnBjVTdJYTNWRXQzbUM4aHBMRFdu?=
 =?utf-8?B?aTNHL1hQLy92bTYwTkNoOVhNUHBKejlzSzk0VFdTV05Kb0wzQXdpRW9UaWJZ?=
 =?utf-8?B?RTk3KzJTQm0xM3RYQUg4eW1zeFdseStyN1pWVVJ6Vy90YnlCSC9BZXJLMHRi?=
 =?utf-8?B?Y0dmOVNBT0VWY2p1TjNqN2NjVnVKMVplakJCWUxacW9qT3gxNk1tcU4wcno5?=
 =?utf-8?B?V1NhMURuTDl5QjlMelhkeGRGMHNxNS9kc0JlaEYwRG5CRXFCazlQZWRtMU15?=
 =?utf-8?B?M1k2YjFFVXBYRXJtVVZOc0tMK0FBL2lLL1hBRnBMR2EzRERWTThjMVEzbGNk?=
 =?utf-8?B?RmY0SzY4T1VTMit5MFJUSXdVd0xHQTNrOHFBckNNYmhLZTlZWkRNUzdicUtu?=
 =?utf-8?B?M3EycGZteVdWVlNoQXZpdTQvb3RmY2hSZXNNampNdWNwVXB1ZWxZUXZWcFdU?=
 =?utf-8?B?SXZjM0JLZTV2Wk5pY1F1emdJdHN0UEdVWlpNVFVSR2lRZkd1Z0FBaDR1T3Yv?=
 =?utf-8?B?aFdsT2RMemRaQWZON0d3Z2l6a2hXNWZuNmROV2J6TnUzZ3REaGpBcjYyRHRN?=
 =?utf-8?B?VElFMEVXYTlDdWtLQytXNWJMMFdHSEROd25BQTVubDZnZi8xNVU5S0IyV2NO?=
 =?utf-8?B?c0svRGNJL2VwUVliVTFvZkpSSERCK3VRRWlTZm54Qnk0WmxQZzBsNzVpNC9r?=
 =?utf-8?B?ZDJSVVJXc1I5Sm50SWNYcFhOamN4NWN6SG1aQTNzakxUZkFZbkhhNm1MbENp?=
 =?utf-8?B?RnordjduNE5yaERHWkgwdDRncmxpcVBLeVo4RUtOZzBQQ0Y1OWZPZkVFeGhz?=
 =?utf-8?B?VFZVd1BFUlZWR3NYTXhyV2pyVGRXVDBFZnVQWjJFZFB3akVtbXNveHdRSGQw?=
 =?utf-8?B?bVVaT3lsR2s3dEluZ0g5V1M2ZDMrSHdZSTBhbjFpNzlMMUhIcUZ3N3ZPeisr?=
 =?utf-8?B?OW1DcU9ETE1FNG43MHVHTTBWMW84WjFhVzhUTVhrd0lGY3MwWklYYldvOVph?=
 =?utf-8?B?Z3Y2WnNPQ3EveXNxM2JjU0RkOGVKVGhlKzJsdnlka3A1SGQvNldxWnk5T3ds?=
 =?utf-8?B?ZHdKVVJEK2FSR0FzaXNkUndhRU9VbXVqWjl0dTM4aHRWVkdNanpUQ1FQUkJT?=
 =?utf-8?B?UDlpUWVmT0QyRXlYYnR4MzQ3Szc4MmU4ay9Kc3B4SWFGNUpOeUhoWFhKTHZ1?=
 =?utf-8?B?R2cwMHJpQkVJeVIvcDdhanVnQk16SjFVdmlGTzc5YjdudnM0U09TMms2U0Fn?=
 =?utf-8?B?SWFmN2tHb1FHUUxTeHFIVWtjTGFkNW5RNGRFOEN2QzRDMDVQd2wyeEp4TGRq?=
 =?utf-8?B?dmZOZEhNWVhHVU5DbW1vWUo4d1d1R1NvMHFwT3lmenNCbFdLQUpDbzNkM3hK?=
 =?utf-8?B?SklvNVBkM1VaYXRuUkZscVJSSyt5WDZ5dGhQcmRiSyswcmRTYXhlS282MURU?=
 =?utf-8?B?b3FBMkFaeTVaTHI0dVJ2UnZ2RWFkVmFtN2VYUmFEL3RSUVNsZnNOQlFnWFk5?=
 =?utf-8?B?ZUQzVUNTUis5WWZJNnRJTEQ5UEVEUGU0UHFNODRtbzVreUVGUEw1cm5OalJ1?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XbuUB01y2xZyWEXZZfpvFBjD+I1FqDFlslTDZDDyotUILpWS2uRL3lEXss/JH0S6MScZwIUVaWnYwqVxdgnIzNN9E+qjwxOB3LwIhuNTJK5hzNc5eaEkAyI05ROG9GsXkLu5Gcs51kMctKMQtVRBU/eg8yI4Y1x6EbT1prfNxkqlKhIjQ4bETd9OflhP+XEPiClphLEzD2QBNIDqdbhz43jiL4RBjfA62GYpMZ1cohvJBFn0kmqlfWK7bfOhac6sv/2LO7w0YvoJjDyWaBfqkAUCwqr4BKqqP7t2d8g+EHW/n4VCdvzurPbJPp0et2MKi+QCHmsUmROkseJMjyAWjtAtUixtq88szcJUtTw5r6rcf/QoEfB7CtQNj0HRWEFFzyuE8E3c/oukjNNrXpX9Q/VGfTnywRDeA8Vmf+TwbZTxIVDykdU1FZVssYg+KBfQ1wfIyJ1dKb1I6dEk0ZuYRJ9w202Y9Pn21BirdEbMXDh5b+hclzgxcko8+m8E7B3JHWpQiq8LlPQlQyapyned+9jV7JU9nMmtT7KqF0d/I0uqJgDE7fIeMqyhfKz8n8h/bYn3COBfKu4IJm/vTNUlObBsDpiw5alo9QXhjhKJmWo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed488aca-6106-4884-9ad1-08ddc143447a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 12:54:41.3561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfiSXccp6bML0lx9XzvJVdf0Fwk5T2I7qfmIuwo6IFESnFhYCpvLttr+uk8r7tvWhcqZXhUTQb/oZAEC93f+IQeEpP2qSeKVtyg3eYsbtpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7BC0D55AF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-12_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507120100
X-Proofpoint-ORIG-GUID: BuNgls9txi_roRs8erLlcFLpow4Nq9g-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDEwMCBTYWx0ZWRfX5SbDsYWwFNA1 NqeWIfnhG4a8iFzklUanE7JDold7Qyau9VINUZwPtZUUGsiGPWq8Ho0CC7ADGaO56WrNb2+KsoP 1sUkEwXGnLYJduNIy2tP2G/qNdbIRnlrIyPv/HyP9KdhIDYvU/BP5Jka2f42dD38dLRrPnaGWol
 Q+UKc2sPr1c3paQ0SeJ5RcjACmmuWjbw1Ryd6yChGz2G3eYQNAbGX7T9TJz4yue0BUxPZSdAj8V H4ah+RKV8psn0E6jej2BzNQFrVxWkeMm6T7PMykxTboApGhggd7Nmkao2EcyVU06rVMbD7Zd+lx iySyggVPxTcq2sFFX7+iMxDmsbQc5W1nA/cEj2xqjTVbN0YZUf4JeNqi8HCNGII9kZhNlxf1FXC
 usfYCxHo2jYIq5XWK4Ddf7x9VqvWaztmB+AqH8za1RmGZB2tfbNM+3+DsPeZVdCFBW3MTy6X
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=68725b15 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=c2wrl3Oq5jzHW1O_1_oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BuNgls9txi_roRs8erLlcFLpow4Nq9g-



On 7/12/2025 4:53 PM, Armin Wolf wrote:
> Add documentation for admins regarding Uniwill laptops. This should
> help users to setup the uniwill-laptop and uniwill-wmi drivers, which
> sadly cannot be loaded automatically.
> 
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://urldefense.com/v3/__https://github.com/lm-sensors/lm-sensors/issues/508__;!!ACWV5N9M2RV99hQ!MfQKq-XQLt4Lj_zRVzpbw1q-Y2RgiAMwHHbA8oE3H1FH_iL99Vb9H29zjLtdHf1xmTUNkT6ZM-xUiZmfJew$
> Closes: https://urldefense.com/v3/__https://github.com/Wer-Wolf/uniwill-laptop/issues/3__;!!ACWV5N9M2RV99hQ!MfQKq-XQLt4Lj_zRVzpbw1q-Y2RgiAMwHHbA8oE3H1FH_iL99Vb9H29zjLtdHf1xmTUNkT6ZM-xU2Vmgr2k$
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   Documentation/admin-guide/laptops/index.rst   |  1 +
>   .../admin-guide/laptops/uniwill-laptop.rst    | 68 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   3 files changed, 70 insertions(+)
>   create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
> 
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
> index db842b629303..6432c251dc95 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -17,3 +17,4 @@ Laptop Drivers
>      sonypi
>      thinkpad-acpi
>      toshiba_haps
> +   uniwill-laptop
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..29f6ee88063b
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -0,0 +1,68 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Uniwill laptop extra features
> +=============================
> +
> +On laptops manufactured by Uniwill (either directly or as ODM), the ``uniwill-laptop`` and
> +``uniwill-wmi`` driver both handle various platform-specific features.
> +However due to a design flaw in the underlying firmware interface, both drivers might need

might need or may need (optional)

> +to be loaded manually on some devices.
> +
> +.. warning:: Not all devices supporting the firmware interface will necessarily support those
> +             drivers, please be careful.
> +
> +Module Loading
> +--------------
> +
> +The ``uniwill-laptop`` driver relies on a DMI table to automatically load on supported devices.
> +When using the ``force`` module parameter, this DMI check will be omitted, allowing the driver
> +to be loaded on unsupported devices for testing purposes.
> +
> +The ``uniwill-wmi`` driver always needs to be loaded manually. However the ``uniwill-laptop``
> +driver will automatically load it as a dependency.
> +
> +Hotkeys
> +-------
> +
> +Usually the FN keys work without a special driver. However as soon as the ``uniwill-laptop`` driver
> +is loaded, the FN keys need to be handled manually. This is done by the ``uniwill-wmi`` driver.
> +
> +Keyboard settings
> +-----------------
> +
> +The ``uniwill-laptop`` driver allows the user to enable/disable:
> +
> + - the FN and super key lock functionality of the integrated keyboard
> + - the touchpad toggle functionality of the integrated touchpad
> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
> +
> +Hwmon interface
> +---------------
> +
> +The ``uniwill-laptop`` driver supports reading of the CPU and GPU temperature and supports up to
> +two fans. Userspace applications can access sensor readings over the hwmon sysfs interface.
> +
> +Platform profile
> +----------------
> +
> +Support for changing the platform performance mode is currently not implemented.
> +
> +Battery Charging Control
> +------------------------
> +
> +The ``uniwill-laptop`` driver supports controlling the battery charge limit. This happens over
> +the standard ``charge_control_end_threshold`` power supply sysfs attribute. All values
> +between 1 and 100 percent are supported.
> +
> +Additionally the driver signals the presence of battery charging issues thru the standard ``health``

thru -> through

> +power supply sysfs attribute.
> +
> +Lightbar
> +--------
> +
> +The ``uniwill-laptop`` driver exposes the lightbar found on some models as a standard multicolor
> +LED class device. The default name of this LED class device is ``uniwill:multicolor:status``.
> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on how to control the various
> +animation modes of the lightbar.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3efec7a99262..fe302a610fe6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25495,6 +25495,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
>   F:	Documentation/wmi/devices/uniwill-laptop.rst
>   F:	drivers/platform/x86/uniwill/uniwill-laptop.c
>   

Thanks,
Alok


