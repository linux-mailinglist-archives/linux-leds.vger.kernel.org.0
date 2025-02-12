Return-Path: <linux-leds+bounces-3947-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC56A32864
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 15:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAC84160D72
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA39620FAB6;
	Wed, 12 Feb 2025 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Oyfhvch6"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazolkn19011028.outbound.protection.outlook.com [52.103.38.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0141207667;
	Wed, 12 Feb 2025 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370514; cv=fail; b=BoSoAc4VC4pa8znWIs6vdIXxrvwHZky8wIenEgN6a7fDEEObEYYusRPDAvGOxiZUmE4/9qdK20tTkpgJSXGGJpF7ZNBITQZH+3CjlW0pLTr5Ns45nPbRKd6S0obbc2elSdrEhj5zv7WI6R2U6fDeMY/Nq4rFJUFRMKHM8+yOm8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370514; c=relaxed/simple;
	bh=mIfBzsqHBKDUrBcbKL6cpcs7ELjtTW8RC5j9MpD9zHc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=e4lBiLIQ4wi+WPGLvOGKlK6q4Nv7Rm0uDSnHa1tVlWHeGQcjHUDINfb4GWuBNri4UmBmVrqwO2Qkz0axxQrzFYAYKZk2PoAwH74xuBeIo9R97eej+q+nkDYaqU7zGEEIBG0Wd+yVKIEESEYgPJwQeWj4lbvqZxHw1Vhx3xX9wJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Oyfhvch6; arc=fail smtp.client-ip=52.103.38.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnvGtvzh20T9/8W4GhpbyDOyr5hi4nBkVrNoqlw4CApUKVvVqg+xqYeXLrxZi+cEW56fKLFbtXCW4F/RozwAce4H03BxOAN1NFcHfJ7ikiMXH4KpPaHCoDyVVdwoOL4EipJtCU6zpIIyTjH1r+m44/6JrSx8OmSfVpZ9ingtxX3Etp4j/orCdb3c0box3flL6lKfuNOWDsvpcYlQNW1eEHqXFiNBvlzZEqgl1DHf2M9mP+y2CIMh3cJEXakCa8d99Ls7KGWF/fcwwOl1Jo57p4SIJmSx1KiVK9ma2tPc6mA4Xm4PA2YkbP5cLezc9pCzcJPWrd1O/Ub0mqjpZrCoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hioXPWA/awBumpPPG5vPcQK2UGiNWB5ACgGX2mfqcIk=;
 b=mfAy7JVvSyTKU888o62hEirfzC3rF9VQvjQ9Z0pLG4fRhC3hoS5Yv4elGKmr0+VJ3e3MBjxphBSEI7BWO0gYhpzKW7lD4RvI0g7rpT0chacHvLucXWZB6WNFXdBtmmWRBuPiW5JTbCgXEA9jSiAlAoeN1FyVQpg7asMTv1h/+JPCPGhr4E4Z+zPXDsAYtS5NBtWHUxqB9oryirWn44FeZOfyOaguZ5swUQ1Di/5yzRfvg7LYwMDv1lm0sziRF3UYhSjGOFn+xPL8Bxei9M13t8RGdjK0Hyd0eXvTJ/hXGeEVzl/aE+MZWpsBfOlEybuiw/5qKUQboGCi8SlsV3+7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hioXPWA/awBumpPPG5vPcQK2UGiNWB5ACgGX2mfqcIk=;
 b=Oyfhvch6dfksm608jdGjDU7+m6r9ITI3YqTHlWBt5ZHcRTc2BSbdNyCCoKBc5mmmxeubwqVfiny2s4EXFt1Zf+CMUBOD3i4ubuYCvgWw8g1HKfGxigYTNh3DMCXSpk8iNSb/LgLgJeWxM5cL+sUjoVCR/DK0XSvFPuULfEmU6yfiIILpRid0jIZsefUx4BMTPDQ7YV4lJXBQ4/clfGWdK2lyUX0fN+DyvOWuAR9cQJyyOjf2u66FaDNAjTx9pbKt22oaqjyUgUABTLyddpSkMazTKx3BkVcaMHqhdS8qsA/a7ZHll0zro8HD4m5V68LlcelK9diaKtaSymVcfiEQLA==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWLP123MB3729.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 14:28:30 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 14:28:29 +0000
