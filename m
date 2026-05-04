Return-Path: <linux-leds+bounces-7967-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5THtKvb292k8owIAu9opvQ
	(envelope-from <linux-leds+bounces-7967-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 03:31:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1C4B7F62
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 03:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41BE93006B66
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 01:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63951991D4;
	Mon,  4 May 2026 01:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wh2PbZVn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B77E0E8;
	Mon,  4 May 2026 01:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858290; cv=fail; b=uWjUoeJLwnPmrVemr9g0fcMBfnTFaSqWXfsOVBsTnld5oXE2k2r/W9gaCuQcOr9qp0Km2tPt+RNodgriLQ1wIrWxL/p7Xul3iyCwQA4PrGmVRv5KWteNE0Er1WDFijDo+nNwvxhtLimOKfXU5NCu06rR+df7sV55bH691xWAutU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858290; c=relaxed/simple;
	bh=7yR9oQuKZfWXBMrAf/Axd0MmCzhhU7aM5BNl3VGFxIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i3dz2BEOH3InXweUZ5JU71/HuNnbUi0jafumr+jq722jtAKR3UH2cF7xTOtSn/tU4gROrDJcUKubTXaGhRsltjcNcU5aZjTMZ1URoj/tMr2UwgW4Vl6a2cbfjALfNgc+im5hqdgT9uvzwLNsefdf0Gp2WJsYyHErLW339rj0sI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wh2PbZVn; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 643NDlsC3423921;
	Sun, 3 May 2026 21:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Ututf
	zy6PiXC+wWj7lRv2aCAi93NIo0dGWU/iKi9DDg=; b=wh2PbZVn+7leZD39DtAdL
	ZAmiKkfPl8GLcfdLnZcy8xr07OGTWY26xo5wKFKZciCYJfZO2nap3UnlZevvxJTE
	Q+6e+cNYzcAozjklA1r2ridqu/9Qb7Vivmpi22oSphgDy0+isfj+9mQIgdOFVVfw
	/aIRvMRCaMJlw7enqRZgU0zcKd62DP2mZ37t0tFDFOcI06ogfBIWK7AovgXxSDix
	43eLaXtMCkV4vLUTlLX7OmChowQXY2YSiI6qoTPhwgqePB4au7CC6dybsWO/SLPp
	yXf8d46/roenePPXYL2c0XjsoMnkljDwDLKSYSB8TvhBOEi7RDIPTcHacvNHEoH+
	Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011071.outbound.protection.outlook.com [40.93.194.71])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dx2kfjbch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 03 May 2026 21:31:24 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWMMPLcEXUd+9Wi3QkfIrxH2AWVl7sxDkek7pUcAAXX2F3f6rkbBZkVuDCb6Cd8qtJ5Yhtapi9gyTofN3IqbJMkPL+SfhPpo5iw9VH+s7zlZLV8kfKDpdB9Y64l5VdITuNV+7AKbTHPSZP/5pu6Ry3emSQqDQf1rv767W4BpzHx1wWvZR39iG9S+8Hy6WtXtHauM0FDuaKBirtfOmMlVhU7+YAFDR+IyKnsSXylZ6XN6iQjs4aF/rcsqaiNEhRkFpAcFI1fCv/BO3Cr8AHOjwJmadqxXqg3G5BUfYIKAGhXd+CPCsJpKbJFc7zFwtd3cApwEH1uYoJD11vr7fKIXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ututfzy6PiXC+wWj7lRv2aCAi93NIo0dGWU/iKi9DDg=;
 b=nQdnGZAOTSVhltA0KzpQZtxXzjKF7vE38CHpBZfBhPxXkjaGo21nMldL52U4gIBVjXZH10EMSJV5329hpt4s9WxW9EMZnMk0dSyda8PIMky9z5SKFnkY1nZpxrr15p+hVtgLaspAd2+Is37S0O9KBTyvF2mukSdxRB7DTLJ6uIwH5FmWBnyL9Y/0+ztEb8Nj5aAYfRtulv2Zj/nfdMKw14vQ7LfeciM9faP5SIaVhyqHDh3N9XNkgkX6kjkMLmSMcr4uBdXEe6g135KjRqXKp+ZqntpRO3uD14kv2NtDLRiCnMCPEWyORuTdqrzQ6upHAHyWmduS+qYHZ1iMgKtg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by DS0PR03MB7680.namprd03.prod.outlook.com (2603:10b6:8:1fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 01:31:22 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 01:31:22 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Lee Jones <lee@kernel.org>
CC: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Topic: [PATCH v6 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Index: AQHczk6XLUbstFfY6UahsFZK2E3YZ7X37DqAgAU8GsA=
Date: Mon, 4 May 2026 01:31:22 +0000
Message-ID:
 <DS0PR03MB7228ACA655995A9CAC025B35ED312@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260417-ltc3220-driver-v6-0-18157871eddd@analog.com>
 <20260417-ltc3220-driver-v6-2-18157871eddd@analog.com>
 <20260430171145.GA2661693@google.com>
In-Reply-To: <20260430171145.GA2661693@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|DS0PR03MB7680:EE_
x-ms-office365-filtering-correlation-id: ab1342a0-27ca-42df-6234-08dea97cd964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Ayw60SQLR1CFkP3JbQAo/GNreT1F+MBHTitfQUfRFZwDnY03BsYpA+S/wT5XN3iywpKON6K29J9Xn7WLOPRx+alSdDHVay3qKpT7LFGqgRe91+Eig1as0T1y5imM2SAiSJhO81BwU5cP090q6A4ZaWPpMw4tNCFhjDJRHEqDUnLvuuMxMgt2GIZTIs8IBNdBA8qwJVde0n8Nrqwj6NCspX2dwaTMRHwNFzUFILC9JHKP1z8pwYyM+w/J1OiYtIEpH5E6KmkW5x+4Fos/PhdpU4hWYTKF+p31H6cEzftQfKTC9f1pRXWZSAZVwvFiYoAl2rfL7gybPYeFCLTGA9I4794aMrcjW3gBuLTfJuOaW3hFqNSfOPitrhQUN/Lszd+5EIJawv6ZXwi8SGPLyrRqorwjFQTuLL4FFi/OiW1iDUbwHvucpGaUgUzbcaDDo0TosJL73BztcPSWQ2vEofHy3Nw21OqMIeq7QG1D4Tvkyf3JvLKUbKtr06x9boVjzBEF7v4lyx//xKNEwSumXRmKkDFmUXqzPhzUx7p0WP2yEmMVqAQXQsT1TWRUKRVWbTkmykSyzbRW+EwQVjoYJU2/I5E+7Cej/PTeqKEpXXY5CaE0kcj+CDzMWurC+asz3qdo0c7Uyz/PjgDy7xsJvvl1RcLrtZIwrGdrU9aF9NAZ2HlKMdjLwdTswDu3vUj6aiwKS4Hz9Mut0dn1fw94NNQYeRSeK86KjeTxieVlpn2K88wOa0gBc3K3jAAghe7jua1D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XMCjKOzpBWMH/snDSzwHuyC2eL5mu5NP2FxsAmWTHYAyWV2rVTD5P4ld2Fuy?=
 =?us-ascii?Q?aVSp64chZ8zQQR4nZd/oyBPFvPrR+JIX6U7otJegwqhgzyn2C6EZIN4DKXGx?=
 =?us-ascii?Q?o3uRIZpkxzJsxrq141iQFvH0tr70YlTydSiG4yOZygabk1HtnHAP9REBFpdd?=
 =?us-ascii?Q?gJiK3WaKHXcbQ/wdbDtOPoFX2TbDEmRfH4d1ERByGvdsF8EyoSs5nZ4WBCBE?=
 =?us-ascii?Q?zwvpT0Ky6ml68PM71awwsrj9m0OFsipH40wFhLrZHLcpZUf653EENkO/TIwP?=
 =?us-ascii?Q?cZvTdtCPJedezRFCDXkyyY699oAU5dOhF34fAK88fPm6eyo0pOKAmjJlaj2F?=
 =?us-ascii?Q?ZSCumzz9/jt6ohEpamxraN3FER7MeArBFkdXP8ckPx0OnN2WGHJw+lYtdPw0?=
 =?us-ascii?Q?S5GSA0VO6YJmLmQI4QqTOuJPrBL+MO6VaaQVhsPtvY7Crffbg/FeMAW5Sr4S?=
 =?us-ascii?Q?FMSLRkBm83buIYrJVn6AuEY4mEDCIludbOOFFyCvLiM1u+Ds636HvmLaEjr+?=
 =?us-ascii?Q?tGNTnifEa8BLisHc/5itdij3pj0bFRvo4zt4whK0qs425qDHH7SKXc31IJsF?=
 =?us-ascii?Q?KGzeH9v82J74KPFWVTtjaW/RdsNWnd8+h2sC3Gm2sEb8m2Zx4UWuqbcMGZ63?=
 =?us-ascii?Q?cdYQsGFFX6w4xirqR2ccn7AZkgtN4pING1m96r2mZCzoEOv7cwXxJTaqtaWP?=
 =?us-ascii?Q?VIj0GVuKeZS5NJ+Fwm38LDPVPrAsX+iUQ00PB5DbZzFb3b9UvQ9Ui9vr53XG?=
 =?us-ascii?Q?m6lq9dA+VNTYMVqmfDVnPcVrxD+lej5ono1zSuD+79Gnyj+mYpXSwxsiC0HZ?=
 =?us-ascii?Q?7XgKfkNc+Ng5v6hY5Jd2EPmZQoA56j3WQCh2dnWtLNYLKGEkVPZ9JBgVzANc?=
 =?us-ascii?Q?WYqr1m3mNayGRnrITe2JdphEVmS6IZGpHCwP/e1gfHY0Pl1L9GujgQiHj8EH?=
 =?us-ascii?Q?O6MPTSqtUdFTh7rovCxVX1g0OpeBgcNMAq8h/PtyVDUUw9tNIHF5+3qLwquT?=
 =?us-ascii?Q?zU8VlDW3c+3sLMnvLAryDPCXsLJn7iVFUM259y4Tcdxe+9w5vjBm6lcu+hYs?=
 =?us-ascii?Q?jYREAc9wW+gjyuR8YBGrBp0LJZmi9bAUEvbYgolTcGXaiET5J24DTQSn6DOt?=
 =?us-ascii?Q?XdIsskxKeEwh1G+VKcdDF95JMDBRgqJ3ODLe3OF84jpcnDuOb/CNOKEz/nsp?=
 =?us-ascii?Q?YEsBuP/2N9wGjDu29AycJWFJrFGPcFucRJ69KG4TwYvU2bKbjwTkZFKwmjZi?=
 =?us-ascii?Q?qEbr4ufMeeq0OYe+5iQbSzESKTBZwnLjJC+pv77xT2oprX/TjuFlDq1uBGbb?=
 =?us-ascii?Q?4839JEBniseSQhaSaRwj3hRCwVQG1O58Axuyk8Wxhn0Il4TpI5xMF3gM3Z2U?=
 =?us-ascii?Q?5+mHy+V4ScE29J5AOmCvdaLbxQHHH9eGmh4NYWCi5p8szqR+16gnC1D+I5cH?=
 =?us-ascii?Q?CCq2wiAu54MtXXWqVyljaqRhnXuYE0wWDmV3u9VcXvb+0Z/OKTcqF86WKyww?=
 =?us-ascii?Q?dzanLQ4wChSb46ObCl3IoyhE7Wpc+pqTMZ2qPgxScGZzvPL7DkWAAaMoTkqn?=
 =?us-ascii?Q?EKaFUpaPstAHXCxZmg2afBeuVjEQKbUpqds7im5szPg3mtLd6y0E8Wc3Wtng?=
 =?us-ascii?Q?RosschjM3Af5MFim0gwN4o4qeiTmsLet5x4ZuZiViQDvjDqBXQIe41Zt+UrD?=
 =?us-ascii?Q?tjf9wo16XzN40ChrpM7UUsFv8LG/C8bZeVUWfolDq/D4fbzc+Xy2Jrk+CTcR?=
 =?us-ascii?Q?7cjB6jYMupv9dnu5d584ly40okTUTe1opmZhECxCnkaVA/yCmIxWbBL5CTJb?=
x-ms-exchange-antispam-messagedata-1: Uh0SSw/9dYnmCA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Dp8ySJGbFBfG+PiEya1DgWQ8nk3RepoQ4nMyJX8INjiEkxvFnd/ZjOcNWj4Jp0TVwnQhM/GbwR9j0GXTF+tbo5Fk0PAOU74qHw/kbtvtzrJ+f8H3Cr3wTvR2VQUpUuGXAG6ROiIydiA/TBx05aPeA1maRQJklkFz+/yWEthbXvkzPf7fs+o+HGNwDmhJOKNGG5jIyGGew49yObt79nw2JXMtYCKjq40H58XJsxTU8swLnFz7cOsekmJ2P5jYI4/vVJHH65QqZZKi01W0l8Ixi9TnPq0mLh00/WbofHlSPa28wcPg4vsjqwrMlKlcjiC0urn9dCehkvyu1S2oWhmZdw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1342a0-27ca-42df-6234-08dea97cd964
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 01:31:22.1330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exqcpk/ZiDDfCXcS3ZonDAZz12MucAgycya0jh3eIrCs4vc6xylkDCerWSaz7kroo0DxbzQozHKAWNcRopP8hBvO9fZVi6dTYeapnvhQ4Ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7680
X-Proofpoint-GUID: 5iAEuo1XzXw-krBaUaZ-JTnHnicBwv5T
X-Proofpoint-ORIG-GUID: 5iAEuo1XzXw-krBaUaZ-JTnHnicBwv5T
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=69f7f6ec cx=c_pps
 a=ojhc/3A0J58/V7uwnPnIuw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8 a=SYX0Y5NGJMQo1HSB2dcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDAxNCBTYWx0ZWRfX3nqUaocbyW6Y
 kxnwkwYmG5myVh3C/DmsuQ/xUNNxDl8iDUR4cGK1OcvthbO88P1rlU55AbXhSAQ/DkHH3abZE9M
 xft/N8YnRxNvkpekyeEo3W9gjvu6lRaQaUkb6Z+JSnrarwd3psyB8VYglCRH7oTQ6Uxs+1GlHWj
 C3rW/G0M+ajJZGmkjf/HD5Mp1Ss2IpNPcUoV00qp/8mQqLf86y+3ID8VHZ107EvW3Q+3RXrjddx
 6fwnN3miccW7iX9Azb0WN8r8NOC7j20TfufAh9Vyow2y6Dm8pPDU6pIXHqRd0BW3Ud2fYBIw1Pw
 P4z2lIYcjpuCXKyAVnC535q1Wq1YsTtWOdoLAu+Y6TVvKhpLgSumOJNHKpk9GOJiyu1sE5Jms9G
 ng0TVuQUZoQGZviaWciKtzPmrr+Frnkw5IrHFxiAN3UAVKqkVRm1WHgSbf0iavnD7p6KaQrkekO
 jfk8b56n2CZliX8mvYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040014
X-Rspamd-Queue-Id: 06A1C4B7F62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7967-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Hello Lee,

Thank you for the review.

> > +static const struct regmap_config ltc3220_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D LTC3220_GRAD_BLINK_REG, };
>=20
> .cache_type?
>=20

I will add=20
.cache_type =3D REGCACHE_FLAT,

> > +
> > +struct ltc3220_uled_cfg {
> > +	struct ltc3220_state *ltc3220_state;
>=20
> This is not a linked list.  Use container_of() instead.
>=20

Will drop struct ltc3220_state *ltc3220_state;, and use container_of()

> > +	u8 reg_value;
> > +	u8 led_index;
> > +};
> > +
> > +struct ltc3220_state {
>=20
> Drop the "_state" part.
>=20

Will drop "_state"

> > +static int ltc3220_shutdown(struct ltc3220_state *ltc3220_state) {
> > +	return regmap_update_bits(ltc3220_state->regmap,
> LTC3220_COMMAND_REG,
> > +				  LTC3220_SHUTDOWN_MASK,
> LTC3220_SHUTDOWN_MASK); }
> > +
> > +static int ltc3220_resume_from_shutdown(struct ltc3220_state
> > +*ltc3220_state) {
> > +	return regmap_update_bits(ltc3220_state->regmap,
> LTC3220_COMMAND_REG,
> > +				  LTC3220_SHUTDOWN_MASK, 0);
> > +}
>=20
> These do not need to be abstracted out.
>=20

Will drop these functions and use inline

> > +
> > +/*
> > + * Set LED brightness and mode.
> > + * The brightness value determines both the LED current and operating =
mode:
> > + * 0-63:    Normal mode - LED current from 0-63 (off to full brightnes=
s)
> > + * 64-127:  Blink mode - LED blinks with current level (brightness -
> > +64)
> > + * 128-191: Gradation mode - LED gradually changes brightness
> > +(brightness - 128)
> > + * 192-255: GPO mode - LED operates as general purpose output
> > +(brightness - 192)  */ static int ltc3220_set_led_data(struct
> > +led_classdev *led_cdev,
> > +				enum led_brightness brightness)
> > +{
> > +	struct ltc3220_state *ltc3220_state;
> > +	struct ltc3220_uled_cfg *uled_cfg;
> > +	int ret;
> > +	int i;
> > +
> > +	uled_cfg =3D container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev=
);
> > +	ltc3220_state =3D uled_cfg->ltc3220_state;
> > +
> > +	ret =3D regmap_write(ltc3220_state->regmap,
> LTC3220_ULED_REG(uled_cfg->led_index),
> > +			   brightness);
> > +	if (ret < 0)
>=20
> Should we be using 'if (ret)' to check for errors here instead of 'if (re=
t < 0)'?
>=20

Will use if (ret)

> > +	/*
> > +	 * When aggregated LED mode is enabled, writing to LED 1 updates all
> > +	 * LEDs simultaneously via quick-write mode. Update cached values for
> > +	 * all LEDs to reflect the synchronized state.
> > +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for
> how
> > +	 * to configure aggregated LED mode.
> > +	 */
> > +	if (ltc3220_state->is_aggregated && uled_cfg->led_index =3D=3D 0) {
> > +		for (i =3D 0; i < LTC3220_NUM_LEDS; i++)
>=20
> for (int i =3D 0; ...
>=20

Will apply this.

> > +			ltc3220_state->uled_cfg[i].reg_value =3D brightness;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static enum led_brightness ltc3220_get_led_data(struct led_classdev
> > +*led_cdev) {
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev,
> > +							 struct
> ltc3220_uled_cfg, led_cdev);
> > +
> > +	return uled_cfg->reg_value;
> > +}
> > +
> > +/*
> > + * LTC3220 pattern support for hardware-assisted breathing/gradation.
> > + * The hardware supports 3 gradation ramp time 240ms, 480ms, 960ms)
> > + * and can ramp up or down.
> > + *
> > + * Pattern array interpretation:
> > + *   pattern[0].brightness =3D start brightness (0-63)
> > + *   pattern[0].delta_t =3D ramp time in milliseconds
> > + *   pattern[1].brightness =3D end brightness (0-63)
> > + *   pattern[1].delta_t =3D (optional, can be 0 or same as pattern[0].=
delta_t)
> > + */
> > +static int ltc3220_pattern_set(struct led_classdev *led_cdev,
> > +			       struct led_pattern *pattern,
> > +			       u32 len, int repeat)
> > +{
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
>=20
> This is the 3rd time we do this and every time has been different.
>=20

Will make it consistent

> > +	struct ltc3220_state *ltc3220_state =3D uled_cfg->ltc3220_state;
> > +	u8 gradation_period;
> > +	u8 start_brightness;
> > +	u8 end_brightness;
> > +	u8 reg_val;
>=20
> Something a little more descriptive please.
>=20

Will improve name to gradation_val

> > +static int ltc3220_pattern_clear(struct led_classdev *led_cdev) {
> > +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct
> ltc3220_uled_cfg,
> > +							 led_cdev);
> > +	struct ltc3220_state *ltc3220_state =3D uled_cfg->ltc3220_state;
> > +
> > +	return regmap_update_bits(ltc3220_state->regmap,
> LTC3220_GRAD_BLINK_REG,
> > +
> LTC3220_GRADATION_MASK, 0);
>=20
> Odd tabbing.
>=20

Will fix tabbing

> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < LTC3220_NUM_LEDS; i++) {
>=20
> As above.
>=20

Will also apply changes on for loop

> > +static const struct of_device_id ltc3220_of_match[] =3D {
> > +	{ .compatible =3D "adi,ltc3220" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ltc3220_of_match);
> > +
> > +static struct i2c_driver ltc3220_led_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc3220",
> > +		.of_match_table =3D ltc3220_of_match,
> > +		.pm =3D pm_sleep_ptr(&ltc3220_pm_ops),
> > +	},
> > +	.probe =3D ltc3220_probe,
> > +};
> > +module_i2c_driver(ltc3220_led_driver);
> > +
> > +MODULE_AUTHOR("Edelweise Escala <edelweise.escala@analog.com>");
> > +MODULE_DESCRIPTION("LED driver for LTC3220 controllers");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.43.0
> >
>=20
> --
> Lee Jones

Best Regards,
Edelweise Escala

