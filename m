Return-Path: <linux-leds+bounces-6211-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D33C70A4A
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 19:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A0CD348DBA
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DB63596E2;
	Wed, 19 Nov 2025 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="oZwFIu5O"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020108.outbound.protection.outlook.com [52.101.69.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C9D33A6FC;
	Wed, 19 Nov 2025 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576668; cv=fail; b=JNcQl9TV8yA0AdP2sKF4hL6p/xEvJDjMwZ2iXMVafbg+fPIb57xSUegs7x7QsEMJzEhFYLsbkQ5COYvR1trPoPRDjf4MNi8jebu/f9fSnZzH5kk6C/JA4f7nJRJZdHaiyQCbhSKQgm6QUNCuEZwh+ItDynINk/ldtaI0ONUez3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576668; c=relaxed/simple;
	bh=W8g0mEcKh4EtyjuksMOnCZZ7VOfDbcBbmhs02Ez6aq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PrVNav0ZtQyTy6QEs/o4aLAnEqonyPKZfS3cYRWR1e5gwZW/dCP7M6sqU4R+Ndw++bXOfopT9Q2drCguVOGaAK01vNTi8WDpujK2NwSSNVXf0f6ka/7yv6NX+K3XmnvYpnmLNEqjcakGIDGjv7FWgcDpzfG4XJkNUsznQDG1dYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=oZwFIu5O; arc=fail smtp.client-ip=52.101.69.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbw4WzluMVQRfSkJhkkVsym+Bf8Fc1KsQtlniO5dUR4uj8t+dcZ+rpm4rL2JePz81e0rSdczzY3o8oYPGO1iOcEjSfpneLIruHIB/0fj5dP261EII/eHPwDrwuBKw1vPAhhHZKX2ZKlQ+NL8QQ0H5BTxd9jdgsUDxqyO7ktoLEpRVqyCVzFI7eo7+LiJl9D5LMdUVq+c6/PQn7EUo/HjqBeYIOveNf26+jIDrJP9CXVJd7xG5CHpyhhFsPDCexsigjQhkw1TI7V3WuFwYT+/abSrN5p4UL3fRUm5U1Bu9gRRSq+x2hTR77aOqc8x4Ld2Kpg2Lsy2x9Wdg+3T1/HjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQg4tAZBpH1N09RtIIXy1ZJrAqKbk4qeWg3i3ZjpOg4=;
 b=ltKjnYVGS9+thVRQ8g7MsJAyMtw0ggINWQ4ekkEde6MjMjiXfnk0fmgjG/pH2xnd4+1MRfIAId24Xno1MeSP9wE8eGip+NyZPI12W6TzGYHdBctIoYQpswtaCOLGHtocN3u5FRe0l96jOI6myDI9NZfIxdHLQVZD4I7iDTz7NoFJaFqAIyB9c8crf8Fz9WtrwaWyMGKTvVRgN1cTy8Q4SEYRWggBFVnn4R+DlhvgoK/qiAz/zfPRlnSLl8yELcOhTkD9ut9tRCYHrZyVsQkdOnO5FMMyOI/K8bUoI71OGFXPzzguOqN5AaBZBfjrndzOhQ+oLG8l3zPZn3Io8fNu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQg4tAZBpH1N09RtIIXy1ZJrAqKbk4qeWg3i3ZjpOg4=;
 b=oZwFIu5OwNgYYif0nx4Svj1lEzwdWRnKCmK78ojNkAIcWeyaBNCBBFm3a1w3zSwEpqHLb50l6bE6bcWgnBA0kXYIaP/bEYPny0aR53/X88RMNeGPHQ+5fUBJJcIKDPPy7+Y4aCFNjZmEYNgui52/M3AiE1FAQZZbjzJMSmJutVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17)
 by DB9PR02MB8298.eurprd02.prod.outlook.com (2603:10a6:10:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 18:24:14 +0000
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced]) by AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 18:24:14 +0000
Message-ID: <d453c7e3-022e-4f5b-bdf1-a78ed5cef4f4@prodrive-technologies.com>
Date: Wed, 19 Nov 2025 19:24:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: group-multicolor: Add support for initial value.
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com>
 <20251119165109.GV1949330@google.com>
