Return-Path: <linux-leds+bounces-3970-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1CA34746
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 16:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D131894350
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 15:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CB915539A;
	Thu, 13 Feb 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oHp+GMpL"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazolkn19010010.outbound.protection.outlook.com [52.103.37.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AA176AA1;
	Thu, 13 Feb 2025 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739460367; cv=fail; b=ueVPaaZ1NDK4hrmlqlpbZ7/3AOCFGt/uJo9JrtSnxidCiDrw3K0TiFqX2kkdlB09bBm9OOEU6SaMKdDBvecX+KBMi58LyTxiwdl2BeMz3fQO2BPEwrjAeIv11bGYeaEHRSorYReM/uhCpg5nw8BBFDYoUyNrAx2hBQt0SvSUrY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739460367; c=relaxed/simple;
	bh=eCgqxksE4LxPTLnHItMJWvS+UZElL6XVYCnW7L/Uz0E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=q2bYmXejr65uDj/BWXjKGzw3cYv7KPkcmdQ5NbaOZDK2OrahDFjZ3SDzcl7H+/VMl/OEumz0Xbur76Cxc6ecgo2vwdUd3XqsdopRnBTa/oTFRZ2KXMNRf0SYjEytJemPaMxCnFnZbPN7rggUok2H6qTaqF7Ym6NNdtC/H6EdKAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oHp+GMpL; arc=fail smtp.client-ip=52.103.37.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+nWl2MZYwPWc2Cz9qfbpB/9D9ZVyQR8HKmS7AvoSqIMI7nfwLiYLBaYjrA4f+P8ZpoHk0EG1zm/NmX684Ift8lTv/GEjbbkebz2iraps3POd3qw/S+CxtnHrr0uuL9405VGtuLOIgiuH7BrIrsJtxfAr/dc/G2qJsV/QIzaR4UFLRFNurcONlpH8P6bHf+tzIjZ38H3P0XZIyiA22Ig+F11O2Yb2ax42h9pp4mS7X+JBy8o3eVrJwGkze8PWchMUIbllxF1jbTg+ENf8jbVScKxjbVb1mxCb1LuPeoe1zxesXZLpr47i4bArhXAmUGyjAxRaOeEz4y3GsUKJsDELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Rsr+NX9gnG3yKCerIWDAeAli+mkFZuswqyE0CcX90M=;
 b=xXhqa7j0ZCF9s9ndkn9aHP/hiWsLXL322QVdLFKDraZRk7iM4yh3K8ZlCxEe6Q9QuB8RwavL0aNGTiKYj4sDxAAqDNziZCBjSlny9k3uZ1YqRfE5B1e2ZioajrpquItNZip12Lktb6vX4Lvq1cf6NPqf78fa1Bx7zB5kaR3zEdGf2T+TSCDIO9njb+myY7e02hzv9OXlqQmhrB3yDl8S7RQ687xm2O3FE7SYSILF81OqcFFiZ76bllKyjgA73rXimdotmOYb5KuuGkPkY5vDAMIZBQRNt9pnWks0HX6t5trCjd58TOTNdVOH/qs0yPY8sj4u1lyHwYIqG0ayZDWekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Rsr+NX9gnG3yKCerIWDAeAli+mkFZuswqyE0CcX90M=;
 b=oHp+GMpLhS+0Vj6XzT+5Qdk+DZGCueoc80/pLTtA6yHQ5poNjP3YX0++KdUYnfesUp20X2cCAiZyuoyjEvB2VS6+PLIrwbB3bIXa2oYm8TksoUr5iDCoU1+BM/TDhCm8VAADzD9GBtY0tXv+pxmWgI0ne8neHce5HJhnWWwKNek3ZGrcGxoOy/K05T3yM9jVwmLt4P4Vdwl8KnpMgzRlgkGVoBy4W9SZmj63RuD7GKp5/DMLwBd87inX++OAcqR4zWaJbYZkHjy97UjXBao1PljvJ+Vzl3waTGXMR0YbzHPmCGpvwdL/aYpfpHzagUDiLFtGMaHfw7TahTaDPGYeGw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO2P123MB4141.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:156::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 15:26:00 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 15:26:00 +0000
Date: Thu, 13 Feb 2025 15:25:28 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access
 on race condition
