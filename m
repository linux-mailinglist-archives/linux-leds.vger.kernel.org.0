Return-Path: <linux-leds+bounces-3946-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA2A326D4
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 14:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F114318820EF
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 13:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CC2B665;
	Wed, 12 Feb 2025 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="L/lKogMQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012062.outbound.protection.outlook.com [52.103.37.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28A184F;
	Wed, 12 Feb 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366187; cv=fail; b=l/aOrPu2LizmaaRLQ1mGV4ya1PXWaBStsyIzygVYBIkGTQxjFDaLu3iBfCpB8UYuuk0yG377bVN3K45P+3R8vqFzNwfiS4EYncgIriREuDzFuw+YcmluEwAYrFKu94Tb4BA3F3lOF+w+zsFWQ5x/Qdpo2YgzqrXp8VELDeebTYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366187; c=relaxed/simple;
	bh=XNvZw8cEMIfB9m4VwsL6f9EYnbFApiKqEPF99oqJ8hM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=mu2Yv9sNYpJORgI6ptQcPapkwgxQzSAzlGXp7Oj5wFWVGri8CJHgIYDES8IptfSCOyglJL541ZXy5NlC3geFbvh99NOtoMDQAdfLAzJ3UjPPmam5p+hY7EUTd3JXRrwSYH2SbOlNrx5Uk+6QGQneFfxE24uMIhkTEz4Evj0SUBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=L/lKogMQ; arc=fail smtp.client-ip=52.103.37.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn7RWAoBKlPRqbI2vV2PxRPvs/ATSDz6OuoRadiTetdoz1geOXf0x3wsmBclFIGlza2Z/zsIpsVjWV7OlQCZXoT8NUXRFcOzpjxEoG2yQEM7ErnYtSQruW1JqSp2jJSpMBkn0RRuYEX/YPAX2i0ZgBlVOSMZSMXqX7acyay1Hg0Djw5bmk/EY/YVEfov+KvDtzzSs7GOy+8LsoSqmXKuS2Gy9KpfAi/mqRfUtZo1NQWJU9KuMcVPFzGPbVDakwxrajAmVeEaNfp0DBpqBzxYo55D3EgqYATYVlaQ4zSMaRMO3/FgLILQxI1iMkJ9WDD9QBEBD595ufm0tyJJHUIqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jgyq/T18StDl6jaINM6z/ephlXcKD377GHJm+o4JOx8=;
 b=csqLX+6Q0RWkPbBuu5ciVDyBcEosFBHVYSTm6wCljptzbzKiQaytgy4DBcGSgEgGJ0sm5nlJXi55eB5IHinkIspPQWCWjybgqm4IR2n7VB9ac5RDiAXqyuJeuQKgRoTpvmnp/PlSZiNYZS+MP1vFEdK0o4iktF0jZ8DAcXAf/AIgMlshyz3Gyb2lnls9KT79cCnqs+F8M2vwO763iFv8x8dr6ZjQdkeIymKkbqWuXBqKcKbIDGmPjLZaM7eempltwk1ZU3m6ln4lwcrincXuz0809JggEFoyHdAhtwqkCKYbIJSUKR7r3Eoe5yJZjCd2BqoIVEHoJTgOa0CWcHG0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jgyq/T18StDl6jaINM6z/ephlXcKD377GHJm+o4JOx8=;
 b=L/lKogMQJO+HU5ow7ets/DzLPmm4GO1rfabdf3AyvfyBEGsjJAM3WDG0lRU2RmUjedG3ptx7rJJQAcKbq4NiC+F/n32DCQ31TVgh0cugjwya6ib+y6S8B3AjUwl9sQCnOubL03okiv7WHapbflwOHazwNBm6S93yo4D5HjMsbVxD0ohtAWfvC53WiF1GAyxdEylFDAyPvmla+k05+YDGpxFwnwr4Hn82s9Us5PtxIw4u46OIORndeX4JUKmKGgiz6eDTRbaFPRA6Ew7Up/KIUCcjVmG+TrLd2GIfQibpqhDLWnB9GGbuDdz/xPlr8S3xF/e3bTpOQAhZqY2v1FTZLA==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO6P123MB6806.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:301::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 13:16:23 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 13:16:23 +0000
