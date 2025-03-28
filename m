Return-Path: <linux-leds+bounces-4374-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265EAA74903
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 12:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFFA817D04E
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 11:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0B12153CC;
	Fri, 28 Mar 2025 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SLoq5BCp"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012062.outbound.protection.outlook.com [52.103.37.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B01DE2C3;
	Fri, 28 Mar 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160401; cv=fail; b=eWkFYt9zLHmFrLySvYiSnB0JQ5qu462H9ecl+PVIYFyQbTfXJuSPg6/1Nwio0sVYFf5o5c3WnBdv0QmI5JDiAOXOSFpxem5oFjzp2rs5pjrPHUMNuMxqt/LWFNl9TGj3JcYSNrZetBkTnIQjrT8Im9EFxbCvF1LFpSJB+9ueaX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160401; c=relaxed/simple;
	bh=XMx1a9RmVkr7/Rb6Agozt97ks1vo5nrXwIBZ2pRUG2k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=m2MchFQY4oJBDwdbO7b83L8EIoA5n3v2K53jGL+QXfUaOurbH/PiLNePX4yHERVWBifGnxJwfCvrNv8AMW6EFMV4lzQWBlcB+JqKjicFnSX+1yBkGEAUuYGFJe3wxX3B0vOomS7U071KbKwKmilj9EyfkanavkQT7oyyvxu9Og4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=SLoq5BCp; arc=fail smtp.client-ip=52.103.37.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFaTa9XESS6WhJt4SjGWAsfis2AnQb3QOldH/jbuJMakIyBNPBNmPmkyf0eEiJr4rijWICeZewHkyCP2AGIeH5XSoKWJPFjVozW5go8ArFpWeoulayx9rfM/gHzw+4FGMre3hOyhFXMV/nrkhuB+x5uakA6uFBsrDhpr3bs8YO+rViUkYfD+Ym0ZGUnzWAfvuciM/mQzB9rkz8PBSw+c5n92lVYS4F1I2sjGrndhZgohWNyMzbqFUkgl9z3oRm5y5BFMctBVmKx7dMxi5GSTpXy0IXJpYKiwqr1BQaI9OWe7dvR46Ddo5gPSCPDRGJ6rh6TwvUIcF8lSNid6nDS2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KH/TSwMLJvSpNXZ/cfEp9i4qUBEnFTvgFA+1e3DrGU=;
 b=a3QRuYwVFvTFuqLJXdWKT+xQmNwivZckHvJC2nTnMEKYnjH1OzNXyzwKfcctkyKYuKqUVmmbMRAH1PTzYJGdvf7F1CkB6VB3+DmUtFLc6HqC/BZ/1kfqwgVHNLOVqCIpGSVfXXaNOsfdqXato5TOwKSsnYNgOatL4Wj26As/e9xrGuubHeipfp29RjcPQLjpQRz6ctxgzaY6TEgFBx8plXhXAmCBJWuAhXFfg/pQY/0pnOaJlSgp6IqASgb5S3WLTZMqR5I4pf89M9QSdJ4qT2DOVw/m0qziuY/u5jKLI8tE408GCw7bXRaaPCdLy02W8a5nk9xNVSSBUSBfxsQj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KH/TSwMLJvSpNXZ/cfEp9i4qUBEnFTvgFA+1e3DrGU=;
 b=SLoq5BCpNAYSG4cXVf4ZjDycEdoOKhSB/iewlqKElmTHlWvf6oL0KRmu2bv2cvXWZNhpfgLviM7qLJwYJPbUsxFM8SxzkzsBngcPNLsd9zcHieiWsTRyAw6lmC3IgaolQJ5qvGzakETDCRHPj5GrF7P7fQPccn/Ty5s6IT3PHcLxalBZOQE7QfMLLRwyIjYr6dAT9juaRLQpwdClR65qbfGfv7o4fAnYL0TAIgXtlHzC6egMF/oiAMk2f+tgD4ybLF6F4j7116USS46hw0pydDdc35/oamMiUG9VXOlzLaYky5Nz4uH7i87iTGvCJTXkxNe+1paW9JKPYgOoJBE/fg==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO7P123MB7483.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:413::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 28 Mar
 2025 11:13:17 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8534.044; Fri, 28 Mar 2025
 11:13:16 +0000
