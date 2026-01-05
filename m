Return-Path: <linux-leds+bounces-6528-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0077CF5618
	for <lists+linux-leds@lfdr.de>; Mon, 05 Jan 2026 20:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F783079EEB
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jan 2026 19:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3FE31B836;
	Mon,  5 Jan 2026 19:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="EEOHnlnR"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020109.outbound.protection.outlook.com [52.101.84.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCF30EF6F;
	Mon,  5 Jan 2026 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767641406; cv=fail; b=TKfxj3Px7j1er3CTBM6oWK2Hwb+p62W8qvE2v/BJD9dgqXbXxXwJ5Q4ekNDjYXQPqZ60HRv/yjgX/zny6mY8IAYLLejYCK6eOmW7ZwNItoi3OQwKRjbBiL3ueLriCSpEXOuMoeZVOb7SGHe92OKFvd3V1CIJ/Q9u19iVGQ5SBOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767641406; c=relaxed/simple;
	bh=3buVsqiaapjPEbyqLAAQd8EUyECQDtIN6Jn4veuTKQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=koZztvxp55cXk4CuCnq3/4+pC84UTOSEDGQL7SnwJOL9tdoOKu9V8/4XqC7dljnwbfk4cBmBFRwKNxVEoW9dQN5WGgAmxPvACdWlrmvkk/OQ5BNx/gKlUGSiHgz8bc8TJUhXMCSjERz4klsGJlvVfGmynsTt9HZeaqwggbSEh3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=EEOHnlnR; arc=fail smtp.client-ip=52.101.84.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suOSgjdZtwVPvXayaUpnTUiqos1wLinaXBYvvLHeHE0eypqF8vTXNTUQSUCQSt+VVhJ1mCzlkYaBoEfLxbdb/ku4nMfo8DkWibq6IRmrTcp1m76OOgN987d9Me5HV4/rmDPQL96jiH25QYgIEFhMD9rd3oMfkcblvypTlsu8UapjeG51aLTbNZzBAjiiJ1rBN4XOo6NKdo3fyAFrPEEumcTqr3VTeh643Wvk55ssSzFT1gx3NuQzxjDjEGidTWTWNzJs/o4o6gkiPeJcqBug69EQ4LL4qPhej3QOkJ0sVNcXwlrddzTQBqWnKRrfBXQw1qxx6Gs+Qh0DFX+0CtTBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHE/x4fLPMYtPAqHFr75RvEhhUUdOrBXzMjqFxXdKh8=;
 b=HHYMUs8tL9ybvMr698Alf6S9FaGzGS+SMJpdcMs1f/UUnX9dQApxDWtcGMmIYXzkxS4Jz2OT3pbXzNaQPFODT9c6izR8bbg2i7whcg0U+fmsdsuYuLlBouZDjlax1N8rOg8qMF+/69RpXtXJrqrFMPwtgH3kYfRad4moANvPtg5Vv6znp0NlonAwNaSsPmE20OoKwjiWpx88R7pWZwO1Yu5LiccEhIwcsNk5VXTcuwm96r8mHK+lyC6q56gTsc0w5VOhJsXnR8TojZ+3PGKK+9ealwQcW29JodhvUbBgKDJIh5PClHArPGeY3eLr6hmE7vS9pL7Fvz44py/G02uZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHE/x4fLPMYtPAqHFr75RvEhhUUdOrBXzMjqFxXdKh8=;
 b=EEOHnlnRigtH8NtakdG9Ju8sRHdzOZg5rBd6yjIaregxCs62PayuKH3Mn8j272f9Klm05qYaxErYL90141OMFtwdTesgmcVz9UyrAWmioJ5q4YWWJ+zaEe+1gih1fkLX7k3ZG9ewGSjCSwPCGTqRwHgwUG1zBz74xg8i3z5cohg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17)
 by GV4PR02MB11208.eurprd02.prod.outlook.com (2603:10a6:150:297::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:29:58 +0000
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::9fdf:6182:1005:2168]) by AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::9fdf:6182:1005:2168%6]) with mapi id 15.20.9456.013; Mon, 5 Jan 2026
 19:29:57 +0000
Message-ID: <3ae26a51-ac87-4e0e-a7ec-88132106580d@prodrive-technologies.com>
Date: Mon, 5 Jan 2026 20:29:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: group-multicolor: Add support for initial value.
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com>
 <20251214152116.GC9275@google.com>
 <26676694-ec69-4fef-8337-a6c7ceb1396d@traphandler.com>
