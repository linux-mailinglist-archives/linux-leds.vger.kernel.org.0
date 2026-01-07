Return-Path: <linux-leds+bounces-6541-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33BCFD128
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 11:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B74430E9D7F
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 09:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9624322B61;
	Wed,  7 Jan 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="cdJVwKFn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F89242D86;
	Wed,  7 Jan 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779562; cv=fail; b=jN/Fc9BulMKOuYLsfG5KP1Vd7Z88k+cQrV5F4asQZQ4YunC2p03Gj2DIfTyzyqN0dCqawd3168rerziP9Od7gOSVwf4FAabjp80JJUVxNu8WS56JLC0Rf/V9EjT9JiD5jIxJW9dWboj4GcnTfXm+uO49x9Gcgig+/6PnvDA6ur0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779562; c=relaxed/simple;
	bh=W4gKLdBtMhu4mz4oZj57PP7+M8W8awKL5gxmkL03FCU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S4ubTMNwR+fzoFhzIM7OOR9coaoDrppsV+c8BA7ktRfIVpqOhnNOmAP2y+rCMHqxVY0yXDFRJB+/pMPKtlSz3rjcEC1HUgnJJ2YVdaiSAJjKE1xNaCF4sH5/bNjV20D2EArurag6PtsyeR79P+Ma0y2mvrjk/eZHGTbvIH7B3vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=cdJVwKFn; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078TPS42106495;
	Wed, 7 Jan 2026 04:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=2f4Ld
	hLyZsY7HI9wBSADAeAAztjNV/tXZzsUmcTQAGU=; b=cdJVwKFnJ8zBhCJzlFPxp
	JjZAsEHiEZ4uBZesiUSo/7Ler91wzhqrrUTqjAJek3GAWNH4JlRQ30SNR7VvhBEv
	htd/G8CbQzSJh6nPKBasif7KlEaGNeuUQy9WFYe7+7gjPxBuoyLv4SfDL6soQSbE
	RqaHIsXy7gTn677V2i2NsCGGWL8bVNcGKK+LOnZ9lOQRSgXzrGlcIofQoXJcAhU2
	qEOi0D9u2/syMJ/rFjdKXO+Faybm8udjyy7IFsJoR5/Y1o1+qlHuhwzMqrNTpQWV
	VUOIQEtqw+S/P43FhY/xxxBpwMtKUSAaUlFiEe5PehtLQ0svvf0rEfbdI9RR85uF
	g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bhf8dsjdp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:52:24 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNj9viCRdjI2RiiQtMcmvChiVpV/nCJW+E6GpAEPys2ZMbQV6XWu3W5NDM8QxCg2Vpk8hPeapaauEn3iFqJsEwIClkZGaSJ/aU+lxCFRxmB+OBxfpGklQHc8f22HJac+j8JWI4nfFHiqR3XT2dH8EwYya1cf5UxJcJEYWe2u3L6idYHi+Hg1sgWsYHc1klH2J9YZfiHk5IHjAEIFrIZIQlBXoqP++gqF0BZTquNV/aXgmaqiAMHEogzZAEcVxYzqm6snhO0uN6+HNoiDu5rFo6+phzLByKKMDf+D/nsFYLt9moTp7ksyasQaXG4aJoN1dlF73hgXUVS3rL4RGpqNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f4LdhLyZsY7HI9wBSADAeAAztjNV/tXZzsUmcTQAGU=;
 b=QDaNcZphnQ1Mcz5Q357hEgRWMVzycLtm4b8sIuVXr3APOUnyXZG/QQ7Y4tIt9dHM71rSEhPxWIsaiFtCCmkjyaO5vnizFg9FIMcYG0o1Cr3itKDpvs3lQW3zKR7PU73/8R7qdq0d2djxvj+U7CKeYr0cB0v/ukQgQhkbLou4DQMw2QwpD/PrOmK159UsBxQSOTZt9hQoCw4O2YFW09Cl1OkBFfZSP53hp/sROi0yYL5FAW/yZemr9W7W4X9oHIrLWt/OUJuqSt8JK0Qet8MUtAhn3OtRkeDQS9kgO1ZHnmFWI0cgWQEG74KdAWtIlAq6QGtvhk8VKjRF8J++pLmgYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by CO1PR03MB5891.namprd03.prod.outlook.com (2603:10b6:303:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:52:21 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:52:20 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
Thread-Index: AQHcfs0qNXq3xtvWU0SseDoZIUly8LVEyrUAgAGc2KA=
Date: Wed, 7 Jan 2026 09:52:19 +0000
Message-ID:
 <PH0PR03MB6525F2AB63E24564356ADE51ED84A@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-1-73601d6f1649@analog.com>
 <20260106-crystal-ambrosial-wildebeest-0e35d6@quoll>
In-Reply-To: <20260106-crystal-ambrosial-wildebeest-0e35d6@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|CO1PR03MB5891:EE_
x-ms-office365-filtering-correlation-id: 955693d8-a3b4-4b4b-1a5c-08de4dd272d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9+nXBQstr3OLv8nfa4s+oFMvkutSuBArq778me5EDdWWUxNpuiZ+Of2CGkq4?=
 =?us-ascii?Q?+S6cnp88tks0zb2h3mspyrgeRUDBSmpe2Dv9572R6y12DzjiUR4zxznXq+j3?=
 =?us-ascii?Q?sIfREtC93ZTCDwGs9TotRFHjJSbckQT3LxZG5sQT/ElNeavtTbXyo2fSOHlY?=
 =?us-ascii?Q?JzHVgZPwSFpDj4tsW824L/gSBX5hYSHAUly7GHASezPCAK8dhr9Nt9pWSNdg?=
 =?us-ascii?Q?nftvIPzue0NaI6juxCBOrbpB1LRg2K+potkzDUj67430sYh+BKyobJwAGYhj?=
 =?us-ascii?Q?IPt8djXPU/kfg2lrPYlNvrED6mmFgEEmV5cWAWUCsXglcX1iayf+mtAPpJRt?=
 =?us-ascii?Q?bb4+zV8La6T0bPT9r8dFW80wOcSPPHEWjQdPvsqDlGNKg7Pc6eNBi2MIKUz4?=
 =?us-ascii?Q?L2xZL3rTnOpRADfqdumbTkf9QilNY+gs4M+umZn2Nd4wc6S6j43fWwiiRpPL?=
 =?us-ascii?Q?/sxdhLoyIfRLef0K5muhBalXbEEAteEqE8Y9/9+4zMOjFFX3bOUIOozKqd6X?=
 =?us-ascii?Q?47Evm+OLdEpJmBsHmgMnaT9L0okiWmbxgv9UUzQHVs6Xz0/8CvLuSdzXGo6a?=
 =?us-ascii?Q?yjI2xRsxOdNTQNydRbTdNc06SLgLtl7kBczrhyr76vD6sOFrdtTTSywyqAA+?=
 =?us-ascii?Q?exoHuqJMDgdNmLh16gFREOGVb/RK32X3u2ABAeh8B8c/AQoS+y+IUNNpJC5Q?=
 =?us-ascii?Q?cSlrRSTmzLkinui1feX0ra+k3riobGUmugUEJoOfdG93fcqnRrcYiTaHMw54?=
 =?us-ascii?Q?zwH4kDXsTFoq3PwPR1BsjL1NIghaePhtatqaB8pPpLg54mds7xVVPnAejyxF?=
 =?us-ascii?Q?la0VJkhEvBn25m1+FBE/UbPlXipHo0dovb9OsaYassdMFL54PwMpuI2j1tAl?=
 =?us-ascii?Q?CGnsvoIUhVL9EA6pH0Bnn6X8Sv65FI2uRhRYtYvppUJf5e2mr02OkuLXr7a5?=
 =?us-ascii?Q?B4CaSaCXIWbH41mtHlEdaWLXk82qL0q3XfLD4MH4al+qNlekBsNftCc9XuoF?=
 =?us-ascii?Q?4HoZ5P/UKeoXyzze4JgyM+DIdQsxh+MH+RZttn8kDMGjEtP6a0/FvpWsdujL?=
 =?us-ascii?Q?QOAvHOsM5TrKXHm2Ve8F9htbwpQPR9u4FILW2/5xtaDgdIixnKOiYKD5oAUu?=
 =?us-ascii?Q?OiG5E6Zyo6X3dJktPjBjm2wOWeHYxukyUzBOiwGN7UFp0fu3BX9TOZYqmRKh?=
 =?us-ascii?Q?/Sm+C1PdDl8hlN9w4166JK35WihIuksfA3kUovjSJr+F1+elCD92qv2Bxv9f?=
 =?us-ascii?Q?Kg84FQbHt/AXGSs1xGnA9Jm8Wjl3p0+1MwCcpf5XZi6ekvbKNxGH5Z7XcJiS?=
 =?us-ascii?Q?OaxO8JJsHE70KQIMOGuP4KiVPKZUCVWB7FD/aBh7dB9bOVBpOGWTpQ/uSh9I?=
 =?us-ascii?Q?wZe+MZ3YxNPdkRv0UKlPG84FSTAt94MZOUAPkUxFHblUciuqsEjVSo3aa5jG?=
 =?us-ascii?Q?cIVCdlqBkcyJwJ+WNZT0UDYc7VO5qhX6ByIpWCu79dqTVt+zCDG0yg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6yu2zvlpEzj0nFibrI0rCHRg3c+7S9BykV2AFdBKe+qIABjeRNnlkTViRJ6L?=
 =?us-ascii?Q?CMtcTTNsu/da/dFtdho45dzNNLLbLxYsBnDjWR8yryfronNGQimQP99EQHP+?=
 =?us-ascii?Q?lCeZIPPocN4FsFRLHlO7o3Wj+8oTFtfMBPLWQg2XHMC6m2yuFB+2Hrt27IH5?=
 =?us-ascii?Q?UA7roF308Gie2DY0Va8K9uYQkaB9SlQ3PIhod4wZmU8e1hdKSz9ZER/KoT7E?=
 =?us-ascii?Q?mbapb5dqkstVl+nJwQJMBzdh0x5G+7jDvekIcSZEf2axmuca3i4tbrLuSsNE?=
 =?us-ascii?Q?B1AHX7xW6JUrzZGqE+S8XWWyaqWqWIYkVL32VrlJoeOGGoh1zMW5CUyIQ2rq?=
 =?us-ascii?Q?gDkyJEnGVrq0vaeZgowb4l1SI5GqUwyYZBT+znkga2fzRQ+wJoGRoBYFLdAu?=
 =?us-ascii?Q?BMDwOGrtUz+xyXYmRVubgsFzifPwXhUMM5h8Q9XVuLPfgCbBs/iIsRyUsgGt?=
 =?us-ascii?Q?UTlf86M3N2I/MhebeBE4+5DM82b55oS04mfniB9XjqS4ECCdY4IXhgfp+4/v?=
 =?us-ascii?Q?hdZhGllTNSaXSuTl4fDRn9hXRKQhcgW/wOtERudKE5aLOP5p9YtVW1urxscl?=
 =?us-ascii?Q?NtmwHbJRn+Ot4jbPGzQPquveOegRfi1rbVINl4sXVyOkp4mYNzeFkW9mJ2bH?=
 =?us-ascii?Q?joWFkUy3lvKVhp9ogfz3XSrDCq9j/vg5ALpcDVw3y2wQcvwd6iKD8Pv4fSTv?=
 =?us-ascii?Q?/9lWjLq5Ol4sDdP/79fKsEI41h1UyhCN4iqUlqfbxt1u04vxZv0AQvSw4UOW?=
 =?us-ascii?Q?O8R//rMXHEPJE6+/vs8B/woZ29BFWkiTU04Sg64K6Hcq6wz6DrGyNlmOSY2g?=
 =?us-ascii?Q?IcEe2G24BHD7vh8KE+Qsr2V1pOAPDLl1OlcLZbnXnTIRLAEA2a/XjEhCo7T6?=
 =?us-ascii?Q?kX1OllHr4APOfHg3Pzd9QjeKml5rWP2R5fC+mfU0ssU7t7HVZrb2hDtz+iwT?=
 =?us-ascii?Q?YR1qhR2viiTZ/s4FyHY+fyt/SI0G3gWQeUDx4M8jp2Sbbss0MsOb2+aoX3El?=
 =?us-ascii?Q?oz5gW6O/zeY/1XF3VJubG6XUNn4flhEGUENoOZg9kzqVLVJQcn2HCxtvOL3b?=
 =?us-ascii?Q?00e5+vsuOnaxaNfGEsxCXIghrFKyIxL07lvbpMerrmsO8jymVVp8y6ddk3lj?=
 =?us-ascii?Q?VwOqjXHG7kNrUlBrrEslH24wNcfQEtq9ArXps4BAtA/g2pECwkDuWscoymJQ?=
 =?us-ascii?Q?Yzrxx1kqkSDFz6m7sA4U+bZ9VZamjyPxHAIeRt9/MfoW5sB2G8BzR4YjwaAD?=
 =?us-ascii?Q?1L8+9lbi3g/0Urr5HxHk1HRKI/J1D50rRpAkctCgczoKFQy0S05JVoraJ2Cp?=
 =?us-ascii?Q?rkd3tRyZqvxjevXnfSPvh1xw55jFY/mKl3CTWb7azBofG4ZUj9/7cqvHBs23?=
 =?us-ascii?Q?sY6Ph+s7CMx90TPCFPLcCx7bAATVydDx/So58I4J+q/pYtEbH608jv5/mty5?=
 =?us-ascii?Q?kAdRQjl7Yxf0RXUiAUT3czhlIqW/IPZVI/XZGMrlGoIrDmxWHUQHVTWcbQUD?=
 =?us-ascii?Q?fzAeCu7/XCcNi3iwvnwUW05W5v932hPBwnhbvpOGlVl8umyzSwQV5Tm3xS9E?=
 =?us-ascii?Q?SYWoKCgJbfYKI8K9ss9wIwwmLnkCm6ee4tAY7zEn/sYRhXkFhJYi4WTfbc/7?=
 =?us-ascii?Q?7TqhaWOj2q6vqfTyqZfIvrvFgrXMksOKyXA3GoXFl5VYGmyUIvuaqryzxb/8?=
 =?us-ascii?Q?XzsI5Tad42Vkg4HOSSHBEn6HY1Xzc53COwTsckhHOepBDLlt1ATD0h9KOBTQ?=
 =?us-ascii?Q?TYNa61K+nQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6525.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955693d8-a3b4-4b4b-1a5c-08de4dd272d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 09:52:19.8060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3Oym1DpOAfDNU/I+RfZtsvbojMBNK92nvWqzPkMBh6YLKWmaFy+ZbUZwenDTn6fNTW/bRxsJC5sM0g2CZCUKBY/kF+h0W7mtmngIeAX8vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5891
X-Authority-Analysis: v=2.4 cv=M51A6iws c=1 sm=1 tr=0 ts=695e2cd8 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=uherdBYGAAAA:8 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=fUdPPIkZ-y2n5qgkozoA:9 a=CjuIK1q_8ugA:10 a=x-rrmlpudb0A:10
 a=V5hIW_BCtU8A:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OSBTYWx0ZWRfX9x+xd+U0pt/v
 wZLEykM9O0H4Z6yuNsmk2KaSEG/EmrFYnK0r1muNVkwnCaypxa207cZsuQmSAXI0/jKzxr7WYnV
 29KspXTD/dovpaAivx6WRHyeUEojB5YrmpMkID2dIlE66ZnF36ycOWO36+CA6jXpCSZIgGFXSw0
 NndxbeIFWS8vJ9Xz4kBzdZmVfZWImP7MhnbK5llMSkX6kruI7GcphRVW2/4vZXyMzuGE8Ur5/lv
 upGvai2jA8QaidHJX3/7WEaGlcNZsk+N4U4Y71UB/EKkJE4ksjzCUnjzBF39fI+stB59BFIjJN2
 95suBRyKp6oX7ajY9Btu4+lqLpet0Qfoi5fnB5ZGJD9OpxnmbDad7i5w2KxagS2Y0zhP8ldTGGp
 GSXX71TUKwvhgnJvdTNQql/5vKwlEJTRyyErUqKlCvrL9oTiMvNhftraq86czrTZKMJIQDD/0X3
 EfPcCoYGn6zOEQ8WEag==
X-Proofpoint-ORIG-GUID: WC95X7tymeGvAkFlUqQHJlgN8gKDPUvJ
X-Proofpoint-GUID: WC95X7tymeGvAkFlUqQHJlgN8gKDPUvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070079

> On Tue, Jan 06, 2026 at 01:27:07PM +0800, Edelweise Escala wrote:
> > Add dt-binding for ltc3220. LTC3220 18 Channel LED driver
>=20
> Subject, commit msg, binding: driver as Linux driver? If yes, then rewrit=
e
> everything to match hardware.
>=20
> Otherwise what is exactly a LED driver? I know motor drivers.
>=20

I will rewrite to match hardware.

> >
> > Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> > ---
> >  .../devicetree/bindings/leds/leds-ltc3220.yaml     | 131
> +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 138 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> > b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> > new file mode 100644
> > index 000000000000..33285a7ac7a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
>=20
> Filename matching compatible.
>=20
>=20
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://urldefense.com/v3/__http://devicetree.org/schemas/leds/leds-l
> > +tc3220.yaml*__;Iw!!A3Ni8CS0y2Y!-
> bTmoOEA7bjPt5CM_hEEqaRU4x0nvJNS2Y926U
> > +ULgO8UsbmEQwBUHq-AZjzofrOg5HnnWnBflY9LKFGVrA$
> > +$schema:
> > +https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.y
> > +aml*__;Iw!!A3Ni8CS0y2Y!-
> bTmoOEA7bjPt5CM_hEEqaRU4x0nvJNS2Y926UULgO8Usb
> > +mEQwBUHq-AZjzofrOg5HnnWnBflY9BRg_sig$
> > +
> > +title: Analog Devices LTC3220 LED Drivers
> > +
> > +maintainers:
> > +  - Edelweise Escala <edelweise.escala@analog.com>
> > +
> > +description: Bindings for the Analog Devices LTC3220 18 channel LED
> Drivers.
>=20
> Missing wrapping after description. Look at other bindings.
>=20
> Also, drop "Bindings for". You should describe  here hardware, not that
> binding is a binding for.
>=20

I will fix the missing wrapping and improve the description.

> > +
> > +  For more product information please see the link below
> > +    https://www.analog.com/en/products/ltc3220.html
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,ltc3220
> > +      - adi,ltc3220-1
>=20
> What is -1 device? Why description does not help here at all?
>=20

It is just a version of ltc3220 with different slave address, I will drop i=
t.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO attached to the chip's reset pin
>=20
> Drop description, obvious, redundant.
>=20
> > +
> > +  adi,force-cpo-level:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: Forces the Charge Pump Output to a specified multipli=
er.
> > +    enum:
> > +      - "0" # Auto(default) - Automatically selects optimal charge pum=
p mode
> > +      - "1.5"
> > +      - "2"
> > +      - "1"
>=20
> Numbers are not a string, so choose appropriate number format. Also, oddl=
y
> sorted. I don't understand what this property is for so not sure what to
> recommend.

It is arranged this way to match the value for the register.
I plan to keep it as string and just do=20
enum:
- auto
- 1.5x
- 2x
- 1x

>=20
> > +    default: "0"
> > +
> > +  adi,quick-write:
> > +    type: boolean
> > +    description: If present, LED 1 output becomes a master control tha=
t
> > +      simultaneously updates all 18 LED outputs using the hardware's q=
uick-
> write
> > +      mode. When enabled, led@1 must be defined in the device tree to
> provide
> > +      the control interface, even if no physical LED is connected to t=
he D1
> > +      output pin. When disabled or not present, LED 1 operates as a no=
rmal
> > +      independent LED output.
>=20
> If there is no led@1 physically, you cannot add it to the DT. It seems yo=
u
> described some sort of driver behavior, instead of hardware.
>=20

This is also a hardware feature, when enabled a write to the LED 1
output register simultaneously updates all 18 LED output registers
to the same value.

> > +
> > +patternProperties:
> > +  "^led@([1-9]|1[0-8])$":
>=20
> Use consistent quotes, so '.
>=20
> > +    type: object
> > +    $ref: /schemas/leds/common.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        description: Output channel for the LED (1-18 maps to LED outp=
uts
> D1-D18).
> > +        minimum: 1
> > +        maximum: 18
>=20

Best Regards,
Edelweise

