Return-Path: <linux-leds+bounces-6473-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7CCE55D0
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F01A8300C5C5
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 18:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDE9239E76;
	Sun, 28 Dec 2025 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="YaaVfMqi"
X-Original-To: linux-leds@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012011.outbound.protection.outlook.com [52.103.14.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142D1E5B7A;
	Sun, 28 Dec 2025 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766947401; cv=fail; b=m48wSt4umZVPLxLtKt30gUao1KEEa2Qi0Bs94a3X29bZqFiiB1mVYAGPkRy3qY4DHcycsa8ClQE+4QXrpRtiwp8dShfB3qm9O0amqoH2ff59+8b3Ywij/vaHxoX6DDf9BTmCxOhPheK2ER/3aHuk6166dr3w1f9p9sMy4Bl4pQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766947401; c=relaxed/simple;
	bh=3p+Aq8DbcMnsC7lkVJVvEfj7CKtPzvBF30oUF8Gqsz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j4dprxsOwhEuf63/5TmQOfLopPIw/m4gcKM+Ceaigl3GpthLrIgZUPS9RdOSpvLXiaXfxaXl6vWSg3K4oPZglvpw0aAGtSOdQ98rPD3beUuu3Dvk2xY6Mi8yhE6Yaj7wMO3Ea8Ue+OzlrK+QsAgQdtM8jmPOFSB6YKbAYwvzTpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=YaaVfMqi; arc=fail smtp.client-ip=52.103.14.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz32fgntwk+EtaXpVGKRGAMKFYFcE9Ailoe1Ug8z2Gm8yl7bsQBhZYto0ZcjsiCjm/UmVkB/xhcP5Cod2QVrq6VPcqam22sMYGqkhldsQtPyzSx/vNuK1c8gV35xyZBOBkfln8GichYiFy+nubEECF+yoMzyq+paDOVBQMva2ux/oB3x0GkZElgGUZoTP9zshnu0rYqTvAhZNjhDsRl+7ZrmHDgL3lk8K1+kP3JCFVUaM9Z2VV3U9jMBXrdk9EC4p4p/mqZYFnoOfmWuHPVPqNts42n+uKFzrPMc4agGSPjRT05TcnKf2EIuzBdaJJP8GNs2lfDCfFpXi5bKlgpl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJYabXi96FWKjfZU4wZAdZvOKkwl6aK8nIt5YQ9DPN0=;
 b=lLU2ysyljtgoH7CMuRKdPyO1STAbRVOOiDG6QYAbIq93YULe0D2eDZkrk4R2ei+UEOZV5XeXA2cP30eAce/VhVvL3odlI6mAaplPq3mAqzt+IHeC95GOGhVTprPpvhX2lIDbFHYrA+lRHLtq7nbKnVhG++UUgKeBWEr5LRVuiGQbV9VD0kVTFGJ+pA6I+3HMPTOO0EizsfM+q+3KspubTanyTuAaY6xPoE4cWeqUYASRTfJ/lZFGnpL34EYswsxl8hRPkxCBfBltz6MB01jh5EWNbEjbVyjmyiWFTgjjSiHAHX13aJWNsIpWoeFbN8KiKgqTVfAS3kFuDcYMF6cRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJYabXi96FWKjfZU4wZAdZvOKkwl6aK8nIt5YQ9DPN0=;
 b=YaaVfMqiwkRnLJ/bgI0y6fPGfhP9SsVcXcxgwhmWZDfu1ujwI5HdIPHsCPMxuaijEJJbpJnOcuKxBrub1LbHZ628ecCZcv4ULk+taMhO+lOgAviqnyV/jPMMtq6W4vAWuf6pli56sAT6cvttOAJbrZwyj0N+gGKK98xjhsdBmopwI+Q+FRmR3si8iph5I3L+KBUkdXxcDeH3VNbmmawoG+337racNt/xLf+/iPlym+3Oci3cagxZI8wPZsx8OHqFNUz+2SIm9bfTWW0kqb5Qdum9gGrznXd1Y4RtHP6go4kgulL6W0+fgR/wCgfibijCflOAkw3M4rrOzNJ8JpxoHQ==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by DM3PR84MB3466.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:0:42::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 18:43:18 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%5]) with mapi id 15.20.9456.008; Sun, 28 Dec 2025
 18:43:18 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Andriy Shevencho <andriy.shevchenko@linux.intel.com>, Jonathan Brophy
	<professorjonny98@gmail.com>
CC: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [RFC PATCH 1/2] leds: core: Add support for led-instance property
Thread-Topic: [RFC PATCH 1/2] leds: core: Add support for led-instance
 property
