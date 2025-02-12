Return-Path: <linux-leds+bounces-3956-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED2CA32B93
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 17:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9B58167AF2
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 16:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49659214A8F;
	Wed, 12 Feb 2025 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DKX1mGi+"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012055.outbound.protection.outlook.com [52.103.37.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796F01D516D;
	Wed, 12 Feb 2025 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377723; cv=fail; b=EjPInYLG4Sk22jsmwMWrJ/edlm7gWJK02rUA0iXHI2gOn9wUnuO+71yrQGeqTY9n8QfcLUr61aYfAynLMmpTxTRM2iMSR83Uc2yzu5sfKCDHjfm9lhghdA/CH0JcEIh6cBl1PxM4kV241mZXYDgFwe+FYoPLF2GoU9mHgpWCPOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377723; c=relaxed/simple;
	bh=iODVGzhfnmcF/xSowJvljS7et+XSWeLXEs3yyzDZQEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=diRZvdrvI6Ri5VCYAI7mGT860fPtIT2ms14iCLF/c7jHFwwwwrozRjUqNSnMz5Vc5eCwJ7EUuWjJXgPVAAoANVAYnBAE5I96eXzdhNZfWz/odlie18+lHtr3h+EwstbSTfSK3JR3rUg/ySosHKrWfTGJOJbGUhWgf3MVwrTgsoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DKX1mGi+; arc=fail smtp.client-ip=52.103.37.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUw2884qvF1p3d/HPMEJ2z/J+yTIXZlwny7PfhbagC28yqSevtiUOIe5FUaRRIgQDISc14+/0ElIsLdfsbkBfLeUKlGc1GzsqI/c2+kuayq/ucu2ZTdirH4mN1oS/e5xYx2AtQOkMEyTXtXEgoHE1alVU06/H6uBb473ArSZR+ZTeQMR7xCfA90itJnpgABlf9pY5HF333Ed7iusjWVno4N9+e4gvJUVgsmOU9+GE13EFQcDM8Z38FDrui5xoWZHMGvIyMoWEdFLcyNpZakaMCxGrs9VvcgCINP4VcXoBwxOSBmnIcEP5wDYKt4zDR/tB2gpz0xmLDF9NtpbsD4FzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97yc2rJVFLPrOnTv52jEN2C350uaKocsNZ5LR/Spqdg=;
 b=KcvFOGsjvtxRhm0DdCi1VFRAAynx5X/9ay4pG/Udf0/mckRfe/nVhl9KwuRB4FqHd6lUKg8FadiyyztfQGpRcT7JYVfPzaVCat0HyOFtiNWxiwIBG49QsOElZ/B/6nsKcmiExJR7rC5q3xSisePUCQ7nhVO54uxZXg2UfDqXUi40WJ5obZwJirVnoLjwMA6frvfHzm4oF5xL+zU8EizOaZKnOBfnmRpwMnBkIFaU3p7UuniucmYpmxEwZznTmA2xTWowKn4rwwQF/895aLNNIYRvchUVnto8Bww39IZlEyTWzKqBSdyJeETtKz9MpXweoGxZG7i+06a8DRJn4UyMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97yc2rJVFLPrOnTv52jEN2C350uaKocsNZ5LR/Spqdg=;
 b=DKX1mGi+TNjFG9P01l2hrixSPQDnrx96Vjv4OzMRVq7jbwyI2IeiPXkcmXyDN7OtaNEY10VohS13u0jqjQt1PGhossV1ud72UTYl8svMi/YBSnF8TPaiTluoaZ3ZVKZkmvtQDgiuDtgqGwAKfRtASTg8VVwTCp+prZksxarRumJBvCc9qtBiNFLIaoUEOgSE2KFVZHJLdii8DdVAfMRkbRZqFOWwPv4/X0cD8oXmd1clhsAziL5SwmMhEfrFIIYPvga2idNpUJGBw1Vlozon/woRrwC/mg7q5kXTEnCIHYk6CDQb87xud7XF2pYhntze30pQZRXR4LeUHEXDu9RlFA==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO2P123MB7100.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:32f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 16:28:39 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 16:28:39 +0000
Date: Wed, 12 Feb 2025 16:28:37 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access
 on race condition
