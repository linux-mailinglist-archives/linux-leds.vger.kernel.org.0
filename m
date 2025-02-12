Return-Path: <linux-leds+bounces-3953-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299CA329AE
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1946616379D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18332211473;
	Wed, 12 Feb 2025 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="okIxcCUI"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazolkn19010009.outbound.protection.outlook.com [52.103.38.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7351D5176;
	Wed, 12 Feb 2025 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373320; cv=fail; b=lwxAqxM4UVhn2vg2wPFP8SnSeLsVpmoKwRNZcyg1d3xJ11P9KYRezFavyV/X5YpasS5fnuI2KC/cUYiVsCo7z7tOkIgbQwiqkl2oJu0jmfKsgQG9j/Y+4cgDj/0OkXBICPzQXE3MOVVkHGo4JCXiKwD0/oAA8r6EnaB9F1Rd638=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373320; c=relaxed/simple;
	bh=j3Lk4l4/IwC5RrfsTCCMX2ADWuJC/5bwhjG+NMWCUO8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=Vg8ujQq87HNR4izu4ZRgfDVClj7v0L7yfY/fntjZo3bAvjwae8EzvrgljEaL+15VV5cd/RUNLKChlzhaFTiRloePEoPTJez/C2MWGJb/3Xlfq575/erymaaj/i9ttekKrJpAr/h/Kzfov4BNTJwiN1i7F3TT06LtooBnDbBxPQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=okIxcCUI; arc=fail smtp.client-ip=52.103.38.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsX60f8JvqxAmkupTkBIXper13yR3VOSpXxnlWTwPfIuLqvuX6hW7RiJ2gdDlp6LCw4XC0U+Io2pKb5MDtO+fjroo32hcwlr2QIEyO8bwddre1a6KGtlD+Vfhtte6x1Yi5O+auz94J+NTvRfINrblESFDnbMi9eKcujkdFQsJcsyGz04XJcN/AAJJga0xyxIZqnMn/jFwoJXyGmCr161T8G6T4I5/wOmPHXwGazXZZDqyU7+84I7Umsr1V54p624WMsLrsg22Fb9UIrhRpgwu17WKJ6vqM1UTadliLrro4EXM5+WVx/z3MFrUqElQTb8ZObq4GreJE9wrNc9UwKK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/lbz92xcLEShlQgCqWNJ5ERnsdm8RsMvHxt6vcASQs=;
 b=OOvS0axXiTpo0J416QmDvGhob5TS1+UCUPDfwbwvh+lhXfBLABG3BnIkHO5lZfx676lVYgkSOgYI3n6WuVp3Gt3ywtZAmPh0SjbWuLc8JlpHhYqofPaxPVWXhztwPQcTgyN1TyGZTtuP9oTooUYwu5vfqZyyT+cn7MhChLqR+4Ajsg0o8KdQiu6oNDd+NXMxHP/oTtIid7DeINZZr+08EcDQcGnaH7e0pYrc+OeXjYgWwfMBs4Q1JUamjg0qJ6zlEoyK1edFlVp8ooF9NO5+fFRAIkNS+GRToWLs4c4e7Vset+D4I8fBKng95hxFgM4a6C+shYP3LoXkzfm9/W6o2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/lbz92xcLEShlQgCqWNJ5ERnsdm8RsMvHxt6vcASQs=;
 b=okIxcCUIZjgH1NVEZlDk0A/O3q4b//G6CWSRDL5sdu6znyQdqox4deSTmG6IJPJPzaDEIHjij3XlpimE/rKPf9lqM8zce+u4lePFrOBQ+1UpPOPxTuDVLX1GH32iIRHwZnQrK99Hpzos7aDGdiMfXWbXqOm7gELtyK/1AGv3ZfjI/jF+8BXY3gyWSfiwfa5LzlbAJOZGxzvpKV0uj10GgwrVhpwiapJV5Hm4oc0QIpg3XpTo6ABUdlp3u3cHoPiMG83G+FkP67RCgJoAsFu0QOdH3ohu3SGIA1JFqo03SBNXefpiPvTUtG+T022ULUGGDCOOVsCLzx6jV94ymFg/tw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB6269.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 15:15:15 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 15:15:15 +0000
Date: Wed, 12 Feb 2025 15:15:13 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/5] leds: leds-st1202: initialize hardware before
 DT node child operations
