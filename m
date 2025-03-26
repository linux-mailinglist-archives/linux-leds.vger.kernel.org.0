Return-Path: <linux-leds+bounces-4366-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B444A715C4
	for <lists+linux-leds@lfdr.de>; Wed, 26 Mar 2025 12:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2504E3A4985
	for <lists+linux-leds@lfdr.de>; Wed, 26 Mar 2025 11:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85AB1DC19D;
	Wed, 26 Mar 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BI4ssA6w"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012061.outbound.protection.outlook.com [52.103.37.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8301CF284;
	Wed, 26 Mar 2025 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988685; cv=fail; b=F7dBO6maYzfz7p5L0Jvsj0K6USc5GnJI8ZnJt4r1nZYjiQwHiEl3sFfoc/iYQSL3PgVm1G2AVcZpomdFQ7vupigcDiooSumr425IF4/tEdw0dd2Imk/D+0JATKmpz1MLDWrQR3RDFgIJ2AR3FpR0JmLZnGW4LjtmiEnjyXbZ0M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988685; c=relaxed/simple;
	bh=EgY9ZZqvCCMrjAEdupcBxCvDJeV8ISbjT53h2hgNQ2w=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=H09TL7t+O6OfrZNg3UrtlQI4AduSIu4pg3535qmzQkXaDUzfSVLuxamDRXIF3oWTER8mvi0pFRGipzDx2zmslnAlw2faBVsFW+VU6JDeAwM6D179HDLkcu6a9p5AU6NVSGvKV5V7zXIL2iN9TCYMJ/tN/5/HxbPEqHBklXZaZh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BI4ssA6w; arc=fail smtp.client-ip=52.103.37.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z22mF4CMG/H1DcIVMgb51LdOPjiTy4BRfNmtn2jMaX63JbJtg1uu2IuFHeXYYZAkAu4vlkL+0lBaA6au5KrsuBjwomDrALhHzN2DHNlCN0bTTrLr7/+Tu8H3btxxkX7jaS8oHo3aZNtTMq7l8dtMPciIujDnTzSAAPcGsfKH6YQ4u8q1jxI5PUA3tlGYD1VhvbK/06qjErB6zJ1Zl1T8Q6EFIRShKjB8+2Ly7pG94Y1GoKG2lCYC4SkXoddOnpve6Sp3VSQII7aPrAfTnkXjkZICJE56K39NY1Px81Gb6duKRzlyayQmsOYzu3Q8td1RzOiRHT7+eI1Vk9le9+TUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahV3jjIwUhncpM7r3vdYpaJEgl59OltTVn7XPFKmfn4=;
 b=ESurQGEW9T8nWzy210n9P1IdrKN2vLF0NytflTY5CeNw7SY0aZNyHfW8XWv5d/lNT/qqVVTfa7Gt5cyKWhr1MkhFxtaP3imqG26LbmEsVow28MpGXuZi/CnbJKajpk2k2pP/T8MSVF6hBlwXIACwC42xuYZUlg4D4Cpg8L6fKTWqqXfNgZhB1psIYiTV1iR+p3PyVP3+nCbGMsJJVlnuaLiQsNcXsG8+r0T2CBdScAVqeVb56ibiDCbJnBjbJdsSHx82gFpWtMJdJIZd/Sh6h3bxsLadDQA8BptME3ovV+k1l7oVcDIkwC5EYNd271BPY9OFZ4LnyAegZNXH8Qx7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahV3jjIwUhncpM7r3vdYpaJEgl59OltTVn7XPFKmfn4=;
 b=BI4ssA6weM5kjaUkYwyji61ILkHmvU+7BCeNWndg8Dm04KKJn95vwZjLu71GjbZG1D/Bmd7woYOr3xu4skRLLhWaaiH0m+GOgFYJMk6NS8nmynET93r0RHV+2USBJeZ3o2cJDMhtNqPieIBBcdYuHPcxtCnMAl2h32rE/2p6CBwMpHx35CYa9C8Z99povM/RgjDxRS2a4GcbKMWwwHwJ4ou5SpbT+wW+D3hjVjei3xp06HCQb4Z4bXYrfhdyhnOgRtWOLevmY+IeDDdt7LaFHdS2zgJVLn8CGvb1xkyJND2ujlAcALD+ndDT1qEFzoOvNk/AjuYPmEULs9LsTHXjow==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB3463.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 11:31:21 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 11:31:21 +0000