Date: Wed, 12 Feb 2025 14:28:26 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 3/5] leds: leds-st1202: spacing and proofreading
 editing
In-Reply-To: <20250211133400.GP1868108@google.com>
Message-ID:
 <CWLP123MB54734806C2F211C814B31D56C5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB5473057725D7E085EF6091C2C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250211133400.GP1868108@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <da4d6219-ead4-a2f4-8a0b-4488cd75682b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWLP123MB3729:EE_
X-MS-Office365-Filtering-Correlation-Id: fade66f3-22be-44ee-2ea6-08dd4b7184ce
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|461199028|6090799003|15080799006|5072599009|19110799003|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y6ZWDrKbq+jA358VLoERQIefdWH87A5JRTX7DeaoqWOBICdrVAyLPsz08VDm?=
 =?us-ascii?Q?eovodetAtvV+BRIQpxie+t6HL6NXFJWeHnyoCcIkGN6ftLIPn//WL4tyqgmq?=
 =?us-ascii?Q?ZooUEfUMXuXm6aDd09WkqBIiMw5x9RxHS5mGMcM3G1aaNCKJqT1H34tQSz8o?=
 =?us-ascii?Q?kVQ+FdmCU69GeeF0nG2wpDwa5fiXYAtpA/aXntoaFwVAMOIFoFbNYXSHtRXZ?=
 =?us-ascii?Q?rlBteiXTZrqZkqzXoTttcTtiLS1MAWbfzdHfQTJPUewuakeEhGmGg2/8hXml?=
 =?us-ascii?Q?ziFsit0/ZXTqzt/AkSYFnLp3VXtD1XISRW6qZRHzeeS3jLWACmDFefYu3ZX+?=
 =?us-ascii?Q?FacSfAL9KtBGWzozGZ6zsW4WxTQd9i/mA9qessHLLd3Ri1p5CcHZrREXwyFl?=
 =?us-ascii?Q?05gWVWg5+aVcjZByQZfRUmYNxXG/YKtOQBXDHT6uXHOoTnAIzrGgA9YyDKXc?=
 =?us-ascii?Q?NEBtIsoPn7or+JKdZegxN7sVXXdqphd7VYLx84QaPaF040T7qXx1j8g/pOe0?=
 =?us-ascii?Q?B//YJA8S3pLK57dSpbfoKsp37aYvFdxDkRc+axTgQo4dB0+9HDP3ktQq+AbX?=
 =?us-ascii?Q?efELE9i0qz/adQFrq+YEuP3mUl2hTyhOGEdjOrLzNKeTeuyvzA0bsxSd2Jco?=
 =?us-ascii?Q?XcMdG3Yk991xGzhauXDmvaNdisZzxYLHfQh+OYChts8hOT9YyEJTJ2Js0FEK?=
 =?us-ascii?Q?lgD21hURPAHSiZdyBCfQqj39CUsxWGG8gUCkil+Y//ZWpo5S2GDat8L7UJly?=
 =?us-ascii?Q?Wx1SGMbMYuTZwh3X83GVnK+hbIA69S7oiD3OJ+HhXv1v3eo3px525/aFsJjU?=
 =?us-ascii?Q?eJYP0LjQ9wXUDxwZ06+LrXO2vLvOEA3gXmj8GTufftSQI1KZAQ//SzsfFz/a?=
 =?us-ascii?Q?ukTGUhVjMuG7O95W6u7Uci88Xp30MEa8aDzNxu4evubK2K/r4h3R+jUZvvNz?=
 =?us-ascii?Q?puW4uSedfOfedcexs8Z+ddKRFfyoFxxnQv2iqJeK7gLROP33gtZTEgjZwejV?=
 =?us-ascii?Q?SfnjDiUVsijPUi6LrYXhTeJ+RV4+HjP950NYdSJmRgbFE1nSuJzmvSjU+Y3u?=
 =?us-ascii?Q?D9+VTxKD3NAkUiDEv/iou6ziArvizP8T9EakkoYURyAGvwPuask=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b9VbBQ5IWay2wtC7F7lUOjZXpZvRNI6Jm9vTlAKnJJk+ySAEzehk+6QmjZQq?=
 =?us-ascii?Q?Sgq519YhQLpQE9evsS6aQdKOY9U72hJ/UDbw5Ri+3gG7R6ohvpxxUO2pzfwY?=
 =?us-ascii?Q?4UfStosxIwGMfXMhpgngL6t3TfmzcTgUqEZT9Sa+ZYF7Y0vlc9Pj3xAq9EHC?=
 =?us-ascii?Q?xsPob80GCwKHytGpeTcBbvfyj6m837akibXi6oQJoNwyTef0AZECXLOLRH8O?=
 =?us-ascii?Q?gx0PcMzxwHqbRXats8kdIi5GeHCEGM4+5m08AJfDechfCTeTmqu4Fe+wG3x4?=
 =?us-ascii?Q?uD1c/7+H0x/aYxFEi9kf73IwiD/4XrqW1k+TjWBjQrTYg9JH1yYmfJFdQw6P?=
 =?us-ascii?Q?yTjR7+qUXga2ejBUCBhKuDSmrFrMgHhig0m8Oab49Y5ZjhEguGS2UBzHJffs?=
 =?us-ascii?Q?wrtjVMrVfDNHIh44MnptmvN23EBFJeJm/tW4kUyya2OFltc24O111UmKvwAr?=
 =?us-ascii?Q?BZgGA2LQ2qsa3CYsXUDMQMPfIdmXiaBkOitZBfBYbpJ/SJPygcwTh1+wkB7+?=
 =?us-ascii?Q?wchrsX3XF00sEOuAr4v7soh2W+2hRo/otV/TYggL3krZFkpbrsV3bEGejpUW?=
 =?us-ascii?Q?OFxa9XD4+hQeNqyKhIb2Qdrn+lEfxkJz4K1X2jX890Gqoa7JSJlYg1wzDym1?=
 =?us-ascii?Q?YkagGy9BnmSVnhwW+zARglg4FdENB4wOyiLxzJcVoX4vcD69r+oUlo2R5qik?=
 =?us-ascii?Q?+7zrjPHLocDh3rKchl4Hao0EBmrRb0VNwC95PEoZVyHVV/rMdCr9+0txTt2l?=
 =?us-ascii?Q?ndzGBPYY4S2C9MS4FNxLe0IBe7dvALToZ8E2lXuh3yB08wSjR/m7YonI/S68?=
 =?us-ascii?Q?miCDiAVzQ3TLA658Ls6jlJgnbS2jCFranSA13E0wD0/0l9870aOwXi3HouwJ?=
 =?us-ascii?Q?IMZwMkwT9Lz58b3R29QljH8jV2INauId1dHzHvcf4RO8K7mOMRvnrOklQLdH?=
 =?us-ascii?Q?Y2xIibG7PPNSq3jrf107/hI3+X4qcGT/en99Ruk9jtryjNB/aXn+A7KeSfZA?=
 =?us-ascii?Q?qVmAA3AdpOEsU7mJ3VmUvaMxTQsVx5ITcjydu0x+/X6T71jAqx7vAQtpg7C/?=
 =?us-ascii?Q?ZvsSlq+SRN+BMmzMxE1JJpZMQMEUpEq9a4kfAZQxMV3JFqodH7aPpjTaS8sT?=
 =?us-ascii?Q?nGsvEdYRrIcPtpyPIgNvbkCrMJY2RU1osVXGQMjdCLM32YHPpHkLJEPQMQnf?=
 =?us-ascii?Q?TqUx+uMkIbHljxgyPcWbgwfE06Zvnt+QENlzZU+fhL6RgvSdxtC4RpS8ONBv?=
 =?us-ascii?Q?wMLOeLwWUqj1kjMtc5GDE5yVz0gbAr+zomrlfn1wB0+QXy4fRp1N+8ctWBsk?=
 =?us-ascii?Q?MeI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fade66f3-22be-44ee-2ea6-08dd4b7184ce
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 14:28:29.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3729


On Tue, 11 Feb 2025, Lee Jones wrote:

> > +#define ST1202_MILLIS_PATTERN_DUR_MAX		5660
> > +#define ST1202_MILLIS_PATTERN_DUR_MIN		22
> > +#define ST1202_PATTERN_DUR					0x16
> > +#define ST1202_PATTERN_PWM					0x1E
> > +#define ST1202_PATTERN_REP					0x15
> 
> Why are you making this change?
> 
> The spacings went from being okay to too large.

Originally the code uses blank spaces for alignment, but changing it to 
tabs leads to inconsistency across viewers / editors so I will just drop 
it. 

--
Manuel Fombuena <fombuena@outlook.com>