In-Reply-To: <20250211133219.GO1868108@google.com>
Message-ID:
 <CWLP123MB547319E34D8A3A891D37DBBBC5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB54732954D59EFDB0D344A6DAC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250211133219.GO1868108@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <0fca63ea-2ce8-2fd6-f10d-0cc55fbc3c7a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e2aa37-a353-429d-8570-08dd4b780d74
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799006|6090799003|19110799003|7092599003|461199028|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pd23cvkx1tROfFrAZtdXw5bwVrpFHVDsriOVpkc3TYZb09E0zGMjEo59jMt4?=
 =?us-ascii?Q?igtUCoqHTonSQ/kH5gaOIvJ1/IRWgC+ManSRXS8xh8uZR6P99z9UAGggHIvK?=
 =?us-ascii?Q?aaGuULokiu82hJS2DyebJ6mnsELfth3b6aCepDKwMjzpMgd1O4Edu2+whSwB?=
 =?us-ascii?Q?K6lv6gWJbVfYpVBzIShMi2c962UASgaIclnsFqSfUHhtAtRH5SCDPp8ZBSzo?=
 =?us-ascii?Q?RftHUFI/P8OSWWw0dmpON9vsCrERAjpGsexp0Dw5FiwnDp2T0qohwIEt0720?=
 =?us-ascii?Q?9jghp2lcsh/X9cNxX+ogrmpHPZ2jtupMSsegc08J4X+8okRSFO4PTLpsYzC+?=
 =?us-ascii?Q?9K7zK1aYPrRAYuXSJmmHQaPPfA3j14JexTjcOp53kTv2IW0HSIWCZhZGnfyG?=
 =?us-ascii?Q?57+l5aK1LhlnklcQsnLehye/djedr+s1CKqJ5vYJz9qPWy9f9ueuLKnNH0an?=
 =?us-ascii?Q?8igOirIGTbFTDNlm7UUe5q6dYAjfMjohznIY1+4ROCrFSEFSxq+RUlZdwdtg?=
 =?us-ascii?Q?qsHy6f4Zx5yrMus51QlUlHchjpb3XbRItiD0QS31y7j338GwnguoJClmKo/+?=
 =?us-ascii?Q?tyndwNevP1PnXyUqLm4OIITb5wtvBrhUhzO5EbH63DjMxFHjeHu9RmiKb5oT?=
 =?us-ascii?Q?KlTlSuiXjM8l1SF0deU2dU2vZAhwBT2QlqhXON4wyU6bLYSIhOB0UaLoUU4k?=
 =?us-ascii?Q?WRl5JXH6T2Pbb6M1M0Ncsd5zaL+K7Hc+RiDuyteq/EbNPKyQHkXpcKrGgBt3?=
 =?us-ascii?Q?oo3QLE8DZ+SwajfcGCKM/Qx28W8eU2H8dTQW7GfxwMiuByuBvbBAPOcgl6If?=
 =?us-ascii?Q?5Kv4F0d3iWnQ/RYm6AwLU9ZQ/rmoqoUiVBb/a75HazgsCYDC/ILE2oWc510d?=
 =?us-ascii?Q?rCRgIbkUleGmLxlC7G60YUNgpbUiTX7zmnY4J6eq+VP81w7QyPCWH5aEsb6U?=
 =?us-ascii?Q?LtIZjVxlf4AtyJvbuYCqhiiS+yIAfi9fn4rTPqjZq4BaZ3Sl1XH4YV8S5RgW?=
 =?us-ascii?Q?BiJvWnsp2grSaloKZeS1953MmT4OL+C+MUiHtbTZcSqkQEptYS7JaGWOrnpp?=
 =?us-ascii?Q?FDIdD2ES27l7A8BzYDhNXOXmG2Sw42rRWIjUbcEFho3S2qSOvdw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eGQBoj+Cet6g88HuUd7/N15vE6AgdaTMhOejjOIMH9HQMQtgQRzNIbpXLEaB?=
 =?us-ascii?Q?Do/TGpX+h4XVMtgN821fvCRfX0r0betZxdQUTQ2xaI2RyYwdJIPhh0XTVMHn?=
 =?us-ascii?Q?mhBhF8AoxEiT8P1dVmoIyF2TIDjBjbpukPPQLmeZZJK/AHHhkvGkn3a1GRPf?=
 =?us-ascii?Q?axSrfHsf0vbMkDWWX1eO8im+evHi0gw2WfeWYx4s5MJwUp+2MHRA5O8GSrPz?=
 =?us-ascii?Q?Lz17zHVNXuMIV8eRv6iaHPNW3S/yPQihhsC01HtKxb0FxPWLVbaLomgIDqVC?=
 =?us-ascii?Q?ZC9ER8yxj6sU9/8KNm/wF5euIdRcIAZppvi2kPvk+ODGOgpG4p4jwu2qAM/z?=
 =?us-ascii?Q?YO6AwrULLyO+a+dzpY8t41+ZmnWVGD77+kdI09zzDf94HKudtM2ZfrspHw8t?=
 =?us-ascii?Q?JEapDkspfTcmdmchZ8CLcG956fPzSi1dLUvX4NzbcwGdFMKDAblK/ES3CB+o?=
 =?us-ascii?Q?tsbsJgYU27PQAtPBBn60XbXCE2RkxAz9k42N8DhxajC1x/pJHsY9NlrUcJq/?=
 =?us-ascii?Q?2UhIP5/BTr5UPp3YmFzMvK9PaKteWGymoX+/1T4vLkMOG+mjHCGcFWreK+lK?=
 =?us-ascii?Q?WdOCQTOOOVwDiR2xktq+iXaOn5VyoCAoeiabwpDRr+o0FB/OeAax9Ip6ODty?=
 =?us-ascii?Q?yF/Uyh01d1od+T8sZWfYj/vo7POFttcZ94IQA3iaN7Xy8HjzRkhkt5Hgcg5D?=
 =?us-ascii?Q?mUKX+EfpwAQRRMJ44c6A5Km4u+9nBhH+UPX1E/OzJ56GNowZYm+SDmkAYCJ6?=
 =?us-ascii?Q?8DxYGEHN7RbCVDb2L71xvEbf8OA5jIo3pcuxMIVKTSDko0dhHE2D0G6nz9ae?=
 =?us-ascii?Q?jUV+F3lcRtWrIPw6RiCpmktbqfbO/l3cnO+noiwiL5ZY31LDmDlkHxYIfieR?=
 =?us-ascii?Q?M9DbjrK5pW54txG4RICArprjkMBVmBh3QXBP4EGShG/HetdS/nKPr6P6GsbU?=
 =?us-ascii?Q?i+HTk098wgR4+PVLs131A1T8Iz//HPVMfwMHTb3rQRtNKI13lpc99uG4ElId?=
 =?us-ascii?Q?TeuYJmFFntiHV0HPg69jmJkY+ArSHraw7CyXnAeWpUZlLKA21MDnc3XPo/xn?=
 =?us-ascii?Q?I2JUATO0fcwuGJWEn1hSUGfKv7gRhOQviScj+fpD9ZWbChr8hIiDJ38Z/d5o?=
 =?us-ascii?Q?Nv0zNW+r4FxrpTOS3HhCvSFUNOXj7jwj1l3NvIJrviyPczCM25v+DpY8MQNF?=
 =?us-ascii?Q?XCEO6aFfUgQRZH52M9o/Fpt8O4Z7zSQMA0Z4qoQ9+1XqzcW4/wzcsj1BNz7K?=
 =?us-ascii?Q?DgdC9UaGmJMxXw/IQJ045zZ0oXqfEpWAzgwHDREKxFeAfZ1zROYSj2QxFjeU?=
 =?us-ascii?Q?5hY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e2aa37-a353-429d-8570-08dd4b780d74
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 15:15:15.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB6269

On Tue, 11 Feb 2025, Lee Jones wrote:

> On Sat, 01 Feb 2025, Manuel Fombuena wrote:
> 
> > Arguably, there are more chances of errors occurring during the
> > initialization of the hardware, so this should complete successfully
> > before the DT node childreen are initialized.
> 
> Okay.  And you're sure nothing in Setup needs the DT info?

Yes, st1202_setup() doesn't require anything previously done in  
st1202_dt_init() to do its thing.

Additionally, I am not just relying on reviewing the code. I am also 
carrying out real-world testing on a device I use daily and it works 
either way.

--
Manuel Fombuena