Content-Language: en-US
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <26676694-ec69-4fef-8337-a6c7ceb1396d@traphandler.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR05CA0084.eurprd05.prod.outlook.com
 (2603:10a6:208:136::24) To AS8PR02MB9532.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::17)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9532:EE_|GV4PR02MB11208:EE_
X-MS-Office365-Filtering-Correlation-Id: e770d836-c517-4ee9-d9d9-08de4c90cfbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEhWRTVDRG1ZSjhNZzFueStPRWVYZXJxaHRld00vRnlhTjNUdy9KVEIwR0dN?=
 =?utf-8?B?ZEZuRC95bHpGUjg0Ny83SEpOa3JNcGx0dzgyUmhWTkVzSVQwS2RNbitnd3oz?=
 =?utf-8?B?UDA3Rm80RCtQTm5QSzgvNjlXYzZMQ1JocmZsSTdXQzJyQ0gvYkN4OGVpUTZm?=
 =?utf-8?B?N1h4NENSVFVSM0FuQ3Erc1BIY1dDc3RzKytocmdUckxKM0k5TmhETUl2TGQ5?=
 =?utf-8?B?M3JTaURvb0pLNWxzVy9JYjhTUXAvelJuMzcvaVgxMGVxUlBGOW5nWnZOak5t?=
 =?utf-8?B?dmZNY0NJcXV6dXVkR08wcFc3SXNXQU9lMmlvYSswa08yUGNQSmlCNnY0YnA0?=
 =?utf-8?B?anh2VHE1dW9tS2pmeWhuaE5xcHMvYVl6K2VoU3BBRTFIK3lVOW1KakkyYkI0?=
 =?utf-8?B?enQzSHJRck0wQWNsV3UvRVV0ajFwSVNHNEFJZWRxT05WdUN2RWkyNGd3WWRO?=
 =?utf-8?B?d1NsaTI0Ti9zdzVNa3lyMkYzY2piS3NyTWluOFh3VU9rMks3TmFVOEp5bHYx?=
 =?utf-8?B?NS9DK0xmdWNtR3dsdWhON1piVlVWK1plZHZ2KzU4dkQwV0NiblFTeFVaUnNJ?=
 =?utf-8?B?Y3ZWTVRsQmV4T3FucnR1TjF0Sk1BVUVDUXREVUtHc012SDdxeHNQTWJNWkFG?=
 =?utf-8?B?ZnprUnA1MUx1dlZUU1NuL1B1T1VORFZ4Q0ZtYTh4YjhEWDRtM1kxa29mRFpv?=
 =?utf-8?B?ZS9BajJEN3ZXT2ltVXN4UEhVVmJqTjNVaHNjVjFLd0I0ZnpVbWthK001RXJK?=
 =?utf-8?B?U2tLNDN6Y3ZlcVoyczZQaElCblhLSHZXblhpN3g1NWFoUFlIcHl0SklKTzFx?=
 =?utf-8?B?K3lQV1FDMFdtVE5FQ2I5WFhKWHhHOGFPd3FFQ3dGMW9pakNHbk81RTE3MWNI?=
 =?utf-8?B?ZnV3Ris0Sm8wQ1lsOSt5cHlFNDdaMW84cU1HZFQ2UUtFb0FhSldONXNhUkJv?=
 =?utf-8?B?K2lVUDl5cUpXR2hiMkhOZ2M2UlJQbG45bE9aSm4wbE9obEdCOVlRR0grZlRT?=
 =?utf-8?B?MHQ2SXNyZFZvV2xUeFhIeDUvdWV5ZnlYQW0rZjZnTlhCOUUreGtLR2VQdmlp?=
 =?utf-8?B?TXR5a1BPRkJZQTdkNUxlQi9IODVuZFUvU1F2UWtOOS9leWR0OUNjZXVTWGNY?=
 =?utf-8?B?UDR6eVZzL0lZb2FVQTZDTTlnYUgzcW0rdFZUNWxxcVA5NTFEMDNkMksyMVYy?=
 =?utf-8?B?cUpMZXBFQnZpb0taOU1rR3NtNmVuaXVSV0ZKekJ4d216RERCSTFZYXUrcHho?=
 =?utf-8?B?bDF5d0ZUM0RsOGFWMnpnbG4wQUM1cXpzeTdieTVBM2pLSmlCSDRmQ0FFcU1Y?=
 =?utf-8?B?cUg3aFJpMFk0RDRQclZ2VW1rSWcxeHhjdmFIM0VHcVNxa1I0Y0RnNHliYldV?=
 =?utf-8?B?dzlwRk1TVGpwdUcyckZnY3VzNHQ3ZnkrNk00dEswUFZDTm1YUkxMU0lZSFJr?=
 =?utf-8?B?Sms1UkpYUVpldk45bDBkUE5naHA0djVSTFA0eEpQMTU3bWZqWFNibE1pQ2tJ?=
 =?utf-8?B?dzBwZDQ1Sm9GVTFxUU9VWWpQMks0YVYvdGVIZGVLMlRTdmhleUlscVlBb0hh?=
 =?utf-8?B?WXJaMVAyZ2NEUFlNMndZTVZWRnQ2MXZoZkdYMUtsbjgvdnRkVlVkMnhHb0dq?=
 =?utf-8?B?WHNKQllBRUtNZ05MbWJWZC85b1pRSk9vTnhmUEZ3WFRrejFwNzZHSVFRWlpV?=
 =?utf-8?B?WnhVVlAxbSt4cithMElEb09aQTN2cE00ZFhiZ29pWnpXUlA3RTFxUVZ4RkRy?=
 =?utf-8?B?YkViUmJ3Z2NhZlA3R01DUnBkU2dPN0VPNG1UWjZaM2ZrUFVkZnNLUktCcU14?=
 =?utf-8?B?Zk15cTBUOTdUNjdjQ3IyZTJybGU2azdIeXkwb0NlUFJGb25Ib3l4aW1DYUJX?=
 =?utf-8?B?ZDF2Uk1SM0k5cVMza3FMSGhDa2RZREJES2pZdkwwNG1hY2l3WWhGQm14cWl0?=
 =?utf-8?Q?8VcTgMWKb42HtrP6DzVfaNPXIFR9zNz2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9532.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amkxM1dWdWpENHVrM1JXQnJjbnlsdGdyTE9Ed29TdVpKMXUxNUtFTVJRYnNp?=
 =?utf-8?B?UGlVMVR2N0pLYS9nOFB6UTBjSW51ZWpySmp1QUQrQ3l5L1VjSXlaM1lwVXdU?=
 =?utf-8?B?VTBTS3JIUXladVNUSVl1VFArM0RkcWpiRFVBY2ZOZFhSWUxuakcxZzBsWE5C?=
 =?utf-8?B?T1I3bENIc3hyYzc0OGlkdENSWjMwWFdPMlNVYnJKdnUvaDVzSHllUE5CL3lH?=
 =?utf-8?B?RldpQ1RkM0RuZ1liaGRQRHdGZGllUzJBeUdmcU9YQ3VOMFJYTzQxNElQaUQr?=
 =?utf-8?B?T0ZkRWs4YWJNRFZSM2tjUy9oblNNZ2dheVlOQnBkeDNNVkVtYnJLdDBRUTBy?=
 =?utf-8?B?c3dHcWhsSFdDWTBUSTJ5eklaeFVpODA4amdzQldaNXhNUEpGRFhzNlZLSitH?=
 =?utf-8?B?aVdEUk9CdUpPaEpFWEZYSm4vS2Jvc05ocExYcGF4N1hRRkFyRG5oc3FNcU5L?=
 =?utf-8?B?bmsyRzk2OWpZVHR0SkRKUEVXZldLQk9DK014SmVvdkFOR2JvSWF4bHB2dFFi?=
 =?utf-8?B?UlBEckNLcVJ4RTJWc2xsRlpldy9LMUV3cTRUUDRXeUc4cGxJQko4MnZaMU1X?=
 =?utf-8?B?RkhEZkdORmlidDNaY1pocVRXbDc5Y0EreVluNWZ1elozRzBFN2hRQnlxZnE4?=
 =?utf-8?B?bW01REpNY09hQ0liOE5VelFyNlRRSDRMcTlVenphWk05ZjFOWXpud2NvLzNp?=
 =?utf-8?B?aTRwRk81NXpJdDM5eFU1SnZRZ1Y1VTh4OVlqY2NpN2RmRXMxUTZ4OUZHUFdo?=
 =?utf-8?B?U1JwZkVtQVJVMTUxdW9ROVJhSThRWXhVTEFLVU1SeStoUlh4dnlTUlllaWNo?=
 =?utf-8?B?RXBkRXM5R3YzREtuL0lYb2dqa1FGWFJ5UnR6djVhZmJhaWlmQzM3WU8xeG42?=
 =?utf-8?B?YlVzMnpOSUMwY0syeFZiVWMzb1VqdnRYUGR6SHgzR09pay9XZVkvMG50M1Vs?=
 =?utf-8?B?SnZOQ3NwMkRwb1FQdERGRGpmL2QySHhYV0Z6UjY5QXI5clVjWXpFVDFiT3pv?=
 =?utf-8?B?YUQwSE96SjUySy9wZWU0bDNBSXMvUEFNVWt2RGtHL2M1STlON3NNcUJEeG9O?=
 =?utf-8?B?bHREU1UzajVqWERqUGRvQTFKY3YrSUd4djhFdHhGWUF5cEVwS0c4Nlhja216?=
 =?utf-8?B?U2tNeWR6QzNaaWdxSnROdWdISHFndXp1RFRVZGZZNXRsWWg5VGNKOWxWYnRh?=
 =?utf-8?B?YzhQeFRnaERZQWNwdzRENkNsbVl5Q3JQOFFEczhpdlFxRWVmZ2Z3Wi83alJ0?=
 =?utf-8?B?QlliYy92WXVLamtTSHR4VllvQThnKzJRVDlMT0dlcDVrR3JMejFUdjMxZitp?=
 =?utf-8?B?OFRna2YvTVlqUHZ1QVpVYnZuWEtiMi8xaEFEQ09EUTNNdUhsUnMwTUlZUVk3?=
 =?utf-8?B?T1dnZlNDVS9HMDRKV2h5MEN4anRTVUt6OEwva3pXcWtWQmp3MFhvQ3RZM0xs?=
 =?utf-8?B?RVNjVDZCWHBadE5rZndLQXVEa3d3ekxzTUhrRVRhSDJCRVpDL2dtQTNqbHls?=
 =?utf-8?B?a0lQRjBhTXZEQWRhUFpBa21MWG5yYnJNWW1jYllqOG10Vm5zRWFESkhSUjVn?=
 =?utf-8?B?YVdqdUpIWkpHTFZpYldITW5OLzdHbXgwSmwzZCtnYTZUMTVRc2JlSWRCNmRX?=
 =?utf-8?B?ZDlmdTA3amRpYnNrT0hQY2htOUV1bFljSzBVd2ZEUzBJY1UzeG9UaVdtZ3ZE?=
 =?utf-8?B?dUpDOWNqakFiMk5iWHpyVlpEM01aYm94aTN3b3FKdm1KNHBhOHJFY010dzgx?=
 =?utf-8?B?bVBTaUNtWER5SG1nS2dmWi80dDNBNkt1eGFvS1Z1SnFmV09tTkxYUldld0Jm?=
 =?utf-8?B?dTZpeUFpYzlKTlpMd0Q1aXcxTjJ6VlpQbmFFQ3NVQTlXTXJyR2V1T085T1Vx?=
 =?utf-8?B?YUhaS25EazBNcnFVL1RmeGp1RFNpWlBvVDhQZzh0TWRKYXJXWGdBOTJmaWZh?=
 =?utf-8?B?UUhjeWpaMTlvWjVzaFJjV08vYzVUcGtueGFxbWNaV3VNYkFvOVp4UlNuMk1M?=
 =?utf-8?B?ZW5ZQVBXU2E1V1E1QWhoMjBhdXgvdy93ZEFldWZKWEZESWNSYjNVQVhWcGs2?=
 =?utf-8?B?ZkRFd2NtYWlZOVZVVGpxVDY3Tnp3dmJZWVgycXNvcXBrTFZ6Vy9DKzZkWVBZ?=
 =?utf-8?B?WXlTOWRaeFBTc2xvOE9oeDRTazhjeVZLbldhMnk1UTRKS28yTkllcjZNajNO?=
 =?utf-8?B?UFhkRW5oWFdRMVFQYzB0TUEwbExmbWpzWjY1d2lSTFlEZ000WXRWN3FUNGRo?=
 =?utf-8?B?b29Jb1UxTFZYYnFOcFZJS0tMNXBuRmo0RDZHc3pqbXlJcTYxZldRbzZNSHhL?=
 =?utf-8?B?VERWOTJ6Sk0rdU0rRTdRYW84d1Uva2ZBMnE0Z0JGWEJ3ditRQTdwaURYZUZu?=
 =?utf-8?Q?LVZzGqT6MFQyYF4PWda9aHLktXseuW8SKqI3IDN//U9FQ?=