In-Reply-To: <20250213102449.GC2756671@google.com>
Message-ID:
 <CWLP123MB54739D3E587725A0E408E2E3C5FF2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250211133149.GN1868108@google.com> <CWLP123MB547308A731A2B7F1B7FF12DFC5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250213102449.GC2756671@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <a4872d57-4c7f-37a9-fb86-15e6f50a4c8d@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO2P123MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1c472a-07c7-47b6-8064-08dd4c42b806
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|5072599009|8060799006|461199028|6090799003|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CtHWbG5Z9W6pGDJK+Dc9ySCSVOkvr4T87ruy1ivDHuu8j6875dnyxJdrmdLT?=
 =?us-ascii?Q?lROsVqoMdyJigE6vS1w7t9A2XTGh+BPEPasS0G3sYMGIKIwyM1EULA2aPJNI?=
 =?us-ascii?Q?qnBt1Px1sVWt3gC2zDzdSCQtvqKg77LhBmeSip56mOrGZXan7TF+CH2h0+CH?=
 =?us-ascii?Q?TZmBRFxFEk5VCllMlhCEOxAvyS+/pkQV1DWzZUlvtg+gdarpFaOtBxhI/IcD?=
 =?us-ascii?Q?Cs7Z1OxCQRtnERMR03UybyUL137eUIiuSrtXMQm0oraEaxun03h9bFZyvoLX?=
 =?us-ascii?Q?jtNBIQE9X+W/UyQ4YwdiMY+1eV0ZZzWqPx8xb+Cyz7OUfAQG9P1We5/XLrqc?=
 =?us-ascii?Q?cgrPONSWAGZXFt/x+4mEOSubwuF5xQ0QXd5gqc8986wITtSeN/7rhsarvGqi?=
 =?us-ascii?Q?mEvaL9AWyVnMegR12EJFAjC5t7/FCGBKljSuo+bxqTN0UQM+neq/k+gnsCFS?=
 =?us-ascii?Q?fZcLsptzMKF9KMpZkzt/c5/0TJT8LVGsK4bqMYDkR8lcd0SW7nLqJJHiSHM9?=
 =?us-ascii?Q?EG4EolI6ukFVDMc/TPSy+oXC9j6ia6k58LVYxKvMxh8fRYMJwvPBf85wdyw8?=
 =?us-ascii?Q?Ph/MzmuEyqprFwJyAGt9GHstIrCAxo6RnLyw+cnQFpNzOlQlfP11xWZAB6Yp?=
 =?us-ascii?Q?1EnYzrxJgsObnxjkh96yo2IWIj/lv9drEwcJ2pNWSXJpmpaVZx40+hjc66Dp?=
 =?us-ascii?Q?Al1v1d9Saxn3L+syiA0QJCs/H302TeAdC6tk++bibTxI4WUYFJkM50bcMvWm?=
 =?us-ascii?Q?b8EpTAgoDMR4orNqzS39DVw5sQDw3wSrHL8bqrnbvzRADB1+A4wDZsM9Yq1r?=
 =?us-ascii?Q?hMPVVu3i7qAyuryTHPzLUjEGlaTNqmJYca4hy7qpgwHvsHviE4XNBFtNI6V6?=
 =?us-ascii?Q?tWUWaHQ7SM5I8nzyt6EGJ6gmJ0qrP6dd2pAs695oJ9iq9ciRc6XVBpBjMEYD?=
 =?us-ascii?Q?3v+yIjA8hAgAYS6r+RTtLqO2ywPRzE9+vRf3EcQV6RDlfuBb9jHK/YLbNf/L?=
 =?us-ascii?Q?z+adIR83scwuN9+uW2FsAE0jmEB361Mseb1qH2MitCWnlIix9hcmp+RkAoiB?=
 =?us-ascii?Q?hm5/a9N5P3T2Ic6cQs+ue6G987bSO/sweutWQ4Ohx8eTAHhrtb8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3fIaP1XyViaEpi4MWIpH7GRsoiRj1IixpfV5aIlc4+dyWicL7YyvTJmviuUP?=
 =?us-ascii?Q?duG/9C4ynfgD0Dlq0TWdNStKrrP3x/e3+H9kO0oD+k02GPzcPNis76j2AGE1?=
 =?us-ascii?Q?3bz48+UR85e1k51yuchQwUTUaW+CLREr1jCBZKKJBi9i7WvLlCQGFlvHOLUE?=
 =?us-ascii?Q?zXLh2jiaqSsCbbzhj6LchI57AA1RQZS05I7l7O3ggLxmLRVqhlqAT+XwjyIe?=
 =?us-ascii?Q?RrUO6PQwIiT+nDP0msp7mjuiGDPMxTfJ2BGMRqFt9uuMQxbKB0ruzcpxybfm?=
 =?us-ascii?Q?p+JML+TeOXBrG12Ns5k1ScJwS/YvNHIUAEHT+FP6u5ovPd9LMfiBOQ3w6LlP?=
 =?us-ascii?Q?6bg8hiKys/bDwFdSOxLQBQxo0nT7CccodlnWVnpTsL2wh4PuyoRIwXaDiwSZ?=
 =?us-ascii?Q?9R96So/c5JpUIdMkcbUlG3At4X36nFKxUjzDhrUtObbmkUixNSomqnSSlExp?=
 =?us-ascii?Q?J4PcnoxfkXhaoT9ISH10AnJ89vXYqPBXzJACINwNktVclhneUHihHyWubown?=
 =?us-ascii?Q?WBte5Pw74yVSXtd1MWF4XJO9Ui609U1IF2HCUJN7EU2QjbPmJq1TallHgAXB?=
 =?us-ascii?Q?hyKMK0dixJ3Wy03nFEUfI6bXcCQsTZiC8p9GwVbqP4d1oP8pZkeD+ozC3NZi?=
 =?us-ascii?Q?nMuRqPh1bsPQV7sVjmCJ1/wD60FcyYiWWQhVsCNsvloCCJXAA5YaKhxe+q8d?=
 =?us-ascii?Q?RgkGBDaiNnprPh4G7A+1qBPayi99UCyQfTF/5iOOrKejUY9bV6Yq2Wka8YQZ?=
 =?us-ascii?Q?Z0QsSW3ZX11M0toz7m+zNRUUb0nMdsDaKTU09ZwPyHZ3QihbYOuF8jDgJlZZ?=
 =?us-ascii?Q?/gw6MmZX+Zzl1LSY8fEXH9+CuFOw370YkLZAMrfKcGTjCtbBCFjUGOBZI4Of?=
 =?us-ascii?Q?Df55XzT611p3Ss4AseIPG+3G1T/jAnueOvOsCWXK/M5rmMHUB+W5mPA8N6oa?=
 =?us-ascii?Q?MVmz6qxXeqFBSpbR4yF+mWYEbn5r9Du+odSg1shW2PMMpNKWNkSAHKD+aU17?=
 =?us-ascii?Q?Xw/gfxeMbhU+RuCbA6/QMgiiflQqHdlzMZ/XFri2bZ1KAs5P/4JVR6587Atq?=
 =?us-ascii?Q?O74Y6sWX35z8yeH8//AgVHNWHjFb65sTpa28NBK3sqEC9mvNjz/UsC/iZvtR?=
 =?us-ascii?Q?XFGrY+fzBUBl916pbFB/paeEe+1tCXywkgcVitx89g4+qjrZ9NtCrZTphB7a?=
 =?us-ascii?Q?atv0tDZpPCtye7OK+kHWAO18m/PCwqz8JjPxGQUKWqzvJ2pfthsrkWSWSN1y?=
 =?us-ascii?Q?24rgtXdiBdDepgkVVhi9fzdcgihhI+oKEt0sQQM+9DJ7wXzAQnolwmjm6GEK?=
 =?us-ascii?Q?j6c=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1c472a-07c7-47b6-8064-08dd4c42b806
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 15:25:59.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB4141

On Thu, 13 Feb 2025, Lee Jones wrote:

> Then you need to separate the set into patches you expect to be
> submitted to the -rcs and ones which can be applied during the next
> cycle, then go to lengths to explain that either in the diff section of
> each patch (preferred) or in the cover-letter.

One question so I don't take more of your time later on on this. Should I 
continue the set with 5 patches as v2, applying the above and the other 
comments, or would it be preferable to send this patch with its 
cover letter separately and drop it from this set?

--
Manuel Fombuena