In-Reply-To: <20250211133149.GN1868108@google.com>
Message-ID:
 <CWLP123MB547308A731A2B7F1B7FF12DFC5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250211133149.GN1868108@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P265CA0121.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::9) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <166442dd-65f1-3958-c2ed-722d378328c1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO2P123MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 69cab9be-d7f5-4ba4-f87b-08dd4b824e27
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|19110799003|5072599009|461199028|8060799006|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?noZCgk/z51vrGJiHbhCxVhKFllBP2juZVtOWfNx0U5n2b128TyoBwNryfPUx?=
 =?us-ascii?Q?yUIz3xQQWHaNoU+tVCk7BG8qepg7mxWZzQGNKlckW4BxA/a312LWpjeOXbFm?=
 =?us-ascii?Q?qtVQzbxGwejRs3Vzp9Qm5cO4ey6hUyjIf5U2TLsDO4yb2fll7VtbXMPt9Qjg?=
 =?us-ascii?Q?6xGhk6Vl3zOVLtZCdzOZX/fTR+97iW7pWUFSpu5XAu2B6EEL0wOpbvhzP4oQ?=
 =?us-ascii?Q?/7acCz3zqQSIogoeMPPt9U8TvzGCXKtFPt48RGBx4fRlkg+FUAfcl6ZoGsBe?=
 =?us-ascii?Q?QHkCDC5pvuonvupkBeR1FwZu9W2uTUK6RFdVBODnf1P+ML2Bg5BKfcvkmMdV?=
 =?us-ascii?Q?XiLfXjNhmAyBPV+H+Hkvy+96gpfoB7TAX4GZZn1s5zyeVpQFzB81aMipR6Kg?=
 =?us-ascii?Q?C0eWhBd5sN2NgvQ+ISbsg1+KrBove/ztGGNy+4ZmHD57qiTZqrpriUaxLojT?=
 =?us-ascii?Q?vY9ocnnpONFF6HTIJdwoSx/2DtYX4KU+S68uCggfXFue+asnO0F1OSj8NokO?=
 =?us-ascii?Q?Da3sgdYIjNq4EfzY6ViGMzGul2MF6qrD4sFg2vmWD4mA/1RDYOi5fd+F95Fz?=
 =?us-ascii?Q?Y6T+eO8h+pOPFfR4JxzxtTKGjhxXmeyC4I9PbFIx2kL4/MR6Z5NiYlPZlmDi?=
 =?us-ascii?Q?/uT/rea29/h8lekYkhvjbvM1ZvWRvAJ1v9O4f6EmERhgOVP4fpHrS6S3wWv2?=
 =?us-ascii?Q?z1fczJV43JNGmFu/CPCzS3DUAeCyjmo+9mW4vMX0tv4nRQcgBGkW+kQADhGM?=
 =?us-ascii?Q?bX/YThnzRD02q2rmBVJ4tUSnfSedqlbo82X+WXqu9r936MxSJsEBP+9P7O/w?=
 =?us-ascii?Q?L4dixhSjRiujvkknb8Txx0w6zkF/k78/4ZZLxUHL39jIgmTmc8T7xk+UmzCd?=
 =?us-ascii?Q?8KWy1clxsOBoumwHkdYOsYPjXDkJCn1MnqRhXAwGm/U3J4N9zmqfdDRH76Zz?=
 =?us-ascii?Q?HkdYHECBvRPJ44hRqDqV/l+jBspeXaDg8DIH0CBimhYjeONVPjbSLlCXeD3S?=
 =?us-ascii?Q?FVrLD+i3T/5Gw5pCqobMbHX4Ft2lCOL3km7ybYapVRGrx/eEwbypacYnvhzY?=
 =?us-ascii?Q?n65ybUfzMsIQ4E3NayCTWVSnHBGD5bjxoVCs/gQlze1elHAmZ1E=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQAgz6ni3bAVjOYn4MFT52VzXIgdau8BSC+wEJCAvvrupzNZ8MJWotFgFd1p?=
 =?us-ascii?Q?Tra7VyIA4L8KThO7bBU4WNMZErSdh3ngr9aDwSI6Tu9MEwzfkRF4j9WBjlDz?=
 =?us-ascii?Q?5gC2zAGBeYHMrxZYja5wlqITKmY0+nAkd4P9lWcTm2hQMpNKC2p9LY0qIRRL?=
 =?us-ascii?Q?nZXyKVI1iEPMjFJG38ido9qb2im/e5Oj5xnIFD1w64F96ZVb0ADEEuNw5pgn?=
 =?us-ascii?Q?fbUrtxYNmteioErhJBK0Lehm2/kNIn+YV+1yu7wNaXn0u2FFCAq0ocKDJzZa?=
 =?us-ascii?Q?YjB69YEpNiYuxvceFjcsG7WQnRr+FlTEyKggze7IikuKiqlwGBJTr7nfPnLl?=
 =?us-ascii?Q?lcyEy15TdwBfLqyIuoz4gfEKl7ZuONAGG1qh7B44VuTwRQUMmn3LqrIxANhA?=
 =?us-ascii?Q?JaUAVGrTdFwW9oLR/GQF8wY/ecVvNiALV/CYX1ls/rnBDzLLGGRNdp9u5A8y?=
 =?us-ascii?Q?QbgkQ0+Hpsb25/y4ilNo5K+M8wjQHnZnBOJtd3j/THMkk4VLLpjs6hn9/fYH?=
 =?us-ascii?Q?0jh2bp51sUFSSJ3zeNOp2R7wTePlahOmhRuY11OKdIj06HEcoJaxkGFWoc09?=
 =?us-ascii?Q?gu43fyfp5sWbBWxDz/Bj2FlTCXXQxuraXJTX70mqiZjQ5jWubs+xC845COP4?=
 =?us-ascii?Q?IqJ34yOSnMBqVGASwXAeOsq3EaAwiYDh+XsxU74eG2Dg9aX7URJ0aZRzFVnS?=
 =?us-ascii?Q?N5iMJrETgqrJr6mNHbvLRsEd6FXmZxeAUK3U2nZO7yx5x5+1m3nnGHiCQkAL?=
 =?us-ascii?Q?KIkgqCMtIu9bsyco+cbp3SbfPyutOkiZtr07QSinFYVCEwA7C/m3yucAjFrL?=
 =?us-ascii?Q?lrH6OuM6vgqEmMGv8eD8iQ1RwPNziuWYp9AwCRLv3W9UgLBE0MRRXAIfr+cK?=
 =?us-ascii?Q?aNqC2A0Gq9GD0W/5XiQgTP8n826yVLAb8dk44U59NU00WcEH/Jv10nMG+f0n?=
 =?us-ascii?Q?jQ8YZL1KaEHhPBESwAPof1dmXI0aJS7lrA1rRkVJf01bKo8PkL3qoGIea2Wy?=
 =?us-ascii?Q?eIHBEWD7XsAgW1xgZL/RydcUha4qt0c6407O25AD+wtiXTI+6uXHeQv7n5K+?=
 =?us-ascii?Q?ZOBTxpa58+E2az0P2rTo9UVBvROUFZgwD/uskgpd8ztGJYYFzfDei43ZK+Bi?=
 =?us-ascii?Q?7w5roSNfkaa7w1/mIwa/EFEZmsqhKxNFTqQBqsmCXE8OaH+7qMCZMjxM4Teu?=
 =?us-ascii?Q?ofBOkzgboS+ofPv8SfKIPQAqcGvy8vfXnDMwt1gBXmq0PcMwR3XsPqvKjzEN?=
 =?us-ascii?Q?YjtUbIjAsXqWk/Yd+0q2Q5LIAUwHrhRgeWCezDlyBDqaUeNwqG3Y2Fn3RCH3?=
 =?us-ascii?Q?XrI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cab9be-d7f5-4ba4-f87b-08dd4b824e27
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:28:38.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB7100

On Tue, 11 Feb 2025, Lee Jones wrote:

> On Sat, 01 Feb 2025, Manuel Fombuena wrote:
> 
> > st1202_dt_init() calls devm_led_classdev_register_ext() before the
> > internal data structures are properly setup, so the leds become visible
> > to user space while being partially initialized, leading to a window
> > where trying to access them causes a NULL pointer access.
> 
> If this is true, you need to provide a Fixes: tag and to Cc: Stable.
>
> Documentation/process/stable-kernel-rules.rst
> 

Yes, some circumstances have to confluence but it is reproducible under 
normal use. I can send panic logs if you want to see the details.

Since this driver has been added in 6.14-rc1, I thought that, if applied,    
this patch would be included in fixes before the final release and there 
would be no need to apply it to -stable trees, as it is nowhere else at 
the moment. But of course I will review the documentation and make changes as 
suggested.

-- Manuel Fombuena

