Return-Path: <linux-leds+bounces-6912-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I9ZHovximmwOwAAu9opvQ
	(envelope-from <linux-leds+bounces-6912-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 09:51:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF91118679
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 09:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A640430065CF
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 08:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E31F33DEE3;
	Tue, 10 Feb 2026 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="WEwxIlHv"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021125.outbound.protection.outlook.com [52.101.65.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFF543ABC;
	Tue, 10 Feb 2026 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713480; cv=fail; b=TTXPmAE1vPuz6scLObJ5t5SiR2FnORun4FTFZCQuRkOqcyYmAcl/D5c+Erxl2xt/O60VNBeXANpLc80n0y6lG7zyQslguNdNpWDYrnzf4CpE6pTs6gcxmvsYc+i+OfgDwernivKRzib9jgoY628TFiwGuufzqfczVlYbWzubzOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713480; c=relaxed/simple;
	bh=xxxxMO03VsX6iHfr31I1dQOBS6v8cmv+v6MwhnmdqZw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P0uKlggJVdC18EKK/9DOC5O7qwmM1zuGY+SdoZ1izVtxe2gyrmbmVTK1wbeqrAYRm2vRwcBXWGRlo4T7mrH9lKVBur8z7qOtPU2iU3aTbctJ8w4I+JdsWwnabqMczJ5WopDIHvN3Yq5YUH74h79FR5CCIDkpXEUlVtWpw12AX5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=WEwxIlHv; arc=fail smtp.client-ip=52.101.65.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1P1zaHKZcQ+jc28wU2NhfliY6kciVrc7lBwSnAgoaNp/DxPvAu8JpzaA+rWsd6AdysUe7LFj/UbJwKvn36ZECseP14ed4dlRRJGN9fRUCiIrpyO9CZV5sDlGGW8CQ5BfimQl1zPCgc1G35vZfA4DzpDocA2jNq191PoZYEGoBt+m8aiMusJyuV79MA7l5fvEIZ/2uoELgGxMk9zIQOIEWBBgDZpzLcB8lZ4mPMnj2GeADN5s+cUHbtmV5y9bUmeBGILDMfs13gj9XUp1BJCl9UIc0BhMPVTJ/xcLEskmLfjmtX8VwswSg6pgjgEnhXTGjAQlwHRisbhluNJp9wEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/+Q3B2fBJZj0yDDU65mrnrFWpB5TgVCfI+Nd97/ZC4=;
 b=dVhStiP74lW1OwjPXv7N1Ygqc2IX21EgwZnSHzEbPL4fzgylF1i43/s3U5S1+L4WYH02xmnun+mci791YSZQUDRJoLMHFhS7KwV+A9gsxvN/Qyes8TAj/lJB+Yada9pRRA1sEEghoRIJktR8a3xcUO6OHPoy36L+yeedFG1Omi9x+pZfq7mk+uKEbJl3ZuEoLPAcSQ80m5g2trqHAmjSU/t60vClb7tQG/Ht1rZl9y33W0kF7kKr7Oc/5NxqhAuUHv30PuLjYx+FBU/rOS2sIbCiBr1bpSwSJ4RdLeznJJ1/wUiJqX5++Uz++9i600Efi6hn+WjWyX9XaSoIoIHCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/+Q3B2fBJZj0yDDU65mrnrFWpB5TgVCfI+Nd97/ZC4=;
 b=WEwxIlHv6SIpR3GCjecb35Rnnp5o4h9OMvDatKrLLvM4S8wFbz4yE3kQGEK4UdymQJ4EmD0gwBPWTvYGi8GZZJNWybCH2UHWOtUCniCKS3Oe7HLEk39Z+w9jY8gVz/E4vJ0WSYY9yFL+jrT6/pPLjWTVlHLK/HNRtF6ueoFNw6z7S4h5nzlfJjubERBKuhXFD8X0EXJkHLrx8gbsWbDwMaIeetYPEH0MsbGXop6aFWi+vvo9zJjMaxfx5Z8yUmzlq3SKFuJs/UAOZi+uH9QonAW7GNBqdwtD+8GI6iwxhNWA8bTsXEwcW0QCwaTrdnGl+fXs1O8RRXgsGc45dPhSrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by DU6PR04MB11184.eurprd04.prod.outlook.com (2603:10a6:10:5c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 08:51:14 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9564.016; Tue, 10 Feb 2026
 08:51:14 +0000
Message-ID: <c1186aeb-70c5-4538-badc-f585002abb4d@gocontroll.com>
Date: Tue, 10 Feb 2026 09:51:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: backlight: Add max25014 support
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
 <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
 <20260129160418.GA1100798-robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260129160418.GA1100798-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0061.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::22) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|DU6PR04MB11184:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a79f10-30f3-4e5b-5250-08de68818bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2Y2NGU0Wm1KVWx0RTVhSEF1VUo3TmNrcExZaWpBTERwQmJXZHRESzU1MVpL?=
 =?utf-8?B?d0dBMitQMW1jWmpnN0hmUytKeCtWcjhRSXJMUno5NG03Zk11cmhzZC9JV0Jo?=
 =?utf-8?B?d1J0T2JLUG54VXFDTS95c0pJT2I1Ykd0czBNR1NKb0txWlV6NDNTTm5PSHVN?=
 =?utf-8?B?Qm1UMkJvZThybU9QYTA2K0RrRVhUOWlFUUhHVHFOYUc1dUd4aXlsc3ZnKzht?=
 =?utf-8?B?K1h3QklXNVE3MllmbXBIY0hrN3Ftc1BzR0M3Z1dKYUhwcEFLRlkveFZTMFd1?=
 =?utf-8?B?OXphSWpkY1Z6cldrdUdTWm5qejk3YWh5Vi8wK0ZCdnl3S3kvdHJLUEN1VHdm?=
 =?utf-8?B?RDBhbVhPZ1hIdjJyVm10WGFKMmRKYzRCQVc3NW1qTVZzcWVMRWRkbFFGWjBi?=
 =?utf-8?B?R29IamwzNy9nY3k1dDg3S2xCajdCVXc1Y1owdVErbHh2a29yUlF3VzRXdVdq?=
 =?utf-8?B?SDFWa3JEUnFCdjVyTDlYQXp5anJDencvN3F4bVBWTSszZ05HQzJXWmFpVm9u?=
 =?utf-8?B?cG1YSzJMSjlCR2dncXdKRzVEWHJFdFFjckZMVmpJL0NDMVNPT0YzQVlUZ2Nj?=
 =?utf-8?B?M1puc1lEbG54ZVBlMGVXdk1ZOVNjeTRSREZYdExKVldlTzdaM25ETldHRFc4?=
 =?utf-8?B?UTc1elN3dkEveEFIWU5OVC9uL0JCcGtKQitZQWh4SmRsQm1Uc1FPOGRuL2lO?=
 =?utf-8?B?V0JST3RvQTFTMVRCZDlnT0IrSkFka0VYbkJibUNEbWhpMmF4em54TlhzWnlT?=
 =?utf-8?B?R3dFZEYwWlNXLzYwcHUwZXBxS3g4MGhHcFVRREE3anBaVGZOYmVtQ0o4eE9V?=
 =?utf-8?B?OVlCeGtabVhpTjNQNFVaRjhoMDRWWjI4QlI4N3MwUFFmWW1Yemt6N1JhdmR1?=
 =?utf-8?B?ZWNDQkpLWElqdy9NV1hxcThmOGZ1WlBkOUNCZWNtdDYrTWhad3hmOTlRdWpr?=
 =?utf-8?B?bEZpTGp0OVJ1bkcxLzdDSUtPVTFEVjhtTzM1WHhPT0hFbjNydGIycXEvdEYy?=
 =?utf-8?B?K0ZYZUN1cHZoZnE5Q0FSdFMyM09rTy82clhOVmxXdzhzZEplcU53VE1wRmIz?=
 =?utf-8?B?dUZXakZ6cDVKY1d2T25DbFd2d1hKeWxVVTFSYTNEOUlJVUwwSGhwYmRQcjd1?=
 =?utf-8?B?YUJubE51L2VYVjBCRnBUUmxGSjMxVkJFOTlyNnRLUEkzdUhFNm5MZ3ZydThq?=
 =?utf-8?B?bEJBdTVoT3l2ZDN1Q09wVXU2ZmdXQkw1RmMvcWVQUkowN2ttNlFTcGh2T1o5?=
 =?utf-8?B?dThsbS9yNDVIUEVpQ0k3RzZjTEl1a0VnREVxK2R4T1EzQWpFdE1BOFNRQlZU?=
 =?utf-8?B?by9BcncwbXdIYnNXREsxdEJsaFpTVVpNd1pkY3hDeUhmeTNiR3Vmb3BPWUxp?=
 =?utf-8?B?TG5BYnp4Vm9qbkU0cmROY3ZKVmhpNXU2MzJiN1pTcW1INzlwcjBlQ0NYWUli?=
 =?utf-8?B?a1FjT3dvSjZHSkNMREQ0VzJFMUdFK0JHYlNtUUtqRUtmblBPNmJSRURBeGFG?=
 =?utf-8?B?c1BPTi84dmJkcStRZjEzME0rQnVaV1BrNmpQNm9FYnIvMHQycXB2TzJUNjVK?=
 =?utf-8?B?a1VxRkthMUJXYk8wZlZFaXoyMzlRRVE0aHV3cER1TDNTcUJRRy9MdHlvaUcr?=
 =?utf-8?B?WVBFYjdvdTM1WnpaQkdvQU91eG5wUDVuZERnbmlPekZzMEFxazczMVAwcjFa?=
 =?utf-8?B?bDV5MUlsbUtTSjcwNXMyd0dMeWR0S2FTeEhOUE9EY21POHVpbDRhWStkQ0JD?=
 =?utf-8?B?VmdTdzBRdXlnUER0UUNKVG1KVUhkaWRaNjYzT0RIWm9IRklGOXlTY0JmNElW?=
 =?utf-8?B?dWErNVRMcFVndm9uU2twT2s3Zi9lV1dlMm91L1hQZi9ZcGQ1VHMvWlhSSkJz?=
 =?utf-8?B?RVd0Mk1lNHRHZXVCU3N1MzF3M3ByQUpOd0x1cExRVlhuR0EyVk0vMTVocGdW?=
 =?utf-8?B?Qm1oZHN2QVYwVmc0Z2Y3ZzI4aHd6YVh5bEwrc0M4TVRCbUpsNnp4YXg4Qitk?=
 =?utf-8?B?RGdCRnQvWXk4YWlCbm90V0RQb2lqS25CeGdLd0tpTnRXUHhieDE5SHJGenJD?=
 =?utf-8?B?dXprUEV6bCtZbVEydWl1LzFkcWZkOGU2Y0NqTkNFWVZhMzM0cVVLNGI5NDFY?=
 =?utf-8?Q?d794=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWdjb013b3NZdDhXTUdOZjZsOWtNd2x0K0hoNUVKa3FBT3JzM1JlcVN3S1NV?=
 =?utf-8?B?c2tabng2dXA4d2FWaTgxK2lrZlJjdFVkNFFUdlVERmpWcW9GYUZXSjFhdnZW?=
 =?utf-8?B?WnBzaEg5REZjRDNCYWJoWFBaODlaQk82V0twclk4VGNhK2xuN3VXMmxyclFM?=
 =?utf-8?B?eDU3cGJjc2dwbUVtcm42S3l6TmZHZmNIdFJsM3pMOGd5b1puNmRRU0daWmJl?=
 =?utf-8?B?V3NXWTFaVUdEcHRSaitpalRIelg2V0FPM3NSWThFLzl0dTZiY1BQYmkrV2ZX?=
 =?utf-8?B?QWtCblZxY0paZ0pYZ2k3K3VtV21yN1lPZ2g1WE1SUkRyUnN3R2ZhWFRpNmdk?=
 =?utf-8?B?MzJYdDlEZ08raEd3aUltZ0dLQkJYcElGODBHNWJsV1F0ZEJnbHFlNVBLdGUx?=
 =?utf-8?B?RFBNdnRYK2kvQ2dIVXhVZjNMVlhVM3I1dlBwODFMYzluMkVaL2ZWSzVxZk9M?=
 =?utf-8?B?NEprWjB0bjhqR3FJTUVnT09IVnl0a1hlbGpiaVNqa0ZTMERaNFJ1KzkzVjlK?=
 =?utf-8?B?T3FISFJ1WDJPZnVXekU2RlpwOXJxelJ3blFKVkN5OEhVbms5VGxLNEhld2xh?=
 =?utf-8?B?MldBdHpkVnZ3Y2g0NUxjT2xvZTRKV3A3QW1rOWVSTmFxYkNjWmdhNVEzM3Nm?=
 =?utf-8?B?Y2lLT2NIdHVvWkZaSjZqcVBONWR3V2hDdDFwZXhnV3hqdUFoMlFTWkorSzlt?=
 =?utf-8?B?b09QWVFKU0ZLZDFZcW5pUEpYMXFzOGNXeEhOa0ppeTdEOXJWVmVWQmtILzF3?=
 =?utf-8?B?dUI3eVlZUWVUMTkyUmtYZ3o2NnBNaWRmbE03bXFBWVlFbnhMODFGWGxVUTc3?=
 =?utf-8?B?YWJ1YThFNXY2Rm02a09MYVVsNUxaN2VuUEN0Zllva0ZTTnIwcXN6eXI1eE8v?=
 =?utf-8?B?cklsVjZjR0xFREg4dW9uTGt0NjIzbzB2RVM2R2IwNTdIZUoyMFNZNzhRaXRS?=
 =?utf-8?B?bk1SZWRDSlBLYVgzVHozUGRXcEluZitaYkhiOHVqdHB2alh4YS8zaXExU0Q3?=
 =?utf-8?B?VFV3NEVpYXdQU0IweDM2dDk0bWt6WStqdlYzeldwT0djV3p0bnBkWUd2bUFV?=
 =?utf-8?B?eHVTYmRkc3BWVm9LREJjcTVMa3hONkxXOVJmV0ZQSnJHZHRtOVVtL1NyVzdS?=
 =?utf-8?B?djA3MXREMlJ3Q25WcEtBQnNGVnBzY1Iyc0EwKzNPYmFYSTNic0p6Y2VzblE0?=
 =?utf-8?B?UHNuTW52ZWNjbG1hbHhVMmNueGluNjAwTjQrL21aM0hjZFNKWS8zTGVQSlFH?=
 =?utf-8?B?b2dRaXhPbE4xT1F1NkNHd25Ib2pMTmw0cjg5WnpYWVV3bjg0WWREaWMxZG1m?=
 =?utf-8?B?RzV6RGJISDhoTzlUdWtJNjgyMDltY3kxbFY1SE1BWVdTRlBRRG8rcFFxTzdn?=
 =?utf-8?B?dStFTDhKOC96MXpISWFxaW90a1NMWno4dDVDZlBQM2FQaFk0cjNSZVA5dEtH?=
 =?utf-8?B?dU45ZnFwWm10RnpYczRham8vb1owRmZhT09IdlZkMjkvY3FySXg1WkUrSm1i?=
 =?utf-8?B?M1VaZWdGc09jUlZiRHI1OEs3bXVNS1NHYjRzWU9sRXZ2RXRsd3hDTCtUVURZ?=
 =?utf-8?B?UWJvWjUzd29nZnlJN1ppY0gxRXl1cXIvRXUyWHNMTERQRU04amh2VWVROEhT?=
 =?utf-8?B?YVRPS0hqMUZoQ1ZMSGlHZm5ESElPSi9LTW9WV3RjWE94bno3SjNqbWRDSjZy?=
 =?utf-8?B?TXA5T0s2M1FYZ2Z2QUJyUFNabkk4Q1VFWlVBaDNDQnhoSXNQWThXcWF2RWRN?=
 =?utf-8?B?ZXFFa2pTbmhtWHJIYys0REhEQXFDbGxCQWNycVFtZmcwUzNxWWxsRHVrME5K?=
 =?utf-8?B?Nm9mTjI2WjlyM2x5MnIzTUhVZ3IyWUdaTjlaY3Q0aU94eEFEV2lMOVRMY01N?=
 =?utf-8?B?S3BodFo5b3lMSmRHQUJwQXB5S1F2SkVLOUd3OW5iZ3pOVmtQRUFxSWtEK25N?=
 =?utf-8?B?YjdjTXByNlZCVEFVZ3k2Tjg1Q2tLM1VsNng4WVJ0NmF3eU5VNDdDeW94TmVZ?=
 =?utf-8?B?ZlVBL1RIb0preEdBZWJiVkJndjZIUmx0R1NoYW9NRzJLRVd0d1B3T3dKOGt4?=
 =?utf-8?B?OHArK2RZMnl5VmFUaWZXZHlCZENEMDhTN09iUzFYUDk0Mit2cUtSb1NSNzZR?=
 =?utf-8?B?bEtYN2FaUnNOMEhnWlpGOXVLN3F6b09CVlZrSGpucjhkT293YjZOMWFmbWxm?=
 =?utf-8?B?ZkxoamVBdXpYdHV0K0Z3bWdCbkFJb3JyTzl6RXk2MU1GSGNJOWJGQ0h1SGQw?=
 =?utf-8?B?bWpuM1ppNFZMQk1Kc3E3dEpOekN2aE5SMzJmZ0JkRWd4L0EwVTJhUjYxTUNp?=
 =?utf-8?B?MlpjLzB6OWxrcExqQkZEdVRDT29DTzdyaHB4Um91b3hSUlZaUEtqaWh4eWpv?=
 =?utf-8?Q?YTDxWF6D+5sETIRPaGXCcCSmflJP6TVlhLZOedTzLBb+d?=
X-MS-Exchange-AntiSpam-MessageData-1: nIP1wMKgJ+mMMawCdcTri/eYizugevZP7yY=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a79f10-30f3-4e5b-5250-08de68818bc4
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:51:13.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0B4va2fGKhLKXYfFOhqiluMMxwUcgLu88FyWTE9H9+l73615sYVu0IvU++RaOX7sP0GZBqjOaW6F0v2FyijhsbyaX1Wy1tenygf6nVvGx9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11184
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[gocontrollcom.onmicrosoft.com:s=selector1-gocontrollcom-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gocontroll.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6912-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gocontrollcom.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maudspierings@gocontroll.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gocontroll.com:mid,gocontroll.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DF91118679
X-Rspamd-Action: no action

On 1/29/26 17:04, Rob Herring wrote:
> On Fri, Jan 23, 2026 at 12:31:30PM +0100, Maud Spierings wrote:
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>
>> ---
>>
>> In the current implementation the control registers for channel 1,
>> control all channels. So only one led subnode with led-sources is
>> supported right now. If at some point the driver functionality is
>> expanded the bindings can be easily extended with it.
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 91 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 000000000000..c499e6224a8f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max25014 backlight controller
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
> 
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> 
> No child nodes (with addresses), so these should be dropped. And in the
> example.
> 
> With that,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

And in the actual dtso's too, thanks for spotting this, this passed the 
dts check but indeed is not correct anymore.

kind regards,
Maud