Thread-Index: AQHceCcRGnaci/wh70C4zVgu4v8SB7U3YUKAgAABL9g=
Date: Sun, 28 Dec 2025 18:43:18 +0000
Message-ID:
 <DS0PR84MB374654D9715FE2FAAC4C299D9FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <20251228182252.1550173-2-professorjonny98@gmail.com>
 <aVF4g_W2KHQ53gbJ@smile.fi.intel.com>
In-Reply-To: <aVF4g_W2KHQ53gbJ@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|DM3PR84MB3466:EE_
x-ms-office365-filtering-correlation-id: 5d4023bc-1908-4d88-9112-08de4640f7bf
x-microsoft-antispam:
 BCL:0;ARA:14566002|41001999006|15030799006|15080799012|8062599012|8060799015|19110799012|51005399006|31061999003|461199028|3412199025|440099028|40105399003|102099032|12091999003;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?Y2w5dG84OVNoVEVHOVBXQ1BEeitWcVgya0xUWUZIRlFpRFVBek5WV3Np?=
 =?iso-2022-jp?B?d2RqTCtMRzRBR0Z1M01oNDZUNm5qOGpxVlF3M2Z1NStGY2hzTkJCQTlK?=
 =?iso-2022-jp?B?RUo4cnJjYWQ0Y1V0RCsrRTIyOG1NZ1RUcElMeEZ0NWVqd05lR2VYMEow?=
 =?iso-2022-jp?B?WEkrUGZSYzVHczVtUVVUOWRoOTBPazZML1hCTlhXY0hsdzlSUStmY1hQ?=
 =?iso-2022-jp?B?UEZyZ2lGSWM0REdOc1NWNk1EMEowS2R1V1BIeEFESGNJeFFvQll6WHNx?=
 =?iso-2022-jp?B?M1phVW5xdXhxMjk4TGpKU05CMXJncTQ2Tlcva0JzckZzMDk3MklUNzEv?=
 =?iso-2022-jp?B?QldFN1FrQlhzbVR3UGZ2bUtJRHA4OWs0NnowRmpxNkZJOXNFek5XNStN?=
 =?iso-2022-jp?B?TlFXbjh4NU9nS2o2VTN3Qjk5VzduWEoxZU5Tam9rZ29GYVA4aXIrelVV?=
 =?iso-2022-jp?B?U0x6TFpQZk9iRWlXL0ZZdE1md1YyNlFrTFBxNDVoSmNxdXhtbmxBbzhn?=
 =?iso-2022-jp?B?b2ZrVmJURmlGMFJNU2J5enc5bm1xWXpxRW9jNi9HZnJjSjZiUit6ZHpD?=
 =?iso-2022-jp?B?UVFKT3QrTmFETTY3YmFQYnVxd2pUa2E0OGRJRjB0RXFYdUM1QlIrdFlD?=
 =?iso-2022-jp?B?Vi9zTXNZVnlvOWk1U1BlajFqYlFJUVhYSG94TC9IZVMvQXN3ZWVEUXEy?=
 =?iso-2022-jp?B?a3pUMTZ5d1craWZDWlB2Nk5WT3RPaHBrQXp6cWE1Qk1hOXRLdXZ0ekFD?=
 =?iso-2022-jp?B?ZGFoZFpnZGQyRk5LaGk2TFRRUnBjalFQcXBvSVhuaFdQV2NNbVArREtK?=
 =?iso-2022-jp?B?a3ZYRzVxS0k5MDZ3TXVabDRseW83WGNtL08zSkNqcXVRdU5WRURZaFdL?=
 =?iso-2022-jp?B?OVlOTVZxaWFieS9JK2Q4Z3pUbjdBNHN0QnhWNGpiWkRxeVFoZCtsVzJ2?=
 =?iso-2022-jp?B?eDF5dVNvdGd4eVpzWlRWTkEzcWgrbUtaMi9HKzJuRU5Uc05SWHVSZXE5?=
 =?iso-2022-jp?B?UWQ4RkFiU2tEa2FWZ0pIVHdkYjc3USswS1NTanZwT0FsVnpwV05Tc2Vr?=
 =?iso-2022-jp?B?SGhWU2FRcis0SjRIemFkdDFON1R0R0J5L0kvaWZmekxobWtRMlF4bmVO?=
 =?iso-2022-jp?B?WXUwSFBkaGJaTEdmTXlsVzhudXlISkhPeXdwOUIzbC8wZ2J4SDRwK0Ur?=
 =?iso-2022-jp?B?U2ErcElYZ1UzM0ZSYUFaWndBVFl6cWdrc05MWUFMNGF5SDlDU0hmQlUz?=
 =?iso-2022-jp?B?Ly83LzB4M3ZsR3RNczExVUQzaDFhYnBuM1Q3ZjlSRmFsNVpvekdaMUJy?=
 =?iso-2022-jp?B?ZnB1eXNFV1BnYWdsd1poOEZ6QjUrRkQyZWI4U1ZyM0FCYVNzRTVxSnFI?=
 =?iso-2022-jp?B?aHI0WDRMVjdNQ0pIbjlNZ2pwSjlXa3p2ZmxGRWp5S0k2MmsvUzBKK2JY?=
 =?iso-2022-jp?B?OXFJY29UTzZPc0hGNXRTWDM4dFlZNDZDZ2dsVndMVkxEQ1RPQVpTdUxk?=
 =?iso-2022-jp?B?ckx4NVE5MGtDT0FaYWROcGNEcng2QWNNNGFxQWgyR1F4ZUNxWGJ4Vk5h?=
 =?iso-2022-jp?B?ZjIzU3pSU3JQRGZHMGl2VVo1akhXbHZGZEpmWW1FckdVT2syY3lTYUh4?=
 =?iso-2022-jp?B?VzdMd2YrZzM1aE1WNFljY1lSaU42clpFT21Ua0NSTVlJN1ExWUtmN2M5?=
 =?iso-2022-jp?B?dWcyVEhaVFoybXZJNWl0V0JITyttWUxEYWo0WU9OV3FaWXJDUTVOSlph?=
 =?iso-2022-jp?B?RzdxaXplU2hQSnF3c2p3ak9rTW1DSkpTdjd2TGVLUXo5bGVla2cxS2Mv?=
 =?iso-2022-jp?B?RDNONm5pUmZZWGRzc05GS3NWMFVNZFFFSUw2QUhTcGRSeFM0dDNaeGNR?=
 =?iso-2022-jp?B?PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?MFBzMUR3SHNBRFREWXE2ZlNpVkhCRy9LZi85YjB5L2JDRjlqTEhaby9m?=
 =?iso-2022-jp?B?aGtCYUYwRG0wSjZNcmhpY3QzTWxIT1hML2ZQWi9UQ3ZuTFhyeW45T2Zo?=
 =?iso-2022-jp?B?UzI5NStBbDByM3VpTlEvQjcwZkZNblpnUGdKQ1o5bGdzVVlaQ3JGbWFl?=
 =?iso-2022-jp?B?akpYWGNRMTQwMmZCc1EzYTBYZlFqTVhiRzhQcXA2ZmhkRXgybVNLQWpu?=
 =?iso-2022-jp?B?NG9ncWlPODRDMWxpemxReFZLbmducmJqMW5EeGRYdE9QRUdQUzVvSGtU?=
 =?iso-2022-jp?B?cFZZbWdyNVJRNThtOXNJTDhUamdxajYvZmUxUmladU0zaGEvZXRYWEV0?=
 =?iso-2022-jp?B?U0k5TUI0MjV4akN5ZnBNckZydEsrTFhUQnEwSk9MOTI5OXQwOStaYUc0?=
 =?iso-2022-jp?B?VWdlQU9LTEkzWlJGY3VoTzdmY1hURWt5S1hTcDU3ZUYrZnJDNnJrWTZE?=
 =?iso-2022-jp?B?RjZURSttd3pVK1Q1TlNUU1h4Vk9lUVg3cVdYNnhBbENPNFV6dWI2bXVq?=
 =?iso-2022-jp?B?RmxGN3dsRXJqMnJDcVF2WTJmbG5ERDdLS3AzZ0FVV3Q1ZW1BV3Q5TkF3?=
 =?iso-2022-jp?B?S2JDMEt5TXl4SzJZTmVnaEJHcXd1cHVBbjYyWlRFR0RQaUVtOFVyNC9Y?=
 =?iso-2022-jp?B?eElYMkh1MWpMdnZmSGhGZmFhRks2RFhQaHdnS1gycmRlWWFhdStJZXR3?=
 =?iso-2022-jp?B?OHlza24yLzBnMDFVdlhHYlBjUWMydVZCZEV4eU5yZmdqMy9yeVlBWTZ0?=
 =?iso-2022-jp?B?enZWM2laNmVxcExIRHlhV3N3YTBUazBlK0haSnZQbSs3QjN1WTUyZ0Vp?=
 =?iso-2022-jp?B?SWMrckJzQjgvUHlLR3cvaExhWnJtSWljbUNnR1k5dis1cmZyV0pNNFFs?=
 =?iso-2022-jp?B?bSthdVZ1VE9zd3NxSFhSSHFHVTNVcm5hU0pVazdqTW1jUzNKSDR0Sjcr?=
 =?iso-2022-jp?B?UDdzREFJei9PNGJ6aHk0MXYxbzVPTVBKSEtpL0hydDBIRkdDdEZrcWIz?=
 =?iso-2022-jp?B?eVZ6bU1UYzNJaXhxd29GMjIvWWRwUFNNenN2cE9kN3pZNFVZZExSZDFa?=
 =?iso-2022-jp?B?T3VlQVB2U0M4ZmRJL0tIYWtHQWgzNjRFdnF1WTdJWWg4OVU5YjVWRHgw?=
 =?iso-2022-jp?B?YzBSK0d4MjlKWXFHREc2NW1GR0xoMmovVmxscW9EQWVFWXM1MURtN24r?=
 =?iso-2022-jp?B?ZDcyZ2V0MWEvN0dLVXozTXpkcVU2Zm5wQUNhWlFWTC9mS1c2WDhldEJU?=
 =?iso-2022-jp?B?VExLTVVCbWxIdXhoNHowY0EzQzJEamdoVTIzdzVFb2pVQ3BzV2pRK25H?=
 =?iso-2022-jp?B?Z01ZZE9PVXFSNDd5UFlocW9jQVlMV21ERjdBaFlNYXNsZld6bEN4OXA2?=
 =?iso-2022-jp?B?SlhvSWh0TkZBd01zQmxLVjh6QlVUU3ZFOU03SGtWckt1QUp5Q0JYZTQ4?=
 =?iso-2022-jp?B?MHREaWUrbXhwYlptR0VGcC82UDRpeFArd1JEQWpQS2wvWFJVamxHYzh5?=
 =?iso-2022-jp?B?N0QyQWU5WnNGQ09qd3BCQ2UzTU9qaUUrRFBSZ3E1S3BFcmdGT010OGRh?=
 =?iso-2022-jp?B?bmtjbWdyMjVwWnR6dlViVnowV0xrRE9vcFd2THltM0JuV1lGWHhkVVZm?=
 =?iso-2022-jp?B?TE81RnZqTDVldUNTSDJoZGFMQ1Z5a0drTnRyODE0WlRSVzRsMnhBMTJI?=
 =?iso-2022-jp?B?OGF2S2trdm51aEo1eU5YSmJidHRlN0liNnREU0xTR1F5UWxiSnEvd2FG?=
 =?iso-2022-jp?B?NThRemZQQXFWSDdQTnlmS0hmMHlRVlZGMnUvRHZLT2lteUZxcEJVdytS?=
 =?iso-2022-jp?B?SGxZZERuUWg5bUVaZHlWSWlka05tN01EZ1hxeUVnK3FPSitXdFFrTTZ1?=
 =?iso-2022-jp?B?OXk1T3U3NFJJV2hrM2dZNi9ORFd3b2ZJWVJVY01jR3JJWHJsUXF5bTl5?=
 =?iso-2022-jp?B?c2FnSWlGdEtrbjViS2F1TWpaRWV5aEhVMHJJdEJvWGwrbzBZMmEza0ZJ?=
 =?iso-2022-jp?B?VXdKcGlrYlk2UlBDaXI3ejZCWVVYVQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a21eb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4023bc-1908-4d88-9112-08de4640f7bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2025 18:43:18.1094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR84MB3466