Date: Wed, 26 Mar 2025 11:31:14 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, 
    vicentiu.galanopulo@remote-tech.co.uk, linux-leds@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: leds: remove .rst extension for
 leds-st1202 on index
In-Reply-To: <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Message-ID:
 <CWLP123MB54738759F49D377A9F080AA0C5A62@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <6c9cf60b-7371-6503-fc44-239bd78324fe@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB3463:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c7f56e-e186-4312-71c3-08dd6c59bb68
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|461199028|6090799003|8060799006|19110799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NedYbHvrZHAIG4H1vd5fEhC7DcjPgbFOoyz0MzgdYUuv9+7nWbhevSnwjdMO?=
 =?us-ascii?Q?bVvVyBCyvMvT+TA61kKh03wmTz2nfvSnvdKFz4vg21mVDtozDsKhXZthtKrT?=
 =?us-ascii?Q?Q6t+dUuZ0qoiRUxp7HqejiIAkjariDnML9KFTo/V//P+sgcTShi6AAnWqLQj?=
 =?us-ascii?Q?L7HvfsQR1JrcoAyYh06GblvOQaW17zxTdU+kAJ2ImfT/pgFVlvQdLIjHuMJN?=
 =?us-ascii?Q?5Iei8XLHQV0K6vHBPUoZXgkDHYc4TNlsz9ouP2wiMkwvFgKnJrKQfrMnjyEB?=
 =?us-ascii?Q?1HPMoT/sQWv3JvxAyUPwrQnLbUCXkqiFiK7rLswID+c+K2BzYPJwiTxTRzh9?=
 =?us-ascii?Q?fvpPGbEnbd8ZLNk2FLPc+ffidkMc/bkARpoGXN20yocrudzj0+GnehSgqzBF?=
 =?us-ascii?Q?5aMS7SBFNefMK1Ysd6oq6uIQ9YE/ea4+5V3FWCCgpb5cuMWBlY5sJilODiaW?=
 =?us-ascii?Q?rI8QYH6Zkg5Msri416ofbJ6wpGpfsgNdvQDlIRi3XzDgBhDqhVfNBRrf4k+b?=
 =?us-ascii?Q?V64ZAO8R/1vuHmBt30606xYvOTwI+w533VLP1ZqG8e7XTSyOzRsuy1A9sJER?=
 =?us-ascii?Q?J5KxXUEWvxF66GWVbFaAjB1LuP0MBjyguovvcZ2UV+xkSU9SJivxyT69XHeW?=
 =?us-ascii?Q?WLoJu/92B1WrNUv8PWZTBajfAh53rNfJc2HFpPGVooWrSvi+cG1ioY5YExFu?=
 =?us-ascii?Q?/N/SNo6N18GJSFopnnUCgLWmsrLXI/6g270NV1rjq0CTIQx0/+7hZ7eJv6PI?=
 =?us-ascii?Q?CVgUoL6jQJjRvPtcYO/yJMGwolZBEd3ZcDr3+xupLsmxMvaUzrKX6ycqOJr8?=
 =?us-ascii?Q?j4WClHuhtjnggjB0/X5Qq+zOktm9aXcRt5IXeoJRXXfqZ5PpObwOjM0bpda0?=
 =?us-ascii?Q?N5Nia8nnpGashww0WLnfWErVL8+l/5lQVwA0eL9CHkQAiuR8XI7lcl+IfQZ8?=
 =?us-ascii?Q?zHVuTMXOg38/7SLuSDrJ+gg8gga752ox4HG9qCaWp8UftWaHq0cLfrdvq2TW?=
 =?us-ascii?Q?/l9M25Sz7PWdvIBqChLcIX6eBi/+NxwliPtDmoSD/18Jflw4DY+PdB0u011v?=
 =?us-ascii?Q?AhnZAY8RzZUCYAwKt/ehY/MT6pAvftx7EA4UGceLWsKpkfABSG9CpBvYjNP5?=
 =?us-ascii?Q?QjdndBmwhSbCBbdh8eP1p8UH+qCkIc9RyQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RDrSVjGHM3aB6cKOALhfE1bcGyMVdC8T997w3psPIHJ+ccXIG6h/gQg4BDDX?=
 =?us-ascii?Q?MdJ35jLPECsf8M20mdNGze/mabr0cIX3NmZgj9m9yr//nAmHLuu2tyvbTCKZ?=
 =?us-ascii?Q?K/JB9HvDMRYIXKLfFphGTCcurZ2Z9flaiKdXlWEHIfKMSV77O5y6Xi/eezKu?=
 =?us-ascii?Q?Zghn7g2ob57kBhwpVQ6gGjuNdwaFwuiLN+wFZX+qwmiH/VDOYq6FdHuiNTpV?=
 =?us-ascii?Q?roVD89G+6/UzG+j5QyhB+13p9sKm519Z+xgs3tT/Mz7/khKQluILMB9p5+Fy?=
 =?us-ascii?Q?U3pJehsPnOAVmqXVs90j1yUGjWpIfpSBRac51sw5T4mZTtYyZHtG+iAV1CW1?=
 =?us-ascii?Q?a8XCu7Xyv+v3WNDgAVwhZ7zBS4vJ4ihFnOomBozHjnacjJLl5vx9cIaPzkF2?=
 =?us-ascii?Q?puyiQF+1JqlED0HReiLlo0fI9OwnCsJsJPRNNkmDWXpNdFYwJJJsmu9yxUxj?=
 =?us-ascii?Q?KMvAA+gPtK02eHxp3MsSW0lAdOYptWKwP5AqlmVax8az+wdTsqO88C4blvA5?=
 =?us-ascii?Q?3CjRGD5mJFT51yM37Uq5JUVExXdPHrE8Rth8CwKfnalZvDRkPcuFOhTaS+x9?=
 =?us-ascii?Q?DsA4E+p0sT9OOyMc27j7uB52kZQ3mrJ3VPgEHFTOYZjus9lpM02TowwkvurO?=
 =?us-ascii?Q?ubwbvxoq5vtxY4OnqT5hi4OkgJfpMyg75lMhrWkNlhGrcCXKklw+Fh8o5azF?=
 =?us-ascii?Q?JKtikku4Oxn0s8qoBu5/0xOMw8a/IVRlJihFz5Jth/RtPOMnHCocy+NBhtMl?=
 =?us-ascii?Q?lgXvYFQcIHgg7WhM5mTGO37jhY9upXfOzYBL568G4tW6QCa6IYuyLfQYyVsm?=
 =?us-ascii?Q?+o8HcpVHzJHysGL6m3Ofcv5J1klZVfE2ugUV3ammNZP6/ouF3/3RRvhezKlJ?=
 =?us-ascii?Q?DWKgxs9vCKJqd78ZUMXCCZyvZL3lMNgloTRRVvK4sD6/Z3+KorbBoAm2fDg+?=
 =?us-ascii?Q?SNeqMkP4POH5p2u0yPisqsZS7xSxQ4apmicoWeKJBTCISfhLnq8ZDGQIgtFY?=
 =?us-ascii?Q?mwVkauYNNKye9aMDMrJLksyyorlct9lQMasySM8OrxVAZLsr9MEMfCuITj3k?=
 =?us-ascii?Q?NI+uZcDqqNxow6SM0MOVa1r0AL+y/y6ycByMnRl020dCdMQ9tnwDaj/upPsd?=
 =?us-ascii?Q?+HTeXNpDKY2nG3rYlA/XKSTkwQ2TEJZRmZ2D3dA/tKXpgnnstqaClI5oNnl8?=
 =?us-ascii?Q?8mK6jSS4toVpKsDUGwjHBEeeTmEFWGPX6POs8TZb2FFoOIcZ7xtE7goqHIqF?=
 =?us-ascii?Q?vVRLj/WaiQSLU3fr4cB8Dv2IZ6M93A5EsY77hZ78vnP74paQUWIdnHl9uETD?=
 =?us-ascii?Q?+Fc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c7f56e-e186-4312-71c3-08dd6c59bb68
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 11:31:21.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3463

On Tue, 25 Feb 2025, Manuel Fombuena wrote:

> No other LED driver is listed on index.rst with the extension .rst.
> Remove it.
> 
> Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  Documentation/leds/index.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index 0ab0a2128a11..76fae171039c 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -28,5 +28,5 @@ LEDs
>     leds-mlxcpld
>     leds-mt6370-rgb
>     leds-sc27xx
> -   leds-st1202.rst
> +   leds-st1202
>     leds-qcom-lpg
> -- 
> 2.48.1
> 
> 

Now that 6.14 is out, should I re-send this for 'for-leds-next' or there 
is no need?

--
Manuel Fombuena