Date: Wed, 12 Feb 2025 13:16:21 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access
 on race condition
In-Reply-To: <20250211133429.GQ1868108@google.com>
Message-ID:
 <CWLP123MB5473C550C034BE8EF29C2651C5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250211133429.GQ1868108@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <fba0f9cd-fac3-3d99-f995-893f9d718909@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO6P123MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1eb3e8-292e-4da9-35a1-08dd4b677267
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|19110799003|8060799006|7092599003|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M1k5XlI1XHMpt9sTLgQJfNSDcpegHQYKg9CDicMKeHBmiko8R5N0tk+VZW/b?=
 =?us-ascii?Q?w+e52Hf0xf0TZoC03sUqxE2BX3HU0OgFovABXa6aiuGjcAvXuhx3QFXlpVLD?=
 =?us-ascii?Q?w1bKrGXUDfFLjYXFrDKemPkSAKUvkLNs/0U+2V6XC308pZCrM8xCnphqTs0x?=
 =?us-ascii?Q?b8Qrjo/lgNNKfx+Hx+5jvwdvSkjnOnmRLYyWOCQa/B1oC/QJRFp79/pPGB7T?=
 =?us-ascii?Q?bpO6w4h6t1BsTxs8z5zWlcj7QrVbyNS4OMpi8vmsBleWOig9j4nuE8g4XEvS?=
 =?us-ascii?Q?mtbPaKkFXSWCzWeuzVYytNa1k5xef0m+wQ+hOl9WXBVQuT3M8JHy3vIU5wJ9?=
 =?us-ascii?Q?CsvTjF58Se/LpTSIZUVu7Beonc9sJBQMhpmWJgIJQS/Ppyt/xtheYUKIdXgp?=
 =?us-ascii?Q?XVgyLdik5nbSxTr8sqQwHaMrwUu2CMaEbtNS4c8HYK4cvMT/uMukSgRIXaYb?=
 =?us-ascii?Q?DgP/pqlAtjc6PDAuiZ0aYWRsoEos92CqsekY/EJ+QnF0WMeO1lw+t5pdu32p?=
 =?us-ascii?Q?qV3JvtKHqhW6UN0S5wpqTDhNf11qTUk20j5fL+1jyI+a5c2ahrH7i25snwde?=
 =?us-ascii?Q?cWKZiVwf/4BvmnXrLkwPexeT/LURAVBalXLOjBmxl1jFOu+RQ1ZautFSqlAr?=
 =?us-ascii?Q?U6qgnZOTMNTpL+/NrY1yTD/W+T1jVDk6W2ul52yhE6RMVReCr84r4t59Jiqz?=
 =?us-ascii?Q?MduFqbMPfvH73sDai0RkrOJ3eo8OqVtSlnEtEnydyeEgPbBMAUSxuLK1dRKh?=
 =?us-ascii?Q?Pq19Z79mgRUfKNamCFv05e6a9w/k9PkSCp2BEsPCfA/cL+7dSJESIQ64YGJd?=
 =?us-ascii?Q?4AET8SdEdRRXE/T3me9aveilKAgbGSYWYG2i0MRS4VS4Hhe6AKxhZXYwMEfy?=
 =?us-ascii?Q?UhZJGwuX/DXEpgrHfMpJUIMiYGzq/1k7+gHfK5epHGsfEtzB7cIHnbzJNlGK?=
 =?us-ascii?Q?KKyiz7KA3i9dxSni8+kZ2Lch+HDT6nZ0fhNtmckuBqkXG0ftXZbvvgQyKmuc?=
 =?us-ascii?Q?dK1qOVSIUERFCmx8KHwlJZqk2mNkbdl5PJeIAdvSpqeVINHKriy2Kog5Y80A?=
 =?us-ascii?Q?aSY8HFTSRNnKt8H6soMat5+Nc5UHuYo+r2cieG2UNJ2I8hoaLC0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u+O2yxVhJQvwCRVt7ewzWvhK7cVnOza6T1S/z8FbFiXsOmlFWfHpzmbMBhHo?=
 =?us-ascii?Q?E6bi/cewQYFHEuYbPHp4GYd/qU0/NW0+npxRgGKPHE5ZP4Ywx7Tj7j6t93ve?=
 =?us-ascii?Q?HFCMW9Tgr+olSkDEiSl3aSjEXJ35kVj5PcYkCOSNW4hPeePKiwKbQZJmmoIZ?=
 =?us-ascii?Q?WfBVnwrZGkINh16YegeH3hihpqdTvHvtwJiBzpgsOC0btIMf3iqbivpRFNRL?=
 =?us-ascii?Q?hbApbIdn5ZqjIY8mRb5hgN1yJAzmcVSQQTzU0kJ6+4KzZo1K2s7J7Qv0mg0z?=
 =?us-ascii?Q?Pxtw4BqBELxkublHDnGatNNc6gnULwgmRkc4Tkq58g2VXmMTrAovH/a+gh6J?=
 =?us-ascii?Q?BXMjIBk12VqLo/hJkk1Ltk+up2wPXQZ07CaaBgSJ2dKyD8aLsjAyNos8LE7N?=
 =?us-ascii?Q?b4KAzIw193p9ozE1GQroqwnWzMLDvwgfC2LBA3TFgXyMLgn+vKkJuNOPPk7F?=
 =?us-ascii?Q?LYYy39HwexXznkfVCcU1JjqGUeBJszgaalqnMsak2y5wh98USlwzeRQ6jfeo?=
 =?us-ascii?Q?xNUgGyiJUqhIHz0oMDNr60g0kOmZkfUakHBrw+NHW4DNp4TpWqoodcE53oo6?=
 =?us-ascii?Q?mWtfKungNhPxAL9wagiC90R54LGxFmLBf3iU5RKMdkP/cihy/FhhtTsBFlTq?=
 =?us-ascii?Q?j3YfcIc0upTHQe82VvkmqDat1EenJeRp9C7gTEd0h7T9UhiihUlON6LNZHvr?=
 =?us-ascii?Q?5VruqSf4LF6qdxOmySOgXVZjvF9Jj6H40L7syn7LSKBNOS7E/5McBQrm3Vs7?=
 =?us-ascii?Q?PMR9CWeA0GfflhjpDawnqiQerF36lFRJgLzDiIJQibvNZtp1VgSW4xo3539n?=
 =?us-ascii?Q?pI3I1lUSNclyakJMrVNWdggXUSYWLmkfaDhCEvNiZqFweFMUpDEhMCsAnhg8?=
 =?us-ascii?Q?M5U+nvi0nx+L4ACEf4M7FxFA8ENhIh/wkX+SaK1qop9bAc/zARBjhsCNP9s7?=
 =?us-ascii?Q?SvDgbw8DPGUh9Wws2LR1K8Z7ZLOYI9lc+3oNsBh4Gc2c4isXHn/h6qYAQICB?=
 =?us-ascii?Q?Wh/xW4OIfrH9Fjn64TiEYVD6M9cDRjP/KHeTroop0+kyeUiZuYdhChxBZsKD?=
 =?us-ascii?Q?GFVGpcgK50XcsG8iKxRfxVGHMzSk42Epf2I5pBF6/PfOgV9NFxwxqgvDoQUR?=
 =?us-ascii?Q?AHByrgp4nEZuoxKpV8yXEWnOcUx2Q7HceIn7QUVkRwNYd720jxjHOya859Uk?=
 =?us-ascii?Q?tla7YKyepWKNq/381DqCNWlkN+EGXsca9uW1SGE9xu0SHWkTf7ouwlOcVWu3?=
 =?us-ascii?Q?/ElR2HSXzyywFueUvOpmjk1a3ocBSCQaK5hzMEX0G/jBwMHxSUQIubahkZCn?=
 =?us-ascii?Q?lBs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1eb3e8-292e-4da9-35a1-08dd4b677267
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 13:16:23.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6806


On Tue, 11 Feb 2025, Lee Jones wrote:

> On Sat, 01 Feb 2025, Manuel Fombuena wrote:
> 
> > st1202_dt_init() calls devm_led_classdev_register_ext() before the
> > internal data structures are properly setup, so the leds become visible
> 
> Always "LEDs".

Noted, thank you.

--
Manuel Fombuena