X-MS-Exchange-AntiSpam-MessageData-1: Yj6SQILyxZQiWg==
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e770d836-c517-4ee9-d9d9-08de4c90cfbb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9532.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:29:57.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTVEY90/RXNipko2MhGwsNNS7qgewBr2MW3dGwoPVZcfyioYnAr3xJab9Dxv8aqi6sruk4t9MSld5FxjzRRprRQY4DBdVSk399RERZbfiEqd4Ts4k7egCQowvWw6fhM+yKuVbWSN6SdAzAEWQTwjxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR02MB11208

Hi,

On 12/15/2025 11:24 PM, Jean-Jacques Hiblot wrote:
> 
> 
> On 14/12/2025 16:21, Lee Jones wrote:
>> INTENTIONAL TOP POST: I think the original author should have been on Cc.
>>
> Hi,
> 
> Sorry, I didn't follow the discussion and I'm not sure what you're trying to achieve with this patch. So correct me if I'm wrong.
> As I understand it you're trying to capture the current state of the
> LEDs at probe() time to set the the relative intensity of the LEDs constituting the group.

Yes, that's indeed what I tried to achieve.

> 
>> Adding: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
>>
>>> When the driver is loaded, it turned off all LEDs in the group. This
>>> patch changes the driver to take over existing LED states and set
>>> the brighness and intensity in the group accordingly.
>>>
>>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>>> ---
>>>   drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
>>> index 548c7dd63ba1e..a12720d73f188 100644
>>> --- a/drivers/leds/rgb/leds-group-multicolor.c
>>> +++ b/drivers/leds/rgb/leds-group-multicolor.c
>>> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>>       struct mc_subled *subled;
>>>       struct leds_multicolor *priv;
>>>       unsigned int max_brightness = 0;
>>> +    unsigned int default_brightness = 0;
>>>       int i, ret, count = 0, common_flags = 0;
>>>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> @@ -96,6 +97,13 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>>             max_brightness = max(max_brightness, led_cdev->max_brightness);
>>>   +        /*
>>> +         * If any LED is on, set brightness to the max brightness.
>>> +         * The actual brightness of the LED is set as intensity value.
>>> +         */
>>> +        if (led_cdev->brightness)
>>> +            default_brightness = max_brightness;
> Storing a brightness here is a bit confusing. What we're interested in is whether at least on of the LED is on (and thus the group is considered on). I've would rather use a boolean here, like is_on = true

