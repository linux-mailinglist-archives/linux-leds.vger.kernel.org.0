Return-Path: <linux-leds+bounces-4193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C6A566D7
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 12:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C883AABD2
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 11:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CCE211276;
	Fri,  7 Mar 2025 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ik9jC9Mi"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012053.outbound.protection.outlook.com [52.103.37.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B8F20E717;
	Fri,  7 Mar 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741347279; cv=fail; b=T01J+eThGur7d8OXZuBiR5QMje84fnGlWW5sJ9t0DOrDEoHx2ycyz64fJvznVyICk6FCIPog3uIFyITnDimKY0N7ml61b4P9Qi6x0SCq6mrQcvykX3gmOxMVG3TsPOCFV+3UOKbq9jZ3h4bqG3sHDgdAF3iUsvfojMRbynAp8hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741347279; c=relaxed/simple;
	bh=yZGoP2aeqq1HQMFPIcKyJgZ57mwlHUeRaAH4m58P2+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=UFRHXIMJXZ6M/Y9LM0rT2WIOCAm8v8KiPfd5JL1xwDkGzehhbo2bTYwPUnexLdy6Jgm0Vi8HTu4KMu2M21HTB6f5je1NacV92K4qYj2pWtyEfdzKEMvNsBC+R8NiZGHwYnNoZSX9DTxUejxz0LWN9jvhcOoTNhbnGsFYdg3JZes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ik9jC9Mi; arc=fail smtp.client-ip=52.103.37.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxyT34UQUlH9iZVXcDNFedAd9fUhLB0BDv0GJbWTqCIiS/t2MW1o4znLpQBVgqqTfD+kfwwiRzD93sicTnKI8yi6t4K2XeKfVUgx0MYF1QH3yBak4rpul/k89fovnUCl8X9l1OD4Rb1H/bpIm4SzKh/WNvpSUXdqT6nxlzbbPQS8L+VDJbgHJy7NIGySRUrPuUASp320jEM6nKeNsZlBKDnJ/xGnA8JovOHiz3J+q4pinvw/0WBbB/MtwcCHFEoGH2Q+Qat5oa0f05Ogs1sLiaxHYmej0WyyrLhuhmhfBj9aJc9HCAgcpOY0uKQSpvEYid7rB0gXgzfi+enF0ak/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2fkS0JgWBQRNzDJUG9MAIYod6yzK7KxFgqroa2ZdCA=;
 b=VC8rjJibVAixNV/I2y2nFBGfMpi3lu5VVqYGrO3S40NrtbOUyHUcePSL+RlBADKaGDfSYMfbCAv1XtW/NMcoABKX1XISNhEqWccKPwZgMHGyDZyNmfnt87nNBFVA5tmF1IEC2rvKy+Kv47XFcwGK+n+WwFEoZ5z/MK/f+BWWqZpgDF//BxWxAUp3C0JnyDCYGclfP0LsJlgG07y4Iz9jz5RWAXzyA3IZ9SqSTk2VFZNgMRJ4axokSWf3S/7IUzg0/WQitndqVeRVr9rjG/rXKYJw2NvzR9CKdbm3HvHfCrdjIw4Lct3ahFbhZsI+TDu8Al+dRrj+FEwLhkEbvlGLpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2fkS0JgWBQRNzDJUG9MAIYod6yzK7KxFgqroa2ZdCA=;
 b=Ik9jC9MiH6iNctHUuJvzAMIETTuA3lYF4QgbpTFYdgK7iRPciqkPxhQvAZHWibk7SOxJwFizv5YUDCAw5t0QAtSSlaQ1yOgPEi1x3YzFiXGHa5aX0zkDXlh+6RwkBlWgW6ufHa03IYYaHF3eEFepYyG6TLfU1bKxxv3QEioMz3U6gYtz2O/549ARq/fDwo+OIGPgbjG+cPu/4PWd09T0n8H/wuxSFrHJTuKyEWG8V9DeIA/Y/e0HLLDqET29JF3tPWWSoQEv+ULYpWYRtbDX9x6kw2a3JKM2RurRZrQoc6DcI2kcrgmYFRXQTXIHN2yapiJ62Om0L1vFsdHE7Va/cA==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB3223.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 11:34:35 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 11:34:35 +0000
Date: Fri, 7 Mar 2025 11:34:29 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: Manuel Fombuena <fombuena@outlook.com>, pavel@ucw.cz, 
    linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: Kconfig: leds-st1202: add select for required
 LEDS_TRIGGER_PATTERN