>But this will be called unconditionally even if the=0A=
=0A=
>function/function-enumerator is present. Wouldn't these be conflicting opt=
ions?=0A=
>=0A=
>--=0A=
>=0A=
>With Best Regards,=0A=
>=0A=
>Andy Shevchenko=0A=
=0A=
Good point! You're right that function-enumerator and led-instance could=0A=
conflict. I'll make them mutually exclusive.=0A=
=0A=
The semantic difference is:=0A=
- function-enumerator: Numeric instances (0, 1, 2...) =1B$B"*=1B(B "lan:gre=
en-5"=0A=
- led-instance: Semantic instances ("port23") =1B$B"*=1B(B "lan:green:port2=
3"=0A=
=0A=
Having both would create "lan:green-5:port23" which is confusing.=0A=
=0A=
I can add validation to reject DT nodes that specify both:=0A=
=0A=
  if (props->func_enum_present && instance) {=0A=
      dev_err(dev, "'led-instance' and 'function-enumerator' are mutually e=
xclusive\n");=0A=
      return -EINVAL;=0A=
  }=0A=
=0A=
And document this in the DT binding:=0A=
=0A=
  "This property cannot be used together with function-enumerator.=0A=
   Use function-enumerator for numeric instances (0, 1, 2) or=0A=
   led-instance for semantic instances (port0, battery, usb)."=0A=
=0A=
would this be ok ?=0A=
=0A=
=0A=
=0A=
=0A=