Content-Language: en-US
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <20251119165109.GV1949330@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::25) To AS8PR02MB9532.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::17)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9532:EE_|DB9PR02MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dc8ce3-9844-45c3-c602-08de2798d7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVN4UDQ2M0JoWDRPSU5EK0ZZRWtUakd5UE53OVVPR1BBV3BuSnlBbWVVWjBs?=
 =?utf-8?B?aUh3SFlKd0Q4MnRPZU9iRTYyLzNITnVxRU9zRXYzMGVmSFJHTkN4SlhwcVh1?=
 =?utf-8?B?OTBiWkJGdHREZ2lTTXlIdHgrdkFDbWx2b1hCaDljN2gzN2JSWlJoTndyWjhZ?=
 =?utf-8?B?Qlp2ZEE4ald5TDlLTlhIZS96V3IvMnlXbWVnSU4rNkVYRWNiK3NLdEZSanQy?=
 =?utf-8?B?UXFyRVVNaTVaMUllVkhqZDZCdWUxVFZyRnliQUNEdmFRaE1MT2J1dlVOWUJF?=
 =?utf-8?B?OXhEUjVlY2poZDVQQWdZL1Y5RFhLa3IyQnhCUFE5YnRmRkRWWHB6OWRTQTU4?=
 =?utf-8?B?aEVwUEVRaTlYT0FBb2EwY2NMUjNhMWp2TXByaEtKVmlhU216bTAwc1o2S1VM?=
 =?utf-8?B?T0ErUC84K2VMSW0rUjU4N05xOUhDTjJBYjdSbjdmbE5rTnF4cGM0ZlJWREFj?=
 =?utf-8?B?OGNWaXlweXhYU1BPODJOWXgvcWhMRFU5ck1zL0J4QTNUcTdRQnE2L2dyaWg5?=
 =?utf-8?B?anJoNVdORytjcC9tdnByUVFheWZ5Y25iYk9CUjFRNEsvWXFvbTg2cGtJYzM1?=
 =?utf-8?B?VFY3YitJVXFFeGsrWVJnT2QzaW5qZ2l0V3BGZUEvY00xSnFQWTF1dlZiOFRn?=
 =?utf-8?B?MGo2VDFPSVVVNTNZdUk5Rndyc0tqQmdYOXF0UlJZdlpQN0t6aWRtVXFLTHo4?=
 =?utf-8?B?WjJoMmxtbGJXWmxESnh5N1ZHQklValdDMUlBQVRFcXVTMXVwTTNIUDBnbVFr?=
 =?utf-8?B?T0l5cUhUYU5lMGZ0eW1TRzJreVg5VmdPa1hBVlZUYlNCYXZDeitVSUdHd21m?=
 =?utf-8?B?MEVEeDh0TW4reWc1dFZqdFR5NFhlYzdHRTg0ZUovWHZncUtzS3JlUEorTVla?=
 =?utf-8?B?RG1UOTFxZURpRXh5Qk5JaTBjMmxOWGtJT0VUb3BNZ3hwRDYvY2hkTTZ5Rkw0?=
 =?utf-8?B?U05xUVNXMDF0UTlnKzYydWFqYTlSYXdSZWJKZHJyUzRyaURjRjZaaGM4QTBm?=
 =?utf-8?B?cGtkcXRtTndDR0k5K0V2K3E2aUpUOGlHL0JmbDdFYlNvVnBqME5NRDR3RFVs?=
 =?utf-8?B?WGVKdlkvbGR0N2VsRWM1eHNjVmhGUGQyR2ovR1l5dG9lZDNlTWlzN2JsVk9t?=
 =?utf-8?B?NjdhUG5HL1JuQTQrY1NGL0MvMlVLOUJnRlpvK2RkSHhmVkxTajM3MVgzWngz?=
 =?utf-8?B?TXlmTXk1dWFlVEdQaFh6STIxVURxbzhKbmF0cmczNVZaUmRSa3VrOVo5WkNU?=
 =?utf-8?B?NXZ1T3o1Q1pIcWlvTVBPeDhQRklmdkFkN2ZyWXJwM2xxK3E4OWpYUm0zQmZL?=
 =?utf-8?B?UTBlQStZWGFJLzM4RGhKL1lCeTVBUlc2bmFHV081OU5aK1FybnhvWEQzYU1w?=
 =?utf-8?B?elRDL1lzT2RQUkVzSkhLOEpsNWM0YlQyaUdZYnpod2FrczlBeDZ4L1JuRjZp?=
 =?utf-8?B?c0V3aW1uZG95bytubG9jelJTYW9iYXpadU9jSUNXSmpPekJrU1N0ay9oMUdy?=
 =?utf-8?B?cjdhL1c0UHBSZno3UmxBS3BQTjVGZWVvSkwrdkR6Vm1jZUwwVDFMbnpNWmlE?=
 =?utf-8?B?NzJHYnZiaFg3TXRZZ01kTFRJRUg3aTNZOFdSWXZ2UnhRR1liL01qRmRYdW5v?=
 =?utf-8?B?UC91Y2l5Y3RkUUtuRldxRFVBRExGZXlqRFd1M2ZQcUlSVGJGUGlXOFk4b3dI?=
 =?utf-8?B?WGRmK1ZaeE5NVFFYSEhIYlZmazdYM0dHU3BGaktJU0V5Ulg3MUxHVXkrSEla?=
 =?utf-8?B?dmhxMENNVVYyMFlzelBxaUxET3lHcVhGNXY3NWw3MC9kZHBoM1hXV05UR2hw?=
 =?utf-8?B?T09CUFdkM3JzNVFaSVJ6SmkxdlkycE1LM3NCN3oyZ2h3NklEUnNpUWpNS3lz?=
 =?utf-8?B?MDRWQUZ5cUZLMkZsTGdiV055K1VseWdseEFoWllZTlJxMXlUanUyVXV0RTVr?=
 =?utf-8?Q?yEWRhGHe4kkR6jZC84sJbngIosy6Vbf+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9532.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXVuSjZucUtwWkJicFgyREoxTkdkOWordmlwNnFPcFJwT25NQXpxcmFSTVB0?=
 =?utf-8?B?YVlVcTMwdUZLdCs3YXMvbVRtRGo5alZadnhEMDVESER6WXhuN1dOK0NUMW1m?=
 =?utf-8?B?bnJkcU5EWjNaZ0ZWTUNReGFIWHlnMi9aYWhSRjg0MGZ3dXNSYytBRmUyMEJD?=
 =?utf-8?B?RDBSK3VGcXZaTmxZTEowMWE2K1VUaHJjN3FreVlMd2NTRVh1cVhFeC9QK085?=
 =?utf-8?B?YnZEamR5K0d4eWVxdnFYdU56SkVVc1NLWjk0OTR4Qy9SOUVibE55b25lbTB0?=
 =?utf-8?B?UVJON1E5ZE5FZVNtOEc5RWQxSHJ6VGgxQWM3eDhjODU4dEVXaUNpbmJlaXc0?=
 =?utf-8?B?cU80WkNjUEUzMVViR2lMTW1tNWpvM0FoS0dIbGRGOCtzZGdJdTRremU3a09U?=
 =?utf-8?B?M2NFVnpBYy9NT2NjY0Radll6ejNJdjd1dENsbkNHZ0VFMEY4blFjZ2tWT2Jq?=
 =?utf-8?B?KzdaSkNoVzY0WE9qRXpiUng5WFI2aHhsWlorcUJSU0E1Y3Zxa2NLZUhxOVha?=
 =?utf-8?B?Tmc0YmFJN0lobzRpZ3VCTDVwSzFEVCtKdTMrQWJEalIwS1Z1ZitmdlFmTXpJ?=
 =?utf-8?B?M3BUajdSdzNHME1jNzhmTU1hTmk4cFpLUWlRYzZ6RWUyRlJNUjk4c2Y4dXZ5?=
 =?utf-8?B?NVhydEJFUm9VcUhvb0c1c0I0ZytIdEZjUE9UWk42N2ttYzZtWmZwUGFvZXIy?=
 =?utf-8?B?QVhTSjR2Tzl5NWJtdVlTR1lWUDVRU29wbDlhSUlnNDhPM28xK1VNMHpCWkQ4?=
 =?utf-8?B?cE1qNlZyb1hwZEFTbUIrYzFFMVNEdXEyK1FHUW9TUEhJZFhrdW5ySjVSaEFC?=
 =?utf-8?B?MkowdDY1cHBOYS9kOWtBMXlHc3RkU2FnQ2lyNFI5aTk5ZnFQUUZkL0dXOTdW?=
 =?utf-8?B?V3k2dTcrMW42UkErNjk5OFMyMGQwQ284WWk2dUdiVlcrZXI0UXRka1AzMnFz?=
 =?utf-8?B?NElZZ3Vsc2RnQ2tmaEY3MTQzeDRHRHA4T2wxVmUxaG82NStlZ0JtMS9jTVVh?=
 =?utf-8?B?eDh0TEtlcVRoclhTVnZUMmdFS0FPd1doU3VNTU9tYXkwYThHZU9icWY4TnFt?=
 =?utf-8?B?eHRZZHljTGcvVlBnMTZNWDdtYndJMm5KUEd0R2xBU3VqS2UvUGlCWFVtV1Ny?=
 =?utf-8?B?RVc1aUZDVTE5Rll5QzczRUtXT0VwVjlUNkIvUko5NTczdHNrMzFVN2JIOENR?=
 =?utf-8?B?Y05reTl4dEZ5VDVzY2VnK2E3M1B0NVhXTlQxdURXQmVIVnZRQjAxVDdZRTY2?=
 =?utf-8?B?enVFbkMxTEU3bkhrcFRZN2FZN0I0MDBwK0VQcTNLS0RmRWd0TmVSMHZHK3M2?=
 =?utf-8?B?NmwyMDBiN0twN1FnMzZjcVdUdG0zdlc1ZW5lQlR3UGtDYXdSVFMzK0RqbGxM?=
 =?utf-8?B?dm5uNXg2d2lqZjZTZmFpVkRDVnJ6M2lhcDJINHhOYzZrdWNlZXUxNEhZSSsx?=
 =?utf-8?B?OTA5UUIwS1ljQ0xTbk1FNndxR2RLS0wrZURnSHFpSXJQRjQ5L09MM2E0aDFy?=
 =?utf-8?B?Vk13SHhYZjlQVEs5Q2tLbi80UU82UkU5VGxDMlBHZWlOaUIvbGNUMjE5QWlL?=
 =?utf-8?B?cmNlUGdKZURnWnVsblYweTNVd3dvQjJ1Y0dlL1VJcmMwdnlhT20wdDNjQVNB?=
 =?utf-8?B?YUxWRGxxQW0yMzkvZlRvdWt3VTZxUHdKalQrOXFoM1dXTEV2YWdXWWpwcjJP?=
 =?utf-8?B?YVpMKzNoNStVUDRndVBjcGJlR005dHlUc2tOc1NCTS9ZdzdyMzNRdjBtTnFw?=
 =?utf-8?B?Q0VLc0dlV2R5ZEk1STZVRldRMmhrSFVzQVEwdzNQTUkyaWxNRmlEN1pjN0p3?=
 =?utf-8?B?T2VjaXRIWFBTdWVXRmkzZmpwcGFkSm9TL3NLVERUbWg3ek1uSVRJNTRXNXJO?=
 =?utf-8?B?Y3J2Zks5Q2VraTJKeWJZSmZ4U2JMMlVXck4zZHJuTHh2cVhtL3Jub3gxSEtH?=
 =?utf-8?B?MFcxeXlXUFU1c2FxWlpWcDd3M0h6TEpvbi9HeFdaRXBnZmtzKzJkV2h5eWxS?=
 =?utf-8?B?TGxsUFExa29nMUM0NjYyV3VoUkhHU0h0aGRrK0tXeWpFTnlOUTFyWlQyRjVJ?=
 =?utf-8?B?TWxMU3hjWFpBWUdRNXNSa2VkeE90cllOWXc3a1E0dkE0bFJqeVBiaVljRXd0?=
 =?utf-8?B?N3oxRVZOOW85NEVEdjkxR3ZrN3YrTEVrTkt4RTdnQXdjNDcwYXZJV0k5cEUy?=
 =?utf-8?Q?Ua1zei69zL25mnoRb5pXb+ggzgUXFi+0OuRpcD/T/aCh?=
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dc8ce3-9844-45c3-c602-08de2798d7e0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9532.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 18:24:14.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fI+Pv0oCXe2ByqnpSMIWexjiK3cZCSgOT0DG6U/mKCfSU71N5QF4JqxbNm8es1MaS1EfxvV8IUN+k50CKdrwv9N6K6/2dWtbeFUtSD1lWOb2kJWX1Q4vlmDDr1BaOQp7G7ldt9z1W2u08T8D2Xf2CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8298