Date: Fri, 28 Mar 2025 11:13:10 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@ucw.cz, corbet@lwn.net, vicentiu.galanopulo@remote-tech.co.uk, 
    linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: leds: remove .rst extension for
 leds-st1202 on index
In-Reply-To: <20250328082030.GB585744@google.com>
Message-ID:
 <CWLP123MB547340D3A31A4F41977584CCC5A02@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB54738759F49D377A9F080AA0C5A62@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250328082030.GB585744@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0588.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::18) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <638db531-9fd4-35a2-f65a-4f1e73316870@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO7P123MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a92ce77-e546-4d47-9fb9-08dd6de98991
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|19110799003|5072599009|8060799006|7092599003|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LSzdjztP++CteY69z72K1Kr5v31aX7j2wZt8RzwsjQ6weZ3wQlneAw/WbSY8?=
 =?us-ascii?Q?681PRepJ98/XgcLpBPD/Puu2JZug6tFIQYOv5JVmGvl4/GMkhb+zBArqI2dS?=
 =?us-ascii?Q?8+W+cuTks//ewD2Ew9Q8JoFOQwqSXWgUOTZFXRfCtgbCwnQJLd4UqyEG2Mk1?=
 =?us-ascii?Q?VMd8wJu2HpzZCA2/YXWCy6S668+/DlMCROIMF/Tc+g8In2s8fjJybqAIVFJF?=
 =?us-ascii?Q?0A2W4Bim0x+Lg0TnB5kA1qESJpzReCQGv+haEMeE/vkUyiehiWDvchT6/SSL?=
 =?us-ascii?Q?6YiiiV69fyyz+V1GqbnvhzkxkzI4+0PHQ4vbJSsMtLAStL3FX0TbxW0s3JiJ?=
 =?us-ascii?Q?tWlcznZ4j6S+KeQKglD2nHwDK5USWRIas41+pon28Rh4QWXfg+eHFmlWLtLS?=
 =?us-ascii?Q?+zXIg6hMS/rAPrN9HiqYX32v2jhe/oI72q3vrnyzvz/Gr89AFpizxmGH4zW+?=
 =?us-ascii?Q?rLwuh3s1yTOAer4j2N4BHJiKd60U1UMAnkWEnpARvLmfSIg3bAoXOorqz/rs?=
 =?us-ascii?Q?7tTAXkxYRfaNN7yznjLcBrJ5Ex58KV7DDA6ZO+bHvKaWt/UwX/4h0zv1mCB/?=
 =?us-ascii?Q?/q42ELAl1g5i3w+Nz2ilm5Y+594BzUO/hJC/4s9e+W0WI9iov984lodFq+MG?=
 =?us-ascii?Q?vYojDXPlUGJgqOhza09aY9brEgzCgqNlZDCyk0La4djiOqkEMncLVlsxck3j?=
 =?us-ascii?Q?uIx/Sh5rz9GRvXoQv2GXSqj4dstD01/VpOoDIxv7IEpFxb7837pP3xj0yiCh?=
 =?us-ascii?Q?x635WZOa8aJrZf5PMTBTgIBqXvddu+bJbNgqB7w0z0v5du/DfxoV5h2AwmLC?=
 =?us-ascii?Q?XgC28qtjVQ2TBg+Mf1RErV3gYa3yXTFZg/OHgUnXp8TFPluxt+M9ANwslUqz?=
 =?us-ascii?Q?EmuXC9STVUPe0ge9dC05Ze8O846fp6G3XWezY9UAkWbk1i8wioNjCbphM1hd?=
 =?us-ascii?Q?SaviUn9l/nRGkEBU2sTAf5sI9yA+2Bai0n0jBJOGatVlgQdsq0kBlENi4SSQ?=
 =?us-ascii?Q?DZrLItEzMWj8eqZb2C3NbtHulwMPYX5Bxldop1kjGZfKv4SSz0qUcDCjBNji?=
 =?us-ascii?Q?dAwEz0ijO4EY4qDgiJwy92a2OoVc5QtwLTk1iZFQmV+RPtvjaJNkH6qUVeRW?=
 =?us-ascii?Q?2YxxYhKpwgbRjj7JCOVmM/tKtSmGWpKqoA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rDefZZrps9tV9QC89MgWHDnJ/05M9TCHfNrQU+XPuGGvoAV0zzJrCE1ubsKy?=
 =?us-ascii?Q?YCesiomEh+ZL9vL5PX8K5n9dNBikGFjjfKqsdED/00QUHTjaSX+TSo4qzPBK?=
 =?us-ascii?Q?K6gHb/YAZGktPS3JXcp2f1CewlnqO6wGNZSzVxVUR7ql1TvEW1U4INNe6N5E?=
 =?us-ascii?Q?V/Hpzc++RRLwtnZdEkpxe95872OAq7IVOKInHVwoof7JRP0nyAIweoDg8XxV?=
 =?us-ascii?Q?vj4g+PTp7DSvqJ1Vlf+Cj1TGiyKjROZvqQQx5JgiM/xkagIEl2w8inyH6D/n?=
 =?us-ascii?Q?zxx9qpEfmrEN4DFAyl+ztnOYl3cry2ER7MD9+0xwRd0iK9tYItvrbszSaZ6Z?=
 =?us-ascii?Q?3z//2/tyujCiGZPUqsjNHYHpkkH1iKbgOFMsmmFgUCgQWMbvOltaEHaH795Q?=
 =?us-ascii?Q?UZYR+3dUgdC3f88IVU7w27W+3f4PaJT401/xZAA+vwkds3i1HvwJWac763Q+?=
 =?us-ascii?Q?+pSMxLHjILr2Yd43PWPPn625jx87OfMe5SInVkcQRcZDii9RRfHMkRECqray?=
 =?us-ascii?Q?VPRonRyXvAvenl2SvuNWhMU1gOs8XIU97X8E/TdP/mqbeRzwy2BLxK3x3kRQ?=
 =?us-ascii?Q?Wp8GBjU3yW0C6HVZ0L5wqIBQ3vqlVdNnH/Gdq8c0MvzOiXGMlkxHL/dTtgjY?=
 =?us-ascii?Q?T31jNnpKI7SbyAtF3HHiCanEKydlk58kSyY0rJJMW0GNyenTz4sBMD3hMZV/?=
 =?us-ascii?Q?XXhxID8fjOveLpPqL4aYti6joVjdwUkhLnnevF0uwx+Dr4TQEC9duht8jT9u?=
 =?us-ascii?Q?m6XeVXs8f+/Oh43QYJVioWGy1T+KBNW6tS+zZBE7F8951dEOvUqlpJKxvbIg?=
 =?us-ascii?Q?+7uTlUVRdu9pKRLKg7wrdWcqK5/FYBlkEIglWBWnt55GpLjv0mKOIcStPX8T?=
 =?us-ascii?Q?YS4Pce3ej82YYcqFrO3yvKJbhILJ0mL1YHEDA1OuGygOb1CJGuJy7dOmg6tC?=
 =?us-ascii?Q?QkHPetXldeayqZrkuVtSoOcs8b2NustgGXt6SDzAJawvAkmqySNZ0vTd4V3W?=
 =?us-ascii?Q?H7/VFPsgYf7tHNMAvzhnDEJjQZrdqSCFjgx7UXtXLXkesFmHzgOUrlwGiByD?=
 =?us-ascii?Q?+ChYTj5WJo26AieOUl1u2MXwwf+UjY9MVZZuLVOm+/iHHDNcxn9uqvhyCgQv?=
 =?us-ascii?Q?uPkhiL3jTbkdBUXawT4n/OkMWwp4NuwlYorjsUYOGEO33ThK1F9P0dPGUMO2?=
 =?us-ascii?Q?84aMNG4Ors/KWbzpKKFVFVo6V7dOsN5MjEUr3t/AIKEPRGDVNKJxGiNuCvzc?=
 =?us-ascii?Q?6AdfBOIp/sxzxyOvObufcgM95uMZnPXTF2uhCrhlChTxMSnnfBm8VNiGqDjQ?=
 =?us-ascii?Q?Fd0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a92ce77-e546-4d47-9fb9-08dd6de98991
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 11:13:16.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P123MB7483

On Fri, 28 Mar 2025, Lee Jones wrote:
> 
> If this is still relevant and still applies cleanly, I'll take it from here.
> 

Thanks. As of now, it still applies cleanly and it is still the only 
driver in the list that includes .rst.

--
Manuel Fombuena