In-Reply-To: <20250306234727.GD8350@google.com>
Message-ID:
 <CWLP123MB5473AFE2456779BF93951439C5D52@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB5473F4DF3A668F7DD057A280C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250306234727.GD8350@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO2P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::10) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <00504206-10e4-284a-dcd0-42d8cf917b05@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB3223:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc50e3d-6fe1-4c9d-bc2b-08dd5d6c0966
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|6090799003|19110799003|8060799006|7092599003|461199028|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H7rHAGsvv3EjgRD5PdP99WV9I/s5JAiqtkBrxJjB4Lxiuum1DYnGfElh51E/?=
 =?us-ascii?Q?7dPc7eFuNyeXdeTrWIZwQQf9h0XJW6sq912HiEeiwlBbphM036xJ3ktd/eXI?=
 =?us-ascii?Q?DzNmb3lz571vcyxBju2TNptH/kAjNlt7CWD1vnBeeOM5+IhSqj5m4CD1ECi8?=
 =?us-ascii?Q?u48b97DrZ0DtngyMzHggPHIO+0nRRx79sroagWhVCaig70CiU4odexFlFSlV?=
 =?us-ascii?Q?Qf8frFowLR66cGzdnVJTTwdfk9ustKLgXxsYMaTr2fjP6DlKQyKh0vB4S7qx?=
 =?us-ascii?Q?NBLnloxIZhbw4My1lHCiHiq28xNRXFj0NBlDEUsOncYHGZpoQRbDMAEH4uMr?=
 =?us-ascii?Q?IDwh+/ff6Dm332oqvDu2L/G0OZF4T5clxtWQQUSdHBs0rR0Nuq4zoAoWlpDd?=
 =?us-ascii?Q?Fd1uykM/RvjlzOq9oNMg2POGSV8t6xVBmGV1z1sjHHViTqurKzvfIYmJpoG5?=
 =?us-ascii?Q?WOX5Hpd3skUn9U/wccgpQlv1aZ/vXjcMf+lMeafwsBKzzwGpsVmYCLClnBa7?=
 =?us-ascii?Q?UoiS5/E2BvasJ+hN3MwbRYUCPl0ot8JQL5UxAO1ouqxtUI0QdvOiEBuPHPEf?=
 =?us-ascii?Q?6lC51/YDwIXvtBiYZYA3BS293QogUhg+GMVQ/h+KyQa8A7bflArd/joXCbnL?=
 =?us-ascii?Q?dxe8DnUiPoJCx0uORpGDt9s4OychiqFkCF7/otimtHIARB0euT9YNpjeZLlE?=
 =?us-ascii?Q?17y9OSmRUGl21rxJ2abaDhKeHKL+yTNmRdMVrE8Gvfws7AYMPuq2tmFpvfA3?=
 =?us-ascii?Q?9akt4dtQBteTOB6dfUAbKBQ72glKyV5oYbE1+g7RHRKKTsmySFIV6lUD0ZdV?=
 =?us-ascii?Q?bs3avV1xhJfl7VxoREbG/6T+i97wPbkPB+ErogBVhNiUGMHSDBEvFRaDmKbU?=
 =?us-ascii?Q?lT+HuBHyiidu6hF185/CqDylsKzpng7C6ZYmM68irKSvO144YFhMlmv5klhf?=
 =?us-ascii?Q?8bpt3YLmB7Kii0TfpyeqvbaEUADnDGAvDvdyPcIaBDdImUecQ8MgB7Hi1SCI?=
 =?us-ascii?Q?KTlnNLyM2Po0ZRbpYUCp3n0q0CaEPl8rXrPjfNKyryJMSA6slBELiaDwd22Q?=
 =?us-ascii?Q?w5kgdF7Y0fksMpYa9YTUQCbRCUKjLHRYwjN423A/tivSt3MqIAxfW4QKj1M7?=
 =?us-ascii?Q?GgYE8ov6LAvp?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0CP3yGctN18zor1UV4pLlhqv3EwE2sc2ZTUVmrGnw4OdDmpgw/eqMicGnfb+?=
 =?us-ascii?Q?jG1VxhEHZ6RUULn+cxAGbQo34Ea+LKDHa9uKhwGFnZBi7Ld+y5GOluhsPN9h?=
 =?us-ascii?Q?umMMQ7u6tuzc0qVGW+v0YTGwLsU/iw6T+EJpfJK49ICIadrS39xO4hZ8RFmg?=
 =?us-ascii?Q?QGaIEMWaeTZHTfVFHU8zCx6eQLArNz3UI37yj4pwyr1dLBU9eNdBQ/NfiaHi?=
 =?us-ascii?Q?ChGSIKlYKwNNuwcnOMKDdF47EP8HKZFrSCXt2q1n7e9CoFChvEpltQveUnhP?=
 =?us-ascii?Q?aX90Z++yNvS3bRpP0pEoCPWgR2Y7dmdlTM3VjYdFK3EG8h9Ama1+81v+ROGw?=
 =?us-ascii?Q?CnQw3XaVlsGeCrebiN/ICM2TW8aa5WV4ksrCj2lwNxWequpPV+IxHHIRN2sH?=
 =?us-ascii?Q?wVAK8pd4//a6Y+CDnsITvOszbKcROicvDdLL9V1IQRVvCs4Xay7EGy7zE5TN?=
 =?us-ascii?Q?V9q/N88KYBf20hmmuE6jt53CwzoIYZ4E4em5t4oxNrAeOKxhZyJMFit6F7h3?=
 =?us-ascii?Q?EIiDXQwgJ6kWwUq0fmpPCSPn+lbtED1lgxs/s8V/Jvve6DlyhaannJoNgFwG?=
 =?us-ascii?Q?jEKxxnjx1pfJKmjip/uoXe1IZTaaczQfAppui2/W8fcsL2caS7lyfM28w4gC?=
 =?us-ascii?Q?eeu5KtgRBnjtey7jKAiECvAtUOlWZUgrHPzyUS4vqZpsJQwTzAMbCliZZ/On?=
 =?us-ascii?Q?9AHnxFqmOdwHurj7E07wY7xKWURWUWq+Rm8tjUlcG2dtG45WH8moNw/5DlTR?=
 =?us-ascii?Q?2bxHWXjY0CAo3Z5/ChhH4O6sZeUb3UbzzyrMHs9T+SUSQ1SVDg2T4qWNDe1K?=
 =?us-ascii?Q?/BxVl1PH0zLJtQZBAq7aBZeAl+2qM1DEI6LUQpjqQoPy4bi2/YOwMOZHkNOR?=
 =?us-ascii?Q?lNd44H3sLFnwcz64nMAlLKK+2OLVb42Su4PS+1oiWSb35zfPrsfOJHVLW07w?=
 =?us-ascii?Q?JcYM7ul3MxF3+F3xQ4e8jHLkv50aT3EPpg3icYyGqsqI2ijnsHWeTybYkNgk?=
 =?us-ascii?Q?W5l/y64UUl42/GizgfMJZp4HzgxqMnZNnIw8evomT8ud+G0Sa5ALJNarUqpA?=
 =?us-ascii?Q?fhm0xPAnaqTSQ45ImggTBky0rCdMzLTLboUa1GVFO8eKvoN3uqcM3YzycKW0?=
 =?us-ascii?Q?G91IbWIbQRlFrc+frkhHa1Go7D4ZJ+toCLf/xQkbRiMxC1HntkgQzO86/qiJ?=
 =?us-ascii?Q?3fpmGd97XpeejUb5hQL9ICCOMe4sR+hreYbmBs3Qi61+7uE9KNMOzb2icyOW?=
 =?us-ascii?Q?Uqd3f0csoCM2xBsiA+yJdSct3lSk/Wy13owe3LzVeZRjfjXOLxj9nhdTLrUh?=
 =?us-ascii?Q?eBE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc50e3d-6fe1-4c9d-bc2b-08dd5d6c0966
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 11:34:35.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3223

On Thu, 6 Mar 2025, Lee Jones wrote:

> On Wed, 26 Feb 2025, Manuel Fombuena wrote:
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -971,6 +971,7 @@ config LEDS_ST1202
> >  	depends on I2C
> >  	depends on OF
> >  	select LEDS_TRIGGERS
> > +	select LEDS_TRIGGER_PATTERN
> 
> Don't you need both?

Not sure I understand the question, sorry. The patch adds 'select 
LEDS_TRIGGER_PATTERN' to the existing 'select LEDS_TRIGGERS'. So yes, you 
need both.

If the question were meant to be 'Do you need both?' the answer would have 
also been yes. Having only 'select LEDS_TRIGGER_PATTERN' doesn't select 
LEDS_TRIGGERS, and it would be even worse because you wouldn't have any of 
them. I tried that first, in case select LEDS_TRIGGER_PATTERN implicitly 
selects LEDS_TRIGGER, but it doesn't work like that.

--
Manuel Fombuena