Hi,

On 11/19/2025 5:51 PM, Lee Jones wrote:
> On Tue, 11 Nov 2025, Martijn de Gouw wrote:
> 
>> It's possible to set a default state for leds in the dts with
>> 'default-state', but this was not reflected when the LEDs are grouped.
>> This patch adds support for keeping the default-state value.
>>
>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>> ---
>>  drivers/leds/rgb/leds-group-multicolor.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
>> index 548c7dd63ba1e..b3e46a51dfbc7 100644
>> --- a/drivers/leds/rgb/leds-group-multicolor.c
>> +++ b/drivers/leds/rgb/leds-group-multicolor.c
>> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>  	struct mc_subled *subled;
>>  	struct leds_multicolor *priv;
>>  	unsigned int max_brightness = 0;
>> +	unsigned int default_brightness = 0;
>>  	int i, ret, count = 0, common_flags = 0;
>>  
>>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> @@ -96,6 +97,12 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>  
>>  		max_brightness = max(max_brightness, led_cdev->max_brightness);
>>  
>> +		/* If any LED is on, set brightness to the max brightness.
>> +		 * The actual brightness of the LED is set as intensity value.
>> +		 */
> 
> I don't know this code well, but if no one complains, I can take your
> word for this.
> 
> However, the comment needs changing to proper multi-line format.
> 
>         /*
>          * This is the preferred style for multi-line
>          * comments in the Linux kernel source code.
>          * Please use it consistently.
>          *
>          * Description:  A column of asterisks on the left side,
>          * with beginning and ending almost-blank lines.
>          */