I'll change it.

>>> +
>>>           count++;
>>>       }
>>>   @@ -109,14 +117,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
>>>             subled[i].color_index = led_cdev->color;
>>>   -        /* Configure the LED intensity to its maximum */
>>> -        subled[i].intensity = max_brightness;
>>> +        /* Configure the LED intensity to its current brightness */
>>> +        subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
>>> +                            led_cdev->max_brightness);
> You cannot use this computation in all cases. If the LEDs have not been turned on, their intensity will always be 0. Maybe the 'is_on' flag can be use to select which computation should be used.

I'm not sure what you mean, if led_cdev->brightness is 0, the result of the DIV will also be 0.
Or you want to guard this DIV explicitly with something like this:

subled[i]->intensity = led_cdev->brightness == 0 ? 0 : DIV_ROUND_CLOSEST(...);


>>>       }
>>>         /* Initialise the multicolor's LED class device */
>>>       cdev = &priv->mc_cdev.led_cdev;
>>>       cdev->brightness_set_blocking = leds_gmc_set;
>>>       cdev->max_brightness = max_brightness;
> 
>>> +    cdev->brightness = default_brightness;
> cdev->brightness = is_on ? max_brightness : 0;
>>>       cdev->color = LED_COLOR_ID_MULTI;
>>>       priv->mc_cdev.num_colors = count;
>>>   
> 
> JJ
>>> -- 
>>> 2.39.2
>>>
>>
> 

Regards, Martijn
-- 
Martijn de Gouw
Designer
Prodrive Technologies B.V.
Mobile: +31 63 17 76 161
Phone:  +31 40 26 76 200


