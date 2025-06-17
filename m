Return-Path: <linux-leds+bounces-4814-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7022ADC332
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 09:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0394188D1F3
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 07:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA58E28D8E4;
	Tue, 17 Jun 2025 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="T8kzh5dK"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586C28B3F7;
	Tue, 17 Jun 2025 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145033; cv=fail; b=T6qENAw+LxJZ1E4W9H42DNNq9nDCRInngatTLuxixtc7kBYwH+gwohOqZ296pqHva5IFPAJQefzm5HFCSb6Zb2u4Q3mnNCASY0Q89xBWuy5vfEyU97dp6YkyUg/UBN2AV2DS/s4a1uZRHO3bqoRlM+hHR5amNN2Qu/moU/P6hnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145033; c=relaxed/simple;
	bh=FgP2sCAu4sS71Fig5Qg9GLoWZhkfbpujpD4/oULdKDs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gD7Ze/3eT+3TQaUVdgwbKEegpf3ES5WHw3COs/IjhRhJ0ri6vrnppmTcfky8tgJZaegTEgOHmT9KDueOGqczKTAN9Z5k1vfpgzFbDuJE0dlOX6Jv6UhcwmCVSidLktw1j3sf1odzEReR3fqMnEUjPohz28ofBlFHNmBRWFWWLQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=T8kzh5dK; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQCrqmAJo2SM80QYj8RNtVzbx7eLSmCi1crqzAQPBcApjPZ795esD3tZFYjherKj+PcYuONkRsIfxHYwMCSEpFqYz9hyZCjXnMzjfyk5rqfAQ2A1UbqJ369oxU3mddAdUxi5uB93L/QP96DHiJfDokA7AgFmdRNL/gKgGoy95yD/5+JqBo979PuRHQYRPLWx2lD6zs//c/f8u1tJASk26Kn7ak7gJuf/ETigNAANSSlwSuUtBzXJZjqEWv5/qhQfXH4+yCZccVQMu5VbkGQbjP/c7szWW3wMSRDDq2SpCR0cweP32SOsCqrx3LhS01hvShJcgxjKGSS61rrSOx6msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgrTl9JX0uY5kshoBGQ1vzmeDJIYPMEAtqc1CzsKXMY=;
 b=xfLodDIANXq2KNkKGImYpDvt5txQzpgaOaIw+YxHqP+FzZL1XIfUBGCiFfqgJmbs76miRmwc9y/Z0dEEOhpVgBtaJSRTXupBc3tRiydbT5IULdIeBO8Er7qqkB6nc6v7qHK9kYY+x4G9f/wk9hkF4XuV0Tfgr3JmiBM5T1JjGhlJ34QvhfmWSZeo9xkGr0BJDSWTfF2yW4bbgLybff6guyTR9b0Y0mCXGuhkpMV2WPTtqIpj3ZrSooUKG8RACf1cwPyRzURloDkwHJKVzGKoPdo53L4kNKzmFUsOIGAaN3Qm+X56D2dNKjH7NhHVFrhq4Alm4ThLkh0VumqmbCPIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgrTl9JX0uY5kshoBGQ1vzmeDJIYPMEAtqc1CzsKXMY=;
 b=T8kzh5dKtWmdidnROPsFFj789wL71Uri44V1n6icPGD9fOCKzOzcTVhCVhqfAd/K8TMfz7yJHiu873lcDHBCJiOx1xKqP8Ed2lVLYNZT1R2eOKvaUMC1OETGnmOnr//S5Qgq08ScO66mGaR6PzQiBN5NSooT+foOzN7t3bnUSKU=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by PAXPR02MB7328.eurprd02.prod.outlook.com (2603:10a6:102:1c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 07:23:49 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%4]) with mapi id 15.20.8835.025; Tue, 17 Jun 2025
 07:23:49 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Davis <afd@ti.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kernel
	<Kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: Re: [PATCH v6 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Topic: [PATCH v6 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Index: AQHb3rFidkI/UDwrFEiIPPe9koP59bQGTjQAgACelfc=
Date: Tue, 17 Jun 2025 07:23:48 +0000
Message-ID:
 <PAWPR02MB92819222B0EFBDE604D6798A9B73A@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
 <20250616-led-fix-v6-1-b9df5b63505d@axis.com>
 <eb8c858d-fde8-4916-b36c-f386242b10c4@gmail.com>
In-Reply-To: <eb8c858d-fde8-4916-b36c-f386242b10c4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|PAXPR02MB7328:EE_
x-ms-office365-filtering-correlation-id: 58bfb2e3-04b2-47b6-c679-08ddad6fe752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F23SqX5noBDMGF83DwxxTRxr3NJAWUcYt0AoePo96xmGBbKdytUZi0wFj7?=
 =?iso-8859-1?Q?XBOa+eaqOap/mtVxgh17BO2nQd4bITLibMc3QNr3GKcN8/KEKw3uYaUJae?=
 =?iso-8859-1?Q?eAAENP3ume1+mQCOthSzsg9y+iPOHuTLR+2QPmBn7nCcuk47uysCm5H/NI?=
 =?iso-8859-1?Q?l/DU1sP6I6m57UPjPeUKiLE9O1TKVQ71VBw2CLjVmEFPSJkjZ73IMH5HoA?=
 =?iso-8859-1?Q?WLSAuOs4TilouW8Q3ZU5YUQ0xiqenz5pODHyLFvn1h/4gC/87nD/KqFwhH?=
 =?iso-8859-1?Q?pjoioQc0PUMbL240RkA5ElOaA4t7ANe0DGZrb+t6eU3w3f1PcQcdC0C+7+?=
 =?iso-8859-1?Q?PtLk2Nzw9pzNfcGhc1tulgCw6r+sVjw/l+MCpkt8ww/ogKRdnwTx/6mlUv?=
 =?iso-8859-1?Q?oWMEQaJStF5MbOxypogjGKQ4OQOOmyv2qPIEdtvQUxDtYwJlJYP6aPe2fS?=
 =?iso-8859-1?Q?nj53XC7nQFGv54ceu0c7XYQhVO26tAGMyyRv9Oc62iyUKCphGePQkCUxxc?=
 =?iso-8859-1?Q?bMIfTfhVqaTu+mvguXc84CKcFLmmtDLjQ2RRBE2tL1M36acXimBCaej6Ee?=
 =?iso-8859-1?Q?D4wWMquH0cOtduATSIRQf1iyY7EDrdmLLsOZ/tZHeA7r5PcTZjlfTXXhzL?=
 =?iso-8859-1?Q?FYKXe2fQbxuAdmBPyhxEwOUTzTReeJiCwNWU1yfnb/vjYpKYEABYgkNBr+?=
 =?iso-8859-1?Q?Isb+gfspuyE6ij5ZEaQkktkZIBx/u+btw2A5QL04bHI5cGDgAQEwiWDCzg?=
 =?iso-8859-1?Q?J0YE4G6Avlb2DsFBKDGn03Sufqtmo4+PbBQ32sSrmXEUXSOi0PNyZQSKwa?=
 =?iso-8859-1?Q?28EMHEpqTX6QZ7wAzR7ihuh0R6Og8mAIcLn8O3qeDn+mlhmbPaTEMDgeZ0?=
 =?iso-8859-1?Q?RbYj7UksUSFWf1/s7Elok3hI48QJryNcFcm/Ap1eItxF/Rua+QAbgvKnpY?=
 =?iso-8859-1?Q?nOe1qM1xfxR9yuqPqQQb53DMLwANMZnXfpo7lZSFfyTR7psrSU0c7hi2iX?=
 =?iso-8859-1?Q?INRTadttkdhRbrRJVPhQKQkpGgCoZWM6B5VWVvPLwGaPnsw7zoyxAqGuik?=
 =?iso-8859-1?Q?K+nulSezy+FzTMyfD6/d0M25TUBP7cgB6257cjfkCRD+6IDQKeK/8ie2Np?=
 =?iso-8859-1?Q?Hur8aqNtZpeT4EjE6CyNg9yfPRvNbLR2FCCTXuU/wO3IH2xx95p84gMv7Q?=
 =?iso-8859-1?Q?Y5wf6ZPcUOXX0nfkflp5mBKXYruzAtQlPLbQO/50+SfZD0OkDNy8SQaEdW?=
 =?iso-8859-1?Q?RuVGGvvymBSffxtPAbB1aiQXkg9jUqZMfg3F04x7zp7sljuKLDdGKTwAIu?=
 =?iso-8859-1?Q?gHaQTvRaAsz3VFmS+cUrPA9ti0oFv9fMCQN0LlbQJ4kEqmX3u7DvuyNlzu?=
 =?iso-8859-1?Q?OqlimxVqcFzuPTRnU1uCj61AUopPbEiOOlSizDTnSCqc3O84FEgaWfJJMG?=
 =?iso-8859-1?Q?5HNXZlWRE3vGeJLB79UjSRxvg9gZDEkPkSA7RmNfd7EDgqBjFvIgvGVRVb?=
 =?iso-8859-1?Q?vvl/8Qo/E/K55GspvIfzL9NJortnSW9soWhVZBj4wFLQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR02MB9281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zZkN1rroGP12VSeBxZM8xLHkDbK08SofUHg6YGOHxR/NGVf5jkKttHfLCU?=
 =?iso-8859-1?Q?4MUsdbL93EIc9S4Aff8A6XHv5A+woMfHkKazilOoP7XOw5GJJYs/2IxEHG?=
 =?iso-8859-1?Q?wY06nFwJTbPuY9mHcOeLz6qjeVZZQq7jbTEwji1V+Siqm4AsgFlmnMV0Cq?=
 =?iso-8859-1?Q?GBYNixLGd6/TFWSIHrWMgEwJngtGFoTSRzy962pRCxv2GxNj8p/E7NIZ52?=
 =?iso-8859-1?Q?vBP8JIx5RRdLyyhzVW1Tr/f1brHoRqhKSOyMSLV9A+ctYb7+baybYGiV8z?=
 =?iso-8859-1?Q?APaPgtE5QU4jakVQzeZFTaNb+T7V5NSuvjJ7jri3t7ZwjeNFcnKh5lXkIo?=
 =?iso-8859-1?Q?giQTPJz9nCJrkvgu5dcVL7RQJTL3dxw1iYlNCAQRJjzbBqO3uE5y29zq+k?=
 =?iso-8859-1?Q?kpggxLrWYzBt6q9zzroNcW0KJUncPyB11MI0EwEEZYq1K/QUNlXjo0DLcN?=
 =?iso-8859-1?Q?WAYOGI23K+KC0a3d6eb9/3Iwmj/XcjblsQCvPQQ01xTTbIgaxYRbvcbEa0?=
 =?iso-8859-1?Q?e43e+lhkHlD1qviIEZ/yt4WElyIeiQNtE/zghU1L7nHsjkt6M2joFd8lET?=
 =?iso-8859-1?Q?nbYbA+CRNs4BTk5nsuIaekuSNNiNQWvVNWEEkD8+qMBPXQyh4Fm8jpOMdU?=
 =?iso-8859-1?Q?cOa3Y4Efr3apALqZgxBx117rvLVAEBrZxszzfmiWC8uWWGdra6sCEmHuLl?=
 =?iso-8859-1?Q?siunJnLQ8HTRxLTiZG0w0yP7r1TkeYS6O6Zv9QPC8nY8Db6u/mm2tOtfji?=
 =?iso-8859-1?Q?cbKjAm0TphQwVAM4MgyjhCm+tZuojM7J6n3jXr6C6iQ9D+oJvrjbBqWxft?=
 =?iso-8859-1?Q?y+m1sEnFPN9PsubZfSlK9Un7kyKAwSb/Tkcautx81F7xiTiaAHekXkYT2g?=
 =?iso-8859-1?Q?9wCEIuzDew9p7/ipSHVQioILCwjp+8Il2kv/S2E978t56DK4A2cQ6jadLI?=
 =?iso-8859-1?Q?Xtv5c1Hd1RQeBpPZu+Oyw2TMAeVEVIiqYLx4pPA7E+t9xMDhWOR0B66jTK?=
 =?iso-8859-1?Q?4U4FGdojOACcqU8Sw5Xd4SEpcW4EjS8yTunfW4K6VfwkwBp4pCX7J0IZdy?=
 =?iso-8859-1?Q?SHmVhRmK5sM7LCprYe7fT8bgxMhi2R3geAnPwLEocUtn7kZECGXtCtEuMr?=
 =?iso-8859-1?Q?CEKn0IIiGAbzbx6RSAYrLiK8iSCkezIlXIJtK8RRkd5zaviX/4ijjxGwZl?=
 =?iso-8859-1?Q?gLSXrRdSt6D1h+1MfhjsU+0TUfC4utDHzl+0Cd/I0U6qJggZpjAPpbKuuT?=
 =?iso-8859-1?Q?Ff0YGcIv68QXx1GGO4w+NTPAlPrbVrq+/p9GM4MDZv3cXl+lXzYjH/dvC6?=
 =?iso-8859-1?Q?YXlaw5QCx8weYo8q0JSPOeOvbDJ3sZh+VnXU33HKEtKmp0RlUa7euGSWzf?=
 =?iso-8859-1?Q?AFv7IbArXRdKTbiPA9khhkYK7VUXgaW/awjS1NptPE/CMokfjOBwPvTjcs?=
 =?iso-8859-1?Q?/3rLd9IqSH3hnNvCWZmyhZgknlh9ABBAPBqtPm4ecIWe0SmezFoVM4faBk?=
 =?iso-8859-1?Q?vCgzdJAc7EmO9/7azWhK+csRbL4eBXdnfMtjaksU3haf3ynVuCq2ZRWPXY?=
 =?iso-8859-1?Q?ZhwKRhQjWBnQVA7krdgfTKLStBPsC6g6os2at9bHqeRq00PP7dexX3o886?=
 =?iso-8859-1?Q?/l+7QhuAy5yGk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bfb2e3-04b2-47b6-c679-08ddad6fe752
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 07:23:49.0108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QR59oJULro+PNetMl2O9KGQMOyghgbANTYZTZGGVT3SkdrSdXQHfxDpBQeH2VaAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7328

Hi Jacek.=0A=
=0A=
>From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
>Sent: Monday, June 16, 2025 23:29=0A=
>To: Johan Adolfsson; Lee Jones; Pavel Machek; Rob Herring; Krzysztof Kozlo=
wski; Conor Dooley; Andrew Davis=0A=
>Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; devicetree@v=
ger.kernel.org; Kernel=0A=
>Subject: Re: [PATCH v6 1/2] leds: leds-lp50xx: Handle reg to get correct m=
ulti_index=0A=
>=0A=
>Hi Johan,=0A=
>=0A=
>On 6/16/25 13:25, Johan Adolfsson wrote:=0A=
..=0A=
>>   drivers/leds/leds-lp50xx.c | 11 ++++++++++-=0A=
>>   1 file changed, 10 insertions(+), 1 deletion(-)=0A=
>>=0A=
>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c=0A=
>> index 02cb1565a9fb..344791b6c575 100644=0A=
>> --- a/drivers/leds/leds-lp50xx.c=0A=
>> +++ b/drivers/leds/leds-lp50xx.c=0A=
>> @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)=0A=
>>                       return -ENOMEM;=0A=
>>=0A=
>>               fwnode_for_each_child_node(child, led_node) {=0A=
>> +                     int multi_index =3D num_colors;=0A=
=0A=
>Any specific reason for initializing this to num_colors?=0A=
=0A=
Sorry - leftover from initial patch where I kept the original behavior if r=
eg was not set.=0A=
Another patch version coming up soon (assuming failing on reg not set is th=
e agreed upon solution).=0A=
=0A=
>>=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
Best regards=0A=
/Johan=0A=