Will do!

> 
>> +		if (led_cdev->brightness)
>> +			default_brightness = max_brightness;
>> +
>>  		count++;
>>  	}
>>  
>> @@ -109,14 +116,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>  
>>  		subled[i].color_index = led_cdev->color;
>>  
>> -		/* Configure the LED intensity to its maximum */
>> -		subled[i].intensity = max_brightness;
>> +		/* Configure the LED intensity to its current brightness */
>> +		subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
> 
> How does this work?  Won't this value be huge?

It calculates the intensity of the led with respect to the max_brightness of the whole group.
So actually it's doing:
subled[i].intensity = group->max_brightness * (led_cdev->brightness/led_cdev->max_brightness).

I highest value I could find for a max_brightness is 4096 (12 bit). Maybe some PWM LEDs use up to 16bit?
So I made the assumption that is should not be an issue.
I wrote it this way, where the multiplication comes first, because integer divisions don't work well.
> 
>> +							led_cdev->max_brightness);
> 
> Also we said we were going to set actual brightness with the intensity
> in the comment above, but we appear to be using max_brightness again?

I'll try to clarify the comments.

> 
>>  	}
>>  
>>  	/* Initialise the multicolor's LED class device */
>>  	cdev = &priv->mc_cdev.led_cdev;
>>  	cdev->brightness_set_blocking = leds_gmc_set;
>>  	cdev->max_brightness = max_brightness;
>> +	cdev->brightness = default_brightness;
>>  	cdev->color = LED_COLOR_ID_MULTI;
>>  	priv->mc_cdev.num_colors = count;
>>  
>> -- 
>> 2.39.2
>>
> 

-- 
Martijn de Gouw
Designer
Prodrive Technologies B.V.
Mobile: +31 63 17 76 161
Phone:  +31 40 26 76 200


